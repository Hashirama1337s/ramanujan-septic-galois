"""C4: rebuild phi(e^{-11 pi sqrt11}) from ONLY the cubic + integer table (+ phi(e^{-pi sqrt11}))."""
import sys, time, json
sys.path.insert(0, 'seatB')
import mpmath as mp
from core import phi_series, phi_prod

DPS = 1600
mp.mp.dps = DPS
F = json.load(open('seatB/found_1600.json'))
CUB = F['cubic']            # coefficients high->low, as found by findpoly
TAB = F['table']            # [lead, 15 coeffs]: lead*b + sum c*basis = 0
E = F['e']

pi = mp.pi
s11 = mp.sqrt(11)
cosb = [mp.mpf(1)] + [mp.cos(2 * pi * j / 11) for j in range(1, 5)]
phi_small = phi_series(mp.exp(-pi * s11))          # phi(e^{-pi sqrt 11}) (allowed input)
target = phi_series(mp.exp(-11 * pi * s11))        # direct computation
target2 = phi_prod(mp.exp(-11 * pi * s11))
print('direct target series vs product digits:', int(-mp.log10(abs(target - target2))) if target != target2 else DPS)


def real_root(cub):
    # real root of cubic; use polyroots then polish
    cub = list(cub)
    while cub and cub[0] == 0:
        cub = cub[1:]
    if len(cub) < 2:
        return None
    rts = mp.polyroots(cub, maxsteps=400, extraprec=400)
    reals = [mp.re(r) for r in rts if abs(mp.im(r)) < mp.mpf(10) ** (-50)]
    if not reals:
        return None
    # conservative for the negative control: take the real root nearest the true P
    r = min(reals, key=lambda x: abs(x - mp.mpf('0.41643943427586409568')))
    r = mp.findroot(lambda x: mp.polyval(cub, x), r)
    return r


def rebuild(cub, tab):
    P = real_root(cub)
    if P is None:
        return None
    basis = [P ** i * cosb[j] for i in range(3) for j in range(5)]
    tot = mp.mpf(1)
    for row in tab:
        lead = row[0]
        if lead == 0:
            return None
        bk = -mp.fsum(c * x for c, x in zip(row[1:], basis)) / lead
        if bk <= 0:
            return None
        tot += mp.root(bk, 11)
    return 11 ** (mp.mpf(-3) / 4) * phi_small * tot


def agree(x):
    if x is None:
        return -1
    d = abs(x - target)
    return DPS if d == 0 else max(0, int(-mp.log10(d / target)))


t0 = time.time()
base = agree(rebuild(CUB, TAB))
print('C4 rebuild digits of agreement:', base)

# negative control: change any one integer by +-1
worst = 0
fails = []
n = 0
for idx in range(len(CUB)):
    for dlt in (1, -1):
        c2 = list(CUB); c2[idx] += dlt
        a = agree(rebuild(c2, TAB)); n += 1
        worst = max(worst, a)
        if a >= 20: fails.append(('cubic', idx, dlt, a))
for k in range(5):
    for idx in range(16):
        for dlt in (1, -1):
            t2 = [list(r) for r in TAB]; t2[k][idx] += dlt
            a = agree(rebuild(CUB, t2)); n += 1
            worst = max(worst, a)
            if a >= 20: fails.append(('table', k, idx, dlt, a))
print('negative control: %d perturbations, max digits of agreement after perturbation = %d' % (n, worst))
print('perturbations still agreeing to >=20 digits:', fails)

# quintic route cross-check: roots of quintic built from e_j(P) vs table b_k
P = real_root(CUB)
ej = []
for j in range(1, 6):
    r = E[str(j)]
    ej.append(-(r[1] + r[2] * P + r[3] * P ** 2) / r[0])
quint = [1, -ej[0], ej[1], -ej[2], ej[3], -ej[4]]
qr = sorted([mp.re(z) for z in mp.polyroots(quint, maxsteps=400, extraprec=2000)], reverse=True)
basis = [P ** i * cosb[j] for i in range(3) for j in range(5)]
tb = [-mp.fsum(c * x for c, x in zip(row[1:], basis)) / row[0] for row in TAB]
print('quintic roots vs table b_k digits:', [int(-mp.log10(abs(a - b) / abs(b))) if a != b else DPS for a, b in zip(qr, tb)])
tot = 11 ** (mp.mpf(-3) / 4) * phi_small * (1 + mp.fsum(mp.root(x, 11) for x in qr))
print('C4 via quintic route digits:', agree(tot))
print('e5 vs P^11 digits:', int(-mp.log10(abs(ej[4] - P ** 11) / P ** 11)))
print('time', time.time() - t0)
