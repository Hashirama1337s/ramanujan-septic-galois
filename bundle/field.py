"""POST HOC: express e_j(b) in Q(P) basis {1, P, P^2} (P = prod u_k, root of x^3-8x^2+80x-32), PSLQ at 1500 digits."""
import sys
sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("field.py", "r1.py")).read().split("if __name__")[0])
from mpmath import pslq
mp.dps = 2000
u = us(11); b = [x ** 11 for x in u]
P = mpf(1)
for x in u: P *= x
e = [mpf(1)]
for x in b:
    e = [e[0]] + [e[i] + x * e[i - 1] for i in range(1, len(e))] + [x * e[-1]]
mp.dps = 1500
for j in range(1, 6):
    rel = pslq([+e[j], mpf(1), +P, +P ** 2], maxcoeff=10 ** 60, maxsteps=10 ** 6)
    if rel:
        d0, c0, c1, c2 = rel
        resid = d0 * e[j] + c0 + c1 * P + c2 * P ** 2
        print(f"e_{j} = -({c0} + {c1} P + {c2} P^2)/{d0}   residual 1e-{digits(resid)}")
    else:
        print(f"e_{j}: not in Q(P) with coeffs <= 1e60")
