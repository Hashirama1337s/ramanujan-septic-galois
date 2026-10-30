\\ runC.gp -- BAR-S1 block C run list (sealed). Launch: gp -q -D parisizemax=6000000000 runC.gp
read("vectors/v6_shape/sC.gp");
\\ controls (RESULT-F1 table): 11, 17, 23, 43
sc(11, 600); sc(17, 600); sc(23, 600); sc(43, 1200);
\\ new: p = 7 mod 8: 31, 47, 71; p = 3 mod 8 with h(-p) > 1: 59; p = 1 mod 8 with ord_p 2 odd: 73; p = 1 mod 8, ord even (dichotomy only): 41
sc(31, 1200); sc(47, 1800); sc(73, 1800); sc(59, 2400); sc(71, 2400); sc(41, 1800);
\\ J-only (cheap) predictions at larger p
jonly(p) = { my(J = jdata(p)[1], e = ef(nfinit([J, [2]])), pj = predJ(p));
  print("CJ p=", p, " (", p % 8, " mod 8) h(-4p)=", qfbclassno(-4*p), " J: ", e, "  predJ: ", pj, if(pj == e, "  ok", "  MISS")); }
foreach([79, 83, 103, 107, 127, 131, 139, 151, 163, 167, 179, 191, 199, 211, 223, 227, 239, 251], p, jonly(p));
