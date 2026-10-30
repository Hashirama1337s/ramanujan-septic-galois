\\ v2.gp -- BAR-V23 vein 2: exact minimal polynomial of b_1 (and of imprimitive pieces b_k) at odd n from analytic conjugates.
\\ Helpers (dig, thsum, redforms, intpol, minsep) from proof/cert/cert.gp.
read("proof/cert/cert.gp");
DIR = "veins/v23/";

\\ an SL2(Z)-equivalent form with gcd(a, 4n) = 1 and |b| <= a
goodform(Q, n) = {
  my([a, b, c] = Q, N = 4*n);
  if(gcd(a, N) == 1, return(Q));
  for(r = 1, 50, for(x = -r, r, for(y = -r, r, if(max(abs(x), abs(y)) == r && gcd(x, y) == 1,
    my(v = a*x^2 + b*x*y + c*y^2);
    if(gcd(v, N) == 1,
      my(u = gcdext(x, y), z, w, b1, c1, k);           \\ u = [U, V, 1] with U x + V y = 1 ; take w = U, z = -V
      w = u[1]; z = -u[2];
      b1 = 2*a*x*z + b*(x*w + y*z) + 2*c*y*w; c1 = a*z^2 + b*z*w + c*w^2;
      if(b1^2 - 4*v*c1 != b^2 - 4*a*c, error("disc mismatch"));
      k = round(-b1 / (2*v)); b1 += 2*v*k; c1 = (b1^2 - (b^2 - 4*a*c)) / (4*v);
      return([v, b1, c1]))))));
  error("no good form");
}

\\ orbit of k under (Z/n)^*, folded to 1..(n-1)/2
orbit(n, k) = {
  my(S = List());
  for(s = 1, n - 1, if(gcd(s, n) == 1, my(t = (k*s) % n); t = min(t, n - t); listput(S, t)));
  Set(Vec(S));
}

\\ conjugates of b_k: one value per (class, orbit element); conv = 1, 2, 3 as in cert.gp
conjsn(n, k, conv) = {
  my(F = redforms(-4*n), O = orbit(n, k), V = [], nz = 0);
  for(i = 1, #F, my(Q = F[i]);
    if(Q == [1, 0, n],
      my(t0 = I * sqrt(n), th0 = thsum(0, t0)); V = concat(V, vector(#O, j, (2 * thsum(O[j]/n, t0) / th0)^n)),
      my([a, b, c] = goodform(Q, n), ap = lift(Mod(a, 4*n)^-1), x0 = -ap * b / 2, y, tQ, th0);
      if(x0 != 0, nz++);
      y = [x0, x0 * ap, x0 * a][conv];
      tQ = (b + 2 * I * sqrt(n)) / (2 * a) + y; th0 = thsum(0, tQ);
      V = concat(V, vector(#O, j, (2 * thsum(O[j]/n, tQ) / th0)^n))));
  [V, nz];
}

needdign(n, k) = {
  my(V);
  default(realprecision, 60);
  V = conjsn(n, k, 1)[1];
  ceil(1.3 * (sum(i = 1, #V, max(0, log(abs(V[i])) / log(10))) + lngamma(#V + 1) / log(10))) + 300;
}

realcyc(M) = subst(minpoly(Mod('x + 'x^-1, polcyclo(M))), 'x, 'x);

runn(n, k, ctrl) = {
  my(t0 = getabstime(), W = needdign(n, k), V, nz, res, G, h = qfbclassno(-4*n), dP = h * eulerphi(n) / 2, ns, sep, M, res2, out);
  default(realprecision, W);
  [V, nz] = conjsn(n, k, 1);
  res = intpol(V); G = res[1];
  sep = minsep(V);
  print("\n== n=", n, " k=", k, " h(-4n)=", h, " W=", W, "  #conjugate values=", #V, "  (pred deg for k=1: ", dP, ")");
  print("  integrality: rounding error 10^-", res[2], ", max coeff digits ", res[3], ", monic=", pollead(G) == 1,
        ", min separation 10^", Strprintf("%.1f", log(sep)/log(10)), ", forms with x0 != 0: ", nz);
  M = G / gcd(G, G');
  if(poldegree(M) < poldegree(G), print("  G is not squarefree: radical degree ", poldegree(M)));
  if(poldegree(M) <= 60, my(f = factor(M)[,1]); print("  irreducible factors of radical: degrees ", apply(poldegree, f~)));
  ns = polsturm(M);
  print("  real roots (polsturm of radical): ", ns, " of ", poldegree(M), "  -> ", if(ns == poldegree(M), "totally real", "NOT totally real => not Galois => not abelian"));
  print("  constant term: |c0| = 2^", valuation(polcoef(G, 0), 2), " * ", abs(polcoef(G, 0)) >> valuation(polcoef(G, 0), 2));
  if(ctrl && nz > 0, res2 = intpol(conjsn(n, k, 2)[1]);
    print("  NEG CONTROL convention 2: rounding error 10^-", res2[2], " -> ", if(res2[2] < 10, "fails as it should", "UNEXPECTEDLY INTEGRAL")));
  if(ctrl && nz == 0, print("  NEG CONTROL convention 2: identical to convention 1 here (all x0 = 0) - not informative"));
  if(ns == poldegree(M) && poldegree(M) <= 60,
    my(P = realcyc(4*n), inc = nfisincl(M, P));
    print("  inclusion in Q(zeta_", 4*n, ")^+ (degree ", poldegree(P), "): ", if(inc === 0, "NO", Str("YES (", #inc, " embeddings)"))));
  print("  time ", (getabstime() - t0) \ 1000, " s");
  write(Str(DIR, "G_n", n, "_k", k, ".gp"), G);
  G;
}
