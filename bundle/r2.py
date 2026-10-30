"""BAR-R2: findpoly on b_k = u_k^p. Usage: python -I r2.py p"""
import sys, time
p = int(sys.argv[1])
sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("r2.py", "r1.py")).read().split("if __name__")[0])
from mpmath import findpoly, polyval
mp.dps = 3000
u = us(p)
for k, uk in enumerate(u):
    b_hi = uk ** p
    mp.dps = 2000
    b = +b_hi
    t0 = time.time(); poly = None
    for d in range(1, 31):
        poly = findpoly(b, d, maxcoeff=10 ** 40, maxsteps=10 ** 6)
        print(f"   b_{k+1} degree {d} tried ({time.time()-t0:.0f}s)", flush=True) if d % 5 == 0 else None
        if poly:
            break
    mp.dps = 3000
    chk = digits(polyval([mpf(c) for c in poly], b_hi)) if poly else None
    print(f"p={p} b_{k+1}={nstr(b_hi, 15)}: degree {len(poly)-1 if poly else None} poly {poly} holds to {chk} digits ({time.time()-t0:.0f}s)", flush=True)
