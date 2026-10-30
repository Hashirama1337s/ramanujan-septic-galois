\\ fastmin.gp -- vein 4: the minimal polynomial of b_1 over Q straight from the analytic conjugates (no lattice search).
\\ Conjugates: proof/cert/cert.gp conjs(p, 1) (principal form: b_k(i sqrt p); other reduced forms: KSY25 Prop 4.1 at N = 4p).
\\ Checks per prime:
\\  (i)   coefficients round to Z (self-check of the conjugates);
\\  (ii)  negative control: convention 2 (a wrong reading of the twist) must NOT round to Z;
\\  (iii) constant term = +-2^e with e = 0 (p = 7 mod 8), p h (p-1)/6 (p = 3 mod 8), p h (p-1)/4 (p = 1 mod 4)  (C3, proved);
\\  (iv)  degree = h(-4p)(p-1)/2 and G irreducible (C1, proved).
read("proof/cert/cert.gp");

needdig(p) = {
  my(V, d, L);
  default(realprecision, 80);
  V = conjs(p, 1)[1]; d = #V;
  L = sum(i = 1, d, max(0, log(abs(V[i])) / log(10))) + lngamma(d + 1) / log(10) - 2 * lngamma(d / 2 + 1) / log(10);
  ceil(1.3 * L) + 300;
}

fastmin(p, ctrl) = {
  my(t0 = getabstime(), W, V, res, G, h = qfbclassno(-4*p), e, c0, v2, odd, res2, tA);
  W = needdig(p);
  default(realprecision, W);
  V = conjs(p, 1)[1];
  tA = getabstime() - t0;
  res = intpol(V); G = res[1];
  e = if(p % 8 == 7, 0, if(p % 8 == 3, p * h * (p-1) / 6, p * h * (p-1) / 4));
  c0 = polcoef(G, 0); v2 = valuation(c0, 2); odd = c0 / 2^v2;
  print("p=", p, " h=", h, " W=", W, " degree=", poldegree(G), " (want ", h*(p-1)/2, ")  conjugates in ", tA, " ms");
  print("  (i)   rounding error 10^-", res[2], "  max coefficient digits ", res[3], "  monic=", pollead(G) == 1);
  print("  (iii) constant term = ", if(odd < 0, "-", "+"), "2^", v2, " * ", abs(odd), "   predicted 2^", e, "  -> ", if(abs(odd) == 1 && v2 == e, "MATCH", "MISMATCH"));
  print("  (iv)  irreducible=", polisirreducible(G));
  if(ctrl, res2 = intpol(conjs(p, 2)[1]); print("  (ii)  wrong convention: rounding error 10^-", res2[2], " -> ", if(res2[2] < 10, "fails as it should", "UNEXPECTEDLY INTEGRAL")));
  print("  total ", getabstime() - t0, " ms");
  G;
}
