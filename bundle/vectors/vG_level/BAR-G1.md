# BAR-G1 — the frozen-level Galois law at every odd level l (sealed before any non-control value is computed)
Vector G, 2026-10-28. Written after reading CONJECTURES.md (C4-C7), veins/v23/C5-proof-v3.md, vectors/v1_wall/RESULT-W1.md (v5),
vectors/v3_rr/RESULT-R1.md, veins/v1_law/RESULT-V1.md, and machinery checks on CONTROLS ONLY (presel.gp / presel_out.txt:
l = 3 at m = 7, 15; l = 5 at m = 15, 21, 1365 — all already in RESULT-W1 — plus the Weber product identity and the null
conventions). Predictions were printed by predict.gp (predict_out.txt), which computes class groups and residues only, no theta values.

## In plain words
Ramanujan-type pieces with a fixed "level" l, evaluated at the special point i sqrt m, sit in a number field whose symmetries are a
commutative group plus a mirror. They are "abelian" (cyclotomic-type) exactly when the mirror commutes with every symmetry. Two
groups can spoil that: the class group of m (it must be all order-2: m idoneal) and a small group of units mod l, the norm-one torus.
The torus is harmless only when l is a prime power dividing m, or in one tiny accident (l = 3, m = 2 mod 3, where the torus is just +-1).
For l = 7, 11, 13 this predicts abelian values only at idoneal multiples of l. We seal that, plus a degree formula and an exact count of
real conjugates, and let the numbers decide.

