\\ rerun.gp -- RE-RUN of the sealed T3 instrument (umodel in f1.gp, unchanged, hash a4960a9a...) at the test primes where the sealed run
\\ stopped on the 2 GB PARI stack (resource failure, not a verdict). Only change: parisizemax 8G (coordinator's allowance; -s 2G start).
\\ Order 43, 41, 53; 60-minute cap each. Same predictions as BAR-F1 (e_P = e, v_P(b_1) = p, sum f v = v_2(G(0))).
default(parisizemax, 8*10^9);
read("vectors/v4_factor/f1.gp");
print("RE-RUN of sealed T3 (parisizemax 8G)");
foreach([43, 41, 53], p, my(r = iferr(alarm(3600, umodel(p)), E, E)); if(type(r) == "t_ERROR", print("  p = ", p, ": T3 re-run NOT RUN (", errname(r), ")")));
quit
