# RESULT-G1 — the frozen-level Galois law at every level (vector G)
**[RESOLVED: REPAIR-GD v2 accepted by two referees; case (D) PROVED again, AI-refereed - proof now lives in vectors/v6_shape/REPAIR-GD.md] CAVEAT (lead, 2026-10-28): case (D) for l = p^e, e >= 2, dividing a non-idoneal m had a written gap (Lemma 2 covers k prime to l only; V uses all k). Repair = vectors/v6_shape/REPAIR-GD.md, PROOF DRAFT under referee. Until accepted, that case is UNPROVED; all other cases unaffected.**
2026-10-28, vector-G theory seat. Sealed bar: BAR-G1.md (sha256 c212720aed4fde1914548b1ff8ebbb69bf1fcb63bd0e9ec0191ac9fb7e0811af,
LOG.md 13:50; other hashes in SEALS.txt). Internal; not for release; nothing published. Status (v3): odd prime l PROVED (AI-refereed,
rounds 1-2); composite l (sec 3c, T2) ACCEPTED in referee round 3 - Theorem G PROVED for every odd l, odd m >= 3 (AI-refereed). Not read by an expert human.

## In plain words
Ramanujan-type theta pieces come in families: a "level" l (3 for the cubic, 5 for the quintic, 7 for the septic, ...) and a special
point i sqrt m. Earlier work settled four separate cases: level = point (C4/C5), level frozen at 3 or 5 (C6), and the Rogers-Ramanujan
function (C7). Here is the single rule behind all of them. The pieces live in a number field whose symmetries are a commutative group
plus one mirror (complex conjugation). The value is "abelian" (cyclotomic-type, sines and cosines) exactly when the mirror commutes with
every symmetry. Two things can break that: (1) the class group of m, which must consist of order-2 elements (m idoneal), and (2) a small
group of residues mod l, the norm-one torus, whose action on the piece must be invisible. For a fixed level l, (2) is invisible only
when l is a prime power dividing m, or in one small accident (l = 3 with m = 2 mod 3). So, for example, the level-7 pieces are abelian
at m = 7, 21, 105, 133, 273, 357, 385, 1365 and nowhere else among odd m; level 11 at 33, 165, 253, 385; level 13 at 13, 273, 1365.
We predicted this before computing. On the sealed test (243 values at levels 7, 9, 11, 13, 15, 21, 25, plus 18 controls) the
abelian / not-abelian verdict matched the prediction every time. Scored strictly as sealed, there are misses: one degree count and one
real-conjugate count (level 11, m = 1365), and one of the two "wrong-recipe" negative controls did not behave as a control. A post-hoc
check traces the count miss to our number-matching tolerance: two conjugates agree to 50 digits, and a finer tolerance gives exactly the
predicted counts.
The "only if" half is proved here for every odd prime level when l does not divide m (a new separation argument that works uniformly
in l); the "if" half is proved for every prime-power level. [v2] The step v1 left open (l divides m, m not idoneal: the product of
the pieces must generate the class field) is now closed by a size argument (§3b), so for every odd PRIME level the law is proved in both
directions (one seat; v1 parts refereed once, §3b not yet refereed). Still open: composite levels with a prime-power part not dividing m.
[v3] §3b was accepted with fixes by the referee (round 2). The composite case is now also written (§3c, Proposition T2, not yet refereed), and a
sealed test of it (BAR-G2, 22 new values) matched every prediction. If §3c survives refereeing, the law holds for every odd level.

## 1. Setting (as BAR-G1)
th[a,b](tau) = sum_j exp(pi i tau (j+a)^2 + 2 pi i (j+a) b); for odd l >= 3, B_k := (2 th[k/l,0]/th[0,0])^l = u_k^l
(u_k = 2 q^{k^2/l} f(q^{l+2k}, q^{l-2k})/phi(q^l) at q = e^{pi i tau/l}; C5 Lemma 1 with n -> l). Level 4l, rational q-coefficients,
B_{-k} = B_k = B_{k+l} (C5 Lemma 0). m odd >= 3, O = Z[sqrt -m], D = -4m, K = Q(sqrt -m), tau_O = i sqrt m, z := B_1(tau_O) > 0,
G := Gal(K_{O,4l}/K) = C_{4l}(O) (KSY25 Prop 3.1), rho: C_{4l}(O) -> G, c = complex conjugation, psi(sigma_[a]) = sigma_[abar/a].
- The diagonal l = m is C5 (q = e^{-pi/sqrt n} means l tau' = i sqrt n); C4 is l = m = p prime; C6 is l in {3, 5}.
- E := Q(all pieces B_k(tau_O), 1 <= k <= (l-1)/2). For prime l every B_k(tau_O) is a K-conjugate of z (Lemma 2 below), so
  K(z) = K(E), and since z is real, E = Q(z). For composite l the pieces with gcd(k, l) > 1 are pieces of lower level
  (e.g. B_3^{(9)} = (B_1^{(3)})^3); the theorem is stated for Q(z).

## 2. The statements
**Theorem G (frozen-level law).** Let l >= 3 and m >= 3 be odd and z = B_1^{(l)}(i sqrt m). Then Q(z) is abelian over Q iff
m is idoneal and (l is a prime power dividing m, or l = 3 and m = 2 mod 3).
- **Status (v2, 2026-10-28).** Referee round 1 (referee-g1-seatB-reply.md): ACCEPTED WITH FIXES for (A), (B), (C); full theorem NOT a
  proof because of (D). v2 proves (D) for every odd l >= 5 that properly divides m (§3b, Prop D_l; NOT yet refereed). With (D):
  **every odd prime l: PROVED both directions**; prime powers l = p^e: "if" PROVED, "only if" PROVED when p^e | m; l with two primes dividing m:
  "only if" PROVED. Still open (numerical only, COMP block): some prime-power part of l does not divide m (e.g. l = 9 with 9 not dividing m,
  l = 15 with 15 not dividing m).
- **Status (v3).** Referee round 2 (referee-g2-seatB-reply.md): **Prop D_l ACCEPTED WITH FIXES; Theorem G for every odd prime l ACCEPTED WITH
  FIXES** (AI independent AI reviewer; not read by an expert human). Fixes applied in v3 (v2 kept as RESULT-G1-v2.md): step-5 constants (exact pi, safe
  roundings, no false "="); step 4 discriminant D' = -4m/d^2 with d = gcd(l, m') for composite l; "-8 is a conjugate" wording at (7, 49).
  v3 also adds §3c (Proposition T2: composite l with a prime-power part not dividing m, cases (i)-(v), NOT yet refereed). With it, Theorem G is
  proved on the page for every odd l >= 3 and odd m >= 3; the parts refereed so far are every odd prime l. Sealed test BAR-G2: 22/22 (§6b).
