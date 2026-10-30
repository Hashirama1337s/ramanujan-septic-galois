read("vectors/v9_even/u1.gp");
print("POST HOC diagnosis of null N1 (wrong level 4), m = 15 and 7");
default(realprecision, 200);
{
foreach([15, 7], m,
  my(V8 = pclust(apply(p -> Ht(p[2]), cmpoints(-4*m, 8)))[1], V4 = pclust(apply(p -> Ht(p[2]), cmpoints(-4*m, 4)))[1], z = Ht(I*sqrt(m)), ins = 0, zin = 0, P4, P8);
  for(i = 1, #V4, if(vecmin(apply(w -> reldist(V4[i], w), V8)) < 1e-100, ins++); if(reldist(V4[i], z) < 1e-100, zin = 1));
  P4 = intpol(V4)[1]; P8 = intpol(V8)[1];
  print("m = ", m, ": #level-8 conjugates ", #V8, ", #level-4 values ", #V4, ", level-4 values inside the level-8 set: ", ins, ", z among them: ", zin,
        ", P4 divides P8: ", (P8 % P4) == 0, ", P4 = ", P4));
}
