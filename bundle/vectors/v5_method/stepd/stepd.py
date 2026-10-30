# stepd.py -- rigorous Step D of proof/cert/CERT-C4-STRONG.md (sine-product identities at p = 5, 7, 13, 37).
# Exact half: python-flint fmpz/fmpq polynomials (Q(theta) = Q[t]/(P_N), theta = 2cos(2 pi/N)).
# Analytic half: certmin.py (Theorem M + Arb balls) for G_p and the conjugate balls.
# Usage: py -3.11 -I stepd.py 7 5 13 37      Output: stepd_out.txt
import sys, os, time, importlib.util
# (machine-specific sys.path line removed for release; install python-flint normally)
from flint import arb, acb, fmpz_poly, fmpq_poly, fmpq, fmpz, ctx
sys.set_int_max_str_digits(0)
HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location('certmin', os.path.join(HERE, '..', 'certmin.py'))
cm = importlib.util.module_from_spec(spec); spec.loader.exec_module(cm)
WCERT = {5: 81, 7: 75, 13: 203, 37: 1797}       # W used by the certified certmin runs; Step D uses 2W
NSINE = os.path.join(HERE, '..', '..', '..', 'proof', 'cert', 'minexp_out.txt')
LOG = []
def out(*a):
    s = ' '.join(str(x) for x in a); print(s, flush=True); LOG.append(s)

def gcd(a, b):
    while b: a, b = b, a % b
    return a

