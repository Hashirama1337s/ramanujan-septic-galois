# BAR-M2 (sealed before any certified run at p = 47, 61, 67)

## In plain words
RESULT-M1-v2 certified the minimal polynomial G_p of b_1 at every prime 5 <= p <= 97 except 47, 61 and 67, which were never
computed (editor gap G63). This test runs the same certified pipeline (certmin.py v1.2, unchanged, same hash) at those three
primes. If every coefficient ball holds exactly one integer and all twins are provably different, Theorem M gives G_p exactly and
Q(b_1) = F_p at these primes too, closing the gap so the claim "every p <= 97" becomes true.

## Instrument (pinned by sha256 in SEALS-M2.txt)
- `../certmin.py` v1.2, sha256 3473634e84b2a9de21548a1dfdeac812b90da4185cf6a211b309f706331fd389 (unchanged; imported in place).
- `run_m2.py` (new driver): checks that hash before import, sets flint ctx.threads = 1 and prints it, re-points only
  certmin.HERE (outputs go to m2/, nothing in v5_method/ is written) and the DISK paths (made absolute, same files).
  No line of certmin.py changes; certification logic, precision rule, retries and the conv 2 control are the sealed ones.
- `score_m2.py`: verdict script, reads the run log and prints HOLDS / FAILED per item below.
- `degree_predict.gp` (PARI 2.17.3, WSL, nbthreads = 1 printed): output `logs/degree_predict_out.txt`, run BEFORE this seal.
- Engine: Windows Python 3.11, python-flint 0.9.0 (Arb), one process, one core.
- Command (one run): `py -3.11 -I run_m2.py 53 47 61 67 --ctrl` -> `certmin_out_53_47_61_67_ctrl.txt`, console in
  `logs/run_console.txt`.
- No certified or floating-point computation of G_47, G_61 or G_67 has been run by this seat before this seal.

## Predicted degrees (from PARI qfbclassno, before running)
| p | p mod 8 | h(-4p) | predicted degree d = h(p-1)/2 | C3 constant-term exponent e |
|---|---|---|---|---|
| 47 | 7 | 5 | 115 | 0 (constant term +-1) |
| 61 | 5 | 6 | 180 | 5490 |
| 67 | 3 | 3 | 99 | 2211 |
| 53 (control) | 5 | 6 | 156 (from M1b run) | as stored |

## Predictions (each p in {47, 61, 67}); all new content (no G_p at these primes exists on disk)
- **P1 (certified rounding).** At the script's W (or after its automatic 1.5x retries), every coefficient of prod(x - v) has a
  real ball of radius < 1/2 containing exactly one integer, and an imaginary ball containing 0. FAILED if the precision cap is hit
  ("NOT CERTIFIED") or any coefficient fails.
- **P2 (distinct conjugates).** All d value balls pairwise disjoint, so l = 1 and, by Theorem M, the product is G_p and
  Q(b_1) = F_p. Exact cross-checks: squarefree and irreducible over Q (flint factor). FAILED if any pair overlaps or the exact
  checks fail.
- **P3 (degree).** h(-4p) and degree exactly as in the table above; monic; degree of the certified integer polynomial = d.
  **P3b**: constant term = +-2^e with the C3 exponent in the table (exact).
- **Positive control (p = 53).** Re-certified G_53 is identical to the stored floating-point polynomial
  (vectors/v4_factor/minpoly_p53.gp) and byte-identical to the stored certified file v5_method/certG_p53.txt. FAILED otherwise.
- **Null (content).** The wrong reading of the Galois formula (conv 2, translation x a' instead of x) is certified NON-integral at
  each test prime (at least one coefficient real ball contains no integer or an imaginary ball excludes 0). If conv 2 gives the
  same translations as conv 1 at a prime, the null is N/A there (reported, not a pass). Also run at 53.
- **Instrument (Arb theta cross-check).** The script's own theta series overlap Arb's acb_modular_theta at every point; a failure
  voids the run.

## Time (descriptive, not scored)
Predicted: each test prime under 2 minutes; whole run (control included) under 6 minutes; p = 61 (degree 180) the longest.
Hard cap 60 minutes total; on the cap the run is stopped by its own PID and the unfinished primes are "NOT RUN".

## Scoring
HOLDS: P1, P2, P3, P3b and the null (or N/A) at all three primes, and the positive control. FAILED: any of those fails at any
prime (logged with the prime). Instrument failure = VOID. No goalpost moves: any script change -> new file + amendment, hashed
and logged before the data it covers.
