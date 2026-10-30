# AMENDMENT-SWEEP2-4 (sealed before any fast-method data on 59, 71, 83, 89, 97)

## In plain words
C1 and C2 are now proved for every prime p >= 5 (proof/proof-C1-C3-v4.md; referee-accepted). So the remaining sweep primes no longer
test those rules; they only produce explicit formulas. The lattice search (LLL) is replaced for the remaining primes by the fast
method (veins/v4_fast/fastmin.gp): compute all Q-conjugates of b_1 analytically (principal form + KSY25 Prop 4.1 at N = 4p for the
other reduced forms), multiply out, round to an integer polynomial. Validated at p = 13 and 73 (veins/v4_fast/probe_out.txt): 73 in
4 min vs 85 min by LLL, all checks pass. Completed LLL verdicts (11-73, and 79 when it finishes) stand unchanged.

## Deliverable per prime
The minimal polynomial G_p(x) in Z[x] of b_1 over Q (b_1 = the real root nearest the analytic value), saved as minpoly_p<p>.gp.

## Bar per prime (all must hold; any failure = FAILED for that prime)
F1. Coefficients round to Z with error < 10^-300.
F2. G_p monic, irreducible, degree h(-4p)(p-1)/2.
F3. Constant term = +-2^e with e = 0 (p = 7 mod 8), p h (p-1)/6 (p = 3 mod 8), p h (p-1)/4 (p = 1 mod 4) (C3, proved).
F4. Negative control: the wrong twist convention (conv 2) gives rounding error > 10^-10 (not integral).
Precision: W = 1.3 x (log10 of the coefficient bound from 80-digit conjugates) + 300.
Order: 59, 71, 83, 89, 97 (then optional 101..199 as tables only).
Positive control: 79 by both methods once the LLL run finishes (the LLL b_1 must be a root of G_79 to >= 0.9 W digits).
