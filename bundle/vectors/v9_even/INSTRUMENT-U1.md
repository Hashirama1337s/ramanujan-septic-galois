# INSTRUMENT-U1 — fixes found during boss 3 (V9), 2026-10-29
Old scripts (law.gp, clustfix.gp, u1.gp) are NOT edited. New code: ratfix.gp (prat).

## 1. Rationality test fooled by large denominators (found by BAR-U1 null N1)
- Fault: law.gp intpol() rounds coefficients with bestappr(c, 10^(P/4)). Fractions with denominators up to 10^(P/4) are ~10^(-P/2) apart, so any
  real number is matched to ~P/2 digits: "rounding error >= 30 digits" cannot detect a non-rational coefficient. N1 (wrong level 4) returned a
  "rational polynomial" with ~400-digit denominators (diag_n1_out.txt).
- Fix: ratfix.gp prat(V, Dmax): fixed denominator bound Dmax (default 10^12) independent of P; ok only if imaginary parts <= 10^(-P/2), common
  denominator <= Dmax, |den c_i - round| <= 10^(-P/2) max(1, |den c_i|), and P/2 >= 2 log10 Dmax + 40 (fractions of denominator <= Dmax are
  >= Dmax^-2 apart, so no accidental match). Where a proved denominator bound exists (algebraic integers: den = 1), use it instead.
- Control (ratfix_check_out.txt, post hoc, 200 digits): true sets GG m = 7, 15 -> ok 1 (den 1); CF n = 8, 61 -> ok 1 (den 8, 4096); the two N1 wrong-level
  sets -> ok 0 (denominators ~10^45, ~10^84). Main BAR-U1 verdicts are unaffected (their denominators were 1 or <= 2^12).
- Rule for future bars: the exact layer uses prat (or a proved bound), and a "wrong level" null is scored by prat, not by rounding digits.

## 2. stdout/stderr overwrite when redirecting outside WSL
- Seen: `wsl -e bash -lc 'gp ...' > out 2>&1` (redirect in Git Bash) let gp's stderr overwrite the first bytes of the file (the "nbthreads = 1" line
  vanished, replaced by "***   variab..."). Fix: redirect INSIDE the WSL shell: `wsl -e bash -lc 'gp ... > <project folder>/out.txt 2>&1'`.
  Checked: run_u1_out.txt (BAR-U1) starts with "nbthreads = 1" and has no stderr lines, so it was not affected.

## 3. Backslashes in heredocs (lesson repeated)
- A python one-liner inside a bash heredoc wrote a gp comment as "\ frac..." (one backslash): gp error "unexpected character". Fixed with the Edit tool.
  Rule stands: no backslashes in heredocs; use Write/Edit.

## 4. PARI built-in names
- Redefining `frac` (a PARI built-in) fails with "variable name expected"; the built-in has the intended meaning (x - floor(x)). Use the built-in.

[Lead 2026-10-29, REFEREE-U1 fixes: (1) denominators in run_u1_out.txt reach 2^21 (n = 96), not 2^12/4096 - any "<= 2^12" or "up to 4096" above is wrong; conclusion unaffected. (2) Plain words: the classification is for m >= 2 (GG) and n >= 2 (CF); POST HOC numerics: m = 1 GG is abelian (C4), n = 1 CF is not (D4). (3) State U-CF as "n even and 9n idoneal" (the form "9n idoneal and (n even or 4n idoneal)" fails at n = 1). (4) Lemma J is CLASSICAL (ker(Cl(Z + nO) -> Cl(O)), Cox sec. 7), proved directly here - not new. (5) Add (S4): Shimura 1971 Prop 6.9 for "Gamma(N)-invariant, rational q-coefficients => in F_N". (6) N1 failed as a null. (7) "exact certificate" for NOT verdicts = exact given the 249-digit numerical root identity. (8) Prior art missed: Akkarapakam-Morton NYJM 30 (2024).]
