# certmin.py -- vector 5 (method seat): CERTIFIED minimal polynomial G_p of b_1 by ball arithmetic.
#
# Theorem M (RESULT-M1.md): the h(-4p)(p-1)/2 numbers v_{Q,k} = B_k(t_Q + x_Q) are exactly the images of b_1 under the
# embeddings of F_p, each once, so chi_p(x) = prod (x - v_{Q,k}) is in Z[x]; if the v are pairwise distinct, chi_p = G_p.
# This script evaluates every v in Arb ball arithmetic (python-flint), with the theta tails bounded explicitly
# (Lemma T of RESULT-M1.md) and added to the balls as error radii, multiplies out with ball arithmetic and reads off the
# integer coefficients only when every coefficient ball contains exactly one integer (radius < 1/2 is required by BAR-M1).
#
# Usage:  py -3.11 -I certmin.py <p> [<p> ...] [--ctrl]      (--ctrl adds the wrong-convention negative control)
# Output: certmin_out_p<p>.txt (log), certG_p<p>.txt (certified integer coefficients, constant term first).

import sys, time, math, hashlib, os
# (machine-specific sys.path line removed for release; install python-flint normally)
from flint import arb, acb, acb_poly, fmpz_poly, fmpz, ctx

HERE = os.path.dirname(os.path.abspath(__file__))
sys.set_int_max_str_digits(0)   # v1.2 fix: Python's 4300-digit int<->str guard crashed the M1b run at p = 83 (after certification)
DISK = {  # floating-point polynomials already on disk (fastmin.gp / v4_factor), to compare against
    5: '../v4_factor/minpoly_p5.gp', 11: '../v4_factor/minpoly_p11.gp', 13: '../v4_factor/minpoly_p13.gp',
    23: '../v4_factor/minpoly_p23.gp', 37: '../v4_factor/minpoly_p37.gp', 59: '../../veins/v4_fast/minpoly_p59.gp',
}
for _q in (17, 19, 29, 41, 43, 53): DISK[_q] = f'../v4_factor/minpoly_p{_q}.gp'
for _q in (71, 73, 79, 83, 89, 97): DISK[_q] = f'../../veins/v4_fast/minpoly_p{_q}.gp'
DISK[31] = '../../veins/v23/G_p31.gp'
DISK2 = {23: '../../veins/v23/G_p23.gp'}
KNOWN7 = [-1, 54, -41, 1]   # p = 7: x^3 - 41x^2 + 54x - 1 (CERT-C4-STRONG, Rebak septic control)

LOG = []
def out(*a):
    s = ' '.join(str(x) for x in a)
    print(s, flush=True); LOG.append(s)

