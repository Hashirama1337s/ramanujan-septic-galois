\ runC3.gp -- AMENDMENT-S1b: J-only list exactly as runC.gp, then sc(47), sc(73) with the thread stack raised (as runC2.gp). sC.gp unchanged.
read("vectors/v6_shape/sC.gp");
default(threadsizemax, 6000000000);
jonly(p) = { my(J = jdata(p)[1], e = ef(nfinit([J, [2]])), pj = predJ(p));
  print("CJ p=", p, " (", p % 8, " mod 8) h(-4p)=", qfbclassno(-4*p), " J: ", e, "  predJ: ", pj, if(pj == e, "  ok", "  MISS")); }
foreach([79, 83, 103, 107, 127, 131, 139, 151, 163, 167, 179, 191, 199, 211, 223, 227, 239, 251], p, jonly(p));
sc(47, 3000); sc(73, 3000);