def field_poly(N):
    """P_N(t) = prod_{1<=a<N/2, gcd(a,N)=1} (t - 2cos(2 pi a/N)), rounded from 512-bit balls, then EXACT check
    x^deg P_N(x + 1/x) = Phi_N(x)."""
    ctx.prec = 512
    P = [arb(1)]
    for a in range(1, (N + 1) // 2):
        if gcd(a, N) != 1 or 2 * a == N: continue
        r = 2 * (arb(2 * a) / N).cos_pi()
        Q = [arb(0)] * (len(P) + 1)
        for i, c in enumerate(P):
            Q[i + 1] += c; Q[i] -= r * c
        P = Q
    co = [c.unique_fmpz() for c in P]
    assert all(c is not None for c in co)
    Pz = fmpz_poly([int(c) for c in co]); d = Pz.degree()
    x2p1 = fmpz_poly([1, 0, 1])
    lhs = sum((fmpz_poly([0] * (d - i) + [1]) * x2p1 ** i * int(co[i]) for i in range(d + 1)), fmpz_poly([0]))
    ok = (lhs == fmpz_poly.cyclotomic(N))
    return fmpq_poly([int(c) for c in co]), ok

def cheb(a, Pt):
    """C_a(t) with C_a(2cos x) = 2cos(a x), reduced mod Pt (exact)."""
    c0, c1 = fmpq_poly([2]), fmpq_poly([0, 1])
    if a == 0: return c0
    for _ in range(a - 1):
        c0, c1 = c1, (fmpq_poly([0, 1]) * c1 - c0) % Pt
    return c1 % Pt

def powmod(x, e, Pt):
    if e < 0:
        x = x.inv_mod(Pt) if hasattr(x, 'inv_mod') else invmod(x, Pt); e = -e
    r = fmpq_poly([1])
    while e:
        if e & 1: r = (r * x) % Pt
        x = (x * x) % Pt; e >>= 1
    return r

def invmod(x, Pt):
    g, s, t = x.xgcd(Pt)          # s x + t Pt = g (a nonzero constant since Pt irreducible)
    assert g.degree() == 0
    return (s / g[0]) % Pt

def compose(c, y, Pt):              # c(y) mod Pt, Horner
    r = fmpq_poly([0])
    for i in range(c.degree(), -1, -1):
        r = (r * y + c[i]) % Pt
    return r

def iota_at(c, N, a):               # ball for c(2cos(2 pi a/N))
    th = 2 * (arb(2 * a) / N).cos_pi()
    r = arb(0)
    for i in range(c.degree(), -1, -1):
        q = c[i]; r = r * th + arb(int(q.p)) / int(q.q)
    return r

def sine_rel(p):
    for line in open(NSINE):
        if line.strip().startswith('b_1^1') and f' {p}^' in line and f'/{ {5:20,7:7,13:52,37:148}[p] }))' .replace(' ', '') in line.replace(' ', ''):
            pre, _, vec = line.partition('nonzero n_j:')
            a2 = int(pre.split('2^')[1].split()[0]); bp = int(pre.split(f'{p}^')[1].split()[0])
            n = [int(x) for x in vec.strip().strip('[]').split(',')]
            return a2, bp, n
    raise ValueError('no E = 1 relation for p = %d' % p)

def stepd(p):
    t0 = time.time()
    L = [l.strip() for l in open(os.path.join(HERE, f'c1_p{p}.txt')) if l.strip()]
    N = int(L[0]); E, A, B = map(int, L[1].split()); C = [int(x) for x in L[2].split()]
    c1 = fmpq_poly([fmpq(*[int(u) for u in (s.split('/') + ['1'])[:2]]) for s in L[3:]])
    out(f'\n========== p = {p}, N = {N}')
    Pt, okP = field_poly(N)
    out(f'   [X1] field polynomial P_N exact (x^deg P_N(x+1/x) = Phi_N): {okP}, degree {Pt.degree()}')
    S = {j: (2 - cheb(j, Pt)) % Pt for j in range(1, N)}
    # certified G_p and conjugate balls
    W = 2 * WCERT[p]
    V, lab, _, _ = cm.conjugates(p, 1, W)
    okR, imok, ints, maxrad, _ = cm.round_cert(V, W)
    G = [int(n) for n in ints] if okR and imok else None
    disk = [int(l) for l in open(os.path.join(HERE, '..', f'certG_p{p}.txt')) if not l.startswith('#')]
    ndis = sum(1 for i in range(len(V)) for j in range(i + 1, len(V)) if V[i].overlaps(V[j]))
    out(f'   [B0] G_p certified at W = {W}: {G is not None}, identical to certG_p{p}.txt: {G == disk}, conjugate balls pairwise disjoint: {ndis == 0}, degree {len(V)} = phi(N)/2: {len(V) == Pt.degree()}; lab[0] = {lab[0]}')
    # exact checks
    Gc = fmpq_poly([0])
    for i in range(len(G) - 1, -1, -1): Gc = (Gc * c1 + G[i]) % Pt
    out(f'   [X2] G_p(c_1) = 0 in Q(theta): {Gc == 0}')
    RE = fmpq_poly([fmpz(2) ** A if A >= 0 else fmpq(1, 2 ** -A)]) * (fmpq(p) ** B if B >= 0 else fmpq(1, p ** -B))
    for j, cj in enumerate(C, 1): RE = (RE * powmod(S[j], cj // 2, Pt)) % Pt
    okE = (powmod(c1, E, Pt) == RE % Pt)
    out(f'   [X3] e_mult form: c_1^{E} = 2^{A} {p}^{B} prod S_j^(C_j/2) exactly: {okE}')
    a2, bp, n = sine_rel(p)
    R1 = fmpq_poly([fmpq(4) ** a2 if a2 >= 0 else fmpq(1, 4 ** -a2)]) * (fmpq(p * p) ** bp if bp >= 0 else fmpq(1, (p * p) ** -bp))
    for j, nj in enumerate(n, 1):
        if nj: R1 = (R1 * powmod(S[j], nj, Pt)) % Pt
    ok1 = (powmod(c1, 2, Pt) == R1 % Pt)
    out(f'   [X4] E = 1 form: c_1^2 = 4^{a2} {p}^(2*{bp}) prod S_j^n_j exactly: {ok1}   (n = {n})')
    # ball identification of iota(c_1)
    ctx.prec = W
    ic = iota_at(c1, N, 1)
    hits = [i for i in range(len(V)) if V[i].overlaps(acb(ic))]
    out(f'   [B1] iota(c_1) ball {ic.mid().str(12)} +/- {float(ic.rad()):.1e} meets conjugate balls {hits} -> iota(c_1) = b_1: {hits == [0]}')
    rhs = arb(2) ** a2 * (arb(p) ** bp)
    for j, nj in enumerate(n, 1):
        if nj: rhs *= (2 * (arb(j) / N).sin_pi()) ** nj
    out(f'   [B2] iota(c_1) > 0: {ic > 0}; 2^a p^b prod s_j^n_j > 0: {rhs > 0}; balls agree: {rhs.overlaps(ic)} -> b_1 = 2^{a2} {p}^{bp} prod (2 sin(pi j/{N}))^n_j')
    # all conjugates via sigma_a
    seen = {}; ak = {}
    for a in range(1, (N + 1) // 2):
        if gcd(a, N) != 1 or 2 * a == N: continue
        ia = iota_at(c1, N, a)
        h = [i for i in range(len(V)) if V[i].overlaps(acb(ia))]
        if len(h) != 1: seen = None; break
        seen[h[0]] = seen.get(h[0], 0) + 1
        if lab[h[0]][0] == (1, 0, p): ak[lab[h[0]][1]] = (a, bool(ia > 0))
    bij = seen is not None and sorted(seen) == list(range(len(V))) and all(v == 1 for v in seen.values())
    out(f'   [B3] each sigma_a(c_1) meets exactly one conjugate ball, bijectively: {bij}; principal b_k <- a_k (positive): ' + ', '.join(f'b_{k}<-{ak[k][0]}{"+" if ak[k][1] else "-"}' for k in sorted(ak)))
    extra = True
    if p == 7:   # Rebak septic forms for b_2, b_3 (squares, exact) on the matching a
        forms = {2: {1: -2, 2: 6, 3: -4}, 3: {1: 6, 2: -4, 3: -2}}
        for k, fm in forms.items():
            a = ak[k][0]; sa = compose(c1, cheb(a, Pt), Pt)
            rr = fmpq_poly([1])
            for j, e in fm.items(): rr = (rr * powmod(S[j], e, Pt)) % Pt
            okk = (powmod(sa, 2, Pt) == rr); extra = extra and okk and ak[k][1]
            out(f'   [X5] p = 7: b_{k}^2 = prod S_j^{fm} exactly via sigma_{a}: {okk} (b_{k} > 0: {ak[k][1]}) -> Rebak form')
    allok = okP and G == disk and ndis == 0 and Gc == 0 and okE and ok1 and hits == [0] and bool(ic > 0) and bool(rhs > 0) and bij and extra and all(v[1] for v in ak.values())
    out(f'   VERDICT p = {p}: ' + ('RIGOROUS (every step enclosed)' if allok else 'NOT RIGOROUS') + f'   [{time.time()-t0:.1f} s]')
    return allok

if __name__ == '__main__':
    res = {int(a): stepd(int(a)) for a in sys.argv[1:]}
    out('\nSUMMARY:', res)
    open(os.path.join(HERE, 'stepd_out.txt'), 'w').write('\n'.join(LOG) + '\n')
