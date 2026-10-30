# BAR-M1 (sealed before any certified run at the test primes 11, 23, 37, 59)

## In plain words
The fast method (veins/v4_fast/fastmin.gp) builds G_p, the minimal polynomial of b_1, by computing every algebraic twin of b_1
from theta series and rounding the product to whole numbers. Until now the rounding was trusted floating point. This test redoes it
with ball arithmetic: every number carries a guaranteed error radius, and the theta series tails are bounded on paper (Lemma T
of RESULT-M1.md) and added to the radius. A coefficient counts as certified only if its ball contains exactly one integer.
The question: do the certified polynomials agree, digit for digit, with the floating-point ones already on disk?

## Instrument
- `certmin.py`, sha256 5040fe852114204af18f6b0e12f2988f9b565a4c8fc66c15c71da9810c05fe25 (python-flint 0.9.0, Arb balls).
- Engine: Windows Python 3.11 (`py -3.11 -I`), user-site path appended inside the script.
- Command: `py -3.11 -I certmin.py 11 23 37 59 --ctrl` (one run; output `certmin_out_11_23_37_59_ctrl.txt`).
- Development and timing were done ONLY at p = 5, 7, 29 (not scored; logs certmin_out_7_5_ctrl.txt, certmin_out_7_29_ctrl.txt,
  certmin_out_5_7_ctrl.txt). No test prime was run by certmin.py before this seal.

## Predictions (each p in {11, 23, 37, 59})
- **M1 (certified rounding).** At the working precision W the script chooses (or after its automatic 1.5x retries), every
  coefficient of prod(x - v) has a real ball of radius < 1/2 containing exactly one integer, and an imaginary ball containing 0.
- **M2 (identity).** The certified integer polynomial is identical, coefficient for coefficient, to the floating-point polynomial
  on disk: vectors/v4_factor/minpoly_p11.gp, minpoly_p23.gp, minpoly_p37.gp, veins/v4_fast/minpoly_p59.gp (and, at 23, also
  veins/v23/G_p23.gp).
- **M3 (distinct conjugates).** The d = h(-4p)(p-1)/2 value balls are pairwise disjoint (so chi_p = G_p and Q(b_1) = F_p at p,
  by Theorem M); exact checks: monic, degree d, irreducible (flint factor), constant term +-2^e with the C3 exponent.
- **M4 (instrument control).** The script's own theta series (Lemma T tails) overlap Arb's built-in acb_modular_theta at every
  evaluation point, at the pass-1 precision.
- **M5 (negative control).** The wrong reading of the twist (convention 2, x a') is certified NON-integral: at least one
  coefficient ball contains no integer or has an imaginary ball excluding 0. (Not applicable where conv 2 = conv 1 translations.)
- **M6 (time).** Each prime finishes in under 10 minutes wall clock; predicted total for all four under 2 minutes, p = 59 the
  longest (predicted 2 to 60 s).

## Scoring
- HOLDS: M1-M5 hold at all four primes. M6 is reported but a time overrun alone is scored "SLOW", not a failure of the method.
- FAILED: any M1, M2, M3 or M5 failure at any test prime, logged as FAILED with the prime. An M4 failure voids the run (instrument).
- No goalpost moves: if W retries exhaust the script's cap, that prime is "NOT CERTIFIED" and the bar FAILS there.
