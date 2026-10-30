\\ cert.gp -- certificate for the strong (products-of-sines) form of C4 at p = 5, 7, 13, 37.
\\ Analytic side: all Q-conjugates of b_1 from theta series at the CM points of the reduced forms of D = -4p
\\   (principal form: b_k = B_k(i sqrt p); other forms: KSY25 Prop 4.1 at N = 4p, i.e. sigma_Q(b_k) = B_k(t_Q + y),
\\    t_Q = (b + sqrt D)/(2a), gcd(a, 4p) = 1, a a' = 1 mod 4p, y = -a' b/2 (three composition conventions tried)).
\\ Exact side: candidate c_1 in Q(theta), theta = 2 cos(2 pi/N), from the numerically found sine-product relation.
\\ B_m(tau) = (2 theta[m/p](tau)/theta[0](tau))^p, theta[a](tau) = sum_n exp(pi i tau (n+a)^2)  (v4 section 1).

dig(z) = if(z == 0, 99999, floor(-log(abs(z)) / log(10)));
thsum(a, tau) = {
  my(y = imag(tau), pr = default(realprecision), nmax, s = 0.);
  nmax = ceil(sqrt((pr + 40) * log(10) / (Pi * y))) + 2;
  for(n = -nmax - 1, nmax + 1, s += exp(Pi * I * tau * (n + a)^2));
  s;
}
Bm(m, p, tau) = (2 * thsum(m / p, tau) / thsum(0, tau))^p;

\\ reduced primitive forms of discriminant D < 0 (|b| <= a <= c, b >= 0 if |b| = a or a = c)
redforms(D) = {
  my(L = List());
  for(a = 1, sqrtint(-D \ 3), for(b = -a, a, my(n = b^2 - D);
    if(n % (4*a) == 0, my(c = n / (4*a));
      if(c >= a && gcd([a, b, c]) == 1 && !(b < 0 && (-b == a || a == c)), listput(L, [a, b, c])))));
  Vec(L);
}

\\ analytic conjugates of b_1; conv = 1, 2, 3 selects y = x0, x0*a', x0*a
conjs(p, conv) = {
  my(m = (p-1)/2, F = redforms(-4*p), V = [], Lab = []);
  for(i = 1, #F, my(Q = F[i], a, b, c, ap, x0, y, tQ);
    if(Q == [1, 0, p],
      V = concat(V, vector(m, k, Bm(k, p, I * sqrt(p)))); Lab = concat(Lab, vector(m, k, Str("b_", k, " at (1,0,", p, ")"))),
      [a, b, c] = Q; if(gcd(a, 4*p) > 1, [a, b, c] = [c, -b, a]); if(gcd(a, 4*p) > 1, error("no a coprime to 4p"));
      ap = lift(Mod(a, 4*p)^-1); x0 = -ap * b / 2;
      y = [x0, x0 * ap, x0 * a][conv];
      tQ = (b + 2 * I * sqrt(p)) / (2 * a);
      V = concat(V, vector(m, k, Bm(k, p, tQ + y)));
      Lab = concat(Lab, vector(m, k, Str("sigma_Q(b_", k, "), Q=", Q, " -> (", a, ",", b, ",", c, "), a'=", ap, ", y=", y)))));
  [V, Lab];
}

