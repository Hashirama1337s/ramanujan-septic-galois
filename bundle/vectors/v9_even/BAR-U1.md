# BAR-U1 — sealed test of the even-level conjectures GG8 and CF6 (boss 3)
2026-10-29, V9 seat. Sealed BEFORE the run; hashes in SEALS-U1.txt and LOG.md. This file is immutable once hashed (corrections go in a new file).
Source of the predictions: PLAN-U.md §3 (sha 05e4915d...). Exploratory run (not sealed): explore_even_out.txt (sha cb422898...).

## In plain words
Two guesses are tested. (1) Goellnitz-Gordon's continued fraction at q = e^{-pi sqrt m} is a cyclotomic (abelian) number exactly at
m = 3, 7, 15. (2) Ramanujan's cubic continued fraction at q = e^{-pi sqrt n} is abelian exactly at n = 2, 8. Each value's verdict is
decided exactly (an integer polynomial plus a Galois-group or real-root certificate), not by eye. The single most decisive item is m = 15.

## Objects and hypotheses
- Ht(z) = H(z/2), H(q) = q^{1/2}(q;q^8)(q^7;q^8)/((q^3;q^8)(q^5;q^8)) = e^{-pi i/4} th[3/8,1/2](8z)/th[1/8,1/2](8z); Ht(i sqrt m) = H(e^{-pi sqrt m}). Level 8
  (rational coefficients; Gamma(8) spot check in explore_even_out.txt).
- Gt(z) = G(z/2), G = cubic CF = eta(w)eta(6w)^3/(eta(2w)eta(3w)^3); Gt(i sqrt n) = G(e^{-pi sqrt n}). Level 6 (RESULT-V1 convention).
- Every item: m >= 2 (O = Z[sqrt -m], O^* = {+-1}), D = -4m (= 0 mod 4, != -4: the conditions of law.gp cmpoints / KSY25 Thm 6.2 + Prop 4.1).
  The driver asserts m >= 2 and prints idoneal (law.gp iselem2) and h per item.
- Values are real (rational coefficients, tau_O on the imaginary axis), so RESULT-V1 (L3) applies: abelian => all conjugates real.

## Instrument (exact method)
u1.gp (hash in SEALS-U1.txt): law.gp cmpoints (KSY25 conjugates; unchanged, hash as in SEALS.txt of veins/v1_law) -> clustfix.gp pclust
(certified clustering; unchanged, sha e5cb5f88...) -> intpol (rational rounding, >= 30 digits required) -> root check (z recomputed
directly at 2W, relative residual <= 10^(-W/2)) -> irreducible, degree = number of distinct conjugates. Verdict: Sturm < degree => NOT
(exact: a non-real conjugate); Sturm = degree => law.gp abtest: non-Galois prime witness => NOT, galoisinit + galoisisabelian => ABELIAN;
anything else => UNDECIDED. Precision auto-raised (start 120 digits, needW, doubling up to 6 rounds). gp: default(nbthreads, 1), printed.
FAULT / UNDECIDED count as misses for the verdict items (no silent drop).

## Predictions
Block GG (level 8): m = 2, 3, ..., 40 and m = 60 (40 items).
- P1 (verdicts): ABELIAN exactly at m in {3, 7, 15}; NOT at every other item.
- P2 (degree, tests GS + generation): deg Q(z) = 8 h(-4m) at every item (stabiliser of order 2 in W/+-1, PLAN-U §3).
- P3 (decisive): m = 15 ABELIAN (h(-60) = 2, forms (1,0,15), (3,0,5)), degree 16, all 16 conjugates real.
Block CF (level 6): n = 2, ..., 100 (99 items).
- P4 (verdicts): ABELIAN exactly at n in {2, 8}; NOT at every other item.
- P5 (degree): deg = h(-4n) w3(n) for n odd, h(-4n) w3(n)/2 for n even, with w3 = |(O/3O)^*| = 6 (3 | n), 4 (n = 2 mod 3), 8 (n = 1 mod 3).

## Controls and nulls
- C1 positive control (odd-level law, Theorem G / C4): B_1^{(7)}(i sqrt 7) at level 28: ABELIAN, degree 3, group Z/3.
- C2 negative control (Theorem G (B), RESULT-G1 P6): B_1^{(7)}(i sqrt 3) at level 28: NOT, degree 18 (S-A: h (l-1)^2/2, -3 a square mod 7).
- C3 instrument consistency: Ht at m = 7 run with level 16 (Ht is also in F_16): same degree and verdict as at level 8.
- N1 content null (wrong level): Ht at m = 15 and m = 7 with the pipeline told level 4: the value set is not Galois-stable, so NO rational
  polynomial (rounding < 30 digits at 300 digits). The null FAILS AS A NULL if a rational polynomial is found.
- N2 alternative hypotheses must each fail on the data: H_Grube "GG abelian iff m in {4, 12, 28, 60}" (Grube's 4||n list read literally);
  H_idon "abelian iff m idoneal" (both blocks); H_9n "CF abelian iff 9n idoneal" (= {2, 5, 8} in range). Near-miss items for H_Grube:
  m = 12, 28, 60 (idoneal, even: predicted NOT by the torus at 2).

## Which items are new content
- GG: m in {6, 8, 9, ..., 40, 60} (35 items) are new; m = 2, 3, 4, 5, 7 were seen in the unsealed exploration (verdicts only) and
  m = 3 in the smoke test - they are not new for P1. P2 (degrees) is new at every GG item (no degree was computed before).
- CF: n = 61..100 (40 items) are new; n = 2..60 replicate RESULT-V1 F2 (verdicts and the degree pattern were observed there) with the fixed
  clustering instrument; n = 2, 5 were in the smoke test.
- Controls C1-C3 test the instrument, not the conjectures.
Smoke test before sealing (smoke_u1_out.txt): only C1 and previously seen items (GG m = 3; CF n = 2, 5); all as expected.

## Scoring
Each P item scored HOLDS or FAILED (with the list of misses). Cap: 2 h wall time; if hit, unrun items are NOT RUN, not misses.
Run: gp -q -s 2G run_u1.gp > run_u1_out.txt 2>&1, one process, one core.