- Explicit (prime l >= 5): abelian iff m is an idoneal multiple of l. The 24 odd idoneal m >= 3 (Euler's list; complete except possibly
  one squarefree m > 1848, Kani Cor 23 / Rem 24) are 3, 5, 7, 9, 13, 15, 21, 25, 33, 37, 45, 57, 85, 93, 105, 133, 165, 177, 253, 273, 345,
  357, 385, 1365. By level: l = 5: {5, 15, 25, 45, 85, 105, 165, 345, 385, 1365} (C6); l = 7: {7, 21, 105, 133, 273, 357, 385, 1365};
  l = 11: {33, 165, 253, 385}; l = 13: {13, 273, 1365}; l = 17: {85, 357}; l = 19: {57, 133}; l = 23: {253, 345}; l = 31: {93};
  l = 37: {37}; l = 59: {177}; every other prime l >= 5: none (up to the one hypothetical extra idoneal number).
- l = 3 (C6): idoneal m with 3 | m or m = 2 mod 3. Prime powers: l = 9: {9, 45}; l = 25: {25}; l = 27, 49, 81, 125, ...: none (Grube,
  Kani Thm 12: 9 | idoneal => n in {9, 18, 45, 72}; 25 | idoneal => n = 25). Two or more primes in l: never.

**Theorem U (one law for all four classifications).** Let f be a modular function of level N with rational q-coefficients, finite at
tau_O, O = Z[sqrt -m] with O^* = {+-1}. Let r: (O/NO)^* -> GL2(Z/N) be the regular representation x = t + s sqrt -m -> g_x = [t, -m s; s, t]
(the matrix through which a principal class acts, Lemma 1), and S_f the set of g with f o g = f (Galois action on F_N). For a class [a] with
[a]^2 = 1 write a^2 = lambda O and eps(a) := N(a)/lambda in (O/N)^*. Then:
  (if) Cl(O) = Cl(O)[2], g_{xbar/x} in S_f for all x, and g_{eps(a)} in S_f for all [a]  ==>  Q(f(tau_O)) abelian;
  (only if) the converse holds whenever f(tau_O) has the generic stabiliser (GS): sigma in G fixes f(tau_O) only if sigma is trivial on
  H_O = K(j(tau_O)) and its torus part lies in S_f.
Specialisations: f = B_1^{(l)} (S_f = {g : (1,0) g = +-(1,0) mod l} on the torus, mod-4 part acting trivially) gives Theorem G; with
l = m it is C5 (and C4 for m prime); with l in {3, 5} it is C6; f = R (Rogers-Ramanujan, a Hauptmodul of Gamma(5), S_f = {+-1}) gives C7:
g_{xbar/x} in {+-1} for all x fails for every m >= 2 (|N1| >= 4 or the unipotent {1 + u sqrt -m} when 5 | m), and at m = 1 the units
+-i absorb N1 (O/5 split, |N1| = 4 = |<i>|). GS holds by Hauptmodul injectivity for C6 (l = 3), C6 (l = 5, via p = U_1 U_2) and C7,
by Prop D + C5 Lemma 4' for C4/C5, and by Lemmas K, T below (torus part) for Theorem G.

## 3. Derivation and proof (one seat; unrefereed)
Inherited, cited not re-proved: KSY25 (arXiv:2506.14139, opened in veins/v1_law/src/ksy25.pdf) Prop 3.1, Prop 4.1, Lemmas 7.3, 7.4;
KSY10 (arXiv:1008.0473) Prop 2.4(ii), (iii) (quoted in RESULT-W1 Appendix); C5-proof-v3 Lemmas 0, 1, 3*, P and §7 (AI-refereed; their
level n is only ever used as an odd number); RESULT-V1 (L1)-(L3); RESULT-W1 §6 Steps 1, 2, 5, 6, v2 item 4, v5 item 1 (AI-refereed, written
for l in {3, 5}; audited below: l enters only as an odd level, except Lemma S and Step 6, which are NOT reused).

**Lemma 1 (principal classes; any odd l, any odd m).** Let mu = d1 - d3 sqrt -m be primitive with a = N(mu) prime to 4l, and
x := mu^{-1} mod l = t + s sqrt -m. Then for every k, rho([mu^{-1} O])(B_k(tau_O)) = B_k(M tau_O) with M in SL2(Z), (1,1)M = (1,1) mod 2,
top row of M = (t, -m s) mod l, and **|B_k(M tau_O)| = 2^l |th[k t/l, -k m s/l](tau_O) / th[0,0](tau_O)|^l**.
*Proof.* KSY25 Prop 4.1 + Lemma 7.4 with rational coefficients (RESULT-W1 v5 item 1) give M = [d4 + y d3, d2 + y d1; d3, d1],
y = -a'(d1 d2 + m d3 d4), a a' = 1 mod 4l. Expanding, a (d4 + y' d3, d2 + y' d1) with y' = -(d1 d2 + m d3 d4) is
(d1^2 d4 + m d3^2 d4 - d1 d2 d3 - m d3^2 d4, d1^2 d2 + m d3^2 d2 - d1^2 d2 - m d1 d3 d4) = (d1, -m d3)(d1 d4 - d2 d3) = (d1, -m d3),
so the top row is a'(d1, -m d3), and a'(d1 + d3 sqrt -m) = mubar/N(mu) = mu^{-1}. Parity: a odd (C5 Lemma P step 3). Modulus: C5 Lemma 1
(B_k = 2^l (-i)^k (g_{a_k}/g_{a_0})^l), KSY10 2.4(ii) (the move; epsilon cancels in the ratio) and 2.4(iii) (integer shifts are modulus-one
factors), exactly RESULT-W1 §6 Step 2 with the row k(A, B) in place of (A, B); th[a+1,b] and th[-a,-b] equal th[a,b]. Nothing uses l <= 5. ∎

**Lemma 2 (rational classes; any odd m).** For every k prime to l, B_k(tau_O) is a K-conjugate of z.
*Proof.* Take d1 odd with d1 = k^{-1} mod l and d1 prime to m (CRT), d3 = 4l, mu = d1 - 4l sqrt -m (N(mu) = d1^2 + 16 l^2 m, prime to 4l).
Lemma 1: top row of M = (d1^{-1}, 0) = (k, 0) mod l, so l | B and M is in Gamma* (C5 §2, level l). C5 Lemma 3* (level l, multiplier exactly 1):
B_1 o M = B_A = B_k. So rho([mu^{-1}O]) z = B_k(tau_O). (C5 Lemma P step 5 with n -> l; l | m is not used.) ∎

