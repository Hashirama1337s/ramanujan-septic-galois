import sys, time, pickle, json
sys.path.insert(0, r"p13/seatB13")
from mpmath import mp, mpf, pi, cos, sqrt, pslq, nstr, fabs, log10, root
from common_b import digits_agree
import sympy as sp

D = r"p13/seatB13/"
mp.dps = 1750
V = pickle.load(open(D + "vals13.pkl", "rb"))
b_num = [mpf(s) for s in V["b"]]
phiA, phiB = mpf(V["phiA"]), mpf(V["phiB"])
T = json.load(open(D + "tableB13.json"))
T = [(T[str(k)]["den"], T[str(k)]["num"]) for k in range(1, 7)]
C = [cos(2 * pi * j / 52) for j in range(12)]

def b_from(den, num):
    return sum(mpf(num[j]) * C[j] for j in range(12)) / den

def rebuild(tab):
    us = [root(b_from(d, n), 13) for d, n in tab]
    return mpf(13) ** (mpf(-3) / 4) * phiA * (1 + sum(us))

t0 = time.time()
print("== D1 table (den, num[j=0..11]) ==")
for k, (d, n) in enumerate(T):
    print("b_%d: den=%d num=%s  digits vs numeric b_k: %d" % (k + 1, d, n, digits_agree(b_from(d, n), b_num[k])))

print("\n== D3 rebuild from table only ==")
base = rebuild(T)
dig0 = digits_agree(base, phiB)
print("phi(e^{-13 pi sqrt13}) rebuilt vs direct product: %d digits" % dig0)
worst = 0; cnt = 0
for k in range(6):
    for pos in range(13):
        for s in (+1, -1):
            tab = [(d, list(n)) for d, n in T]
            d, n = tab[k]
            if pos == 0:
                d = d + s
                if d == 0:
                    continue
            else:
                n[pos - 1] += s
            tab[k] = (d, n)
            dd = digits_agree(rebuild(tab), phiB)
            worst = max(worst, dd); cnt += 1
print("perturbations tested: %d ; best agreement after any +-1 change: %d digits" % (cnt, worst))

print("\n== D4 pairing under cos(2pi/52) -> -cos(2pi/52), i.e. coefficient j -> (-1)^j * coefficient ==")
for k, (d, n) in enumerate(T):
    img = (d, [(-1) ** j * n[j] for j in range(12)])
    match = [m + 1 for m, (d2, n2) in enumerate(T) if (d2, n2) == img]
    print("sigma(b_%d) = b_%s   (numeric check: %s)" % (k + 1, match,
          [digits_agree(b_from(*img), b_num[m - 1]) for m in match]))

print("\n== D2 elementary symmetric functions ==")
# exact: work in Q(zeta_52), z = zeta_52, cos(2 pi j/52) = (z^j + z^-j)/2
z = sp.symbols('z')
Phi = sp.Poly(sp.cyclotomic_poly(52, z), z, domain='QQ')
def red(p): return sp.Poly(p, z, domain='QQ').rem(Phi)
def cosj(j): return red(sp.Rational(1, 2) * (z ** j + z ** ((52 - j) % 52)))
cs = [cosj(j) for j in range(12)]
bex = []
for d, n in T:
    acc = sp.Poly(0, z, domain='QQ')
    for j in range(12):
        acc = acc + cs[j] * sp.Rational(n[j], d)
    bex.append(red(acc.as_expr()))
# Gauss sum: sqrt13 = sum_{a=1}^{12} (a/13) zeta_13^a, zeta_13 = z^4
s13 = red(sum(sp.jacobi_symbol(a, 13) * z ** (4 * a) for a in range(1, 13)))
assert red((s13 * s13).as_expr() - 13).is_zero
# e_i via product prod (X + b_k)
X = sp.symbols('X')
es = [sp.Poly(1, z, domain='QQ')]
for bk in bex:
    new = [sp.Poly(0, z, domain='QQ')] * (len(es) + 1)
    for i, e in enumerate(es):
        new[i] = red((new[i] + e).as_expr())
        new[i + 1] = red((new[i + 1] + e * bk).as_expr())
    es = new
ok_all = True
for i in range(1, 7):
    e = es[i]
    # solve e = A + B*s13 with rational A, B: compare coefficients
    A, B = sp.symbols('A B')
    sol = sp.solve(sp.Poly((e - (sp.Poly(A, z) + sp.Poly(B, z) * s13)).as_expr(), z).coeffs(), [A, B], dict=True)
    if not sol:
        print("e_%d NOT in Q(sqrt13) (exact)" % i); ok_all = False; continue
    Av, Bv = sol[0][A], sol[0][B]
    dd = sp.ilcm(sp.fraction(Av)[1], sp.fraction(Bv)[1])
    # numeric cross-check vs symmetric function of numerical b_k
    from itertools import combinations
    en = sum(__import__('functools').reduce(lambda x, y: x * y, c, mpf(1)) for c in combinations(b_num, i))
    ev = (mpf(int(Av * dd)) + mpf(int(Bv * dd)) * sqrt(13)) / dd
    print("e_%d = (%s + %s*sqrt13)/%s   numeric digits: %d" % (i, Av * dd, Bv * dd, dd, digits_agree(ev, en)))
print("all e_i in Q(sqrt13):", ok_all)
# independent numeric route: pslq on [e_i, 1, sqrt13]
from itertools import combinations
from functools import reduce
for i in range(1, 7):
    en = sum(reduce(lambda x, y: x * y, c, mpf(1)) for c in combinations(b_num, i))
    mp.dps = 400
    print("  pslq e_%d:" % i, pslq([+en, mpf(1), sqrt(13)], maxcoeff=10 ** 80, maxsteps=10 ** 6))
    mp.dps = 1750

print("\n== negative controls ==")
mp.dps = 1750
wrong = [cos(2 * pi * j / 13) for j in range(6)]
print("b_1 vs Q(cos 2pi/13), 1750 dps:", pslq([b_num[0]] + wrong, maxcoeff=10 ** 60, maxsteps=10 ** 6))
mp.dps = 300
print("b_1 vs Q(cos 2pi/13), 300 dps:", pslq([+b_num[0]] + [cos(2 * pi * j / 13) for j in range(6)], maxcoeff=10 ** 60, maxsteps=10 ** 6))
mp.dps = 1750
pert = b_num[0] + mpf(10) ** (-300)
print("b_1+1e-300 vs Q(cos 2pi/52), 1750 dps:", pslq([pert] + C, maxcoeff=10 ** 60, maxsteps=10 ** 6))
mp.dps = 600
print("b_1+1e-300 vs Q(cos 2pi/52), 600 dps:", pslq([+pert] + [cos(2 * pi * j / 52) for j in range(12)], maxcoeff=10 ** 60, maxsteps=10 ** 6))
mp.dps = 1750
# p=7 analogue of the field claim (positive control of the PSLQ step itself)
print("time %.1fs" % (time.time() - t0))
