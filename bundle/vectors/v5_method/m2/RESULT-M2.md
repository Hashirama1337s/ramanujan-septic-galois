# RESULT-M2: G_p certified at p = 47, 61, 67 (closes editor gap G63)
Test seat, 2026-10-29. Sealed bar: BAR-M2.md (sha256 7372a46a..., logged in deg11/LOG.md 23:49 before the run; SEALS-M2.txt).
Internal; not for release.

## In plain words
RESULT-M1-v2 had certified the minimal polynomial G_p of b_1 at every prime from 5 to 97 except 47, 61 and 67. Those three were
simply never computed. This run used the same certified pipeline (certmin.py v1.2, unchanged, same hash) on them. At all three
primes every coefficient ball held exactly one integer, and all the twins of b_1 were provably different. By Theorem M, the
certified polynomial is G_p and b_1 alone generates the field F_p (Q(b_1) = F_p). The degrees came out as predicted from
PARI's class numbers before the run. The positive control (p = 53) reproduced the stored certified polynomial byte for byte.
The wrong reading of the Galois formula was provably non-integral at every prime. The whole run took 19.7 s.
So the statement "certified at every prime 5 <= p <= 97" is now true as written.
Ceiling: housekeeping and rigour. It closes a gap in a claim; it is not a new discovery.

## Verdict (score_m2.py, logs/score_out.txt): BAR-M2 OVERALL HOLDS
| p | h(-4p) predicted / found | degree predicted / found | P1 rounding | P2 distinct (pairs) | irreducible | P3b constant term | null (conv 2) | W bits | max coeff digits | wall |
|---|---|---|---|---|---|---|---|---|---|---|
| 47 | 5 / 5 | 115 / 115 | HOLDS (max radius 3.8e-17) | HOLDS (0 of 6555 overlap) | yes | -2^0 = -1, C3 MATCH | non-integral (115/115 coeffs) | 2749 | 804 | 0.5 s |
| 61 | 6 / 6 | 180 / 180 | HOLDS (5.0e-17) | HOLDS (0 of 16110) | yes | -2^5490, C3 MATCH | non-integral (180/180; imag 180) | 10267 | 3066 | 10.2 s |
| 67 | 3 / 3 | 99 / 99 | HOLDS (3.0e-16) | HOLDS (0 of 4851) | yes | -2^2211, C3 MATCH | non-integral (99/99) | 7557 | 2251 | 3.5 s |
| 53 (positive control) | 6 | 156 | HOLDS | HOLDS (0 of 12090) | yes | -2^4134, MATCH | non-integral (156/156) | 7968 | 2375 | 5.4 s |

- Positive control p = 53: identical to the floating-point polynomial on disk (vectors/v4_factor/minpoly_p53.gp) and m2/certG_p53.txt
  is byte-identical to the stored v5_method/certG_p53.txt (both sha256 6795fd3f1db87ac0648ae805cda07c21e93814e17a1535f5685322f071a897f5).
- Instrument: Arb acb_modular_theta cross-check overlapped at every evaluation point at all four primes (115, 180, 99, 156 points).
- All three test primes were first-ever runs: no floating-point G_p exists on disk at 47, 61, 67, so there is no disk comparison
  (P2 of BAR-M1 does not apply); the certificate itself is the evidence.
- No retries were needed (first W certified at every prime). No amendment was filed; no script changed.
- Time: predicted under 2 min per prime and under 6 min total; actual 19.7 s total (p = 89 in M1b took 584 s).

## Certified polynomials (coefficients of x^0 .. x^d, constant term first; one integer per line after a header line)
| file | sha256 (whole file) | sha256(str(coefficient list))[:16] (script line) |
|---|---|---|
| m2/certG_p47.txt | 453e73bd7deec0a6b6a821f913fef70bd063af1df215f586dfc41bdc4827b2ea | a430a17466e8e694 |
| m2/certG_p61.txt | c91267695fd1cd13f87afff56761d937288a0f3fe36dc0059e50a7fea86bf668 | ea39d74f67fa109c |
| m2/certG_p67.txt | 6307c5dbce4f953aaa419bd669d662958add3a616d5badb4bf0f3f0ea150a9d0 | 1adce1837d854c6f |
| m2/certG_p53.txt (control) | 6795fd3f1db87ac0648ae805cda07c21e93814e17a1535f5685322f071a897f5 | 8fca08ac7f36445f |

Run log: certmin_out_53_47_61_67_ctrl.txt sha256 7f47ec796c8ad70d5e4700be58d38462ab3840389e30c4e47fd50d959b6fbb8b
(identical to logs/run_console.txt minus its two header lines; console sha256 b6d4ddcd...). Score: logs/score_out.txt sha256 d3467581....

## How it was run (instrument facts, verified by output)
- certmin.py v1.2 sha256 3473634e... checked by run_m2.py before import (printed "sealed v1.2 match"); imported in place, unchanged.
  run_m2.py re-pointed only certmin.HERE (outputs to m2/) and the DISK paths (made absolute); sys.dont_write_bytecode set, so
  nothing in v5_method/ was written (its certG file count is still 20).
- python-flint 0.9.0, flint ctx.threads = 1 (printed), Python 3.11.9, one process.
- Degree predictions: degree_predict.gp, PARI 2.17.3 in WSL, nbthreads = 1 printed, logs/degree_predict_out.txt (run before seal).

## What this licenses / does not
- Licenses: C10 / RESULT-M1-v2 "G_p certified and Q(b_1) = F_p at every prime 5 <= p <= 97" (now 23 primes, no exceptions),
  resting on Theorem M (refereed ACCEPTED WITH FIXES in M1) plus Arb ball arithmetic.
- Does not: re-referee Theorem M or the v4/v5.1 inputs; no independent second implementation was run at 47, 61, 67 (the
  certificate stands on the ball arithmetic). CONJECTURES.md and the paper text are the lead's to update.