**Lemma M (monotone).** For y > 0, a -> th[a,0](iy) is strictly decreasing on [0, 1/2].
*Proof.* Poisson summation and the Jacobi triple product: th[a,0](iy) = y^{-1/2} sum_k e^{-pi k^2/y} e^{2 pi i k a}
= y^{-1/2} prod_{n>=1} (1 - Q^{2n})(1 + 2 Q^{2n-1} cos 2 pi a + Q^{4n-2}), Q = e^{-pi/y}; every factor is positive and strictly decreasing in a
on [0, 1/2]. (Same route as v4 Lemma 4' in C5 §3 (iii).) Grid confirmation: pchk_out.txt. ∎

**Lemma T (separation, new; replaces RESULT-W1's Lemma S, which only worked for l <= 5).** Let y >= sqrt 3, 0 <= a <= 1/4, 1/3 <= a' <= 1/2,
b, b' real. Then **|th[a,b](iy)| > U(y) >= |th[a',b'](iy)|**, with U(y) := th[1/3,0](iy).
*Proof.* Upper: |th[a',b']| <= sum_n e^{-pi y (n+a')^2} = th[a',0](iy) <= U(y) (Lemma M). Lower (v2, referee fix: v1 had the two
estimates swapped, and "|n + a| >= |n| for n <= -1" is false, e.g. a = 1/4, n = -1): for 0 <= a <= 1/4, |n + a| >= n for n >= 1 and
|n + a| >= |n| - 1/4 for n <= -1, so |th[a,b](iy)| >= e^{-pi y a^2} - sum_{n != 0} e^{-pi y (n+a)^2} >= Lam(y) := e^{-pi y/16} - sum_{n>=1} (e^{-pi y (n-1/4)^2} + e^{-pi y n^2}).
Lam(y) e^{pi y/16} = 1 - sum_{n>=1} (e^{-pi y ((n-1/4)^2 - 1/16)} + e^{-pi y (n^2 - 1/16)}) increases with y (all exponents >= 1/2 > 0);
U(y) e^{pi y/16} = sum_n e^{-pi y ((n+1/3)^2 - 1/16)} decreases (all exponents >= 1/9 - 1/16 > 0). At y = sqrt 3 (pchk_out.txt, 60 digits,
|n| <= 60, neglected tail < 1e-200): **Lam = 0.660524..., U = 0.635420...** (margin 0.0251). Hence Lam(y) > U(y) for all y >= sqrt 3. ∎

**Lemma K (combinatorial, new).** Let l >= 3 be prime, t in Z/l, t != +-1, and c(x) := min(x mod l, l - (x mod l)). There is k prime to l
with one of c(k)/l, c(kt)/l at most 1/4 and the other at least 1/3.
*Proof.* t = 0: k = (l-1)/2 (c(k)/l = (l-1)/2l >= 1/3; c(0) = 0). Otherwise c := c(t) is in [2, (l-1)/2] (c = 1 means t = +-1).
If 3c >= l: k = 1 (1/l <= 1/4 for l >= 5; at l = 3 only t = 0 occurs). If 3c < l: k := ceil(l/(3c)); then kc is in [l/3, l/3 + c) inside
[l/3, 2l/3), so c(kt) = c(kc) >= l/3; and k <= l/(3c) + 1 <= l/6 + 1 <= l/4 once l >= 12; 1 <= k < l. Primes l <= 11 by hand
(l = 5: t = 0, +-2; l = 7: t = +-2 via k = 3; l = 11: t = +-2 via k = 2, t = +-3 via k = 2) and by machine: pchk_out.txt checks every prime
l <= 1000 and every t (75,791 pairs, zero failures) and the explicit witness for 12 <= l <= 1000 (zero failures). ∎

**Lemma W (Weber form of the product; on the page).** For odd l, prod_{k=1}^{(l-1)/2} 2 th[k/l,0](tau)/th[0,0](tau) = 2^{(l-1)/2} f(tau/l)/f(tau)^l,
f = Weber's function q^{-1/48} prod_{r odd} (1 + q^{r/2}), q = e^{2 pi i tau}. Hence **V := prod_k B_k(tau_O) = 2^{l(l-1)/2} (f(tau_O/l)/f(tau_O)^l)^l.**
*Proof.* Triple product: th[a,0] = q^{a^2/2} prod_{j>=1} (1-q^j)(1+q^{j-1/2+a})(1+q^{j-1/2-a}). Over a = k/l, k = -(l-1)/2..(l-1)/2, the
exponents j - 1/2 +- k/l = (2lj - l +- 2k)/2l run over every r/(2l), r odd positive, twice in total; so prod_k th[k/l,0]
= q^{(l^2-1)/(24 l)} (q;q)^l [prod_{r odd} (1 + q^{r/2l})]^2 = q^{(l^2-1)/(24l) + 1/(24 l)} (q;q)^l f(tau/l)^2, while th[0,0] = q^{1/24} (q;q) f(tau)^2.
The q-powers cancel ((l^2 - 1 + 1 - l^2)/24l = 0), giving the square of the claim (pairs +-k equal, C5 Lemma 0); both sides are holomorphic
and non-vanishing on H with leading coefficient 1, so the square root is the claimed one. Numerical check 1e-94 at six (l, tau) (presel_out.txt).
At l = m this is v5.1 Lemma A (f(i/sqrt p) = f(i sqrt p)). For l | m, m = l m': f(tau_O/l) = f(i sqrt(l/m')), the Weber value at the ambiguous form (m', 0, l). ∎

### Proof of Theorem G
**(A) "if", l = p^e dividing m, m idoneal.** Every class of C_{4l}(O) has an integral representative a prime to 4l. Cl = Cl[2] (Kani Thm 6 /
Rem 7(b), opened: src/kani2011.txt line 260), so a^2 = lambda O with N(lambda) = N(a)^2 prime to 4l, and abar a^{-1} = (N(a)/lambda) O.
Lemma P at level l (C5 Lemma P with n -> l at tau_O = i sqrt m; its steps use the level only through t: O -> Z/l, t + s sqrt -m -> t, being a ring
homomorphism, i.e. (sqrt -m)^2 = 0 mod l, true because l | m; RESULT-W1 §6 Step 5(a)) gives rho([nu O]) B_k(tau_O) = B_{k t(nu)}(tau_O), and by
multiplicativity psi(rho[a]) sends B_k(tau_O) to B_{k u}(tau_O), u = N(a)/t(lambda). Now N(lambda) = t(lambda)^2 + m s(lambda)^2 = t(lambda)^2 mod l,
so u^2 = 1 in (Z/p^e)^*, which is cyclic (p odd): u = +-1 and B_{-k} = B_k. So psi(G) fixes every piece; by (L2) Q(z) (and E) is abelian.
**(A') "if", l = 3, m = 2 mod 3, m idoneal:** RESULT-W1 §6 Step 5(b).

**(B) "only if", l prime not dividing m (except l = 3, m = 2 mod 3): PROVED for every odd prime l, every odd m >= 3, idoneal or not.**
N1 := kernel of the norm (O/l)^* -> F_l^* (onto), so |N1| = l + 1 (O/l = F_{l^2}, -m a non-square) or l - 1 (O/l = F_l x F_l). The map
x -> xbar/x has kernel F_l^*, so its image has |(O/l)^*|/(l-1) = |N1| elements and lies in N1: image = N1 (Hilbert 90 by counting).
|N1| > 2 except for l = 3 split. Take y in N1, y != +-1: t(y) != +-1 (else m s^2 = 0 mod l, so s = 0, y = +-1). Choose x with xbar/x = y and nu in O
with nu = x mod l, nu = 1 mod 4 (nu O prime to 4l). sigma := psi(rho[nu O]) = rho([nubar nu^{-1}]) = rho([mu^{-1} O]) for a primitive mu with
mu^{-1} = nubar/nu mod 4l (RESULT-W1 v2 item 4), so mu^{-1} = y mod l. Lemma K gives k; Lemma 1 gives
|sigma(B_k(tau_O))| = 2^l |th[c(kt)/l, *](tau_O)/th0(tau_O)|^l, while B_k(tau_O) = 2^l (th[c(k)/l, 0](tau_O)/th0(tau_O))^l; Lemma T at
y = sqrt m >= sqrt 3 (th0(tau_O) > 0 is common to both) shows they differ. By Lemma 2, B_k(tau_O) = rho(kappa) z for some kappa. If Q(z) were
abelian, psi(G) would fix z (L2), hence sigma rho(kappa) z = rho(kappa) sigma z = rho(kappa) z (G abelian): contradiction. ∎
(For l in {3, 5} this re-proves RESULT-W1 §6 Step 3 by a uniform argument.)

**(C) "only if", l dividing m with two distinct primes r, s (composite level): PROVED.** C5 §7 with level l: for r^e || m, a = (pi/r^e) q with
pi = r^e + 2 sqrt -m, q = [r^e, sqrt -m], N(a) = r^e + 4m/r^e (prime to 2m), lambda = r^e - 4m/r^e + 4 sqrt -m. Mod the r-part of l:
u = N(a)/t(lambda) = (4m/r^e)/(-4m/r^e) = -1; mod the s-part: u = r^e/r^e = +1. So psi(rho[a]) sends z = B_1(tau_O) to B_u(tau_O) with u != +-1
mod l, i.e. c(u) >= 2, and B_u(tau_O) < B_1(tau_O) by Lemma M. Not abelian (no idoneal or generation input). ∎

**(D) "only if", l = p^e dividing m, m not idoneal.** Some [a]^2 != 1, so psi(rho[a]) is non-trivial on H_O. It moves z as soon as
H_O is inside K(z). V (Lemma W) lies in K(z) (Lemma 2: all B_k(tau_O) are K-conjugates of z, K(z)/K Galois) and is fixed by every principal
class (Lemma P at level l permutes the B_k), so V is in H_O, real. Hence **H_O inside K(z) follows from Prop D_l: K(V) = H_O.**
- Proved: l = m (C5 §4 = v5.1 Prop D, V = 2^{..} f(tau_O)^{-l(l-1)}); l = 3 and l = 5 (RESULT-W1 §6 Step 6, Hauptmodul generation).
- [v1: OPEN for l >= 7 a proper divisor of m; a size attempt on the theta form of V's conjugates did not close.] **v2: PROVED for every odd
  l >= 5 properly dividing m, §3b** (size argument on the Weber form, not on the theta form). Numerical agreement: degree h (l-1)/2 at every
  sealed non-idoneal item with l | m (§5), and pd_out.txt.
- Also OPEN: composite or prime-power l with some prime-power part of l not dividing m (the torus half of (B) for composite l; Lemma K would need
  t = 1 modulo the other parts). Covered numerically by the COMP block.

**Summary of the proof status of Theorem G (v2).** For every odd prime l: "if" PROVED; "only if" PROVED when l does not divide m ((B)); when
l | m, "only if" PROVED for l in {3, 5} (RESULT-W1), l = m (C5) and every other l by §3b. For composite l: "if" PROVED for prime powers; "only if"
PROVED when l | m (two primes: (C); prime power p^e | m, m not idoneal: (D) + §3b); OPEN when a prime-power part of l does not divide m.
Degree and real-count formulas: derived under the generic-stabiliser hypothesis, NOT proved; numerically exact (§5).

## 3b. Open case (v2, 2026-10-28): Prop D_l — the product of the pieces generates H_O
**Proposition D_l.** Let l >= 5 be odd, m odd with l | m and m' := m/l >= 3 (so m >= 3l), O = Z[sqrt -m], tau_O = i sqrt m, and
V := prod_{k=1}^{(l-1)/2} B_k(tau_O). Then K(V) = H_O. Consequently (D) holds: for l = p^e properly dividing a non-idoneal m, Q(z) is not abelian.
(l = m is C5 / v5.1 Prop D; l = 3 is RESULT-W1's Hauptmodul case.)

Notation (as v5.1 §1.2-1.3, [Wiki-W] Weber functions): f(tau) = q^{-1/48} prod (1 + q^{n-1/2}), f1 = q^{-1/48} prod (1 - q^{n-1/2}),
f2 = sqrt2 q^{1/24} prod (1 + q^n), q = e^{2 pi i tau}; R_0 = f^24, R_1 = f1^24, R_2 = f2^24; the roots of (X - 16)^3 - j(tau) X are
f^24, -f1^24, -f2^24. w1 := f(tau_O)^24, w2 := f(tau_O/l)^24.

*Proof.*
0. *Lemma W completed (referee item).* For fixed j >= 1, as k runs over -(l-1)/2..(l-1)/2 the numbers 2lj - l + 2k are the l consecutive odd
   integers 2l(j-1)+1, ..., 2lj-1; over j >= 1 they are every positive odd integer exactly once. The factors (1 + q^{j-1/2-k/l}) give the same
   set (k -> -k). So prod_k prod_j (1+q^{j-1/2+k/l})(1+q^{j-1/2-k/l}) = [prod_{r odd} (1 + q^{r/2l})]^2, as used. Hence
   **V^24 = 2^{12 l(l-1)} w2^l / w1^{l^2}** (Lemma W raised to the 24th power).
1. *V lies in H_O and is real* (§3 (D): principal classes permute the B_k by Lemma P at level l, which needs only l | m). So for sigma in
   Gal(H_O/K), sigma != 1, it suffices to show |sigma(V)| != V. Extend sigma to sigma~ on a Galois closure containing w1, w2; then
   |sigma(V)|^24 = 2^{12 l(l-1)} |sigma~(w2)|^l / |sigma~(w1)|^{l^2}.
2. *w1 and its conjugate (v5.1 Lemmas B, B', C with p -> m; they use only D = -4m, m >= 2).* w1 = e^{pi sqrt m} prod (1 + e^{-pi sqrt m (2n-1)})^24
   > e^{pi sqrt m}. sigma(j(tau_O)) = j(t_Q) with Q reduced, Q != (1,0,m) (else sigma fixes H_O = K(j(tau_O))), so a >= 2 and
   sqrt3/2 <= Im t_Q <= sqrt m/2; sigma~(w1) is a root of (X-16)^3 - j(t_Q) X, so |sigma~(w1)| <= max_i |R_i(t_Q)| <= 4.888 e^{pi sqrt m/2} (Lemma C).
3. *w2.* tau_O/l = i sqrt m/l and f(-1/tau) = f(tau), so w2 = f(iY)^24 with Y = max(sqrt m/l, l/sqrt m) = sqrt m/min(l, m'). Since l >= 5 and
   m' >= 3: 1 <= Y <= sqrt m/3. Then w2 = e^{pi Y} prod (1 + e^{-pi Y(2n-1)})^24 <= e^{pi Y} exp(24 e^{-pi}/(1 - e^{-2 pi})) < 2.83 e^{pi sqrt m/3}.
4. *A lower bound for every conjugate of w2 (new).* [v3, referee round 2 fix] tau' := tau_O/l is a root of the form (l, 0, m') (discriminant -4m),
   whose content is d := gcd(l, m'); so tau' is a CM point of the order of discriminant **D' = -4m/d^2** (for prime l: d = 1 or l; for composite l
   any divisor d of l can occur — v2 listed only d = 1, l, which is wrong for composite l). In every case D' divides -4m with square cofactor, so
   j(tau') is in the ring class field of an order containing O, hence in H_O, and
   sigma(j(tau')) = j(t') for a reduced t' of discriminant D' (Lemma B for that order; for D' = -4, j = 1728 is rational and t' = i), so
   sqrt3/2 <= Im t' =: y' <= sqrt|D'|/2 <= sqrt m. sigma~(w2) is a root of (X-16)^3 - j(t') X, i.e. one of R_0(t'), -R_1(t'), -R_2(t').
   With r := |q| = e^{-2 pi y'} <= e^{-pi sqrt3} < 0.004334 and |1 - x| >= exp(-x/(1-x)) for 0 <= x < 1:
   - |R_0(t')|, |R_1(t')| >= e^{pi y'} prod (1 - r^{n-1/2})^24 >= e^{pi y'} exp(-24 * 0.06612/(1 - 0.06583)) > 0.1829 e^{pi y'} >= 0.1829 e^{pi sqrt3/2} > 2.77 (gp: 0.18294, 2.7791);
   - |R_2(t')| = 4096 r |prod (1 + q^n)|^24 >= 4096 e^{-2 pi y'} exp(-24 * 0.004334/(1 - 0.004334)^2) > 3688 e^{-2 pi sqrt m}.
   Since sqrt m >= sqrt 15 > 1.14, 3688 e^{-2 pi sqrt m} < 2.77, so **|sigma~(w2)| > 3688 e^{-2 pi sqrt m}** in all three cases.
5. *Comparison.* From 1-4,
   log(|sigma(V)|^24 / V^24) = l log(|sigma~ w2|/w2) + l^2 log(w1/|sigma~ w1|)
   > l [log(3688/2.83) - (7 pi/3) sqrt m] + l^2 [(pi/2) sqrt m - log 4.888]
   > l [7.172 - (7 pi/3) sqrt m] + l^2 [(pi/2) sqrt m - 1.5868] =: l F(l, m)
   [v3, referee round 2 fix: v2 printed "= l [7.172 - 7.330 sqrt m] + l^2 [1.5708 sqrt m - 1.5868]", with 7 pi/3 = 7.33038... and pi/2 = 1.570796...
   rounded the unsafe way and a false "="; now exact pi and safe roundings 7.172 < log(3688/2.83) = 7.17256, 1.5868 > log 4.888 = 1.58678].
   F(l, m) = 7.172 - (7 pi/3) sqrt m + l ((pi/2) sqrt m - 1.5868). dF/dl = (pi/2) sqrt m - 1.5868 > 0 and dF/d(sqrt m) = (l/2 - 7/3) pi > 0 for l >= 5,
   so F is increasing in both on the allowed range (l >= 5, m >= 3l). F(5, 15) > 1.26 and F(7, 21) > 12 (gp: 1.26589, 12.8604).
   So |sigma(V)| > V for every sigma != 1.
6. Only the identity fixes V, so K(V) = H_O; V is in K(z) (§3 (D)), so H_O is inside K(z), and (D) follows as stated there. ∎
The decisive change from the failed v1 attempt: work with the two Weber values (whose conjugates are controlled by j alone, via the Weber cubic),
not with the individual theta characteristics of the conjugate pieces.

**Referee's test case l = 7, m = 49 (h(-196) = 4, not idoneal).** Here m' = 7 = l, tau_O/7 = i, w2 = f(i)^24 = 64 and the Weber cubic
(X-16)^3 - 1728 X = (X - 64)(X + 8)^2. [v3 wording fix: w2 = 64 is rational, so its only Galois conjugate is 64 itself; -8 is another root of the
cubic, not a conjugate. The general bound of step 4 only needs |sigma~(w2)| >= 8, which holds a fortiori.] Cl(-196) = {(1,0,49), (2,2,25),
(5,+-2,10)} is cyclic of order 4 (referee), so m = 49 is not idoneal. w1 = f(7i)^24 > e^{7 pi}, and
|sigma~(w1)| <= 4.888 e^{7 pi/2} for sigma != 1. So log(|sigma V|^24/V^24) >= 7 log(8/64) + 49 (7 pi/2 - log 4.888) = -14.56 + 461.0 > 0.
K(V) = H_O, and B_1^{(7)}(7i) is not abelian — as the sealed run found (degree 12 = h (l-1)/2, 6 real roots, non-Galois witness mod 3).

**Checks (pd.gp -> pd_out.txt; POST HOC).** At (l, m) = (7, 21), (7, 35), (7, 49), (7, 63), (7, 77), (7, 91), (11, 33), (11, 55), (11, 99),
(13, 39), (13, 65), (9, 27), (9, 63), (25, 75), (5, 35), (5, 55): the KSY25 conjugates of V take exactly h distinct values, V is the strictly
smallest, and the observed min log(|sigma V|/V) (e.g. 36.41 at (7, 49), 11.83 at (5, 35)) is above the proved bound F l/24 (6.34, 0.49), which is
positive in every case. Note (9, 27) and (9, 63): the prime-power case flagged open by the referee is covered by the same proof.
[v3 note: pd.gp printed the bound with the v2 constants 7.330 and 1.5708; the corrected F is smaller by less than 1e-3 l^2 sqrt m, and every
printed margin is far larger.]

## 3c. The torus half for composite levels (v3, 2026-10-28; Proposition T2; NOT yet refereed; sealed test BAR-G2)
**Lemma T0 (strict phase loss).** For y > 0, real a and real b not in Z: |th[a,b](iy)| < th[a,0](iy).
*Proof.* th[a,b](iy) = sum_n c_n e^{2 pi i (n+a) b} with c_n = e^{-pi y (n+a)^2} > 0; the triangle inequality is strict because the phases of
the n = 0 and n = 1 terms differ by e^{2 pi i b} != 1. ∎

**Realisation step.** For any x in (O/lO)^* and y := xbar/x, there is sigma in psi(G) with sigma = rho([mu^{-1} O]), mu^{-1} = y mod l: lift x to
nu in O with nu = x mod l, nu = 1 mod 4 (nu O prime to 4l), and use RESULT-W1 v2 item 4 as in (B). By Lemma 1 (no primality used),
|sigma(B_k(tau_O))| = 2^l |th[k t(y)/l, -k m s(y)/l](tau_O)/th0(tau_O)|^l; if moreover m s(y) = 0 mod l, then M is in Gamma* and Lemma 3* gives
sigma(B_1(tau_O)) = B_{t(y)}(tau_O) exactly. For k prime to l, B_k(tau_O) is a K-conjugate of z (Lemma 2; no primality used). As in (B), a sigma in
psi(G) that moves some K-conjugate of z shows Q(z) is not abelian.

**Proposition T2.** Let l be odd, m >= 3 odd, and suppose some prime power p^e || l does not divide m; v := v_p(m) < e, l' := l/p^e. Then
Q(B_1^{(l)}(i sqrt m)) is not abelian. (l prime is (B); so assume l composite.) Write t, s for t(y), s(y). In every case x is chosen at the
p^e-component and x = 1 at the other components (CRT), so y = 1 mod l'.
- **(i) p does not divide m, l' > 1.** x = sqrt -m at p^e (a unit there). y = -1 at p^e, +1 mod l': s = 0, t = u with u = -1 mod p^e, u = 1 mod l', so
  u != +-1 mod l and c(u) >= 2. sigma z = B_u(tau_O) < B_1(tau_O) (Lemma M).
- **(ii) p does not divide m, l = p^e, e >= 2.** O/p^e is unramified; the norm (O/p^e)^* -> (Z/p^e)^* is onto (onto mod p, and N(1 + p w) = 1 + p Tr(w) + p^2(...) with
  Tr onto), so as in (B) the image of x -> xbar/x is the whole norm-one group N1. y := 1 + p^{e-1} sqrt -m has N(y) = 1 + m p^{2e-2} = 1 mod p^e, so
  y is in the image. t = 1, m s = m p^{e-1} != 0 mod p^e. |sigma z| = 2^l |th[1/l, -m/p](tau_O)/th0|^l < z by Lemma T0 (b = -m/p not in Z).
- **(iii) p | m, v <= e - 2.** x = 1 + s0 sqrt -m at p^e with s0 = p^{e-v-1} (N(x) = 1 mod p, a unit). y = (1 - m s0^2 - 2 s0 sqrt -m)/(1 + m s0^2):
  v_p(m s0^2) = 2e - v - 2 >= e, so t = 1 mod p^e, hence t = 1 mod l; v_p(m s) = v_p(2 m s0) = e - 1 < e, so m s != 0 mod l. Lemma T0: |sigma z| < z.
- **(iv) p = 3, v = e - 1 >= 1.** x = 1 + sqrt -m at 3^e. t - 1 = -2m/(1+m) at 3^e has valuation exactly e - 1, and t = 1 mod l', so t = 1 + (l/3) j mod l
  with j in {1, 2}. j = 1: k = 1, c(1) = 1 <= l/4 and c(t) = l/3 + 1 >= l/3 (l >= 9). j = 2: k = 2 (a unit), c(2) = 2 <= l/4, and
  2t = 2 + (l/3)*4 = 2 + l/3 mod l, c(2 + l/3) >= l/3 (it is 2 + l/3 for l >= 12, and 4 >= 3 at l = 9). Lemma T (any b) separates |sigma B_k| from B_k.
- **(v) p >= 5, v = e - 1 >= 1 (any l; this also closes the family tagged GAP in BAR-G2).** Same x; t = 1 + L j mod l with L := l/p = p^{e-1} l', j != 0 mod p.
  Let k0 in [1, p-1] with k0 j = (p-1)/2 mod p and k := the CRT solution of k = k0 mod p, k = 1 mod l', 1 <= k <= p l' (a unit mod l).
  Then k t = k + L (k j mod p) = k + L (p-1)/2 =: X mod l. Bounds: X >= L(p-1)/2 + 1 >= Lp/3 = l/3 (since L(p-3)/6 + 1 > 0); and
  l - X >= Lp - p l' - L(p-1)/2 = L(p+1)/2 - p l' >= l/3 because L(p+3)/6 >= p l' <=> p^{e-2}(p+3) >= 6 (true: e >= 2, p >= 5). So c(kt) >= l/3,
  and c(k) <= k <= p l' <= l/4 <=> p^{e-1} >= 4 (true). Lemma T separates. ∎
**Consequence.** With (A), (A'), (B), (C), (D) + §3b and T2, **Theorem G is proved for every odd l >= 3 and every odd m >= 3** (one seat; T2 and
the v3 constants not yet refereed). The BAR-G2 run (sealed before this section's case (v) was extended to composite l) is reported in §6b.

### Proof of Theorem U and the specialisations
(if) By Lemma 1-type Shimura action (KSY25 Prop 4.1 with gamma-hat, Lemma 7.4), a principal class x acts on f(tau_O) through r(x) up to the diamond [Lead 2026-10-29, V9 audit U-1: cite KSY25 Prop 5.1 (valid at every level N) for this action, not the odd-only Lemma 1; needed before any even-level use.]
factor diag(1, N(x)), which is trivial on rational coefficients; a class [a] in Cl[2] has psi(rho[a]) = rho(eps(a) O), principal. If Cl = Cl[2],
psi(G) consists of principal classes; under the hypotheses they act through S_f and fix f(tau_O); (L2). (only if) If some psi(sigma) is outside the
hypotheses then, by GS, it moves f(tau_O); (L2). The theorem is elementary given (L2) and Shimura reciprocity; its content is that each earlier
classification is the computation of ONE stabiliser plus a proof of GS for that family:
| family | S_f on the torus | condition | GS proved by |
|---|---|---|---|
| C4/C5: B_1^{(n)} at i sqrt n | (1,0) g = +-(1,0) mod n | n idoneal, eps constant: n an idoneal prime power | Prop D + Lemma 4' (C5 §§3-4) |
| C6: B_1^{(l)}, l = 3, 5 | same, level l | m idoneal, l | m or (l = 3 split) | Hauptmodul (RESULT-W1 §6 Step 6) + Lemma S |
| Theorem G: B_1^{(l)}, any odd l | same, level l | m idoneal, l a prime power | m, or l = 3 split | Lemmas K, T (torus); Prop D_l (sec 3b) and Prop T2 (sec 3c), all refereed |
| C7: Rogers-Ramanujan R (Gamma(5) Hauptmodul) | g = +-1 mod 5 (up to diamonds) | never for m >= 2; m = 1 by units +-i | Hauptmodul injectivity (RESULT-R1) |
For R: g_y = +-1 for all y = xbar/x fails for every m >= 2 (|N1| >= 4 when 5 does not divide m; y = 1 + u sqrt -m, u != 0, when 5 | m), which is
RESULT-R1's "nu = 1 + sqrt -n or 2 + sqrt -n"; at m = 1, O/5 is split, |N1| = 4 = |<i>| and the units absorb it: abelian only at n = 1 (C7).
The same unit mechanism predicts the pieces at m = 1: abelian iff |N1/<i>| = 1, i.e. l in {3, 5} (checked post hoc at l = 7, §6).
Cubic continued fraction: CORRECTION to the brief and to RESULT-W1 §7 "Echo": RESULT-V1 (F2, table and P3b) found it abelian only at n = 2 and 8
among n <= 60; its sealed prediction {1, 2, 5, 8} FAILED there. Under Theorem U it needs its own stabiliser mod 6 (including the 2-part, which
must kill odd n = 5 and even n = 20); that derivation is not done here.

## 4. Method and run history (files in this folder)
- Engine: gl.gp (sealed) on veins/v1_law/law.gp: K-conjugates from KSY25 Prop 4.1 (x = -a'b/2 mod 4l), the same method as wall.gp
  (RESULT-W1) and fastmin.gp / cert.gp (analytic conjugates -> integer polynomial). Numerical layer for every item; exact layer
  (integer polynomial, rounding error = integrality self-check, irreducibility, P(z) ~ 0 at 2W with z recomputed directly, Sturm count,
  non-Galois witness mod a prime or galoisinit + galoisisabelian) for small degree or predicted abelian. No GRH, no bnfinit. Floating
  point, no interval arithmetic. WSL PARI/GP, one process at a time.
- **Run 1** (run_g1.gp -> run_g1_out.txt, sealed instrument). Controls 18/18. 162 MAIN/COMP items reached, all verdicts as predicted.
  INSTRUMENT FAULT: law.gp's clust() tolerance is tol (1 + |R|), absolute for small values, and the reality test was absolute too. At large
  m some conjugates are below 1e-30, so distinct ones merged (DEGMISS at l = 7, m = 345; l = 11, m = 133, 177, 273, 345, 357; REALMISS at
  l = 11, m = 273, 345, 357); the guard error("degree changed") then aborted MAIN at l = 11, m = 385 (rest of l = 11 and all of l = 13 unrun)
  and COMP at l = 9, m = 253 (rest of COMP unrun). Logged in LOG.md 14:05.
- **Run 1b** (gl2.gp + run_g1b.gp -> run_g1b_out.txt). gl2.gp changes ONLY the tolerances (relative) and the numerical precision (60 digits
  above the smallest conjugate); predab / preddeg / predreal / lists are the sealed ones. Every MAIN and COMP item re-run. Hashes:
  gl2.gp 0af6e75c..., run_g1b.gp 4cc9dda9... (SEALS.txt; LOG.md 14:35 — note: the hash line was written while 1b was already running,
  at the note-taker's request; the files were not edited after launch except the one-character paren fix made before the successful launch).
- pchk.gp -> pchk_out.txt: Lemma T and Lemma M numbers, Lemma K exhaustive check, m = 1 post hoc, null diagnosis, the 1365 diagnosis.
- post.gp -> post_out.txt: POST HOC lists at l = 17, 19, 23, 31, 37, 59 (not sealed).

## 5. Table (run 1b; full lines in run_g1b_out.txt). A = abelian.
| l | items | abelian at (observed = predicted) | exact certificates | verdict | degree | real count |
|---|---|---|---|---|---|---|
| 7 | 63 | 7, 21, 105, 133, 273, 357, 385, 1365 | 44 (36 non-Galois witnesses) | 63/63 | 63/63 | 63/63 |
| 11 | 47 | 33, 165, 253, 385 | 14 (10) | 47/47 | 46/47 | 46/47 |
| 13 | 47 | 13, 273, 1365 | 11 (8) | 47/47 | 47/47 | 47/47 |
| 9 | 42 | 9, 45 | 30 (28) | 42/42 | 42/42 | not predicted |
| 15 | 31 | none | 22 (22) | 31/31 | 31/31 | not predicted |
| 21 | 7 | none | 7 (7) | 7/7 | 7/7 | not predicted |
| 25 | 6 | 25 | 5 (4) | 6/6 | 6/6 | not predicted |
| controls l = 3, 5 (run 1) | 18 | as RESULT-W1 | 18 | 18/18 | 18/18 | 18/18 |
Exact layer over all items: rounding error <= 1e-120, all denominators 1 (integral), P(z) <= 1e-308 at 2W, Sturm count = numerical real
count everywhere, no inconsistency flag. Galois groups of the abelian items (galoisisabelian, Smith form): l = 7: Z/3 (m = 7),
Z/6 x Z/2 (21, 133), Z/6 x (Z/2)^2 (105, 273, 357, 385), Z/6 x (Z/2)^3 (1365); l = 11: Z/10 x Z/2 (33, 253), Z/10 x (Z/2)^2 (165, 385);
l = 13: Z/12 (13), Z/12 x (Z/2)^2 (273), Z/12 x (Z/2)^3 (1365); l = 9: Z/6 (9), Z/6 x Z/2 (45); l = 25: Z/20 (25). Pattern: Z/((l-1)/2) or
Z/(l-1) times (Z/2)^{rank Cl}, degree h (l-1)/2 (for l = 9, 25: phi(l)/2). Examples: l = 7, m = 7: x^3 - 41x^2 + 54x - 1 (cubic, cyclic; compare C4 at p = 7); l = 7, m = 49 (non-idoneal): degree 12,
6 real roots, non-Galois witness mod 3.

## 6. Verdicts, scored strictly against BAR-G1 as sealed
| item | verdict |
|---|---|
| P1 Theorem G verdict, MAIN (157 items) | **HOLDS** (157/157, run 1b; run 1 reached 108, all hits) |
| P2 composite levels, COMP (86) | **HOLDS** (86/86, run 1b) |
| P3 degree formula (243 items) | **FAILED at 1 item**: l = 11, m = 1365 (956 observed vs 960 predicted). 242/243. Run 1 also had DEGMISS at 6 items (instrument fault above). |
| P4 real-count formula (157 prime-level items) | **FAILED at 1 item**: l = 11, m = 1365 (156 vs 160). 156/157. Run 1 also had 3 REALMISS (instrument). |
| P5 positive controls (18) | **HOLDS** (verdicts, degrees, real counts as RESULT-W1) |
| P6 alternatives H_C5, H_idon, H_split each fail on MAIN | **HOLDS**: at l = 7, m = 3 all three say A (predict_out.txt: H_C5 = H_idon = H_split = A; -3 is a square mod 7), observed NOT abelian; H_C5 also fails at l = 7, m = 21 (says -, observed A) |
| NULL conv 3 (x = -ab/2) at (7, 21), (11, 15) | **HOLDS** (fails to round, distance 1e-0) |
| NULL conv 2 (x = +a'b/2) at (7, 21), (11, 15) | **FAILED as a null** ("DID NOT FAIL" by the sealed test) |
| NULL at (13, 13) | **NOT RUN** (gnull crashed on precision loss in round(), both runs) |
POST HOC diagnoses (no score changed):
- l = 11, m = 1365 (pchk_out.txt, 400 digits): the closest distinct conjugates differ by a relative 2.6e-50 (values near 2^11 = 2048, the
  c = 0 characteristics at Im = sqrt 1365, where theta differences are of size e^{-pi sqrt 1365} ~ 1e-50). Tolerance 1e-30: 956 distinct /
  156 real; tolerance 1e-100 or 1e-200: **960 / 160, the predicted numbers.** So the miss is the instrument's matching tolerance, not the formula.
- Null conv 2 (pchk_out.txt, precision above the coefficient size): conv 2 yields an INTEGRAL polynomial at (7, 21) (96 values, coefficients
  ~1e164, distance 1e-140) and (11, 15) (120 values), so conv 2 is a Galois-stable but different value set (at (7, 21) degree 96, not 12) — a
  design error of the null, like RESULT-W1's coefficient-action null. conv 2 and conv 3 both fail to round at (13, 13) (166 / 164 values).
  The sealed null criterion (absolute distance at 200 digits, threshold 1e-30) was also meaningless for coefficients above 1e170.
  The correct convention (conv 1) is integral at all three points with the predicted degrees 12, 120, 12.

## 6b. BAR-G2 (sealed 16:01, sha256 1940cf42...; run: g2.gp g2run(60) -> run_g2_out.txt)
| item | verdict |
|---|---|
| P1 verdicts, 22 items (l = 27, 45, 49, 63, 75 + controls (9,9), (9,45), (25,25)) | **HOLDS** 22/22 (19 NOT abelian, all 3 controls abelian: Z/6, Z/6 x Z/2, Z/20) |
| P2 degree = preddeg | **HOLDS** 22/22 (degrees 6 .. 2400) |
| P3 the item tagged GAP at sealing, (75, 15) | NOT abelian as predicted; §3c case (v) was extended to composite l after sealing and now covers it |
**Order of events for the GAP family (v3 integrity note).** BAR-G2 was sealed at 16:01 with (75, 15) tagged GAP. The run was launched right
after. While it was running, and before this seat read any line of run_g2_out.txt, §3c was written, including the CRT extension of case (v)
that covers the GAP family. The first read of the output came after that edit. The file times cannot show this order independently: both the
§3c edit and the final §6b write fall in the same minutes. So, conservatively: **the case-(v) extension to composite l was
derived after the sealing and not under seal (post hoc); the proof does not depend on the numbers** (it uses only Lemmas 1, 2, T and the
CRT choice of k). The 22 predictions were fixed at sealing and are unaffected.
Exact non-Galois witnesses at (27, 9) and (45, 45); the rest numerical (gl2.gp, all-real test). All m here are idoneal, so every
"not abelian" is the torus obstruction, case by case as tagged: (i) at (45, 5), (45, 7), (63, 5), (63, 7), (75, 3), (75, 7); (ii) at (27, 5),
(27, 7), (49, 3), (49, 13); (iii) at (27, 3); (iv) at (27, 9), (27, 45), (45, 15), (63, 21); (v) at (49, 7), (49, 21), (75, 15); (C) at (45, 45).

## 7. Post hoc (not sealed)
- m = 1 (units +-i; pchk_out.txt, algdep at 1500 digits): l = 7: degree 12 = |(O/7)^*/<i>|, irreducible, 6 real roots, NOT abelian
  (non-Galois witness mod 3); no degree-11 relation. l = 3: x^2 - 4x - 8, l = 5: x^4 - 24x^3 - 224x^2 + 5376x - 1024, both abelian
  (RESULT-W1 post hoc reproduced). Theorem U predicts abelian at m = 1 exactly for l in {3, 5} among primes.
- Other primes (post.gp -> post_out_part1.txt, post2.gp -> post2_out.txt; repaired instrument; predicted from Theorem G before computing,
  not sealed): **ABELIAN as predicted** at l = 17, m = 85 (Z/16 x Z/2) and 357 (Z/16 x (Z/2)^2); l = 19, m = 57 and 133 (Z/18 x Z/2);
  l = 23, m = 253 (Z/22 x Z/2); l = 31, m = 93 (Z/30 x Z/2); l = 37, m = 37 (Z/36; the C4 case p = 37). **NOT abelian as predicted** at
  l = 17, m = 17 and 51; l = 19, m = 19; l = 23, m = 23; l = 31, m = 31 (non-idoneal multiples of l; exact non-Galois witnesses) and at
  l = 17, m = 21 and l = 19, m = 15 (idoneal, l not dividing m; numerical). Degrees and real counts all as predicted (14/14). Not run:
  l = 23, m = 345 (stopped by this seat after > 10 minutes on the exact layer) and l = 59, m = 177 (too large for this session).

## 8. Prior art (sources opened by this seat)
- Berndt-Rebak, Ramanujan J. 66(4) art. 66 (2025), arXiv:2312.15513v2 (text vectors/v1_wall/src/br.txt, re-read here): evaluations only; no
  field, Galois or abelian statement anywhere (grep of the full text). Final section (br.txt line 2080): higher orders are named as the open
  direction, with the remark that "as the order increases, we know less and less about the modular equations necessary for a possible grand
  theory". Theorem G is a Galois-side statement at every order that needs no modular equation.
- Kani, "Idoneal numbers and some generalizations", Ann. Sci. Math. Québec 35 (2011) 197-227: OPENED this session (author PDF from
  queensu.ca, saved src/kani2011.pdf, text src/kani2011.txt). Thm 32 (Weber) is printed on p. 19 (txt line 981): "Q(j(sqrt -n)) is a Galois
  (and hence an abelian) field extension of Q if and only if n is idoneal", level 1 only. Remark 33 (txt line 1009) concerns Weber's
  tabulated powers of f, f1, f2 at idoneal n; nothing on level-N values, ray class fields, or a torus condition. Thm 6 (Grube/Gauss
  criterion, txt line 260) is used in (A).
- Lab prior-art gate on C6-C8 (vectors/external-gate-c6c8-reply.md, not re-opened): closest are Cho-Koo-Park 2010 (cubic CF generates ray class
  fields), Gee-Honsbeek (R generates H_5), Enge-Morain 2014, Duke 2005, Cais-Conrad. None classifies abelian-over-Q values.
- Status: "not found in the sources opened". A scout on "theta quotient / Siegel function value abelian over Q / norm-one torus" is needed
  before any novelty claim. The ingredients (Shimura reciprocity, ray class groups of orders, Weber's criterion, Hilbert 90) are classical.

## 9. Ceiling
Ceiling: a complete, explicit Galois classification of Ramanujan's theta pieces at every level — the cubic, quintic, septic, ninth-degree and
all higher analogues — in one sentence ("abelian exactly at idoneal multiples of the level, plus the level-3 split accident"), with the
earlier four classifications as specialisations of one stabiliser computation. It is a clean theorem in explicit class field theory, not a new
method; its mechanism is standard. The plain-words line: "Ramanujan's theta pieces at any level are sine-and-cosine numbers exactly at
idoneal multiples of the level."

## 10. Gaps and next strike
1. [v2: CLOSED by §3b, pending referee.] Prop D_l: referee round 2 on §3b (steps 3-5: the w2 lower bound and the comparison).
2. [v3: written as §3c, Proposition T2; sealed BAR-G2 22/22; next = referee round 3 on §3c.] Composite l with a prime-power part not dividing m.
3. Degree and real-count formulas: prove the exact stabiliser (all torus values distinct), as C5 §6 does for l = m.
4. A independent AI reviewer on §3 (Lemmas 1, 2, K, T, W and (A)-(D)); a prior-art scout (§8).
5. Instrument: replace law.gp's absolute clustering tolerance everywhere it is still used (wall.gp, rr.gp users) — run 1 shows it fails
   silently for conjugates below 1e-30 (large m).
6. The cubic continued fraction under Theorem U (stabiliser mod 6 including the 2-part); correct the "{1, 2, 5, 8}" echo in RESULT-W1 §7.
