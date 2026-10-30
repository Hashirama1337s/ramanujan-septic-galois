\\ rerun2.gp -- RE-RUN (resume seat, 2026-10-28 evening) of the sealed T3 instrument (umodel in f1.gp, unchanged, sha256 a4960a9a...)
\\ at p = 43 only, where the sealed run stopped on the 2 GB PARI stack (resource failure, NOT RUN) and the 8G re-run (rerun.gp) was
\\ killed by the 09:20 pause. Only change from the sealed run: parisizemax 8G. 60-minute cap. Same prediction as BAR-F1:
\\ 3 | e_P for every P and e_P = 3, v_P(b_1) = 43, sum f_P v_P(b_1) = 903. Not run at 41, 53 (degree 160/156; post hoc route used).
\\ Labelled a re-run after a resource failure; the post hoc model (posthoc_out.txt) had already shown [3,7] x 3 at 43 before this run.
default(parisizemax, 8*10^9);
read("vectors/v4_factor/f1.gp");
print("RE-RUN 2 of sealed T3 at p = 43 (parisizemax 8G, cap 60 min)");
r = iferr(alarm(3600, umodel(43)), E, E); if(type(r) == "t_ERROR", print("  p = 43: T3 re-run NOT RUN (", errname(r), ")"));
print("END RE-RUN 2");
quit
