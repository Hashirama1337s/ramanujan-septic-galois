\\ BAR-IDONEAL runner: is u_1^n (or u_1^{2n}) in Q(cos 2pi/(4n)) for odd n?
thf(a, b, eps) = {
  my(s = 1., n = 1, t);
  while(1, t = a^(n*(n+1)/2) * b^(n*(n-1)/2) + a^(n*(n-1)/2) * b^(n*(n+1)/2); s += t; if(t < eps, break); n++);
  s;
}
dig(x) = if(x == 0, 99999, floor(-log(abs(x)) / log(10)));

itest(n, lab) = {
  my(nb = eulerphi(4*n)/2, W = max(3000, 60*nb), Whi, q, eps, u1, B, verdict = "NOT ABELIAN", v, b, res, e);
  Whi = W + 400;
  default(realprecision, Whi);
  q = exp(-Pi / sqrt(n)); eps = 10.^(-Whi - 20);
  u1 = 2 * q^(1/n) * thf(q^(n+2), q^(n-2), eps) / thf(q^n, q^n, eps);
  B = vector(nb, j, cos(2*Pi*(j-1)/(4*n)));
  forstep(e = 1, 2, 1,
    b = u1^(n*e);
    default(realprecision, W);
    v = lindep(concat([precision(b, W)], apply(x -> precision(x, W), B)));
    default(realprecision, Whi);
    if(v[1] != 0,
      res = dig(v[1]*b + sum(j = 1, nb, v[j+1]*B[j]));
      if(res >= 0.9 * W, verdict = Str("ABELIAN via u^", n*e, " (max|n|~1e", floor(log(vecmax(abs(v)))/log(10)), ", holds ", res, ")"); break)));
  print(lab, " n=", n, " (basis ", nb, ", W=", W, "): ", verdict);
}

