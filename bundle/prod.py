"""POST HOC: the product P = prod u_k (septic analogue 'p = uvw') and P^p at p=11; findpoly deg<=30."""
import sys
p = int(sys.argv[1]); sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("prod.py", "r1.py")).read().split("if __name__")[0])
from mpmath import findpoly, polyval
mp.dps = 3000
u = us(p); P = mpf(1)
for x in u: P *= x
for name, val in (("P", P), ("P^2", P**2), (f"P^{p}", P**p)):
    mp.dps = 2000; v = +val; poly = None
    for d in range(1, 31):
        poly = findpoly(v, d, maxcoeff=10**40, maxsteps=10**6)
        if poly: break
    mp.dps = 3000
    print(f"p={p} {name}={nstr(val,15)}: degree {len(poly)-1 if poly else None} {poly} holds {digits(polyval([mpf(c) for c in poly], val)) if poly else None}", flush=True)
