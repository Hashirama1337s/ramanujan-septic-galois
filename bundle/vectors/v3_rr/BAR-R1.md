# BAR-R1 — Rogers-Ramanujan values R(i sqrt n): abelian over Q only at n = 1 (vector 3)
Sealed 2026-10-28 before any computation of this vector. (Name clash note: this is vectors/v3_rr/BAR-R1, not the
2026-10-27 deg11/BAR-R1 of the degree-11 probe.) An earlier seat on this vector was stopped before it wrote any file
(folder vectors/v3_rr did not exist at restart, 06:37 ADT). Background read: veins/v1_law/RESULT-V1.md (n <= 60 table,
law L2/L3, L5), vectors/v1_wall/RESULT-W1.md (torus mechanism), KSY25 text (veins/v1_law/src/ksy25.txt).

## Normalisation (exactly RESULT-V1 / law.gp `RR`)
R(tau) = q^{1/5} prod_{k>=0} (1-q^{5k+1})(1-q^{5k+4}) / ((1-q^{5k+2})(1-q^{5k+3})),  q = e^{2 pi i tau}  (KSY25 (12), Rogers).
z_n := R(i sqrt n) = the classical continued fraction R(q) at q = e^{-2 pi sqrt n}. O = Z[sqrt -n] (discriminant D = -4n),
K = Q(sqrt -n), tau_O = i sqrt n, N = 5. "Abelian" = Q(z_n)/Q is Galois with abelian group.

## Claim to be proved on the page (route fixed before running)
Theorem R. For every integer n >= 1: Q(z_n) is abelian over Q iff n = 1. Moreover for n >= 2, K(z_n) = K_{O,5} (ray class
field of O mod 5) and deg z_n = h(-4n) * e(n), e(n) = |(O/5O)^*|/2 = 8 if n = 1, 4 mod 5; 10 if 5 | n; 12 if n = 2, 3 mod 5.
Route: KSY25 Prop 5.1 (Stevenhagen: W_{O,5}/T_{O,5} = Gal(K_{O,5}/H_O), gamma acts by f(tau_O) -> f^gamma(tau_O)) + KSY25 §4
(GL2(Z/N) action on F_N) + Lemma 7.3 (K_{O,N}/Q Galois, complex conjugation c). Then c sigma_gamma c = sigma_{eps gamma eps},
eps = diag(1,-1), so the commutator [c, sigma_gamma] = sigma_delta with delta <-> nubar/nu (norm one). For nu = x + tau_O,
x in {1, 2}, 5 not dividing x^2 + n: delta != +-1 mod 5 and R(delta~ tau_O) != R(tau_O) because R is a Hauptmodul for Gamma(5)
(Duke) and Stab_SL2(Z)(i sqrt n) = {+-1} for n >= 2. At n = 1 the norm-one torus mod 5 is {+-1, +-i} = O^*: obstruction vanishes.
(This needs no generation theorem; generation is used only for the degree formula.)

## Range
S = {1, ..., 200} union {idoneal n in (200, 1848]} = 200 + 19 = 219 values
(idoneal > 200: 210, 232, 240, 253, 273, 280, 312, 330, 345, 357, 385, 408, 462, 520, 760, 840, 1320, 1365, 1848).
n <= 60 repeats RESULT-V1 (re-run here with the same engine; not new evidence for the range, kept as a reproduction check).

## Method (per n >= 2)
K-conjugates by KSY25 Thm 6.2/7.5 + Rem 7.6 using veins/v1_law/law.gp (unchanged; copied hash recorded at run time),
runner rr.gp (new). Distinct values -> integer polynomial P (bestappr), P(z) at 2W with z recomputed directly, irreducibility,
polsturm. NOT ABELIAN = a prime with unequal factor degrees of P (rigorous non-Galois certificate given P). ABELIAN = galoisinit +
galoisisabelian. Witness: nu = x + sqrt -n (x = 1, or 2 if 5 | 1 + n); delta = matrix of nubar/nu mod 5 on basis (tau_O, 1);
delta~ in SL2(Z) a lift; w = R(delta~ tau_O) evaluated directly by the q-series at extra precision, and at a second lift.
h(-4n) = number of reduced forms of discriminant -4n; a2(n) = number of ambiguous reduced forms (b = 0, b = a or a = c) = |Cl(O)[2]|.
n = 1: algdep at 800 digits, check at 1600.

## Predictions (scored HOLDS / FAILED as written; nothing re-scored)
P1 (law): ABELIAN at n = 1 only; NOT ABELIAN with a non-Galois prime certificate at all 218 n >= 2 in S.
P2 (degree): deg P = |C_5(O)| (enumerated classes) = h(-4n) e(n), and all |C_5(O)| values distinct (multiplicity 1), at all 218 n >= 2.
P3 (real roots): polsturm(P) = r(n) a2(n), r(n) = 4 if 5 does not divide n, 2 if 5 | n, at all 218 n >= 2
   (formula from RESULT-V1 POST HOC, n <= 60; the extended range is the test).
P4 (proof step, direct): for all 218 n >= 2: |w - z_n| > 10^{-30} |z_n| (the commutator moves z_n); w agrees with one of the
   computed K-conjugates of z_n to >= W/3 digits; the two lifts agree to >= W/3 digits.
P5 (positive control n = 1): z_1 = sqrt((5 + sqrt5)/2) - (1 + sqrt5)/2 to >= 1000 digits; algdep gives x^4 + 2x^3 - 6x^2 - 2x + 1,
   galoisisabelian with group Z/4; witness at n = 1 (nu = 1 + i): delta = +-S mod 5 and w = z_1 to working precision (point fixed).
P6 (machinery controls): n = 13 polynomial equals KSY25 Example 8.1 exactly; every rounding error >= 50 digits; every |P(z)| at 2W
   (normalised as in law.gp/run.gp) <= 10^{-100}.
Nulls: N1 the witness detector on a level-1 function: |j(delta~ tau_O) - j(tau_O)| / |j(tau_O)| < 10^{-W/2} at n = 2, 3, 13, 59, 200
   (detector must say "not moved"); N2 x^3 - 4x - 1 (totally real S3) -> NOT ABELIAN; N3 z_13 perturbed by 10^{-40} z_13 ->
   P(z') at 2W must fail the 100-digit bar.

## Resource rules
WSL PARI/GP, gp -s 2G, one gp process at a time, own PIDs only (a 9-core run is on this PC). Each block < 20 min wall; n values
that do not finish are reported NOT RUN. Floating point, not interval arithmetic (stated as such in the result).
