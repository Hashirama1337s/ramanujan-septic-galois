\\ a_siegel.gp -- reviewer A proof seat, 2026-10-27
\\ (1) u_k(e^{-pi/sqrt p}) from the definition  ==  2 e^{-pi i k/(2p)} g_{((p+2k)/2p,1/2)}(i sqrt p) / g_{(1/2,1/2)}(i sqrt p)
\\     ==  2 theta[k/p,0](i sqrt p)/theta[0,0](i sqrt p);   g_{(1/2,1/2)} = -e^{-pi i/4} weberf^2
\\ (2) functional transformation: b_k(gam tau) == b_{t k}(tau), gam an SL2(Z) lift of diag(1,1/d) g(x) (and of g(x) diag(1,1/d)),
\\     g(x) = [t,-p s; s,t], x = t + s sqrt(-p), d = t^2+p s^2, all mod 4p, b_k(tau) = (2 theta[k/p,0](tau)/theta[0,0](tau))^p.
default(realprecision, 260);
B2(x) = x^2 - x + 1/6;
\\ Siegel function (Kubert-Lang / Koo-Shin-Yoon (1.3)), q = e^{2 pi i tau}, qz = e^{2 pi i (r1 tau + r2)}
siegel(r1, r2, tau) = {
  my(q = exp(2*Pi*I*tau), qz = exp(2*Pi*I*(r1*tau + r2)), pr = 1 - qz, n = 1, qn = q, t1, t2, eps = 10.^(-default(realprecision)-5));
  while(1, t1 = qn*qz; t2 = qn/qz; pr *= (1 - t1)*(1 - t2); if(abs(t1) + abs(t2) < eps, break); n++; qn *= q);
  -exp(Pi*I*tau*B2(r1)) * exp(Pi*I*r2*(r1 - 1)) * pr;
}
\\ theta with characteristic [a,0]: sum_n e^{pi i tau (n+a)^2}
thchar(a, tau) = {
  my(s = 0, n0 = round(-a), lim, y = imag(tau));
  lim = ceil(sqrt((default(realprecision)*log(10) + 50)/(Pi*y))) + 3;
  sum(n = n0 - lim, n0 + lim, exp(Pi*I*tau*(n + a)^2));
}
weberf(tau) = { my(q = exp(2*Pi*I*tau)); exp(-2*Pi*I*tau/48) * prod(n = 1, 400, 1 + q^(n - 1/2)); }
\\ definition-level u_k
udef(p, k) = {
  my(q = exp(-Pi/sqrt(p)), lim = 60, num, den);
  num = sum(n = -lim, lim, q^(p*n^2 + 2*k*n));
  den = sum(n = -lim, lim, q^(p*n^2));
  2*q^(k^2/p)*num/den;
}
digs(x, y) = if(x == y, default(realprecision), round(-log(abs(x - y)/abs(y))/log(10)));

print("=== (1) expression of u_k at tau0 = i sqrt p, realprecision 260 ===");
{
foreach([7, 11, 13], p,
  my(tau0 = I*sqrt(p), g0 = siegel(1/2, 1/2, tau0), th0 = thchar(0, tau0), wf = weberf(tau0), worst = 1000, worst2 = 1000);
  for(k = 1, (p - 1)/2,
    my(ud = udef(p, k), us = 2*exp(-Pi*I*k/(2*p))*siegel((p + 2*k)/(2*p), 1/2, tau0)/g0, ut = 2*thchar(k/p, tau0)/th0);
    worst = min(worst, digs(us, ud)); worst2 = min(worst2, digs(ut, ud)));
  print("p=", p, ": Siegel form agrees with definition to >= ", worst, " digits; theta form to >= ", worst2,
        " digits; g_(1/2,1/2) = -e^(-pi i/4) f^2 to ", digs(-exp(-Pi*I/4)*wf^2, g0), " digits"));
}

\\ ---- (2) functional transformation check ----
\\ lift a matrix in SL2(Z/N) to SL2(Z)
liftsl2(M, N) = {
  my(a = lift(M[1,1]), b = lift(M[1,2]), c = lift(M[2,1]), d = lift(M[2,2]), cc, dd, k, uv, a1, b1, m, n, del, sol);
  cc = if(c == 0, N, c); k = 0;
  while(gcd(cc, d + k*N) != 1, k++); dd = d + k*N;
  uv = gcdext(dd, cc);  \\ uv[1]*dd + uv[2]*cc = 1  -> a1 = uv[1], b1 = -uv[2] : a1 dd - b1 cc = 1
  a1 = uv[1]; b1 = -uv[2];
  \\ delta = (a - a1, b - b1) = m (cc, dd) + n (a1, b1); solve over Q then m mod N
  sol = matsolve([cc, a1; dd, b1], [a - a1, b - b1]~);
  m = sol[1];
  if(denominator(m) != 1, error("lift"));
  a1 += m*cc; b1 += m*dd;
  my(G = [a1, b1; cc, dd]);
  if(matdet(G) != 1 || G*Mod(1, N) != M, error("lift check"));
  G;
}
bk(p, k, tau) = (2*thchar(k/p, tau)/thchar(0, tau))^p;
mob(G, tau) = (G[1,1]*tau + G[1,2])/(G[2,1]*tau + G[2,2]);
redk(p, k) = { my(r = lift(Mod(k, p))); if(r > p/2, p - r, r); }
default(realprecision, 80);
print("=== (2) b_k(gam tau) = b_{tk}(tau) at a random tau, realprecision 80 ===");
{
setrand(20261027);
foreach([5, 7, 11, 13], p,
  my(N = 4*p, cnt = 0, worst = 1000, tau = 0.1234 + 0.9871*I, ntest = 0);
  while(ntest < 6,
    my(t = random(N), s = random(N), d, g, gam1, gam2, tk);
    d = Mod(t^2 + p*s^2, N);
    if(gcd(lift(d), N) != 1, next);
    ntest++;
    g = [Mod(t, N), Mod(-p*s, N); Mod(s, N), Mod(t, N)];
    gam1 = liftsl2([1, 0; 0, 1/d]*g, N);
    gam2 = liftsl2(g*[1, 0; 0, 1/d], N);
    for(k = 1, (p - 1)/2,
      tk = redk(p, k*t);
      my(rhs = bk(p, tk, tau));
      worst = min(worst, digs(bk(p, k, mob(gam1, tau)), rhs));
      worst = min(worst, digs(bk(p, k, mob(gam2, tau)), rhs));
      cnt += 2));
  print("p=", p, ": ", cnt, " checks (6 random x, both decompositions, all k): worst agreement ", worst, " digits"));
}
\\ negative control: the variant k -> t^{-1} k (should FAIL where t^2 != 1 mod p)
{
foreach([11, 13], p,
  my(N = 4*p, tau = 0.1234 + 0.9871*I, t = 2, s = 1, d, g, gam1, bad = 0, tot = 0);
  if(gcd(t^2 + p*s^2, N) != 1, s = 2);
  d = Mod(t^2 + p*s^2, N); g = [Mod(t, N), Mod(-p*s, N); Mod(s, N), Mod(t, N)];
  gam1 = liftsl2([1, 0; 0, 1/d]*g, N);
  for(k = 1, (p - 1)/2, my(tk = redk(p, k*lift(Mod(t, p)^-1)));
    tot++; if(digs(bk(p, k, mob(gam1, tau)), bk(p, tk, tau)) < 20, bad++));
  print("negative control p=", p, " x=", t, "+", s, "sqrt(-p), map k -> k/t: ", bad, " of ", tot, " fail (k with k/t = +-kt excepted)"));
}
quit;
