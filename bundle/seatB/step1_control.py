import sys, time
sys.path.insert(0, 'seatB')
import mpmath as mp
from core import u_list, phi_series

def digits(a, b):
    d = abs(a - b)
    if d == 0:
        return mp.mp.dps
    return int(-mp.log10(d / abs(b)))

# cross-check product vs series at low precision
mp.mp.dps = 60
for p in (7, 11):
    _, up = u_list(p)
    _, us = u_list(p, use_series=True)
    print('p=%d product-vs-series digits:' % p, [digits(a, b) for a, b in zip(up, us)])

# dissection check at moderate precision
mp.mp.dps = 300
for p in (7, 11):
    q, u = u_list(p)
    lhs = phi_series(q ** (mp.mpf(1) / p)) / phi_series(q ** p)
    print('p=%d dissection digits:' % p, digits(1 + mp.fsum(u), lhs))

# positive control p=7 at 1600 digits
t = time.time()
mp.mp.dps = 1600
q, u = u_list(7)
pi = mp.pi
c = mp.cos
ref = [(c(2*pi/7) / (2*c(3*pi/7)**2)) ** (mp.mpf(2)/7),
       (c(pi/7) / (2*c(2*pi/7)**2)) ** (mp.mpf(2)/7),
       (c(3*pi/7) / (2*c(pi/7)**2)) ** (mp.mpf(2)/7)]
print('p=7 control digits vs Rebak closed forms:', [digits(a, b) for a, b in zip(u, ref)])
print('u7 =', [mp.nstr(x, 20) for x in u])
print('time', time.time() - t)
