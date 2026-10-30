\\ u1.gp -- BAR-U1 driver (V9). Exact verdicts for even-level CM values: Goellnitz-Gordon (level 8) and cubic CF (level 6).
\\ Engine: law.gp cmpoints (KSY25 conjugates, unchanged) + clustfix.gp pclust/preal (certified clustering, unchanged).
\\ Verdict per item: exact integer polynomial of the distinct conjugates (rounding certified, z recomputed at 2W is a root),
\\ irreducible; Sturm count < degree => NOT ABELIAN (a non-real conjugate of the real z, RESULT-V1 L3; exact);
\\ Sturm = degree => abtest (non-Galois prime witness => NOT; galoisinit + galoisisabelian => ABELIAN); otherwise UNDECIDED.
default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
read("veins/v1_law/law.gp");
read("vectors/v6_shape/clustfix.gp");

\\ ---- functions (rational q-coefficients) ----
Geta(w) = eta(w, 1) * eta(6*w, 1)^3 / (eta(2*w, 1) * eta(3*w, 1)^3);   \\ cubic CF G(q), q = e^{2 pi i w}
Gt6(z) = Geta(z / 2);                                                    \\ Gt(i sqrt n) = G(e^{-pi sqrt n}) (RESULT-V1 convention)
H8(z) = exp(-Pi*I/4) * th(3/8, 1/2, 8*z) / th(1/8, 1/2, 8*z);            \\ Goellnitz-Gordon H(q), q = e^{2 pi i z}
Ht(z) = H8(z / 2);                                                       \\ Ht(i sqrt m) = H(e^{-pi sqrt m})
B7(z) = Bpiece(1, 7, z);                                                 \\ odd-level control, level 28

\\ ---- one item ----
\\ returns [verdict string, degree, sturm, h, idoneal]
uitem(F, N, m, tag) = {
  my(D = -4*m, W = 120, V, C, R, G, d, st, z, res, nrm, ab, verdict, why, pr, h = #redforms(-4*m), idn = iselem2(-4*m), ok = 0, P, irr);
  if(m < 2, error("hypothesis: m >= 2"));
  for(round = 1, 6,
    default(realprecision, W);
    P = cmpoints(D, N);                      \\ points computed AFTER the precision is set
    V = vector(#P, i, F(P[i][2]));
    C = pclust(V);
    if(!C[5], W = 2*W; next);
    R = C[1];
    my(W2 = needW(R));
    if(W2 > W, W = W2 + 40; next);
    G = intpol(R);
    if(G[2] < 30, W = 2*W; next);
    ok = 1; break);
  if(!ok, print(tag, " m = ", m, ": INSTRUMENT FAULT (no certified clustering/rounding up to W = ", W, ")"); return(["FAULT", 0, 0, h, idn]));
  P = G[1]; d = poldegree(P); irr = polisirreducible(P);
  \\ root check: z recomputed directly at 2W
  default(realprecision, 2*W);
  z = F(I*sqrt(m));
  res = abs(subst(P, 'x, z)); nrm = sum(i = 0, d, abs(polcoef(P, i)) * abs(z)^i);
  pr = dig(res / nrm);
  default(realprecision, W);
  st = polsturm(P);
  my(rl = preal(R), ex = pexact(P, rl[1]));
  if(!irr || d != #R || pr < W/2,
    verdict = "FAULT"; why = Str("irr ", irr, " d ", d, " #R ", #R, " rootcheck ", pr),
    if(st < d, verdict = "NOT"; why = Str("Sturm ", st, " < ", d, " (non-real conjugate)"),
      ab = abtest(P);
      if(ab[1], verdict = "ABELIAN"; why = Str("galoisisabelian, SNF ", ab[2]),
        if(type(ab[2]) == "t_STR" && #ab[2] >= 3 && ab[2][1..3] == "not", verdict = "NOT"; why = ab[2],
          verdict = "UNDECIDED"; why = ab[2]))));
  print(tag, " m = ", m, " | idoneal ", idn, " h ", h, " | W ", W, " | deg ", d, " real(num) ", rl[1], " sturm ", st,
        " | round ", G[2], " den ", G[3], " rootchk ", pr, " clust_ok ", C[5], " gap ", dig(C[4]), " | sqfree ", ex[1], " parity ", ex[4],
        " | ", verdict, " : ", why);
  [verdict, d, st, h, idn];
}

\\ ---- null: wrong level (the pipeline told N, function actually of level 8) ----
unull(F, N, m, tag) = {
  my(D = -4*m, W = 300, P, V, C, R, G);
  default(realprecision, W);
  P = cmpoints(D, N); V = vector(#P, i, F(P[i][2])); C = pclust(V); R = C[1]; G = intpol(R);
  print(tag, " m = ", m, " told level ", N, ": #values ", #R, " clust_ok ", C[5], " rounding digits ", G[2],
        " -> ", if(G[2] >= 30, "NULL DID NOT FAIL (rational polynomial found)", "null fails as it should (no rational polynomial)"));
  G[2];
}
