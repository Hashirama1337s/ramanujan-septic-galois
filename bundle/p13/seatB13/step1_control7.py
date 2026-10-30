import sys, time
sys.path.insert(0, r"p13/seatB13")
from mpmath import mp, mpf, exp, pi, sqrt, cos, nstr
from common_b import *

t0 = time.time()
# (a) product vs series cross-check at low precision
mp.dps = 60
for p in (7, 13):
    q = exp(-pi / sqrt(p))
    for k in range(1, (p - 1) // 2 + 1):
        a, b = q ** (p + 2 * k), q ** (p - 2 * k)
        print("p=%d k=%d prod-vs-series digits: %d" % (p, k, digits_agree(f_prod(a, b), f_series(a, b))))
    print("p=%d phi prod-vs-series digits: %d" % (p, digits_agree(phi_prod(q ** p), phi_series(q ** p))))
    # dissection check phi(q^{1/p}) = phi(q^p)(1+sum u)
    u = u_list(p, q)
    print("p=%d dissection digits: %d" % (p, digits_agree(phi_prod(q ** (mpf(1) / p)), phi_prod(q ** p) * (1 + sum(u)))))

# (b) positive control p=7 at 700 digits
mp.dps = 700
q = exp(-pi / sqrt(7))
u = u_list(7, q)
r = [(cos(2 * pi / 7) / (2 * cos(3 * pi / 7) ** 2)) ** (mpf(2) / 7),
     (cos(pi / 7) / (2 * cos(2 * pi / 7) ** 2)) ** (mpf(2) / 7),
     (cos(3 * pi / 7) / (2 * cos(pi / 7) ** 2)) ** (mpf(2) / 7)]
for k in range(3):
    print("p=7 u_%d = %s" % (k + 1, nstr(u[k], 30)))
    print("       Rebak  %s   digits agree: %d" % (nstr(r[k], 30), digits_agree(u[k], r[k])))
# identity phi(e^{-7pi sqrt7}) = 7^{-3/4} phi(e^{-pi sqrt7})(1+u1+u2+u3)
lhs = phi_prod(exp(-7 * pi * sqrt(7)))
rhs = mpf(7) ** (mpf(-3) / 4) * phi_prod(exp(-pi * sqrt(7))) * (1 + sum(r))
print("p=7 full identity with Rebak closed forms, digits:", digits_agree(lhs, rhs))
print("time %.1fs" % (time.time() - t0))
