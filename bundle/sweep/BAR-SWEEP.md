# BAR-SWEEP — analogues of lost-notebook Entry 1.1 at p = 17, 19, 23, 29, 31, 37. Sealed 2026-10-27 before any table run.

## In plain words
Degrees 11 and 13 worked. We predict, before computing, exactly which number system ("field") the pieces of each
higher prime live in, then test it with the same controls as before. A prediction that fails is a result too.

## Known before sealing (probe_P.txt, descriptive)
P_p = product of the (p-1)/2 pieces at q = e^{-pi/sqrt p} is algebraic of degree 4, 3, 3, 6, 3, 2 for p = 17, 19, 23,
29, 31, 37 (= class number h(-4p) in each case).

## Field-rule prediction (the thing being tested)
- p = 3 mod 4 (19, 23, 31): each b_k = u_k^p lies in Q(P_p)(cos 2pi/p). Basis: P^i cos(2 pi j/p), i < 3, j < (p-1)/2
  (sizes 27, 33, 45).
- p = 1 mod 4 (17, 29, 37): each b_k lies in Q(P_p)(cos 2pi/(4p)), where Q(P_p) contains Q(sqrt p). Basis:
  P^i cos(2 pi j/(4p)), i < deg(P_p)/2, j < phi(4p)/2 (sizes 32, 84, 36).

## Bar per prime (scored separately)
- S1: every b_k has an integer relation with the basis, found at working precision W and holding to >= 0.9 W digits at a
  higher precision. No relation, or a relation with zero coefficient on b_k, counts as FAILED for that k.
- S2: phi(e^{-p pi sqrt p}) = p^{-3/4} phi(e^{-pi sqrt p})(1 + sum b_k^{1/p}) rebuilt from the table alone holds to >= 0.9 W.
- S3: changing any single table integer by +-1 drops S2 below 50 digits (a random sample of 40 changes per prime is
  acceptable if the table is large).
- Negative control: b_1 against the basis with cos(2 pi j/N) replaced by the wrong conductor (N = p for p = 1 mod 4,
  N = 4p for p = 3 mod 4) gives no relation at the same bounds.
- Positive control: the same code reproduces the p = 11 and p = 13 tables already confirmed by two seats.
## Prior
~75% per prime that S1-S3 hold; lowest for p = 29 (largest basis; may exceed the time budget, which counts as NOT REACHED,
not FAILED).
## Compute budget
Each prime: a timing probe on b_1 first; skip (NOT REACHED) any prime projected beyond ~6 hours on this PC.
