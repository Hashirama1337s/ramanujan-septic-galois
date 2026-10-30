import sys, time, pickle
sys.path.insert(0, r"p13/seatB13")
from mpmath import mp, mpf, exp, pi, sqrt, cos, nstr
from common_b import *

t0 = time.time()
mp.dps = 1750
q = exp(-pi / sqrt(13))
u = u_list(13, q)
b = [x ** 13 for x in u]
phiA = phi_prod(exp(-pi * sqrt(13)))           # phi(e^{-pi sqrt13})
phiB = phi_prod(exp(-13 * pi * sqrt(13)))      # phi(e^{-13 pi sqrt13}) direct
chk = mpf(13) ** (mpf(-3) / 4) * phiA * (1 + sum(u))
print("identity with numerical u_k, digits:", digits_agree(phiB, chk))
for k in range(6):
    print("u_%d = %s   b_%d = %s" % (k + 1, nstr(u[k], 25), k + 1, nstr(b[k], 25)))
with open(r"p13/seatB13/vals13.pkl", "wb") as fh:
    pickle.dump({"dps": mp.dps, "u": [str(x) for x in u], "b": [str(x) for x in b],
                 "phiA": str(phiA), "phiB": str(phiB)}, fh)
print("time %.1fs" % (time.time() - t0))
