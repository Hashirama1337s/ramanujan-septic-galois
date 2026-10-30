"""BAR-R13 runner: degree-13 table in the basis cos(2 pi j/52), j = 0..11; symmetric functions; rebuild; controls."""
import json
import sys
import time

sys.argv = [sys.argv[0], "none"]
exec(open(__file__.replace("p13\\r13.py", "r1.py").replace("p13/r13.py", "r1.py")).read().split("if __name__")[0])
from mpmath import pslq, sqrt as msqrt

out = []


def log(s):
    print(s, flush=True)
    out.append(s)


def rel_for(x, basis, cap=10 ** 15):
    return pslq([x] + basis, maxcoeff=cap, maxsteps=10 ** 6)


# positive control p = 7
mp.dps = 600
u7 = us(7)
b7 = [x ** 7 for x in u7]
B7 = [cos(2 * pi * j / 7) for j in range(3)]
for k, x in enumerate(b7):
    r = rel_for(x, B7)
    log(f"control p=7 b_{k+1}: relation {r}")

# main p = 13
mp.dps = 2000
u = us(13)
b_hi = [x ** 13 for x in u]
B_hi = [cos(2 * pi * j / 52) for j in range(12)]
mp.dps = 1500
table = []
t0 = time.time()
for k in range(6):
    r = rel_for(+b_hi[k], [+x for x in B_hi])
    if not r:
        log(f"T1 b_{k+1}: NO relation (coeff <= 1e15)")
        table.append(None)
        continue
    mp.dps = 2000
    resid = r[0] * b_hi[k] + sum(c * x for c, x in zip(r[1:], B_hi))
    log(f"T1 b_{k+1}: d={r[0]}, max|n|={max(abs(c) for c in r[1:])}, holds to {digits(resid)} digits at 2000 "
        f"({time.time() - t0:.0f}s)")
    table.append(r)
    mp.dps = 1500
t1 = all(r is not None for r in table)
mp.dps = 2000
if t1:
    t1 = all(digits(r[0] * b_hi[k] + sum(c * x for c, x in zip(r[1:], B_hi))) >= 1900 for k, r in enumerate(table))
log(f"T1: {'HOLDS' if t1 else 'FAILED'}")
json.dump({"basis": "cos(2 pi j/52), j=0..11; row = [d, n_0..n_11] with d*b_k + sum n_j B_j = 0", "rows": table},
          open(__file__.replace("r13.py", "table13.json"), "w"))

# T2 symmetric functions in Q(sqrt13)
e = [mpf(1)]
for x in b_hi:
    e = [e[0]] + [e[i] + x * e[i - 1] for i in range(1, len(e))] + [x * e[-1]]
t2 = True
s13 = msqrt(13)
for j in range(1, 7):
    mp.dps = 1500
    r = pslq([+e[j], mpf(1), +s13], maxcoeff=10 ** 40, maxsteps=10 ** 6)
    mp.dps = 2000
    if r:
        d = digits(r[0] * e[j] + r[1] + r[2] * s13)
        log(f"T2 e_{j}: {r} holds {d}")
        t2 = t2 and d >= 1900
    else:
        log(f"T2 e_{j}: not in Q(sqrt13)")
        t2 = False
log(f"T2: {'HOLDS' if t2 else 'FAILED'}")

# T3 rebuild + perturbations
def rebuild(rows):
    bs = [-sum(c * x for c, x in zip(r[1:], B_hi)) / r[0] for r in rows]
    return mpf(13) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(13))) * (1 + sum(x ** (mpf(1) / 13) for x in bs))


if t1:
    lhs = phi(exp(-13 * pi * sqrt(13)))
    log(f"T3 identity rebuilt from table: {digits(lhs - rebuild(table))} digits")
    worst = 0
    for k in range(6):
        for i in range(1, 13):
            for dlt in (1, -1):
                rows = [r[:] for r in table]
                rows[k][i] += dlt
                worst = max(worst, digits(lhs - rebuild(rows)))
    log(f"T3 perturbations: 144 single-integer changes, best agreement {worst} digits (bar < 50)")

# negative controls
mp.dps = 1500
wrong = [cos(2 * pi * j / 13) for j in range(6)]
log(f"NC(a) wrong field Q(cos 2pi/13): {rel_for(+b_hi[0], wrong)}")
log(f"NC(b) b_1 + 1e-300: {rel_for(+b_hi[0] + mpf(10) ** -300, [+x for x in B_hi])}")
open(__file__.replace("r13.py", "r13_out.txt"), "w").write("\n".join(out) + "\n")