# ---------- exact form data ----------
def redforms(D):
    """reduced primitive forms (a,b,c), b^2-4ac = D < 0: |b| <= a <= c, b >= 0 if |b| = a or a = c (KSY25 Rem 3.2(i))."""
    L = []
    amax = math.isqrt(-D // 3)
    for a in range(1, amax + 1):
        for b in range(-a, a + 1):
            n = b * b - D
            if n % (4 * a): continue
            c = n // (4 * a)
            if c < a or math.gcd(math.gcd(a, b), c) != 1: continue
            if b < 0 and (-b == a or a == c): continue
            L.append((a, b, c))
    return L

def points(p, conv=1):
    """For each reduced form Q: the form used (gcd(a,4p)=1), a', the integer translation x, and t_Q = (b + 2i sqrt p)/(2a)."""
    N = 4 * p
    P = []
    for (a0, b0, c0) in redforms(-4 * p):
        a, b, c = a0, b0, c0
        swapped = False
        if math.gcd(a, N) > 1:
            a, b, c = c0, -b0, a0; swapped = True       # (x,y) -> (-y,x): same SL2(Z) class
        assert math.gcd(a, N) == 1 and b % 2 == 0
        ap = pow(a, -1, N)
        x0 = -ap * b // 2
        x = [x0, x0 * ap, x0 * a][conv - 1]             # conv 1 = Theorem M; 2, 3 = the wrong readings (controls)
        P.append(dict(red=(a0, b0, c0), used=(a, b, c), swapped=swapped, ap=ap, x=x))
    return P

# ---------- Lemma T: theta with rigorous tail ----------
def tail_bound(y, M):
    """2 exp(-pi y T^2) / (1 - exp(-2 pi y T)), T = M + 1/2, as an arb (y an arb > 0)."""
    T = arb(2 * M + 1) / 2
    pi = arb.pi()
    return 2 * (-(pi * y * T * T)).exp() / (1 - (-(2 * pi * y * T)).exp())

def theta_char(k, p, re_tau, im_tau, M):
    """theta[k/p](tau) = sum_n exp(pi i tau (n + k/p)^2), |n| <= M, plus the Lemma T tail as an error ball."""
    s = acb(0)
    for n in range(-M, M + 1):
        u = arb(fmpz((p * n + k) ** 2)) / (p * p)          # (n + k/p)^2, exact rational in a ball
        s += acb(re_tau * u, im_tau * u).exp_pi_i()
    R = tail_bound(im_tau, M).upper()
    e = arb(0, R)
    assert e.rad() >= R
    return s + acb(e, e)

def nterms(prec_bits, y_float):
    return int(math.ceil(math.sqrt((prec_bits + 30) * math.log(2) / (math.pi * y_float)))) + 1

def conjugates(p, conv, prec_bits, check_arb_theta=False):
    """all h(p-1)/2 values B_k(t_Q + x_Q) as acb balls, with labels; optional cross-check against Arb's own theta."""
    ctx.prec = prec_bits
    m = (p - 1) // 2
    V, lab, ymin, xcheck = [], [], None, 0
    for P in points(p, conv):
        a, b, c = P['used']
        re_tau = arb(fmpz(b)) / (2 * a) + P['x']
        im_tau = arb(p).sqrt() / a
        yf = math.sqrt(p) / a
        ymin = yf if ymin is None else min(ymin, yf)
        M = nterms(prec_bits, yf)
        th0 = theta_char(0, p, re_tau, im_tau, M)
        tau = acb(re_tau, im_tau)
        for k in range(1, m + 1):
            thk = theta_char(k, p, re_tau, im_tau, M)
            if check_arb_theta:   # independent instrument: Arb's acb_modular_theta, theta[a](tau) = e^{pi i tau a^2} theta_3(a tau, tau)
                al = arb(k) / p
                ref = (tau * al * al).exp_pi_i() * acb.modular_theta(tau * al, tau)[2]
                ref0 = acb.modular_theta(acb(0), tau)[2]
                if not (ref.overlaps(thk) and ref0.overlaps(th0)): xcheck += 1
            V.append((2 * thk / th0) ** p)
            lab.append((P['used'], k))
    return V, lab, ymin, xcheck

# ---------- explicit a-priori bound (Lemma H) ----------
def theta0_lower(y, J=400):
    """|theta[0](tau)| >= prod_{n>=1} (1 - r^n)(1 - r^{n-1/2})^2 >= (prod_{j>=1} (1 - s^j))^2, s = e^{-pi y} (triple product)."""
    s = (-(arb.pi() * y)).exp()
    P = arb(1)
    for j in range(1, J + 1): P *= (1 - s ** j)
    tail = 1 - s ** (J + 1) / (1 - s)
    assert tail > 0
    return (P * tail) ** 2

def apriori_log2H(p):
    """closed-form bound: |v| <= U(y) = (2 (2 + 1/sqrt y) / L(y))^p with y = Im of the evaluation point; log2 prod (1 + U)."""
    ctx.prec = 128
    m = (p - 1) // 2
    tot = arb(0)
    for P in points(p, 1):
        a = P['used'][0]
        y = arb(p).sqrt() / a
        U = (2 * (2 + 1 / y.sqrt()) / theta0_lower(y)) ** p
        tot += m * (1 + U).log() / arb(2).log()
    return tot.upper()

# ---------- disk polynomial parser (PARI text, variable x) ----------
def parse_gp(path):
    lines = [l.strip() for l in open(os.path.join(HERE, path)).read().splitlines() if l.strip()]
    # v1.1 fix (after the BAR-M1 run): a file may hold the same polynomial on several lines (PARI write() appends);
    # require all lines identical and parse one of them (v1.0 concatenated the lines -> false mismatch at p = 37)
    assert all(l == lines[0] for l in lines), 'disk file holds DIFFERENT polynomials on different lines: ' + path
    s = lines[0]
    s = ''.join(ch for ch in s if ch not in ' \n\r\t\\')
    terms, cur = [], ''
    for i, ch in enumerate(s):
        if ch in '+-' and i > 0 and s[i - 1] != '^':
            terms.append(cur); cur = ch
        else:
            cur += ch
    terms.append(cur)
    C = {}
    for t in terms:
        if not t: continue
        sign = -1 if t[0] == '-' else 1
        t = t.lstrip('+-')
        if 'x' in t:
            coef, _, pw = t.partition('x')
            coef = coef.rstrip('*')
            cv = int(coef) if coef else 1
            e = int(pw[1:]) if pw.startswith('^') else 1
        else:
            cv, e = int(t), 0
        C[e] = C.get(e, 0) + sign * cv
    d = max(C)
    return [C.get(i, 0) for i in range(d + 1)]

# ---------- certification of one prime ----------
def round_cert(V, prec_bits):
    ctx.prec = prec_bits
    G = acb_poly.from_roots(V)
    co = G.coeffs()
    ints, maxrad, ok, imok = [], arb(0), True, True
    for cf in co:
        n = cf.real.unique_fmpz()
        if n is None or not (cf.real.rad() < arb(1) / 2): ok = False
        if not cf.imag.contains(0): imok = False
        ints.append(n)
        r = cf.real.rad()
        if r > maxrad: maxrad = r
    return ok, imok, ints, maxrad, co

def certify(p, ctrl=False):
    t0 = time.time()
    h = len(redforms(-4 * p)); m = (p - 1) // 2; d = h * m
    out(f'\n========== p = {p}: h(-4p) = {h} reduced forms {redforms(-4*p)}, degree d = {d}')
    for P in points(p):
        out(f"   form {P['red']} -> used {P['used']}{' (swapped)' if P['swapped'] else ''}, a' = {P['ap']}, x = {P['x']}, Im t = sqrt(p)/{P['used'][0]} = {math.sqrt(p)/P['used'][0]:.4f}")
    # pass 1: certified upper bounds |v| <= U, plus Arb-theta instrument cross-check
    p1 = 256
    while True:
        V1, lab, ymin, xc = conjugates(p, 1, p1, check_arb_theta=True)
        ctx.prec = p1
        l2H = arb(0)
        for v in V1: l2H += (1 + v.abs_upper()).log() / arb(2).log()
        if l2H.is_finite() and all(v.rel_accuracy_bits() > 20 for v in V1): break
        p1 *= 2
    l2H = float(l2H.upper())
    l2A = float(apriori_log2H(p))
    out(f'   min Im of evaluation points y_min = {ymin:.4f} (Lemma B\'/T bound: {min(math.sqrt(3)/2, 2*math.sqrt(p)/(p+1)):.4f})')
    out(f'   Arb modular_theta cross-check ({p1} bits): {d - xc if xc == 0 else "MISMATCH " + str(xc)} points, {"all overlap" if xc == 0 else "FAIL"}')
    out(f'   coefficient bound log2 prod(1+|v|): certified-ball {l2H:.1f} bits ({l2H*math.log10(2):.1f} digits); closed-form Lemma H {l2A:.1f} bits')
    W = int(math.ceil(l2H)) + 2 * int(math.ceil(math.log2(d))) + 64
    tries = []
    while True:
        t1 = time.time()
        V, lab, _, _ = conjugates(p, 1, W)
        ok, imok, ints, maxrad, co = round_cert(V, W)
        tries.append((W, ok, imok, float(maxrad.upper()) if maxrad.is_finite() else float('inf'), time.time() - t1))
        out(f'   W = {W} bits: rounding certified = {ok}, imag parts contain 0 = {imok}, max coefficient radius = {float(maxrad.upper()):.3e}  [{time.time()-t1:.1f} s]')
        if ok and imok: break
        if W > 8 * (l2H + 200): out('   GIVING UP: precision cap'); return None
        W = int(W * 1.5)
    ctx.prec = W
    # distinctness of the d conjugates (pairwise disjoint balls)
    ndis = 0; minsep = None
    for i in range(d):
        for j in range(i + 1, d):
            if V[i].overlaps(V[j]): ndis += 1
    out(f'   pairwise-disjoint value balls: {ndis == 0} ({ndis} overlapping pairs of {d*(d-1)//2})')
    G = fmpz_poly([int(n) for n in ints])
    # exact checks
    monic = int(ints[-1]) == 1
    sqf = G.gcd(G.derivative()).degree() == 0
    cont, fac = G.factor()
    irr = (len(fac) == 1 and fac[0][1] == 1 and cont == 1)
    c0 = int(ints[0]); v2 = (abs(c0) & -abs(c0)).bit_length() - 1; odd = abs(c0) >> v2
    e = 0 if p % 8 == 7 else (p * h * (p - 1) // 6 if p % 8 == 3 else p * h * (p - 1) // 4)
    out(f'   exact: monic {monic}, degree {G.degree()} (want {d}), squarefree {sqf}, irreducible (flint factor) {irr}')
    out(f"   exact: constant term {'-' if c0 < 0 else '+'}2^{v2} * {odd}; C3 predicts 2^{e} -> {'MATCH' if odd == 1 and v2 == e else 'MISMATCH'}")
    mxd = max(len(str(abs(int(n)))) for n in ints)
    out(f'   max coefficient digits {mxd}; sha256(certified coefficient list) = {hashlib.sha256(str([int(n) for n in ints]).encode()).hexdigest()[:16]}')
    # compare with disk
    same = None
    if p in DISK:
        Dk = parse_gp(DISK[p]); same = (Dk == [int(n) for n in ints])
        out(f'   identical to floating-point polynomial on disk ({DISK[p]}): {same}')
    if p in DISK2:
        D2 = parse_gp(DISK2[p]); out(f'   identical to {DISK2[p]}: {D2 == [int(n) for n in ints]}')
    if p == 7:
        same = ([int(n) for n in ints] == KNOWN7); out(f'   identical to known x^3 - 41x^2 + 54x - 1: {same}')
    with open(os.path.join(HERE, f'certG_p{p}.txt'), 'w') as f:
        f.write(f'# certified G_{p}, coefficients of x^0 .. x^{d} (certmin.py, W = {W} bits)\n')
        for n in ints: f.write(str(int(n)) + '\n')
    # negative control: the wrong reading (conv 2) must NOT certify
    if ctrl:
        Vw, _, _, _ = conjugates(p, 2, W)
        okw, imokw, intsw, maxradw, cow = round_cert(Vw, W)
        noint = sum(1 for cf in cow if not cf.real.contains_integer())
        noimag = sum(1 for cf in cow if not cf.imag.contains(0))
        if all(P['x'] == Q['x'] for P, Q in zip(points(p, 1), points(p, 2))):
            out('   NEG CONTROL conv 2: not applicable (conv 2 gives the same translations as conv 1, e.g. h = 1)')
        else:
            out(f'   NEG CONTROL conv 2: certified = {okw and imokw}; coefficients whose real ball contains NO integer: {noint}; imag ball excludes 0: {noimag} -> '
                + ('certified NON-integral (control passes)' if (noint + noimag) > 0 else 'control FAILS'))
    tt = time.time() - t0
    out(f'   VERDICT p = {p}: ' + ('CERTIFIED' if (ok and imok and ndis == 0 and monic and irr and G.degree() == d and same is not False) else 'NOT CERTIFIED') + f'   [total {tt:.1f} s]')
    return dict(p=p, h=h, d=d, W=W, tries=tries, maxrad=tries[-1][3], ymin=ymin, l2H=l2H, l2A=l2A, mxd=mxd, same=same, irr=irr, t=tt)

if __name__ == '__main__':
    args = sys.argv[1:]
    ctrl = '--ctrl' in args
    ps = [int(a) for a in args if not a.startswith('--')]
    tag = '_'.join(str(p) for p in ps)
    for p in ps:
        certify(p, ctrl)
    with open(os.path.join(HERE, f'certmin_out_{tag}{"_ctrl" if ctrl else ""}.txt'), 'w') as f:
        f.write('\n'.join(LOG) + '\n')
