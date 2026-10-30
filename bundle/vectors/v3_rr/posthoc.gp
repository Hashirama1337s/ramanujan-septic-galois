\\ posthoc.gp -- POST HOC diagnostic (after scoring block B): why no non-Galois prime certificate at n = 1848?
read("veins/v1_law/law.gp");
read("veins/v1_law/run.gp");
read("vectors/v3_rr/rr.gp");
diag(P) = {
  my(pats = Map(), ng = 0, sq = 0, lc = 0);
  print("deg ", poldegree(P), " polsturm ", polsturm(P), " (a Galois polynomial has 0 or all roots real)");
  forprime(p = 3, 20000,
    if(polcoef(P, poldegree(P)) % p == 0, lc++; next);
    my(F = factormod(P, p)); if(vecmax(F[, 2]) > 1, sq++; next);
    ng++; my(k = Str(Set(apply(poldegree, lift(F[, 1])))));
    mapput(pats, k, if(mapisdefined(pats, k), mapget(pats, k), 0) + 1));
  print("primes 3..20000: good ", ng, ", non-squarefree ", sq, ", leading-coeff ", lc);
  print("factor-degree sets seen (set -> count): ", Mat(pats));
  forprime(p = 20000, 400000,
    if(polcoef(P, poldegree(P)) % p == 0, next);
    my(F = factormod(P, p)); if(vecmax(F[, 2]) > 1, next);
    my(dg = apply(poldegree, lift(F[, 1])));
    if(vecmin(dg) != vecmax(dg), print("first unequal-degree prime >= 20000: ", p, " degrees ", Set(dg)); return(p)));
  print("none up to 400000");
}
{ my(r = rrone(1848)); diag(mon(r[3])); }
quit;
