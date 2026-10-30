# RCFT one-hour test — result (2026-10-27), BAR-RCFT sealed e80552a0...

## In plain words
Our symmetry rule for Ramanujan's pieces is exactly the Galois symmetry physicists use for the matching (abelian)
conformal field theory, and the same mechanism works for a genuinely non-abelian theory, SU(2) at level 3: at a special
point its character ratios are algebraic numbers whose Galois conjugates are again character ratios. Ramanujan's degree-7
terms can be written as monomials in SU(2)_5 quantum dimensions, but that last one is forced by unit theory.

## Scores
- R1 HOLDS: 141/141 recorded Galois images (p = 29..67, galois_p*.txt MAP lines) obey k^2 = +-a (mod p), the T-eigenvalue
  rule e^{pi i k^2/p} -> e^{pi i a k^2/p} (Coste-Gannon / Harvey-Hu-Wu eq.(33) shape) for U(1)-type modular data.
- R2 HOLDS (r2_out.txt): SU(2)_3, tau0 = i. r_1 = chi_1/chi_0 is algebraic of degree 16 with palindromic minimal polynomial
  199x^16 + 1312x^15 - 936x^14 - 4512x^13 + 644x^12 + 1056x^11 + 12136x^10 + 2144x^9 - 24342x^8 + ... + 199 (2,000 digits).
  Three of its conjugates are character ratios at the same point: -chi_2/chi_3, -chi_3/chi_2, chi_0/chi_1 (2,000+ digits),
  i.e. the Galois permutation j -> 3 - j with a sign. Negative control (tau = 1.2345 i): no relation of degree <= 16.
  The other 12 conjugates were not identified (expected to be values at transformed points).
- R3 HOLDS, as predicted (tautology): with SU(2)_5 quantum dimensions d1 = sin(2pi/7)/sin(pi/7), d2 = sin(3pi/7)/sin(pi/7),
  Ramanujan's septic pieces satisfy u_1^7 = d2^6/d1^2, u_2^7 = d1^6/d2^4, u_3^7 = 1/(d1^4 d2^2) (200 digits). Pretty
  rewrite of Rebak's terms; forced because these are units of Q(cos 2pi/7) (class number 1).
## Incidents
First R2 run void: tau passed as a float literal at the default 38-digit precision (spurious degree-1 relation with
denominator 2^128). Fixed and rerun; logged.
## Honest size
R1 identifies our rule with known RCFT Galois symmetry (explanation, likely folklore once stated). R2 is a clean explicit
example of the same mechanism for a non-abelian theory at a CM point; no paper evaluating RCFT characters at CM points was
found by the panel (search floor), but experts may regard it as a consequence of Shimura reciprocity + Coste-Gannon.
Ceiling: a remark/section in a note, and a bridge worth one more test (another theory, another CM point).
