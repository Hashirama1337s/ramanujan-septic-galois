"""BAR-R1 (+Amendment 1) degree-11 scorer: P1 (findpoly at 700 digits, check at 1200) and P2 (PSLQ in Q(cos 2pi/11))."""
import sys

from mpmath import mp, mpf, findpoly, pslq, polyval, nstr, fabs, log10, cos, pi

sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("r1_score.py", "r1.py")).read().split("if __name__")[0])


def nd(x):
    return int(-log10(fabs(x))) if x != 0 else mp.dps


mp.dps = 1200
res, cs = deg11()
hi = [mpf(a) for a in res]
out = []
p1 = True
for k, a_hi in enumerate(hi):
    mp.dps = 700
    a = +a_hi
    poly = None
    for deg in range(1, 11):
        poly = findpoly(a, deg, maxcoeff=10 ** 15)
        if poly:
            break
    mp.dps = 1200
    if not poly:
        out.append(f"a_{k + 1}: NO polynomial of degree <= 10, coeffs <= 1e15 at 700 digits")
        p1 = False
        continue
    r = polyval([mpf(c) for c in poly], a_hi)
    ok = nd(r) >= 1000
    p1 = p1 and ok
    out.append(f"a_{k + 1} = {nstr(a_hi, 20)}: degree {len(poly) - 1} polynomial {poly}; holds to {nd(r)} digits "
               f"at 1200 ({'OK' if ok else 'FAIL'})")
out.append(f"P1: {'HOLDS' if p1 else 'FAILED'}")
p2 = True
mp.dps = 1000
cs = [cos(2 * pi * j / 11) for j in range(1, 6)]
for k, a_hi in enumerate(hi):
    rel = pslq([+a_hi, mpf(1)] + cs[:4], maxcoeff=10 ** 8, maxsteps=10 ** 6)
    if rel:
        resid = rel[0] * a_hi + rel[1] + sum(c * x for c, x in zip(rel[2:], cs[:4]))
        out.append(f"P2 a_{k + 1}: relation {rel} (residual 1e-{nd(resid)})")
        p2 = p2 and nd(resid) >= 950
    else:
        out.append(f"P2 a_{k + 1}: no relation in Q(cos 2pi/11) with coeffs <= 1e8")
        p2 = False
out.append(f"P2: {'HOLDS' if p2 else 'FAILED'}")
txt = "\n".join(out)
print(txt)
open(__file__.replace("r1_score.py", "deg11_result.txt"), "w").write(txt + "\n")
