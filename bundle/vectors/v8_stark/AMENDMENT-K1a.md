# AMENDMENT-K1a (code only; predictions, thresholds and scoring of BAR-K1 unchanged). 2026-10-28.
Run 1 of k1.gp (sha ddbb922d...) was VOID: instrument fault. GP reads a file line by line at top level, so the five multi-line
foreach/for blocks (k1.gp lines 93-100, 108-113, 115-118, 120-126, 142-149) were parsed as broken statements (syntax errors; the
loop variables were left as free polynomials). No predicted quantity was computed (every P/N line errored before a verdict printed;
SUMMARY 0/0). The only numbers printed were three p = 23 instrument checks (all ok). Raw output kept as k1_out_v0_VOID.txt; the
faulty script kept as k1_v0_void.gp. Fix: each of the five blocks is wrapped in braces { ... }. No other character changed
(diff k1_v0_void.gp k1.gp shows only the ten brace edits).
