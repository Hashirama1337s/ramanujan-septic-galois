\\ d_units.gp -- C3 checks.  y = 2/f(sqrt -p)^2 (Weber f).  Lemma 5: b_k = unit * y^p.
\\ (i) identities at tau0: 2/f^2 = i g_(0,1/2) g_(1/2,0); Weber cubic (x-16)^3 - j x has roots f^24, -f1^24, -f2^24.
\\ (ii) minimal polynomial of Y = y^4 (in Q(j(sqrt -p))): monic? degree h? |constant term| vs prediction
\\     p = 7 mod 8: 1;   p = 3 mod 8: 2^(4h/3)  (v(y) = 1/3 at every prime over 2);   p = 1 mod 4: 2^(2h)  (v(y) = 1/2).
default(realprecision, 1500);
B2(x) = x^2 - x + 1/6;
siegel(r1, r2, tau) = {
  my(q = exp(2*Pi*I*tau), qz = exp(2*Pi*I*(r1*tau + r2)), pr = 1 - qz, n = 1, qn = q, t1, t2, eps = 10.^(-default(realprecision)-5));
  while(1, t1 = qn*qz; t2 = qn/qz; pr *= (1 - t1)*(1 - t2); if(abs(t1) + abs(t2) < eps, break); n++; qn *= q);
  -exp(Pi*I*tau*B2(r1)) * exp(Pi*I*r2*(r1 - 1)) * pr;
}
wf(tau)  = { my(q = exp(2*Pi*I*tau)); exp(-2*Pi*I*tau/48) * prod(n = 1, 600, 1 + q^(n - 1/2)); }
wf1(tau) = { my(q = exp(2*Pi*I*tau)); exp(-2*Pi*I*tau/48) * prod(n = 1, 600, 1 - q^(n - 1/2)); }
wf2(tau) = { my(q = exp(2*Pi*I*tau)); sqrt(2)*exp(2*Pi*I*tau/24) * prod(n = 1, 600, 1 + q^n); }
digs(x, y) = if(x == y, default(realprecision), round(-log(abs(x - y)/max(abs(y),1e-100))/log(10)));
{
foreach([7, 11, 13], p,
  my(t0 = I*sqrt(p), f = wf(t0), f1 = wf1(t0), f2 = wf2(t0), j = ellj(t0), c = (x - 16)^3 - j*x, k = 1,
     bk, uk);
  uk = 2*exp(-Pi*I*k/(2*p))*siegel((p + 2*k)/(2*p), 1/2, t0)/siegel(1/2, 1/2, t0);
  bk = (-I)^k*exp(-Pi*I*p/4)*siegel((p+2*k)/(2*p), 1/2, t0)^p*(siegel(0, 1/2, t0)*siegel(1/2, 0, t0))^p;
  print("p=", p, ": 2/f^2 = i g(0,1/2) g(1/2,0): ", digs(I*siegel(0, 1/2, t0)*siegel(1/2, 0, t0), 2/f^2),
        " digits; b_1 formula: ", digs(bk, uk^p), " digits; cubic residuals (log10): ",
        round(log(abs(subst(c, x, f^24)))/log(10)), " ", round(log(abs(subst(c, x, -f1^24)))/log(10)), " ",
        round(log(abs(subst(c, x, -f2^24)))/log(10))));
}
print("--- norms of Y = (2/f(sqrt -p)^2)^4 over Q ---");
{
foreach([7, 23, 31, 47, 71, 11, 19, 43, 59, 67, 83, 5, 13, 17, 29, 37, 41], p,
  my(h = qfbclassno(-4*p), t0 = I*sqrt(p), Y = (2/wf(t0)^2)^4, P, ok, pred, c0, e2, cls);
  P = algdep(Y, h);
  ok = abs(subst(P, x, Y)) < 10.^(-1300);
  c0 = polcoef(P, 0)/pollead(P);
  e2 = if(c0 == 0, -1, valuation(numerator(c0), 2) - valuation(denominator(c0), 2));
  cls = if(p % 8 == 7, "7 mod 8", if(p % 8 == 3, "3 mod 8", "1 mod 4"));
  pred = if(p % 8 == 7, 0, if(p % 8 == 3, 4*h/3, 2*h));
  print("p=", p, " (", cls, ") h=", h, " deg=", poldegree(P), " irreducible=", polisirreducible(P), " monic=", abs(pollead(P)) == 1,
        " root ok=", ok, " |N(Y)| = 2^", e2, " * ", abs(c0)/2^e2, "   predicted 2^", pred, "  ", if(e2 == pred && abs(c0) == 2^pred, "MATCH", "NO MATCH")));
}
quit;
