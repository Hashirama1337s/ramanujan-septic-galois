# BAR-SWEEP2 — field rule at all primes 41..97. Sealed 2026-10-27 before any table run at these primes.

## Known before sealing (probe2.txt)
deg P_p = h(-4p) for p = 41..97 except 89 (degree not found at 1,500 digits; h(-356) = 12).

## General field rule (extends BAR-SWEEP, which used i < 3 because deg P = 3 there)
- p = 3 mod 4: b_k = u_k^p in Q(P)(cos 2pi/p); basis P^i cos(2 pi j/p), i < deg P, j < (p-1)/2.
- p = 1 mod 4: b_k in Q(P)(cos 2pi/(4p)); basis P^i cos(2 pi j/(4p)), i < deg P / 2, j < phi(4p)/2.
## Predictions
- R0: deg P_89 = 12 = h(-356) once precision is raised (3,000+ digits).
- R1-R3 per prime: exactly S1, S2, S3 and the negative control of BAR-SWEEP (0.9 W thresholds; NC 'no genuine
  relation' = none, or one holding < 0.9 W).
- Working precision W per prime starts at max(3000, 45 * basis size) and is doubled once on an S1 failure (logged);
  a relation that appears only after doubling still has to meet 0.9 W at the new W.
## Budget
Up to 3 primes at once; each prime capped at 4 hours wall time; beyond that = NOT REACHED (not FAILED).
## Prior
R0 ~85%. Field rule holds where reached ~85% per prime.
