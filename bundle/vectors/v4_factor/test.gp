\\ test.gp -- BAR-F1 sealed test run (vector 4). Engine f1.gp. Order fixed in BAR-F1.md.
read("vectors/v4_factor/f1.gp");
print("SEALED TEST RUN BAR-F1 (vector 4)");
\\ T1, T2 (and the sanity checks) at all four primes; minimal polynomials saved to minpoly_p*.gp
foreach([37, 43, 41, 53], p, factor1(p, 0, 0));
\\ T3 (unit model, nfinit([S,[2]])) caps as in BAR-F1
print("\n== T3: unit model (cap 60 min at 37, 43; 30 min at 41, 53)");
foreach([37, 43, 41, 53], p, my(r = iferr(alarm(if(p == 37 || p == 43, 3600, 1800), umodel(p)), E, E)); if(type(r) == "t_ERROR", print("  p = ", p, ": T3 NOT RUN (", errname(r), ")")));
\\ T4 at 37: direct nfinit([G,[2]]) and all conjugates of b_1 lying in F_p (nfroots), 60-minute cap
print("\n== T4 at 37: direct factorisation + conjugates in F_p (60-minute cap)");
r4 = iferr(alarm(3600, factor1(37, 1, 1)), E, E); if(type(r4) == "t_ERROR", print("  p = 37: T4 NOT RUN (", errname(r4), ")"));
print("\nEND OF SEALED RUN");
quit
