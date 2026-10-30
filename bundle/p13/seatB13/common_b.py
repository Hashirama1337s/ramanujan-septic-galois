# Seat B13 common routines: theta functions via Jacobi triple PRODUCT.
from mpmath import mp, mpf, exp, pi, sqrt, nstr, log10, fabs

def qpoch(a, q, eps):
    """(a; q)_inf, truncated when |a q^n| < eps."""
    prod = mpf(1)
    term = a
    while fabs(term) > eps:
        prod *= (1 - term)
        term *= q
    return prod

def f_prod(a, b):
    eps = mpf(10) ** (-(mp.dps + 20))
    ab = a * b
    return qpoch(-a, ab, eps) * qpoch(-b, ab, eps) * qpoch(ab, ab, eps)

def phi_prod(q):
    eps = mpf(10) ** (-(mp.dps + 20))
    return qpoch(-q, q * q, eps) ** 2 * qpoch(q * q, q * q, eps)

def f_series(a, b, N=60):
    s = mpf(0)
    for n in range(-N, N + 1):
        s += a ** (n * (n + 1) // 2) * b ** (n * (n - 1) // 2)
    return s

def phi_series(q, N=60):
    return f_series(q, q, N)

def u_list(p, q):
    """u_k = 2 q^{k^2/p} f(q^{p+2k}, q^{p-2k}) / phi(q^p), k=1..(p-1)/2."""
    ph = phi_prod(q ** p)
    out = []
    for k in range(1, (p - 1) // 2 + 1):
        out.append(2 * q ** (mpf(k * k) / p) * f_prod(q ** (p + 2 * k), q ** (p - 2 * k)) / ph)
    return out

def digits_agree(x, y):
    d = fabs(x - y)
    if d == 0:
        return mp.dps
    return int(-log10(d / max(fabs(x), mpf(10) ** (-mp.dps))))
