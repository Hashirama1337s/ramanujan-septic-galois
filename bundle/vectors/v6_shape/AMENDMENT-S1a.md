# AMENDMENT-S1a to BAR-S1 (block C instrument only; predictions unchanged)
2026-10-28, vector-6 seat. Written after runC_out.txt showed "NOT RUN (... e_STACKTHREAD)" at p = 47 and 73.
Cause: sC.gp wraps nfinit in alarm(cap, ...); PARI evaluates alarm() in a thread whose stack is bounded by threadsizemax
(default small), not by parisizemax, so the degree-115/144 nfinit overflowed the THREAD stack. The printout then labelled the item
"MISS" because the string "NOT RUN" != the predicted list; that label is wrong: these items are NOT RUN (instrument), not misses.
Change: runC2.gp sets default(threadsizemax, 6000000000) and re-calls the SAME sc() (sC.gp unchanged, hash as sealed) at
p = 47, 73, 59, 71, 41 with caps 3000-3600 s. Predictions, items and pass rules: exactly as BAR-S1 block C.
