# BAR-R13 — thirteenth-degree analogue of lost-notebook Entry 1.1 (full table). Sealed 2026-10-27 before the full run.

## In plain words
The where-else pass saw (one implementation, 1,100 digits) that at p = 13 each of the six pieces to the 13th power lies
in the real cyclotomic field Q(cos 2pi/52). We now build the full table in a fixed basis, check it to higher precision,
rebuild phi(e^{-13 pi sqrt 13}) from the table alone, and then hand a blind seat only a written spec.

## Method (fixed)
u_k = 2 q^{k^2/13} f(q^{13+2k}, q^{13-2k}) / phi(q^13), k = 1..6, q = e^{-pi/sqrt 13} (same code as deg11/r1.py `us`).
b_k = u_k^13. Basis: B_j = cos(2 pi j/52), j = 0..11 (12 numbers, a basis of Q(cos 2pi/52) via Chebyshev polynomials).
mpmath pslq on [b_k, B_0..B_11] at 1,500 digits, maxcoeff 1e15, maxsteps 1e6; verify at 2,000 digits.

## Predictions / bar
- T1: for every k, an integer relation d*b_k = sum n_j B_j exists with |coeff| <= 1e15, found at 1,500 digits and holding
  to >= 1,900 digits at 2,000. FAILED otherwise.
- T2: the six elementary symmetric functions of b_1..b_6 each lie in Q(sqrt 13) (PSLQ on [e_j, 1, sqrt13], coeff <= 1e40,
  holding >= 1,900 digits).
- T3: phi(e^{-13 pi sqrt 13}) = 13^{-3/4} phi(e^{-pi sqrt 13}) (1 + sum b_k^{1/13}) rebuilt from the T1 table holds to
  >= 1,800 digits; changing any single table integer by +-1 breaks it to < 50 digits (all entries tested).
- Negative controls: (a) b_1 against the wrong field Q(cos 2pi/13) (6 numbers) finds no relation with coeff <= 1e15;
  (b) b_1 + 1e-300 finds no relation with coeff <= 1e15.
- Positive control: the same pipeline on p = 7 with basis cos(2 pi j/7), j = 0..2, recovers Rebak's u_k^7 field.
- Prior: T1-T3 HOLD ~85% (the where-else run already saw relations at 1,100 digits).
