"""BAR-R1 runner. Usage: python -I r1.py <stage: control|deg11> [dps]"""
import sys

from mpmath import mp, mpf, exp, pi, sqrt, cos, nsum, inf, findpoly, pslq, nstr, fabs


def f(a, b):
    """Ramanujan's f(a,b) = sum_{n in Z} a^{n(n+1)/2} b^{n(n-1)/2}, for 0 < a, b < 1."""
    s = mpf(1)
    n = 1
    while True:
        t1 = a ** (n * (n + 1) // 2) * b ** (n * (n - 1) // 2)
        t2 = a ** ((-n) * (-n + 1) // 2) * b ** ((-n) * (-n - 1) // 2)
        s += t1 + t2
        if t1 + t2 < mpf(10) ** (-(mp.dps + 20)):
            return s
        n += 1


def phi(q):
    return f(q, q)


def us(p):
    q = exp(-pi / sqrt(p))  # Amendment 1
    den = phi(q ** p)
    return [2 * q ** (mpf(k * k) / p) * f(q ** (p + 2 * k), q ** (p - 2 * k)) / den for k in range(1, (p - 1) // 2 + 1)]


def digits(x):
    return int(-mp.log10(fabs(x))) if x != 0 else mp.dps


def control():
    u = us(7)
    s = 1 + sum(u)
    target = mpf(7) ** (mpf(3) / 4) * phi(exp(-7 * pi * sqrt(7))) / phi(exp(-pi * sqrt(7)))
    print(f"C2 p=7: |1+sum u - target| ~ 1e-{digits(s - target)}")
    c = lambda j: cos(j * pi / 7)
    closed = [(c(2) / (2 * c(3) ** 2)) ** (mpf(2) / 7), (c(1) / (2 * c(2) ** 2)) ** (mpf(2) / 7),
              (c(3) / (2 * c(1) ** 2)) ** (mpf(2) / 7)]
    for k in range(3):
        print(f"C1 u_{k + 1} vs Rebak closed form: agree to {digits(u[k] - closed[k])} digits")
    bad = ((c(2) + mpf(10) ** -30) / (2 * c(3) ** 2)) ** (mpf(2) / 7)
    print(f"C3 negative control (perturbed u_1): agree to {digits(u[0] - bad)} digits (must be ~30)")
    # pipeline check: findpoly recovers degree-3 polynomials for a_k = u_k^(7/2)
    for k in range(3):
        a = u[k] ** (mpf(7) / 2)
        print(f"   septic a_{k + 1} minimal polynomial (findpoly):", findpoly(a, 6, maxcoeff=10 ** 12))


def deg11():
    p = 11
    u = us(p)
    s = 1 + sum(u)
    target = mpf(p) ** (mpf(3) / 4) * phi(exp(-p * pi * sqrt(p))) / phi(exp(-pi * sqrt(p)))
    print(f"C2 p=11: |1+sum u - target| ~ 1e-{digits(s - target)}")
    cs = [cos(2 * pi * j / p) for j in range(1, 5)]
    res = []
    for k in range(5):
        a = u[k] ** (mpf(p) / 2)
        print(f"u_{k + 1} = {nstr(u[k], 25)}   a_{k + 1} = u^(11/2) = {nstr(a, 25)}")
        res.append(a)
    return res, cs


if __name__ == "__main__":
    mp.dps = int(sys.argv[2]) if len(sys.argv) > 2 else 500
    if sys.argv[1] == "control":
        control()
    else:
        deg11()
