# RESULT-V1 — one law for "abelian over Q" at CM values of Ramanujan-type functions
Vein 1, 2026-10-27. Sealed bar: BAR-V1.md (sha256 a5f89d9c282d31c80be13f65daa9f70d92ecb9ccde375a1af2da7f27f5d92cc4, LOG.md 23:24).
Files: law.gp (engine), run.gp (runner), presel*.txt (pre-seal machinery checks), f1_out.txt, f2_out.txt, f3_out.txt,
polys_out.txt, posthoc.gp / posthoc_out.txt, src/ksy25.pdf + src/ksy25.txt (opened source). Nothing published.

## In plain words
Yes, there is one law, and it is short. All these special values sit inside one big number field whose symmetries are
"a commutative part plus one mirror" (complex conjugation). For a value that is a real number, the rule is:
**it lives in an abelian (cyclotomic-type) field exactly when all of its algebraic conjugates are real numbers too.**
The general form (for any value) is: complex conjugation must commute with the symmetries acting on that value.
This law is elementary group theory once the big field is known to have that shape, so it is NOT a new theorem in its own
right — it is a sharp, checkable test. Run on 127 values (Rogers-Ramanujan at n = 1..60, the cubic continued fraction at
n = 1..60, and seven p.206 cases) it never failed. "n is idoneal" is NOT the general law: it fails for Rogers-Ramanujan
(abelian only at n = 1), for the cubic continued fraction (abelian only at n = 2 and 8) and for the p.206 pieces at
composite n (15, 21 idoneal but not abelian; 9, 25 abelian). The idoneal rule for the p.206 pieces at primes is a special
coincidence of that family (the pieces carry j, so Weber's criterion transfers), not an instance of a universal idoneal law.
The naive rule in the brief ("the symmetry group over K must be made of order-2 moves") is false: the p.206 pieces at
7 and 13 are abelian with cyclic groups of order 3 and 12.

## 1. The criterion, with derivation

### Sources (zero invention; labels as in the lab)
- [KSY25] Koo–Shin–Yoon, "A simplified algorithmic realization of Galois actions on special values of modular functions",
  arXiv:2506.14139v1. OPENED this session (PDF saved to src/ksy25.pdf, text src/ksy25.txt). Used: §2 (C_N(O) =
  I(O,N)/P_N(O,N), Artin map C_N(O) -> Gal(K_{O,N}/K) iso, (ii) on p. 4); §3 (Q(D,N): primitive positive forms with gcd(a,N) = 1;
  C_N(D) = Q(D,N)/~Gamma_1(N); tau_Q = (-b + sqrt D)/(2a); Prop 3.1: C_N(D) iso C_N(O) iso Gal(K_{O,N}/K)); §4 (F_N; the action of
  [1,0;0,d] on Fourier coefficients; tau_O = sqrt(D)/2 for D = 0 mod 4; Prop 4.1: [Q] acts by f(tau_O) -> f^{[1, -a'(b+b_O)/2; 0, a']}(-conj tau_Q));
  Thm 6.2 (all classes = Q_i^{gamma_k}, Q_i reduced, gamma_k coset reps of +-Gamma_1(N), D != -3, -4); Lemma 7.1 (cosets <-> first
  column mod N up to sign); **Lemma 7.3: K_{O,N} is Galois over Q and Gal(K_{O,N}/Q) = Gal(K_{O,N}/K) x| <c>**; Thm 7.5 and Rem 7.6
  (if f(tau_O) is real, its irreducible polynomial over Q equals that over K and is the product over the K-conjugates);
  Example 8.1 (R at D = -52, N = 5: explicit degree-24 polynomial — our positive control).
- [Kani] Kani 2011, Thm 32 (Weber): Q(j(sqrt -n)) Galois over Q iff n idoneal; proof via complex conjugation acting on the
  class group by inversion (Cox, Lemma 9.3). OPENED in the vein-gate/v5.1 session (proof/v5/... "Prior-art correction"); not re-opened here.
- STANDARD, not opened here: (S1) for L/Q Galois containing K, tau (L/K, p) tau^{-1} = (L/K, tau p) (Frobenius transport; one-line
  proof: apply tau to sigma(x) = x^{Np} mod P); (S2) a conj(a) = N(a) O for proper O-ideals prime to the conductor (Cox §7).

### Derivation
Setting: f in F_N with rational q-coefficients; O of discriminant D = -4n (n >= 2), tau_O = i sqrt n; z = f(tau_O), finite.
G := Gal(K_{O,N}/K) (abelian, = C_N(O) by [KSY25] §2/Prop 3.1); Gamma := Gal(K_{O,N}/Q) = G x| <c> ([KSY25] Lemma 7.3).
kappa(g) := c g c^{-1}; by (S1), kappa(sigma_[a]) = sigma_[conj a].
z is real: conj f(tau) = f(-conj tau) for real coefficients, and -conj(i sqrt n) = i sqrt n.

(L3) **For real z: Q(z)/Q is abelian <=> every Q-conjugate of z is real.**
Proof. (=>) abelian => Galois; a Galois field with one real embedding is totally real. (<=) Let H = Stab_Gamma(z). "All
conjugates real" means c(gamma z) = gamma z for all gamma, i.e. gamma^{-1} c gamma in H: H contains the normal closure M of <c>.
Since c in M and Gamma = G u Gc, Gamma/M is a quotient of G, hence abelian; so the fixed field of M is abelian over Q and contains z.
(Only needs: K_{O,N}/Q Galois with an abelian subgroup of index 2 not containing c — [KSY25] Lemma 7.3.)

(L1) [Gamma, Gamma] = psi(G), psi(g) := kappa(g) g^{-1} = sigma_[conj(a)/a].
Proof. [c, g] = kappa(g) g^{-1}; commutators inside G vanish; psi is a homomorphism (G abelian) and its image is kappa-stable,
and kappa = id on G/psi(G), so Gamma/psi(G) is abelian.

(L2) **General form (z need not be real): Q(z) abelian <=> psi(G) fixes z <=> conj(sigma(z)) = sigma(conj z) for every sigma in G**
(complex conjugation commutes with the K-Galois action on the orbit of z). Proof: abelian <=> [Gamma,Gamma] in H; then L1;
the last form: c sigma z = kappa(sigma) c z, so equality for all sigma <=> psi(G) fixes c z <=> psi(G) fixes z (psi(G) is kappa-stable).

(L4) **Which subgroup must be 2-torsion.** By (S2), kappa(g) = g^{-1} nu(g), nu([a]) := [N(a) O] (the class of a rational
ideal). So kappa is inversion exactly on ker nu = {[a] : N(a) = +-1 mod N} = Gal(K_{O,N}/K(cos 2pi/N)) (sigma_[a] acts on zeta_N
by zeta_N -> zeta_N^{N(a)}). Hence, with A = Gal(K(z)/K) = G/S_z:
- abelian => the image of ker nu in A, i.e. **Gal(K^+_N(z)/K^+_N) with K^+_N = K(cos 2pi/N), is an elementary 2-group** (necessary);
- the exact condition is g^2 = nu(g) mod S_z for all g (equivalently L2); the naive "A elementary 2" is neither necessary
  (p.206 at 7, 13: A cyclic of order 3, 12) nor the right statement; it is correct when N = 1 (nu trivial): that is Weber's
  criterion (Q(j) abelian <=> Cl(O) elementary 2, [Kani] Thm 32).

(L5, derived after the run — POST HOC) **Generators of ray class fields are (almost) never abelian at tau_O.** Take
alpha = x + sqrt(-n) with N(alpha) = x^2 + n prime to N. psi(sigma_(alpha)) = sigma_((conj alpha/alpha)) is trivial in C_N(O) iff
conj(alpha) = +-alpha mod N O (O* = {+-1} for n >= 2). "+" needs N | 2 (the sqrt(-n)-coefficient of alpha - conj alpha is 2);
"-" needs N | 2x. So if N >= 3 and some x has gcd(x^2 + n, N) = 1 and N not dividing 2x, then psi != 1, and any f(tau_O) with
K(f(tau_O)) = K_{O,N} is NOT abelian over Q. For N = 5 such x always exists (x = 1 or 2), so: **if R(tau_O) generates K_{O,5}
over K, then R(e^{-2 pi sqrt n}) is not abelian for every n >= 2.** In general abelian values must lie in the fixed field of
psi(G), i.e. in K_{O,N} cap Q^ab.

## 2. Method (per value)
K-conjugates by [KSY25] Thm 6.2/7.5 + Rem 7.6 (law.gp: reduced forms x coset columns mod N, minimal representative per class,
x = -a'b/2 mod N, value f(x + (b + sqrt D)/(2a))); theta functions at low points via an exact S/T reducer (checked against direct
sums to 10^-131). Distinct values -> polynomial, coefficients rounded by bestappr (cubic CF values are not integral; denominators
are powers of 2). Checks: rounding error, P(z) = 0 with z recomputed directly at 2W, irreducibility. ABELIAN = galoisinit +
galoisisabelian on the monic rescaling; NOT ABELIAN = a prime with unequal factor degrees (rigorous non-Galois certificate).
n = 1 (D = -4, outside KSY25 Thm 7.5): algdep at 800 digits, checked at 1600.
Levels: R in F_5, Gt(z) = G(z/2) in F_6 (numerical Gamma(N)-invariance, presel_out2.txt), b_1 in F_{4n} (C1 proof for primes;
for composite n validated by the integrality + 2W check).

## 3. Tables

### F1 — Rogers-Ramanujan R(e^{-2 pi sqrt n}), N = 5 (f1_out.txt)
| n | deg over Q | = |C_5(-4n)| | real conjugates | verdict |
|---|---|---|---|---|
| 1 | 4 (x^4 + 2x^3 - 6x^2 - 2x + 1, cyclic 4) | (D = -4) | 4/4 | ABELIAN |
| 2..60 (all 59) | 8 .. 72 | yes, every n | 4, 8 or 16 | NOT ABELIAN (59/59, each with a non-Galois prime certificate) |
Idoneal n >= 2 (29 values: 2,3,4,5,6,7,8,9,10,12,13,15,16,18,21,22,24,25,28,30,33,37,40,42,45,48,57,58,60): all NOT abelian.
n = 13 reproduces KSY25 Example 8.1 exactly (degree 24). Rounding >= 141 digits, P(z) ~ 0 to >= 310 digits at 2W.

### F2 — cubic continued fraction G(e^{-pi sqrt n}), N = 6 (f2_out.txt, polys_out.txt)
| n | minimal polynomial / degree | real conj. | verdict |
|---|---|---|---|
| 1 | 2x^4 + 8x^3 + 2x - 1 (algdep) | 2/4 | NOT ABELIAN |
| 2 | 2x^2 + 4x - 1, i.e. G(e^{-pi sqrt 2}) = (sqrt 6 - 2)/2 | 2/2 | ABELIAN (Z/2) |
| 8 | 8x^4 - 16x^3 - 12x^2 + 20x - 1 | 4/4 | ABELIAN (Z/2 x Z/2) |
| all other n in 3..60 (57 values) | 4 .. 36 | strictly fewer than deg | NOT ABELIAN |
Idoneal but not abelian: 1, 3, 4, 5, 6, 7, 9, 10, 12, 13, 15, 16, 18, 21, 22, 24, 25, 28, 30, 33, 37, 40, 42, 45, 48, 57, 58, 60.
Degree = |C_6| for odd n, |C_6|/2 for even n (the value has a stabilizer of order 2).

### F3 — p.206 piece b_1, N = 4n (f3_out.txt)
| n | idoneal | h(-4n) | deg | real conj. | verdict | group |
|---|---|---|---|---|---|---|
| 7 (control) | yes | 1 | 3 | 3/3 | ABELIAN | Z/3 |
| 13 (control) | yes | 2 | 12 | 12/12 | ABELIAN | Z/12 |
| 11 (control) | no | 3 | 15 | 5/15 | NOT ABELIAN | — |
| 9 | yes | 2 | 6 | 6/6 | ABELIAN | Z/6 |
| 15 | yes | 2 | 8 | 4/8 | NOT ABELIAN | — |
| 21 | yes | 4 | 24 | 12/24 | NOT ABELIAN | — |
| 25 | yes | 2 | 20 | 20/20 | ABELIAN | Z/20 |
Degrees at 7, 11, 13 = h(p-1)/2 (C1). 9 and 25 abelian, 15 and 21 not: agrees with BAR-IDONEAL (lindep), now by an independent
exact method (minimal polynomial + Galois group), and explains it: at 15 and 21 some conjugates are non-real.

## 4. Scores (as sealed)
| item | verdict |
|---|---|
| P1 law L3 (abelian <=> all conjugates real), 127 values | **HOLDS** (0 mismatches: 60 F1 + 60 F2 + 7 F3) |
| P2 naive (H) predicted to fail at F3 7, 13 | **HOLDS** (abelian with Z/3, Z/12; also Z/6 at 9, Z/20 at 25, Z/4 for F1 n = 1) |
| P3a F1 abelian exactly at n = 1 | **HOLDS** |
| P3b F2 abelian exactly at {1, 2, 5, 8} | **FAILED** (observed {2, 8}; 1 and 5 are not abelian) |
| P3c F3 abelian exactly at {7, 9, 13, 25} | **HOLDS** |
| P4 'n idoneal' is not the law for F1, F2 | **HOLDS** |
| P5 controls (KSY25 Ex 8.1 exact; 7/13/11 degrees and verdicts; rounding >= 50 digits, min 112; 2W checks >= 308 digits; class-representative independence 10^-208 at 3 spots) | **HOLDS** |
| P6 nulls (random degree-24 polynomial; x^3 - 4x - 1 totally real S3) | **HOLDS** (both NOT ABELIAN; the second shows L3 needs the ray-class-field hypothesis) |
Why P3b failed (POST HOC): I reasoned "class group elementary 2 and the local unit quotient elementary 2" — componentwise.
The true condition is g^2 = nu(g) on the whole group (an extension condition). At n = 5 it fails: p = (7, 3 + sqrt -5) has
conj(p)/p = (2 + 3 sqrt -5)/7, not = +-1 mod 6, so psi is non-trivial although every "component" is 2-torsion.

POST HOC (posthoc_out.txt): for F1 the number of real conjugates equals 4|Cl(O)[2]|/(2 if 5 | n else 1) = [Q(zeta_5)Gen(O):Q]/2
at all 59 n. With deg = |C_5| this says K_{O,5} cap Q^ab = Q(zeta_5) * genus field of O, for n <= 60 (observed, not proved).

## 5. What is new vs prior art
- NOT new: L3/L1/L2 are elementary consequences of the generalized-dihedral shape of K_{O,N}/Q ([KSY25] Lemma 7.3, citing [14]);
  the N = 1 case is Weber's criterion ([Kani] Thm 32). We did not find L3 stated in an opened source, but it is folklore-level;
  do not present it as a theorem of ours.
- NOT new: the conjugate algorithm ([KSY25]); R at D = -52 ([KSY25] Ex 8.1); G(e^{-pi sqrt 2}) = (sqrt 6 - 2)/2 is very likely a
  classical evaluation (not checked).
- Possibly new (unchecked against literature, numerical for n <= 60): the complete abelian lists — R(e^{-2 pi sqrt n}) abelian over
  Q only at n = 1; G(e^{-pi sqrt n}) only at n = 2, 8; and L5 ("a ray-class-field generator at tau_O is never abelian for N >= 3").
  The fact deg R(i sqrt n) = |C_5(-4n)| (R generates K_{O,5}) is suggested by Gee-Honsbeek / Cais-Conrad abstracts ("generate specific
  class fields", ABSTRACT/SNIPPET via search) but no opened source states it for orders.
- For the project: the idoneal criterion for the p.206 pieces is family-specific (the pieces carry j: Prop D), not a universal law.
  The universal law is L2/L3; idoneal-ness enters only when the value's field is (essentially) Q(j) up to cyclotomic parts.

## 6. Ceiling
Paper-level general theorem? No. The general law is a short group-theory lemma (folklore). What could be a short note:
"Abelian singular values of Ramanujan's continued fractions": (i) L5 + a proof that R(tau_O) generates K_{O,5} (then R is abelian
over Q at no tau_O with D = -4n, n >= 2, all n, not just <= 60); (ii) the finite list for the cubic continued fraction
(needs the analogous generation statement and a finiteness argument); (iii) the composite-n p.206 rule via L2. Odds that (i) is
already in the literature in some form: ~40%. Revolutionary: no.

## 7. Single next strike
Prove "R(tau_O) generates K_{O,5} over K for D = -4n, n >= 2" (open Gee-Honsbeek / Cho-Koo for the exact statement first;
if it is there, L5 immediately gives the all-n theorem "R(e^{-2 pi sqrt n}) is abelian over Q only for n = 1"), and run the
same machinery at D = 1 mod 4 points and on R(e^{-2 pi / sqrt n}) to see whether n = 1 stays the only abelian case.
