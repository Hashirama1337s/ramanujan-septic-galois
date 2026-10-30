"""POST HOC: is b_k = u_k^11 in Q(P)(cos 2pi/11)? PSLQ on {b_k} + {P^i c_j : i=0..2, j=0..4} (c_0=1), 1500 digits."""
import sys
sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("cyclo.py", "r1.py")).read().split("if __name__")[0])
from mpmath import pslq
mp.dps = 2000
u = us(11); b = [x ** 11 for x in u]
P = mpf(1)
for x in u: P *= x
c = [mpf(1)] + [cos(2 * pi * j / 11) for j in range(1, 5)]
basis = [P ** i * cj for i in range(3) for cj in c]
mp.dps = 1500
for k, bk in enumerate(b):
    rel = pslq([+bk] + [+x for x in basis], maxcoeff=10 ** 40, maxsteps=10 ** 6)
    if rel:
        resid = rel[0] * bk + sum(r * x for r, x in zip(rel[1:], basis))
        print(f"b_{k+1}: FOUND, denominator {rel[0]}, max |coeff| {max(abs(r) for r in rel)}, residual 1e-{digits(resid)}")
        print("   ", rel)
    else:
        print(f"b_{k+1}: not in Q(P, cos 2pi/11) with coeffs <= 1e40")
