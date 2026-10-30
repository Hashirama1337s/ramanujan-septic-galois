import sys, time, json
sys.path.insert(0, 'seatB')
import mpmath as mp
from core import u_list

DPS = int(sys.argv[1]) if len(sys.argv) > 1 else 1600
mp.mp.dps = DPS
t0 = time.time()
q, u = u_list(11)
print('u =', [mp.nstr(x, 25) for x in u])
P = mp.fprod(u)
print('P =', mp.nstr(P, 40))

# C1
for deg in (1, 2, 3):
    c = mp.findpoly(P, deg, maxcoeff=10**12, maxsteps=10**6)
    print('findpoly deg', deg, c)
    if c:
        break
cub = c
res = mp.polyval(cub, P)
print('cubic residual', mp.nstr(res, 5))
# all roots of cubic
roots = mp.polyroots(cub, maxsteps=200, extraprec=200)
print('cubic roots', [mp.nstr(r, 20) for r in roots])

# C2
b = [x ** 11 for x in u]
print('b =', [mp.nstr(x, 25) for x in b])
# elementary symmetric
e = [mp.mpf(1)]
for x in b:
    e = [e[0]] + [e[j] + x * e[j - 1] for j in range(1, len(e))] + [x * e[-1]]
print('e_j =', [mp.nstr(x, 25) for x in e])
ecoef = {}
for j in range(1, 6):
    rel = mp.pslq([e[j], 1, P, P ** 2], maxcoeff=10**30, maxsteps=10**6)
    print('e_%d relation' % j, rel)
    ecoef[j] = rel

# C3
pi = mp.pi
cosb = [mp.mpf(1)] + [mp.cos(2 * pi * j / 11) for j in range(1, 5)]
basis = []
names = []
for i in range(3):
    for j in range(5):
        basis.append(P ** i * cosb[j])
        names.append('P^%d c%d' % (i, j))
table = []
for k in range(5):
    rel = mp.pslq([b[k]] + basis, maxcoeff=10**30, maxsteps=10**6)
    print('b_%d relation' % (k + 1), rel)
    table.append(rel)

json.dump({'cubic': [int(x) for x in cub],
           'e': {str(j): ([int(x) for x in ecoef[j]] if ecoef[j] else None) for j in ecoef},
           'table': [([int(x) for x in r] if r else None) for r in table],
           'names': names},
          open('seatB/found_%d.json' % DPS, 'w'), indent=1)
print('time', time.time() - t0)
