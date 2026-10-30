read("vectors/v9_even/u1.gp");
read("vectors/v9_even/ratfix.gp");
print("ratfix controls (POST HOC instrument check, not a sealed test); Dmax = 10^12, 200 digits");
default(realprecision, 200);
{
foreach([[Ht, 8, 15, "true set GG m=15 (expect ok 1)"], [Ht, 4, 15, "wrong level 4 GG m=15 (expect ok 0)"], [Ht, 8, 7, "true set GG m=7 (expect ok 1)"],
         [Ht, 4, 7, "wrong level 4 GG m=7 (expect ok 0)"], [Gt6, 6, 8, "true set CF n=8 (expect ok 1)"], [Gt6, 6, 61, "true set CF n=61 (expect ok 1)"]], it,
  my(V = pclust(apply(p -> it[1](p[2]), cmpoints(-4*it[3], it[2])))[1], r = prat(V, 10^12));
  print(it[4], ": #values ", #V, ", den ", r[2], ", err digits ", r[3], ", ok ", r[4]));
}
