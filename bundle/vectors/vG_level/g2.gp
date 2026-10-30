\\ g2.gp -- BAR-G2 (composite-level torus half, Proposition T2). Items, the T2 case that proves each "not abelian", and predictions.
\\ Predictions use gl.gp's sealed predab / preddeg (class groups and residues only). No theta value is computed by predict mode.
read("vectors/vG_level/gl2.gp");
{ G2LIST = [[27, [3, 5, 7, 9, 45]], [45, [5, 7, 15, 45]], [49, [3, 7, 13, 21]], [63, [5, 7, 21]], [75, [3, 7, 15]],
            [9, [9, 45]], [25, [25]]]; }
\\ which case of RESULT-G1 §3c (T2) or §3 proves "not abelian" (or "A" for a predicted abelian control); "GAP" if none applies
t2case(l, m) = {
  my(F = factor(l), np = #F[, 1], c = List());
  if(predab(l, m), return("A (control)"));
  if(m % l == 0, return(if(np >= 2, "(C)", "(D)+3b")));
  for(i = 1, np, my(p = F[i, 1], e = F[i, 2], v = valuation(m, p));
    if(v >= e, next);
    if(v == 0, listput(c, if(np >= 2, "(i)", "(ii)")), if(v <= e - 2, listput(c, "(iii)"), if(p == 3, listput(c, "(iv)"), if(np == 1, listput(c, "(v)"), listput(c, "GAP"))))));
  my(s = Set(Vec(c)));
  if(#s == 1 && s[1] == "GAP", "GAP", Str(Vec(setminus(s, Set(["GAP"])))));
}
g2predict() = {
  foreach(G2LIST, it, my(l = it[1]); foreach(it[2], m,
    print("G2 l=", l, " m=", m, " idoneal=", idon(m), " h=", #redforms(-4*m), " pred=", if(predab(l, m), "A", "-"),
          " preddeg=", preddeg(l, m), " case=", t2case(l, m))));
}
g2run(cap) = {
  my(T = [0, 0, 0]);
  foreach(G2LIST, it, my(l = it[1]); foreach(it[2], m,
    my(r = iferr(gone("G2", l, m, cap), E, print("G2 l=", l, " m=", m, " ERROR ", E); 0));
    if(r != 0, T[1]++; T[2] += (r[1] == r[2]); T[3] += (r[3] == r[4]))));
  print("G2 totals [items, verdict hits, degree hits] = ", T);
}
