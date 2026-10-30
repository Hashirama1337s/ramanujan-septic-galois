# AMENDMENT-K2a (code only; predictions, thresholds, scoring of BAR-K2 unchanged). 2026-10-28.
Run 1 of k2.gp (sha 8a442199...) crashed in the character block: the line "rP(k) = rhoI(k, PP); rPb(k) = rhoI(k, PB);" is parsed by GP as
ONE function rP whose body also contains the definition of rPb, so rPb was undefined at its first use (error "t_REAL + t_CLOSURE").
The crash happened at the first character item before any character-level verdict or LHS value was printed. The element-level block
(Q1, Q1', Z1-Z4: 6 verdicts, all as predicted) and all instrument checks (0 faults) had completed. Raw output kept as
k2_out_v0_CRASH.txt, script as k2_v0_crash.gp. Fix: the two definitions are put on separate lines (diff shows only this). The whole
script is re-run and scored from run 2; run 1's element-level lines are not used for scoring.
Note: k2.gp was rewritten with LF line endings (the editor tool wrote CRLF); use diff --strip-trailing-cr to see the one-line change.
Correction to the note above: the direction is reversed - k2_v0_crash.gp has LF endings and k2.gp has CRLF (Python on Windows). GP reads both alike.
