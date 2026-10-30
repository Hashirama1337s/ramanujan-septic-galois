"""Seat B core: u_k via Jacobi triple product (infinite products)."""
import mpmath as mp


def qpoch(a, q):
    """(a; q)_inf as a product, truncated when |a q^n| < eps."""
    eps = mp.mpf(2) ** (-mp.mp.prec - 20)
    r = mp.mpf(1)
    t = a
    while abs(t) > eps:
        r *= (1 - t)
        t *= q
    return r


def f_prod(a, b):
    ab = a * b
    return qpoch(-a, ab) * qpoch(-b, ab) * qpoch(ab, ab)


def phi_prod(q):
    return qpoch(-q, q * q) ** 2 * qpoch(q * q, q * q)


def f_series(a, b, N=60):
    s = mp.mpf(0)
    for n in range(-N, N + 1):
        s += a ** (n * (n + 1) // 2) * b ** (n * (n - 1) // 2)
    return s


def phi_series(q, N=None):
    eps = mp.mpf(2) ** (-mp.mp.prec - 20)
    s = mp.mpf(1)
    n = 1
    while True:
        t = q ** (n * n)
        if t < eps:
            break
        s += 2 * t
        n += 1
    return s


def u_list(p, use_series=False):
    q = mp.exp(-mp.pi / mp.sqrt(p))
    f = (lambda a, b: f_series(a, b)) if use_series else f_prod
    ph = phi_series if use_series else phi_prod
    den = ph(q ** p)
    out = []
    for k in range(1, (p - 1) // 2 + 1):
        out.append(2 * q ** (mp.mpf(k * k) / p) * f(q ** (p + 2 * k), q ** (p - 2 * k)) / den)
    return q, out
