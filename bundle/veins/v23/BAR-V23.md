# BAR-V23 — veins 2 (the 25 puzzle) and 3 (Ramanujan units). Sealed 2026-10-27 before any theta value at composite n
# and before any unit-group computation.

## In plain words
Vein 2: for odd composite n we compute every algebraic conjugate of the first piece b_1 directly (no lattice search), build
its exact minimal polynomial, and read off the field: its degree, how many of its roots are real (a Galois-over-Q field with
one real root must have all roots real), and whether it sits inside a cyclotomic field. A paper rule, derived before this
run (below), predicts exactly which n give a cyclotomic (abelian) field: n idoneal AND n a prime power. Vein 3: in the
fields where the pieces are units (p = 7 mod 8) we measure how much of the full unit group the pieces generate.

## Paper rule (derived before the run; class-group side computed in theory_out.txt, which uses no theta values)
O = Z[sqrt -n], D = -4n, H_O ring class field, A := Gal(L/K) for L := K(b_1). For x = s + t sqrt -n in O prime to 4n the
Shimura action sends b_1 to b_{+-s}, so the action factors through O/(sqrt -n) = Z/n and L is the ray class field of O
modulo the ideal (sqrt -n): [L:K] = h(-4n) phi(n)/2 (prediction P2.1). L is Galois over Q (stable under complex conjugation c);
a conjugate sigma(b_1) is real iff sigma commutes with c, i.e. iff Art(a/abar) = 1 on L for the ideal a of sigma. If [a]^2 != 1
in Cl(O) this fails on H_O. If a^2 = (lambda), lambda = s + t sqrt -n, then a/abar = (lambda/N a) acts as b_1 -> b_{s/Na}
with (s/Na)^2 = 1 mod n; it is trivial iff the sign vector eps(a) = (s/Na mod q^e)_{q^e || n} is +-(1,...,1).
Hence #real roots of G_n = (phi(n)/2) * #{c in Cl(O)[2] : eps(c) constant}, and Q(b_1) abelian <=> all roots real
<=> Cl(O) has exponent <= 2 (n idoneal) AND eps trivial. eps is automatically trivial when n is a prime power, and is
non-trivial on the ambiguous class (q^e, 0, n/q^e) whenever n has two distinct prime factors. Rule: **abelian <=> n idoneal
and a prime power.**

## Predictions (from theory_out.txt)
| n | h(-4n) | deg G_n | #real roots | verdict |
|---|---|---|---|---|
| 7 (positive control) | 1 | 3 | 3 | ABELIAN (= Q(zeta_7)^+) |
| 11 (null: non-idoneal prime) | 3 | 15 | 5 | not abelian |
| 9 | 2 | 6 | 6 | ABELIAN (inside Q(zeta_36)^+) |
| 15 | 2 | 8 | 4 | not abelian |
| 21 | 4 | 24 | 12 | not abelian |
| 25 | 2 | 20 | 20 | ABELIAN (= Q(zeta_100)^+) |
| 27 | 3 | 27 | 9 | not abelian |
| 33 | 4 | 40 | 20 | not abelian |
| 45 | 4 | 48 | 24 | not abelian |
| 49 | 4 | 84 | 42 | not abelian |
| 85, 93, 105 (vein 2a) | 4, 4, 8 | 128, 120, 192 | 64, 60, 48 | not abelian |
Also: Q(b_1) contains Q(j(sqrt -n)) (follows from deg = [L:K]); at 15 Q(b_1) strictly contains Q(zeta_15)^+ (degree 8 vs 4).

## Method (vein 2)
Conjugates: principal form -> B_s(i sqrt n), s in (Z/n)^*/+-1; each other reduced class -> an equivalent form (a,b,c) with
gcd(a,4n) = 1, value B_s(t_Q + y), t_Q = (b + sqrt D)/(2a), a a' = 1 mod 4n, y = -a'b/2 (convention 1, KSY25 Prop 4.1 at
N = 4n as used in proof/cert/cert.gp). B_m(tau) = (2 theta[m/n](tau)/theta[0](tau))^n. G_n = prod (x - values), rounded.
Self-check: coefficients round to Z (error <= 10^-50 at working precision W = 1.3 x (digits of the product) + 300).
Negative control: convention 2 (y = x0 a') must NOT round to Z wherever it differs from convention 1.
Real roots: polsturm(G_n) (exact). Abelian confirmation for predicted-abelian n: nfisincl(G_n, minpoly of 2cos(2 pi/4n)).

## Method (vein 3)
p = 7, 23, (31 if it fits in 4G and 20 min). G_p from fastmin.gp; F_p = Q[x]/G_p (polredbest). bnfinit (GRH-conditional,
stated); bnfisunit gives exponent vectors of b_1..b_m (the conjugates of b_1 that lie in F_p); rank and Smith form give
the index (or, if not full rank, the index in the saturation). For p = 23 also L = F_23(sqrt -23) (degree 66, contains all
33 conjugates) if bnfinit fits; E_L = <mu_L, all 33 conjugates>.
Null (pipeline): replacing b_k by b_k^2 must multiply the index by exactly 2^rank.

## Predictions (vein 3)
- P3.1 (positive control p = 7): F_7 = Q(zeta_7)^+, h = 1, E = <-1, b_1, b_2, b_3> has rank 2 (full), index 28 = 2^2 * 7
  (from the known forms u_1^7 = d2^6/d1^2 etc. and the cyclotomic-unit index h^+ = 1).
- P3.2 (p = 23, 31): F_p is NOT totally real for h > 1: signature (m, m(h-1)/2), m = (p-1)/2, so unit rank m(h+1)/2 - 1
  (21 at p = 23, 29 at p = 31), while <-1, b_1..b_m> has rank <= m (11, 15). So "full rank in F_p" (the brief's suggested
  prediction) is predicted to FAIL for h > 1; I predict rank exactly m.
- P3.3 (p = 23, in L): E_L has full rank 32; [O_L^* : E_L] / h_L has no prime factor outside {2, 3, 11, 23}; guess h_L = 1.

## Bar
Vein 2: each n scored separately; HOLDS for n if G_n is integral and degree, #real roots and verdict all equal the table.
The rule HOLDS if every n holds. Vein 2a: the claim "no abelian form at 85, 93, 105 at any conductor" is CERTIFIED if G_n is
integral and polsturm(G_n) < deg G_n (a field with a real and a non-real embedding is not Galois, hence not abelian).
Vein 3: P3.1, P3.2, P3.3 scored separately. Anything not run is reported NOT RUN, not as a pass.
Prior: ~70% that convention 1 gives integral G_n at composite n (risks: the twist y and the theta bookkeeping at composite n,
non-integrality of b_1); ~85% for the rule given integrality.
