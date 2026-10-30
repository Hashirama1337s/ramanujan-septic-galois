\\ rr.gp -- BAR-R1 runner (vector 3). Requires law.gp (veins/v1_law, unchanged) read first.
\\ z_n = RR(I*sqrt(n)) = R(q) at q = e^{-2 pi sqrt n}, N = 5, O = Z[sqrt -n].

\\ number of ambiguous reduced forms of discriminant D (= |Cl(O)[2]|)
a2(D) = { my(F = redforms(D)); sum(i = 1, #F, my(Q = F[i]); Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]); }
efac(n) = { my(r = n % 5); if(r == 0, 10, if(r == 1 || r == 4, 8, 12)); }
rfac(n) = if(n % 5 == 0, 2, 4);

\\ witness matrix: nu = x + tau_O, delta = matrix of nubar/nu mod 5 on basis (tau_O, 1): [t, -n s; s, t]
\\ (multiplication by t + s tau: (tau, 1) -> (t tau - n s, s tau + t)).  Returns [x, t, s, lift1, lift2].
liftSL(t0, b0, c0, d0, n, shift) = {
  \\ integer matrix [a,b;c,d] in SL2(Z) congruent to [t0,b0;c0,d0] mod 5; bottom row chosen small, shifted by 5*shift
  my(c = centerlift(Mod(c0, 5)), d = centerlift(Mod(d0, 5)) + 5 * shift, g, a, b, k, cnt = 0);
  while(gcd(c, d) != 1, d += 5; cnt++; if(cnt > 50, error("no coprime lift")));
  g = gcdext(d, -c);              \\ g[1]*d + g[2]*(-c) = 1  ->  a = g[1], b = g[2] gives a d - b c = 1
  a = g[1]; b = g[2];
  if(a * d - b * c != 1, error("bezout"));
  for(k = 0, 4, my(aa = a + k * c, bb = b + k * d);
    if((aa - t0) % 5 == 0 && (bb - b0) % 5 == 0, return([aa, bb; c, d])));
  error("lift failed");
}
witness(n) = {
  my(x = if((1 + n) % 5 == 0, 2, 1), Np = lift(Mod(x^2 + n, 5)^-1), t, s, M1, M2);
  t = lift(Mod((x^2 - n) * Np, 5)); s = lift(Mod(-2 * x * Np, 5));
  if(Mod(t^2 + n * s^2, 5) != 1, error("det != 1 mod 5"));
  M1 = liftSL(t, -n * s, s, t, n, 0);
  M2 = M1 * [1, 0; 5, 1];   \\ second lift = M1 times an element of Gamma(5) (genuinely different point); smoke run had a degenerate shift-lift
  [x, t, s, M1, M2];
}
mob(M, z) = (M[1,1] * z + M[1,2]) / (M[2,1] * z + M[2,2]);

\\ ---------- per-n run (adapted from veins/v1_law/run.gp runone) ----------
\\ returns [n, ok-vector], prints one line
rrone(n) = {
  my(t0 = getabstime(), D = -4*n, V, cl, d, W, reps, mult, res, P, err, z, chk, nreal, ab, h, A2, pdeg, preal,
     wit, w1, w2, mv, mt, la, okv);
  default(realprecision, 60);
  V = cvals(D, 5, RR); cl = clust(V, 1e-25); reps = cl[1];
  W = max(needW(reps), 150);
  default(realprecision, W);
  V = cvals(D, 5, RR); cl = clust(V, 10.^(-W \ 3)); [reps, mult] = cl; d = #reps;
  res = intpol(reps); [P, err] = res[1..2];
  default(realprecision, 2 * W);
  z = RR(I * sqrt(n));
  chk = dig(abs(subst(P, 'x, z)) / (vecmax(apply(abs, Vec(P))) * max(1, abs(z))^d));
  \\ witness at W + 60 digits
  default(realprecision, W + 60);
  wit = witness(n); z = RR(I * sqrt(n));
  w1 = RR(mob(wit[4], I * sqrt(n))); w2 = RR(mob(wit[5], I * sqrt(n)));
  mv = abs(w1 - z) / abs(z);
  la = dig(abs(w1 - w2) / abs(w1));
  mt = vecmax(apply(r -> dig(abs(w1 - r) / abs(r)), reps));
  default(realprecision, W);
  nreal = polsturm(P);
  ab = abtest(P);
  h = #redforms(D); A2 = a2(D); pdeg = h * efac(n); preal = rfac(n) * A2;
  okv = [!ab[1], d == #V && d == pdeg && Set(mult) == [1], nreal == preal,
         mv > 1e-30 && mt >= W \ 3 && la >= W \ 3, err >= 50 && chk >= 100];
  print("n=", n, " h=", h, " a2=", A2, " e=", efac(n), " |C5|=", #V, " deg=", d, " pred=", pdeg, " mult=", Set(mult),
        " W=", W, " round=1e-", err, " P(z)@2W=1e-", chk, " real=", nreal, " pred=", preal,
        " => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]",
        " | wit x=", wit[1], " delta=[", wit[2], ",", lift(Mod(-n*wit[3],5)), ";", wit[3], ",", wit[2], "] lift=", wit[4],
        " moved=", Strprintf("%.3e", mv), " match=1e-", mt, " lifts=1e-", la,
        " | P1..P6:", okv, " (", (getabstime() - t0) \ 1000, " s)");
  [n, okv, P];
}

\\ ---------- controls ----------
ctl1() = {
  my(z, cf, P, ab, wit, w);
  print("=== P5 positive control n = 1");
  default(realprecision, 1100);
  z = real(RR(I)); cf = sqrt((5 + sqrt(5)) / 2) - (1 + sqrt(5)) / 2;
  print("  closed form sqrt((5+sqrt5)/2) - (1+sqrt5)/2 vs R(i): 1e-", dig(z - cf));
  P = runalg("R", 1, RR);
  ab = abtest(P); print("  abtest: ", ab, "  P == x^4+2x^3-6x^2-2x+1: ", P == x^4 + 2*x^3 - 6*x^2 - 2*x + 1);
  default(realprecision, 300);
  wit = witness(1); w = RR(mob(wit[4], I));
  print("  witness n=1: x=", wit[1], " delta mod 5 = [", wit[2], ",", lift(Mod(-wit[3],5)), ";", wit[3], ",", wit[2], "]",
        " lift ", wit[4], " point ", mob(wit[4], I), " |w - z|/|z| = 1e-", dig(abs(w - RR(I)) / abs(RR(I))));
}
nulls() = {
  my(L = [2, 3, 13, 59, 200], wit, tau, j0, j1, P, ab);
  print("=== nulls");
  default(realprecision, 300);
  for(i = 1, #L, my(n = L[i]); wit = witness(n); tau = I * sqrt(n);
    j0 = ellj(tau); j1 = ellj(mob(wit[4], tau));
    print("  N1 n=", n, ": |j(delta tau) - j(tau)|/|j(tau)| = 1e-", dig(abs(j1 - j0) / abs(j0)), "  (W/2 = 150 -> ", if(dig(abs(j1 - j0) / abs(j0)) >= 150, "not moved: OK", "MOVED: NULL FAILS"), ")"));
  P = x^3 - 4*x - 1; ab = abtest(P); print("  N2 x^3-4x-1: ", if(ab[1], "ABELIAN (NULL FAILS)", "NOT ABELIAN"), " [", ab[2], "]");
}
null3(P13) = {
  my(W = 150, z, zp, c1, c2);
  default(realprecision, 2 * W);
  z = RR(I * sqrt(13)); zp = z * (1 + 1e-40);
  c1 = dig(abs(subst(P13, 'x, z)) / (vecmax(apply(abs, Vec(P13))) * max(1, abs(z))^24));
  c2 = dig(abs(subst(P13, 'x, zp)) / (vecmax(apply(abs, Vec(P13))) * max(1, abs(zp))^24));
  print("  N3 n=13: P(z)@2W = 1e-", c1, "; P(z perturbed 1e-40) = 1e-", c2, " -> ", if(c2 < 100, "fails bar: OK", "PASSES BAR: NULL FAILS"));
}
ksy13(P) = {
  my(K = x^24 + 82*x^23 - 996*x^22 + 968*x^21 + 1051*x^20 + 1422*x^19 - 96*x^18 - 24912*x^17 + 7896*x^16 + 16722*x^15 + 28844*x^14
       + 13658*x^13 - 114024*x^12 - 13658*x^11 + 28844*x^10 - 16722*x^9 + 7896*x^8 + 24912*x^7 - 96*x^6 - 1422*x^5 + 1051*x^4
       - 968*x^3 - 996*x^2 - 82*x + 1);
  print("  [P6] n=13 equals KSY25 Example 8.1 polynomial: ", P == K);
}

\\ ---------- blocks ----------
IDON200 = [210, 232, 240, 253, 273, 280, 312, 330, 345, 357, 385, 408, 462, 520, 760, 840, 1320, 1365, 1848];
tally = vector(5);
cnt = 0;
runlist(L) = {
  for(i = 1, #L, my(r = rrone(L[i])); cnt++; for(k = 1, 5, tally[k] += r[2][k]);
    if(L[i] == 13, ksy13(r[3]); null3(r[3])));
  print("=== tally after ", cnt, " values (n >= 2): P1 ", tally[1], " P2 ", tally[2], " P3 ", tally[3], " P4 ", tally[4], " P6 ", tally[5]);
}
