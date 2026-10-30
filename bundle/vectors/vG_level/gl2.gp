\\ gl2.gp -- INSTRUMENT REPAIR after the sealed run (no prediction, list or bar changed; predab/preddeg/predreal are untouched).
\\ Fault found in run 1 (run_g1_out.txt): law.gp clust() uses the tolerance tol*(1 + |R|), i.e. ABSOLUTE for small values, and gone()
\\ tested reality with |Im| < 1e-30 (1 + |v|). At large m some conjugates are below 1e-30 (e.g. l = 11, m = 385: ~1e-61), so distinct
\\ tiny conjugates merged (DEGMISS) and tiny non-real ones were counted as real (REALMISS); at l = 11, m = 385 the exact layer then saw
\\ a different number of values and the guard error("degree changed") aborted the rest of the MAIN block.
\\ Repair: RELATIVE tolerances everywhere (cluster and reality), and the numerical layer's precision raised to 60 digits above the size
\\ of the smallest conjugate.
read("vectors/vG_level/gl.gp");
clust(V, tol) = {
  my(R = List(), M = List(), hit);
  for(i = 1, #V, hit = 0;
    for(j = 1, #R, if(abs(V[i] - R[j]) < tol * abs(R[j]), M[j]++; hit = 1; break));
    if(!hit, listput(R, V[i]); listput(M, 1)));
  [Vec(R), Vec(M)];
}
gone(lab, l, m, cap) = {
  my(t0 = getabstime(), V, cl, reps, mult, d, nre, numab, pa, pd, pr, W, res, P, err, z, chk, nreal, ab, cert, h = #redforms(-4*m), mn, p0);
  default(realprecision, 40);
  V = gvals(m, l, 1); mn = vecmin(apply(v -> abs(v), V)); p0 = 60 + max(0, ceil(-log(mn)/log(10)));
  default(realprecision, p0);
  V = gvals(m, l, 1); cl = clust(V, 1e-30); [reps, mult] = cl; d = #reps;
  nre = sum(i = 1, d, abs(imag(reps[i])) < 1e-30 * abs(reps[i]));
  numab = (nre == d);
  pa = predab(l, m); pd = preddeg(l, m); pr = predreal(l, m);
  cert = Str("numerical, prec ", p0);
  if(d <= cap || pa,
    W = max(needW(reps), 150) + max(0, ceil(-log(mn)/log(10)));
    default(realprecision, W);
    V = gvals(m, l, 1); cl = clust(V, 10.^(-W \ 3)); [reps, mult] = cl;
    if(#reps != d, print("  !!DEGREE CHANGED with precision at l=", l, " m=", m, ": ", d, " -> ", #reps); d = #reps);
    res = intpol(reps); [P, err] = res[1..2];
    default(realprecision, 2 * W);
    z = Bv(l, 1, I * sqrt(m));
    chk = dig(abs(subst(P, 'x, z)) / (vecmax(apply(abs, Vec(P))) * max(1, abs(z))^d));
    default(realprecision, W);
    nreal = polsturm(P);
    ab = if(d <= 2, [1, "degree <= 2"], abtest(P));
    cert = Str(if(#reps != poldegree(P), "!!", ""), "p0=", p0, " exact: round=1e-", err, " den=", res[3], " irred=", polisirreducible(P), " P(z)@2W=1e-", chk,
               " sturm=", nreal, " W=", W, " [", ab[2], "]");
    if(ab[1] != numab || nreal != nre, cert = Str(cert, " !!INCONSISTENT with numerical"));
    if(d <= 6, cert = Str(cert, " P=", P)));
  print(lab, " l=", l, " m=", m, " (m mod l=", m % l, ") idoneal=", idon(m), " h=", h, " cl2=", cl2(m), " |C_N|=", #V,
        " deg=", d, " preddeg=", pd, if(d == pd, " ok", " DEGMISS"), " real=", nre, "/", d, " predreal=", pr,
        if(pr < 0, "", if(pr == nre, " ok", " REALMISS")),
        " => ", if(numab, "ABELIAN", "NOT ABELIAN"), " pred=", if(pa, "ABELIAN", "NOT ABELIAN"), if(pa == numab, " HIT", " MISS"),
        "  {", cert, "}  (", (getabstime() - t0) \ 1000, " s)");
  [numab, pa, d, pd, nre, pr];
}
