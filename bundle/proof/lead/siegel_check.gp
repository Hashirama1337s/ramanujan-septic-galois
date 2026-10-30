/* check the reviewer B seat's Lemma 2: u_k = 2 e(k/(4p)) g_(1/2-k/p,1/2)(w) / g_(1/2,1/2)(w), w = sqrt(-p), q = e^(2 pi i w) */
default(realprecision, 300);
thf(a, b) = { my(s = 1., n = 1, t); while(1, t = a^(n*(n+1)/2)*b^(n*(n-1)/2) + a^(n*(n-1)/2)*b^(n*(n+1)/2); s += t; if(abs(t) < 10.^-320, break); n++); s; }
B2(x) = x^2 - x + 1/6;
siegel(r, s, w) = { my(q = exp(2*Pi*I*w), z = exp(2*Pi*I*s), pr, n = 1, t);
  pr = (1 - q^r * z);
  while(1, t = (1 - q^(n+r)*z) * (1 - q^(n-r)/z); pr *= t; if(abs(t - 1) < 10.^-320, break); n++);
  -q^(B2(r)/2) * exp(Pi*I*s*(r-1)) * pr; }
check(p) = { my(qq = exp(-Pi/sqrt(p)), w = I*sqrt(p), uk, sk, d);
  for(k = 1, (p-1)/2,
    uk = 2 * qq^(k^2/p) * thf(qq^(p+2*k), qq^(p-2*k)) / thf(qq^p, qq^p);
    sk = 2 * exp(2*Pi*I*k/(4*p)) * siegel(1/2 - k/p, 1/2, w) / siegel(1/2, 1/2, w);
    d = abs(uk - sk);
    print("p=", p, " k=", k, "  |u_k - Siegel expr| ~ 1e", if(d == 0, -300, floor(log(d)/log(10))), "   arg(Siegel expr) = ", precision(arg(sk), 6))); }
check(7);
check(11);
check(13);
quit
