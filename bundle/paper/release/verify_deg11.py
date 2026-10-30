"""Standalone check of the eleventh- and thirteenth-degree analogues of Ramanujan's lost-notebook p.206 identity.

Needs only Python 3 and mpmath (pip install mpmath). Usage:  python verify_deg11.py [digits]   (default 1000)

Checks:
  1. P = product of the five dissection pieces u_k at q = e^{-pi/sqrt 11} is a root of P^3 - 8P^2 + 80P - 32.
  2. Each u_k^11 equals the integer combination of P^i cos(2 pi j/11) in TABLE.
  3. phi(e^{-11 pi sqrt 11}) = 11^{-3/4} phi(e^{-pi sqrt 11}) (1 + sum_k b_k^{1/11}), rebuilt from TABLE and the cubic only.
  4. Negative control: changing one table entry by +1 must break check 3.
  5-7. The same for p = 13 with the table M13 in the basis cos(2 pi j/52).
"""
import sys

from mpmath import mp, mpf, exp, pi, sqrt, cos, fabs, log10, findroot

mp.dps = int(sys.argv[1]) if len(sys.argv) > 1 else 1000

# rows k = 1..5; columns: P^0 (1, c1, c2, c3, c4), P^1 (same), P^2 (same), with c_j = cos(2 pi j/11)
TABLE = [
    [320, 448, 352, 256, -32, -80, 136, 88, -32, 240, 10, -12, -4, 4, -20],
    [336, 288, 32, 384, 480, -200, -272, -240, -152, -104, 20, 24, 20, 16, 8],
    [192, -256, 192, -288, 96, -64, 32, 168, 272, 120, 8, -4, -16, -24, -8],
    [96, -96, -480, -448, -192, -148, -48, 104, -136, -168, 16, 8, -8, 12, 16],
    [144, -384, -96, 96, -352, -124, 152, -120, 48, -88, 12, -16, 8, -8, 4],
]


def f(a, b):
    """Ramanujan's f(a, b) = sum over integers n of a^{n(n+1)/2} b^{n(n-1)/2}."""
    s, n, eps = mpf(1), 1, mpf(10) ** (-(mp.dps + 20))
    while True:
        t = a ** (n * (n + 1) // 2) * b ** (n * (n - 1) // 2) + a ** (n * (n - 1) // 2) * b ** (n * (n + 1) // 2)
        s += t
        if t < eps:
            return s
        n += 1


def phi(q):
    return f(q, q)


def agree(x, y):
    d = fabs(x - y)
    return mp.dps if d == 0 else int(-log10(d))


q = exp(-pi / sqrt(11))
u = [2 * q ** (mpf(k * k) / 11) * f(q ** (11 + 2 * k), q ** (11 - 2 * k)) / phi(q ** 11) for k in range(1, 6)]
P_direct = u[0] * u[1] * u[2] * u[3] * u[4]
P = findroot(lambda x: x ** 3 - 8 * x ** 2 + 80 * x - 32, mpf("0.4164"))
print(f"1. product of pieces vs root of P^3-8P^2+80P-32: {agree(P_direct, P)} digits")

c = [mpf(1)] + [cos(2 * pi * j / 11) for j in range(1, 5)]
basis = [P ** i * cj for i in range(3) for cj in c]


def bs(table):
    return [sum(t * x for t, x in zip(row, basis)) for row in table]


b = bs(TABLE)
print("2. u_k^11 vs table:", [agree(u[k] ** 11, b[k]) for k in range(5)], "digits")

lhs = phi(exp(-11 * pi * sqrt(11)))
rhs = mpf(11) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(11))) * (1 + sum(x ** (mpf(1) / 11) for x in b))
rel_nontrivial = fabs((lhs - rhs) / (lhs - 1))  # relative to the non-trivial part phi - 1 (about 3.3e-50)
print(f"3. identity rebuilt from table + cubic: {agree(lhs, rhs)} digits; relative to phi-1: "
      f"{int(-log10(rel_nontrivial)) if rel_nontrivial else mp.dps} digits")

bad = [row[:] for row in TABLE]
bad[2][5] += 1
rhs_bad = mpf(11) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(11))) * (1 + sum(x ** (mpf(1) / 11) for x in bs(bad)))
print(f"4. negative control (one entry +1): {agree(lhs, rhs_bad)} digits (must be small)")

# ---- thirteenth degree: b_k = 64 * sum_j M13[k][j] cos(2 pi j/52), j = 0..11 ----
M13 = [
    [23021, 150562, -247962, 4300, 243256, -207292, 33774, -184608, 212810, 143690, -405522, 304124],
    [-179740, 4300, 439296, 143690, -405522, -304124, 192712, 207292, -157560, -150562, 162266, 184608],
    [-179740, -4300, 439296, -143690, -405522, 304124, 192712, -207292, -157560, 150562, 162266, -184608],
    [-98607, 143690, 30446, -150562, 162266, -184608, -4706, 304124, -277030, -4300, 243256, -207292],
    [23021, -150562, -247962, -4300, 243256, 207292, 33774, 184608, 212810, -143690, -405522, -304124],
    [-98607, -143690, 30446, 150562, 162266, 184608, -4706, -304124, -277030, 4300, 243256, 207292],
]
q13 = exp(-pi / sqrt(13))
u13 = [2 * q13 ** (mpf(k * k) / 13) * f(q13 ** (13 + 2 * k), q13 ** (13 - 2 * k)) / phi(q13 ** 13) for k in range(1, 7)]
B = [cos(2 * pi * j / 52) for j in range(12)]
b13 = lambda rows: [64 * sum(m * x for m, x in zip(row, B)) for row in rows]
print("5. p=13: u_k^13 vs table:", [agree(u13[k] ** 13, b13(M13)[k]) for k in range(6)], "digits")
lhs13 = phi(exp(-13 * pi * sqrt(13)))
rhs13 = lambda rows: mpf(13) ** (-mpf(3) / 4) * phi(exp(-pi * sqrt(13))) * (1 + sum(x ** (mpf(1) / 13) for x in b13(rows)))
print(f"6. p=13 identity rebuilt from table: {agree(lhs13, rhs13(M13))} digits")
bad13 = [row[:] for row in M13]
bad13[3][7] += 1
print(f"7. p=13 negative control (one entry +1): {agree(lhs13, rhs13(bad13))} digits (must be small)")
