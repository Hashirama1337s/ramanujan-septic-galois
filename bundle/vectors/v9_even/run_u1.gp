read("vectors/v9_even/u1.gp");
print("=== BAR-U1 run ===");
print("--- controls ---");
uitem(B7, 28, 7, "C1 B7");
uitem(B7, 28, 3, "C2 B7");
uitem(Ht, 16, 7, "C3 GG@16");
print("--- nulls (wrong level) ---");
unull(Ht, 4, 15, "N1 GG");
unull(Ht, 4, 7, "N1 GG");
print("--- block GG (level 8) ---");
{
  my(L = concat(vector(39, i, i + 1), [60]), ab = List(), dmiss = List(), bad = List(), r);
  for(i = 1, #L, my(m = L[i]); r = uitem(Ht, 8, m, "GG");
    if(r[1] == "ABELIAN", listput(ab, m));
    if(r[1] != "ABELIAN" && r[1] != "NOT", listput(bad, m));
    if(r[2] != 8 * r[4], listput(dmiss, [m, r[2], 8 * r[4]])));
  print("GG SUMMARY: abelian at ", Vec(ab), " | predicted [3, 7, 15] | fault/undecided ", Vec(bad), " | degree misses (m, obs, pred) ", Vec(dmiss));
}
print("--- block CF (level 6) ---");
{
  my(ab = List(), dmiss = List(), bad = List(), r, w3, pd);
  for(n = 2, 100, r = uitem(Gt6, 6, n, "CF");
    if(r[1] == "ABELIAN", listput(ab, n));
    if(r[1] != "ABELIAN" && r[1] != "NOT", listput(bad, n));
    w3 = if(n % 3 == 0, 6, if(n % 3 == 2, 4, 8));
    pd = if(n % 2, r[4] * w3, r[4] * w3 / 2);
    if(r[2] != pd, listput(dmiss, [n, r[2], pd])));
  print("CF SUMMARY: abelian at ", Vec(ab), " | predicted [2, 8] | fault/undecided ", Vec(bad), " | degree misses (n, obs, pred) ", Vec(dmiss));
}
print("=== END OF SEALED RUN ===");
