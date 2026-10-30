"""Exact algebra: are the table's b_k mutually consistent with the e_j (in Q(P, cos 2pi/11))?
Also: does prod u_k = P hold exactly as prod b_k = P^11?"""
import json
import sympy as sp

F = json.load(open('seatB/found_1600.json'))
P, y, X = sp.symbols('P y X')   # y = 2cos(2pi/11)
cub = sp.Poly(F['cubic'], P)
my = sp.Poly(y**5 + y**4 - 4*y**3 - 3*y**2 + 3*y + 1, y)   # min poly of 2cos(2pi/11)
# cos(2 pi j/11) = T_j(y/2)
cosj = [sp.Integer(1)] + [sp.expand(sp.chebyshevt(j, y / 2)) for j in range(1, 5)]

def red(expr):
    e = sp.Poly(sp.expand(expr), P, y, X)
    _, r = sp.reduced(e.as_expr(), [cub.as_expr(), my.as_expr()], P, y, X)
    return sp.expand(r)

bk = []
for row in F['table']:
    lead = row[0]
    expr = 0
    idx = 1
    for i in range(3):
        for j in range(5):
            expr += row[idx] * P**i * cosj[j]
            idx += 1
    bk.append(red(-expr / lead))

poly = sp.Integer(1)
for b in bk:
    poly = red(poly * (X - b))
target = X**5
for j in range(1, 6):
    r = F['e'][str(j)]
    ejx = -(r[1] + r[2] * P + r[3] * P**2) / sp.Integer(r[0])
    target += (-1)**j * ejx * X**(5 - j)
print('prod (X - b_k) - quintic(X; e_j(P)) reduced =', red(poly - target))
print('e5 - P^11 reduced =', red(-(sp.Integer(F['e']['5'][1]) + F['e']['5'][2]*P + F['e']['5'][3]*P**2)/F['e']['5'][0] - P**11))
print('cubic irreducible over Q:', sp.Poly(F['cubic'], P).is_irreducible, ' disc =', sp.discriminant(sp.Poly(F['cubic'], P)))