## Setting
- th[a,b](tau) = sum_j exp(pi i tau (j+a)^2 + 2 pi i (j+a) b); for odd l >= 3 and 1 <= k <= (l-1)/2:
  B_k(tau) := (2 th[k/l,0](tau)/th[0,0](tau))^l. With q = e^{pi i tau'} and tau = l tau', B_k = u_k^l for the piece
  u_k = 2 q^{k^2/l} f(q^{l+2k}, q^{l-2k})/phi(q^l) (C5 Lemma 1 with n -> l; RESULT-W1 §1). Level 4l, rational q-coefficients.
- m odd >= 3, O = Z[sqrt -m], D = -4m, K = Q(sqrt -m), h = h(D), Cl2 = |Cl(O)[2]|, tau_O = i sqrt m, z = B_1(tau_O).
- E := Q(B_1(tau_O), ..., B_{(l-1)/2}(tau_O)) (the field of all pieces). Every B_k(tau_O) with gcd(k, l) = 1 is a K-conjugate of z
  (rational ideal action, C5 Lemma P step 5, valid for any m), so for prime l: E = Q(z) (z real, K(z)/K abelian). We test Q(z).
- C5 is the diagonal l = m (q = e^{-pi/sqrt n} means l tau' = i sqrt n); C6 is l in {3, 5}.

## Derivation of the prediction (written before computing; proof to follow in RESULT-G1)
G = Gal(K_{O,4l}/K) = C_{4l}(O) (KSY25 Prop 3.1), c = complex conjugation, psi(sigma_[a]) = sigma_[abar/a] (RESULT-V1 L1).
(L2) Q(z) abelian iff psi(G) fixes z. (L3) for real z: iff every K-conjugate of z is real.
1. Principal classes: for mu prime to 4l, rho([mu^{-1} O]) sends B_k(tau_O) to B_k(M tau_O) where the top row of M is
   (1, 0) g_x mod l, x = mu^{-1} = t + s sqrt -m, g_x = [t, -m s; s, t] (RESULT-W1 §6 Step 1, l-generic). So the torus
   T = (O/lO)^*/{+-1} acts on the characteristic row (1, 0) by the regular representation; its stabiliser is
   Stab = {x : (t, -m s) = +-(1, 0) mod l}.
2. psi on principal classes is x -> xbar/x, whose image is the norm-one group N1 = {x : N(x) = 1 mod l} (prime l, l not | m; Hilbert 90 in
   F_{l^2} or F_l x F_l), resp. {1 + u sqrt -m} if l | m.
3. psi on a class [a] with [a]^2 = 1: a^2 = lambda O, psi = the principal class of eps(a) = N(a)/lambda, an element of N1.
4. Hence (assuming the generic stabiliser — no accidental coincidence of values, and H_O inside K(z)):
   Q(z) abelian iff (i) Cl = Cl[2] (m idoneal), (ii) N1-image inside Stab, (iii) eps(Cl[2]) inside Stab.
   - l | m (l = p^e a prime power): x = t + s e, e^2 = -m = 0 mod l, Stab = {t = +-1}, psi-image has t = 1, and N(eps) = t^2 = 1 forces
     t = +-1 (p odd): (ii), (iii) hold. If l | m has two distinct primes, eps on an ambiguous class is a non-constant sign vector (C5 §7): fails.
   - l not | m, prime l: Stab = {+-1}; |N1| = l - (-m/l) must be <= 2: only l = 3 with -m a square mod 3 (m = 2 mod 3).
   - l not | m composite, or p^e || l with p^e not | m: some local torus is larger than +-1, or its sign disagrees with other components: fails.
**Theorem G (prediction).** For odd l >= 3 and odd m >= 3: Q(B_1^{(l)}(i sqrt m)) is abelian over Q iff m is idoneal and
(l is a prime power dividing m, or l = 3 and m = 2 mod 3).
- Degree (generic stabiliser): [Q(z):Q] = h * |orbit of (1,0) under T, mod +-| (= h (l-1)/2 if l | m prime; h (l-1)^2/2 if -m is a square
  mod l; h (l^2-1)/2 otherwise) — preddeg in gl.gp.
- Real conjugates (prime l): Cl2 (l-1)/2 if l | m, Cl2 (l-1) otherwise (count of sigma with psi(sigma) in the stabiliser: for l not | m the
  coset {x : xbar/x = +-eps^{-1}} has 2(l-1) elements of (O/l)^*, i.e. l-1 mod +-1, for every class in Cl[2]).

## Sealed items (lists.gp; predictions in predict_out.txt)
- Positive controls (must reproduce RESULT-W1 exactly): l = 3 at m in {3, 5, 7, 9, 13, 15, 21, 25, 45, 85} (abelian at 3, 5, 9, 15, 21, 45);
  l = 5 at {3, 5, 7, 15, 21, 25, 45, 85} (abelian at 5, 15, 25, 45, 85).
- MAIN (prime levels): l = 7: odd m in [3, 99] + {105, 119, 133, 147, 165, 177, 245, 253, 273, 343, 345, 357, 385, 1365} (63 items);
  predicted ABELIAN exactly at **7, 21, 105, 133, 273, 357, 385, 1365**.
  l = 11: odd m in [3, 61] + {77, 85, 93, 99, 105, 121, 133, 143, 165, 177, 187, 253, 273, 345, 357, 385, 1365} (47); ABELIAN exactly at **33, 165, 253, 385**.
  l = 13: odd m in [3, 61] + {65, 85, 91, 93, 105, 117, 133, 143, 165, 169, 177, 253, 273, 345, 357, 385, 1365} (47); ABELIAN exactly at **13, 273, 1365**.
- COMP (any odd l): l = 9: odd m in [3, 49] + {57, 63, 81, 85, 93, 99, 105, 117, 133, 165, 177, 225, 253, 273, 345, 357, 385, 1365} (42);
  ABELIAN exactly at **9, 45**. l = 15: odd m in [3, 45] + {57, 75, 85, 93, 105, 165, 195, 345, 1365} (31): **none**.
  l = 21 at {3, 7, 15, 21, 63, 105, 273}: **none**. l = 25 at {5, 15, 25, 45, 75, 125}: **25 only**.
- Alternative hypotheses, each predicted to FAIL somewhere on the main block (columns H_C5, H_idon, H_split in predict_out.txt):
  H_C5 (m idoneal prime power, level ignored), H_idon (m idoneal), H_split (m idoneal and l | m or -m a nonzero square mod l).

## Method (gl.gp, run_g1.gp)
K-conjugates by KSY25 Prop 4.1 (law.gp cmpoints, conv = 1: x = -a'b/2 mod 4l). Numerical layer (60 digits) for every item: distinct
values = degree, number of real values, verdict by L3. Exact layer when degree <= 150 or the item is predicted abelian: integer polynomial
from the conjugates (rounding error printed; integrality is the self-check), irreducible, P(z) ~ 0 at 2W with z recomputed directly, Sturm
real-root count, abelian test (nongalois witness mod a prime, else galoisinit + galoisisabelian); an inconsistency between the two layers is flagged.
No GRH anywhere (no bnfinit). Floating point, no interval arithmetic.

## Pass / fail bar
- P1 (Theorem G): verdict matches the prediction at every MAIN item. One miss = FAILED (reported as such, no retuning).
- P2 composite levels: verdict matches at every COMP item.
- P3 degree formula at every item; P4 real-count formula at every prime-level item.
- P5 positive controls reproduce RESULT-W1 (verdicts, and degree/real counts as in its tables).
- P6 alternatives H_C5, H_idon, H_split each FAIL on at least one MAIN item (scored from the same run).
- NULL: the wrong Prop 4.1 conventions (conv 2: x = +a'b/2; conv 3: x = -ab/2) must fail to round at (l, m) = (7, 21), (11, 15), (13, 13).
  Pre-seal note (presel_out.txt): at l = 3, m = 21 both wrong conventions DID round (non-discriminating at l = 3); at l = 5 they failed.
  So the nulls are placed at l >= 7 only; this choice was made from control data, before any l >= 7 value was computed.
- Proof-side checks (not predictions; may be run after sealing): Lemma K (combinatorial) and Lemma T (separation) numerics.
