"""End-to-end check of the degree-11 identity built ONLY from: P = real root of x^3-8x^2+80x-32, the integer
coefficients found by cyclo.py, cos(2 pi j/11); compared with phi(e^{-11 pi sqrt 11}) computed directly.
phi(e^{-11 pi sqrt11}) =? 11^{-3/4} phi(e^{-pi sqrt11}) (1 + sum_k b_k^{1/11})."""
import sys
sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("verify.py", "r1.py")).read().split("if __name__")[0])
from mpmath import polyroots, findroot
mp.dps = 1300
P = findroot(lambda x: x**3 - 8*x**2 + 80*x - 32, mpf("0.4164"))
c = [mpf(1)] + [cos(2 * pi * j / 11) for j in range(1, 5)]
basis = [P ** i * cj for i in range(3) for cj in c]
REL = [[1, -320, -448, -352, -256, 32, 80, -136, -88, 32, -240, -10, 12, 4, -4, 20],
       [-1, 336, 288, 32, 384, 480, -200, -272, -240, -152, -104, 20, 24, 20, 16, 8],
       [-1, 192, -256, 192, -288, 96, -64, 32, 168, 272, 120, 8, -4, -16, -24, -8],
       [1, -96, 96, 480, 448, 192, 148, 48, -104, 136, 168, -16, -8, 8, -12, -16],
       [-1, 144, -384, -96, 96, -352, -124, 152, -120, 48, -88, 12, -16, 8, -8, 4]]
def build(rels):
    bs = [-sum(r * x for r, x in zip(rel[1:], basis)) / rel[0] for rel in rels]
    return 1 + sum(bk ** (mpf(1) / 11) for bk in bs)
lhs = phi(exp(-11 * pi * sqrt(11)))
rhs = mpf(11) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(11))) * build(REL)
print(f"identity: |lhs - rhs| ~ 1e-{digits(lhs - rhs)}   (lhs = {nstr(lhs, 30)})")
bad = [row[:] for row in REL]; bad[2][5] += 1
rhs_bad = mpf(11) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(11))) * build(bad)
print(f"negative control (one coefficient +1): |lhs - rhs| ~ 1e-{digits(lhs - rhs_bad)}")