\\ integer polynomial from conjugates; returns [G, rounding error digits, max coefficient digits]
intpol(V) = {
  my(G0 = prod(i = 1, #V, 'x - V[i]), G, err = 0., mx = 0);
  G = vector(poldegree(G0) + 1, i, round(real(polcoef(G0, i - 1))));
  for(i = 0, poldegree(G0), err = max(err, abs(polcoef(G0, i) - G[i + 1])));
  mx = vecmax(apply(z -> if(z == 0, 0, #digits(abs(z))), G));
  [Pol(Vecrev(G)), dig(err), mx];
}
minsep(V) = { my(s = +oo); for(i = 1, #V, for(j = i + 1, #V, s = min(s, abs(V[i] - V[j])))); s; }

\\ field Q(theta), theta = 2cos(2 pi/N), polynomial in t
fieldpol(N) = subst(minpoly(Mod('x + 'x^-1, polcyclo(N))), 'x, 't);
ch(a) = 2 * subst(polchebyshev(a, 1, 'y), 'y, 't / 2);            \\ 2cos(2 pi a/N) as polynomial in theta
Sa(a, Pt) = Mod(2 - ch(a), Pt);                                    \\ s_a^2 = (2 sin(pi a/N))^2
emb(el, N, a) = subst(lift(el), 't, 2 * cos(2 * Pi * a / N));      \\ embedding theta -> 2cos(2 pi a/N)
gal(el, a, Pt) = Mod(subst(lift(el), 't, ch(a)), Pt);              \\ sigma_a : zeta_N -> zeta_N^a

\\ relation b_1^E = 2^A p^B prod_j s_j^C[j]  (all C[j] even), s_j = 2 sin(pi j/N)
cert(p, N, E, A, B, C) = {
  my(t0 = getabstime(), V, Lab, best = 0, res, G, rd, mx, sep, d, Pt, R, rts, c1, dist = +oo, b1, Hb, Hc, liou, ok, used);
  print("\n================ p = ", p, "  (N = ", N, ", h(-4p) = ", qfbclassno(-4*p), ", reduced forms ", redforms(-4*p), ")");
  for(conv = 1, if(qfbclassno(-4*p) == 1, 1, 3),
    [V, Lab] = conjs(p, conv); res = intpol(V);
    print("  convention ", conv, ": degree ", #V, ", coefficients round to Z with error 10^-", res[2], ", max imag part of conjugates 10^-", dig(vecmax(apply(z -> abs(imag(z)), V)) + 10.^-99999));
    if(best == 0 && res[2] > 500, best = conv; used = [V, Lab, res]));
  if(best == 0, print("  FAILED: no convention gives an integral polynomial"); return(0));
  [V, Lab, res] = used; [G, rd, mx] = res; V = real(V);
  sep = minsep(V); d = #V; b1 = V[1];
  print("  used convention ", best, ": G integral (error 10^-", rd, "), monic=", pollead(G) == 1, ", max coefficient digits ", mx,
        ", irreducible=", polisirreducible(G), ", min root separation 10^", Strprintf("%.1f", log(sep)/log(10)));
  Pt = fieldpol(N);
  R = 2^A * p^B * prod(j = 1, #C, Sa(j, Pt)^(C[j] / 2));
  print("  exact R = b_1^", E, " candidate in Q(theta), deg ", poldegree(Pt), "; max coefficient digits of R: ",
        vecmax(apply(z -> #digits(abs(numerator(z))) + #digits(denominator(z)), Vec(lift(R)))));
  rts = if(E == 1, [R], nfroots(Pt, 'x^E - lift(R)));
  print("  roots of x^", E, " - R in Q(theta): ", #rts);
  for(i = 1, #rts, my(r = Mod(lift(rts[i]), Pt), e = abs(emb(r, N, 1) - b1)); if(e < dist, dist = e; c1 = r));
  ok = (subst(G, 'x, c1) == 0);
  print("  EXACT: G(c_1) = 0 in Q(theta): ", ok, ";  |iota(c_1) - b_1| = 10^-", dig(dist), " (half separation 10^",
        Strprintf("%.1f", log(sep/2)/log(10)), ")");
  print("  c_1 = ", if(#Str(lift(c1)) < 400, lift(c1), Str("[", #Str(lift(c1)), " chars]")));
  Hb = vecmax(apply(abs, V));
  Hc = vecmax(vector(N, a, if(gcd(a, N) == 1, abs(emb(c1, N, a)), 0)));
  liou = (d - 1) * log(Hb + Hc) / log(10);
  print("  Liouville gap: if b_1 != iota(c_1) then |b_1 - iota(c_1)| >= (H_b + H_c)^-(d-1) = 10^-", Strprintf("%.1f", liou),
        " (log10 H_b = ", Strprintf("%.2f", log(Hb)/log(10)), ", log10 H_c = ", Strprintf("%.2f", log(Hc)/log(10)), "); observed 10^-", dig(dist),
        " -> ", if(dig(dist) > liou + 10, "GAP ARGUMENT PASSES", "gap argument not conclusive"));
  \\ every conjugate as a Galois image of c_1
  my(seen = vector(d), worst = 99999);
  for(a = 1, N \ 2, if(gcd(a, N) != 1, next);
    my(w = emb(c1, N, a), jbest = 0, eb = +oo);
    for(j = 1, d, my(e = abs(w - V[j])); if(e < eb, eb = e; jbest = j));
    seen[jbest]++; worst = min(worst, dig(eb));
    if(jbest <= (p-1)/2 || d <= 6, print("    a = ", a, ": sigma_a(c_1) at iota = ", Lab[jbest], "  (agreement 10^-", dig(eb), ")"),
       print("    a = ", a, ": sigma_a(c_1) at iota = ", Lab[jbest], "  (10^-", dig(eb), ")")));
  print("  each analytic conjugate hit exactly once by sigma_a(c_1): ", seen == vector(d, i, 1), "; worst agreement 10^-", worst);
  print("  VERDICT p = ", p, ": ", if(ok && dig(dist) > 900 && dist < sep/2 && seen == vector(d, i, 1), "CERTIFIED", "FAILED"),
        "   [", (getabstime() - t0) \ 1000, " s]");
  c1;
}
