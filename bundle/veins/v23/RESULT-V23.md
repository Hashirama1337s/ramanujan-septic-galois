# RESULT-V23: vein 2 (the 25 puzzle) and vein 3 (Ramanujan units). 2026-10-27/28. Internal; not for release.
Sealed bar: BAR-V23.md (sha256 5b4f9f42...ffaf2, LOG.md 23:19). Scripts and raw outputs are in this folder (file names below).

## In plain words
**Vein 2: solved, with a clean rule.** At any odd n, the pieces live in one specific field: the "ring class field" of
Z[sqrt -n] with the n-th roots of unity, and sometimes twice that size. That field is cyclotomic (abelian) exactly when two things
hold. First, n must be idoneal (Euler's condition on the class group). Second, n must be a power of a single prime.
When n has two different prime factors (15 = 3 x 5, for example), there is an extra symmetry that acts as "+1 at one prime,
-1 at the other". Complex conjugation cannot commute with it, so the field is not abelian. 25 = 5^2 and 9 = 3^2 are prime powers,
so they pass. All 14 odd n we computed (7, 9, 11, 15, 21, 25, 27, 33, 45, 49, 57, 85, 93, 105) match the sealed prediction
exactly: degree, number of real roots, and verdict. Classical results of Grube and the class-number lists then give the complete
answer with no open conjecture: **the odd n whose pieces are cyclotomic are exactly 3, 5, 7, 9, 13, 25, 37.**
The old note "post hoc at conductors up to 24n" was overstated. That check ran only at 15 and 35, and never for 85, 93, 105.
It is now replaced by an exact certificate that works at every conductor: at every composite idoneal n tested, the minimal
polynomial of b_1 has non-real roots, so b_1 lies in no abelian field at all.

**Vein 3: the question as posed has no finite answer for p = 23 and 31. The p = 7 control is exact.**
- At p = 7, the pieces generate the unit group of Q(zeta_7)^+ up to index exactly 28 = 4 x 7. That field's class number is 1.
- At p = 23 and 31, the field F_p is only partly real (its Galois group is not abelian). It has 21 and 29 independent units, but the
  pieces supply only 11 and 15, so they cannot have finite index. The other conjugates of b_1 live in a field twice as large
  (degree 66, 90). Its unit group did not compute within 20 minutes.
- Inside their own span, the pieces fall short of being saturated by exactly 2 x m x p^(m-1), with m = (p-1)/2.
- The large p^(m-1) part has a simple explanation (POST HOC). The ratio u_1^(k^2) / u_k of Ramanujan's original numbers
  (u_k = b_k^(1/p)) is already in F_p, for every k and at all three primes.

---

## Vein 2

### (a) The R1 wording ("also post hoc at conductors up to 24n")
Files checked: idoneal/retry_and_explore.gp, retry_out.txt, explore.gp, explore_out.txt.
- The sealed retry (2W, u^{4n}, conductor 4n) ran only for 15, 21, 33, 45, 57. **It did not run for 85, 93, 105**: the loop list stops at 57.
- The post hoc block in retry_and_explore.gp died with a PARI syntax error. Its rerun (explore.gp, explore_out.txt) covered
  **only n = 15 and n = 35** (conductors 8n, 12n, 24n; exponents 1, 2, 4, 8, 24) and found no relation. 21, 33, 45, 57, 85, 93 and
  105 were never tried above conductor 4n.
- So the R1 sentence is overstated as written. I did not rerun the lindep searches: an exact test replaces them (next item).
- **Replacement evidence (this run, exact):** for every composite idoneal n tested, I built the integer minimal polynomial G_n of b_1
  from its analytic conjugates and counted its real roots exactly (polsturm). A number field with both a real and a non-real
  embedding is not Galois over Q, so b_1 lies in no abelian field of any conductor.
- This gives a no-abelian-form certificate at 15, 21, 33, 45, 57, 85, 93, 105. It is exact once G_n is accepted. The one numerical
  step is rounding the coefficients to integers, with error 10^-310 or smaller; see the table.

**Correction proposal for CONJECTURES.md R1 (one line):** replace "(also post hoc at conductors up to 24n)" with "(post hoc lindep
at conductors 8n-24n only at 15 and 35; superseded by veins/v23: the exact minimal polynomial of b_1 has non-real roots at 15, 21,
33, 45, 57, 85, 93, 105, so no abelian form exists at any conductor; the abelian composite cases are exactly 9 and 25)".

### (b) The field at each n: findings
Method: KSY25 Prop 4.1 at N = 4n (convention 1, exactly as in proof/cert/cert.gp).
- **Conjugates.** Each class of Cl(-4n) is represented by an equivalent form with gcd(a, 4n) = 1. The value is
  B_s(t_Q - a'b/2), with s running over (Z/n)^*/+-1.
- **Polynomial.** G_n = prod (x - values), rounded to integer coefficients.
- **Negative control.** Convention 2 (twist x0·a') must fail to round.
- Files: v2.gp, theory.gp, run_a/b/c/d_out.txt.

| n | h(-4n) | deg G_n (pred) | rounding error | real roots (pred) | verdict | conv-2 control | sealed |
|---|---|---|---|---|---|---|---|
| 7 (pos. control) | 1 | 3 (3) | 1e-304 | 3 (3) | ABELIAN, inside Q(zeta_28)^+ | identical (x0 = 0), uninformative | HOLDS |
| 11 (null) | 3 | 15 (15) | 1e-337 | 5 (5) | not abelian | fails, as it should | HOLDS |
| 9 | 2 | 6 (6) | 1e-313 | 6 (6) | ABELIAN, Q(b_1) = Q(zeta_36)^+ | fails | HOLDS |
| 15 | 2 | 8 (8) | 1e-310 | 4 (4) | not abelian | fails | HOLDS |
| 21 | 4 | 24 (24) | 1e-378 | 12 (12) | not abelian | fails | HOLDS |
| **25** | 2 | 20 (20) | 1e-370 | 20 (20) | **ABELIAN, Q(b_1) = Q(zeta_100)^+** | fails | HOLDS |
| 27 | 3 | 27 (27) | 1e-402 | 9 (9) | not abelian | fails | HOLDS |
| 33 | 4 | 40 (40) | 1e-479 | 20 (20) | not abelian | fails | HOLDS |
| 45 | 4 | 48 (48) | 1e-585 | 24 (24) | not abelian | fails | HOLDS |
| 49 | 4 | 84 (84) | 1e-846 | 42 (42) | not abelian | fails | HOLDS |
| 57 | 4 | 72 (72*) | 1e-847 | 36 (36*) | not abelian | fails | *formula sealed, value computed after the seal |
| 85 | 4 | 128 (128) | 1e-1777 | 64 (64) | not abelian | fails | HOLDS |
| 93 | 4 | 120 (120) | 1e-1932 | 60 (60) | not abelian | fails | HOLDS |
| 105 | 8 | 192 (192) | 1e-2656 | 48 (48) | not abelian | NOT RUN (20-min cap hit during the control) | HOLDS (control missing) |

Relation to known fields (v2b.gp, v2b_out.txt; n <= 33):

| n | Q(j(sqrt -n)) in Q(b_1) | Q(zeta_n)^+ in Q(b_1) | [Q(b_1) : K(j(sqrt -n), zeta_n)^+] |
|---|---|---|---|
| 7, 9, 25, 27 | yes | yes | 1 |
| 15, 21, 33 | yes | yes | **2** |

So the analogue of "F_p = K(j, zeta_N)^+" (C1) fails at 15, 21 and 33. There the field of b_1 is twice as big. It is the ray
class field of Z[sqrt -n] modulo the ideal (sqrt -n). That field equals K(j, zeta_n) only when H_O and K(zeta_n) are linearly
disjoint over K. At 15, H_O = Q(sqrt -3, sqrt 5) already sits inside Q(zeta_15).

Further observations, all POST HOC (not in the bar):
- Every G_n is monic. |G_n(0)| is a pure power of 2 at every composite n except 15, where b_1 is a unit.
- **Imprimitive pieces** (k not coprime to n) can be abelian when b_1 is not.
  - At 15: b_3 (orbit {3, 6}, degree 4) and b_5 (degree 2) lie in Q(zeta_60)^+.
  - At 25: b_5 (orbit {5, 10}, degree 4) lies in Q(zeta_100)^+.
  - At 9: b_3 (degree 2) lies in Q(zeta_36)^+.
  - This is consistent with the rule: a piece of level n/d sees fewer primes. At 15, b_3 and b_5 each see one prime, so their sign twist is trivial.
  - Caveat: at 15 the conv-2 control is uninformative for b_5 (it also rounds), because the twist is invisible at level 3.
- **Field of all pieces.** b_k with gcd(k, n) = d is a level-(n/d) theta quotient at the same CM point, and its Galois action
  factors through s mod n/d. So Q(b_1, ..., b_{(n-1)/2}) = Q(b_1).

### (c) The rule (derivation on the page; sketch-level at steps 2 and 7)
Setting: n odd; O = Z[sqrt -n]; D = -4n; K = Q(sqrt -n); H_O = ring class field; tau_0 = i sqrt n;
B_k(tau) = (2 theta[k/n](tau) / theta[0](tau))^n; b_k = B_k(tau_0).

1. *Level.*
   - By the triple product, B_k is the n-th power of a Siegel-function ratio g_r/g_s, with r = (k/n + 1/2, 1/2) and s = (1/2, 1/2),
     times 2^n and a root of unity.
   - The Kubert-Lang quadratic conditions hold at N = 4n (and at 2n). At N = 4n: sum m = 0; sum m (N r_1)^2 = 16 n k (k+n), which
     is 0 mod 8n; sum m (N r_1)(N r_2) = 8 k n^2, which is 0 mod 4n.
   - Its q-expansion has rational coefficients, so the matrices [1,0;0,d] act trivially.
   - The operative check is the integrality of G_n at every n, together with the failure of convention 2.
2. *Units of the order act through Z/n.*
   - x = s + t sqrt -n, prime to 4n, acts at tau_0 through g_x = [s, -n t; t, s] (KSY25 §4; v4 key lemma).
   - On theta characteristics, (k/n, 0) g_x = (ks/n, -kt), and -kt is an integer.
   - det g_x = s^2 + n t^2 is odd, so st is even and the denominator theta[0] returns to +-theta[0].
   - The n-th power kills the roots of unity, as in v4's B_k^{g(x)} = B_{tk}. That lemma never uses primality.
   - Hence **x sends b_k to b_{+-ks}**. The action factors through O/(sqrt -n) = Z/n, x -> s mod n. Note (sqrt -n)^2 = 0 there.
3. *The field.*
   - L := K(b_1) is the ray class field of O modulo the ideal (sqrt -n).
   - Gal(L/H_O) = (Z/n)^*/{+-1}, so [L:K] = h(-4n) phi(n)/2. Confirmed by deg G_n at all 14 n.
   - L contains H_O and Q(zeta_n).
4. *Complex conjugation c.*
   - L is c-stable, so L/Q is Galois with group A ⋊ <c>, where A = Gal(L/K), and c Art(a) c = Art(abar).
   - sigma(b_1) is real iff sigma commutes with c, i.e. iff Art(a/abar) is trivial on L.
   - Kani's proof of Weber's Thm 32 is the case L = H_O, where c acts by inversion.
5. *The sign vector.*
   - If [a]^2 != 1, then a/abar already acts non-trivially on H_O.
   - If a^2 = (lambda) with lambda = s + t sqrt -n, then a/abar = (lambda/Na). From N(lambda) = (Na)^2 we get s^2 = (Na)^2 mod n,
     so eps_q := s/Na = +-1 mod each q^e || n.
   - By step 2, Art(a/abar) sends b_1 to b_{s/Na}. This is trivial iff the vector eps(a) = (eps_q)_q is constant.
   - eps is a homomorphism Cl(O)[2] -> {+-1}^{omega(n)}/{+-1}.
   - eps_q is the reduction of a/abar at the ramified prime over q.
6. *Count.* **#real roots of G_n = (phi(n)/2) · #{c in Cl(O)[2] : eps(c) constant}.** It was sealed in this form and matches
   at all 14 n. Q(b_1) is abelian iff G_n is totally real, iff Cl(O) = Cl(O)[2] (n idoneal) and eps = 1.
7. *Evaluating eps.*
   - If n is a prime power, {+-1}^1/{+-1} is trivial, so eps = 1.
   - If n has two distinct primes, take q^e || n and the primitive ambiguous form (q^e, 0, n/q^e).
   - A representing ideal prime to 2n is beta·(q^e, sqrt -n). The ratio beta/betabar is -1 at the ramified prime over q, because
     sqrt -n is a uniformiser there with conjugate -sqrt -n. It is +1 at the other ramified primes.
   - So eps != 1. theory_out.txt computes eps directly from prime representatives at all 13 sealed n, and agrees.
8. **Rule.** For odd n >= 3, the p.206 pieces at q = e^{-pi/sqrt n} generate an abelian field iff n is idoneal and a prime power.
   - Kani Thm 12 (Grube): if n is idoneal and t^2 | n, then t^2 is 1, 4, 9, 16 or 25. If 9 | n, then n is 9, 18, 45 or 72;
     if 25 | n, then n = 25.
   - So the odd idoneal prime powers with exponent >= 2 are 9 and 25. The odd idoneal primes are 3, 5, 7, 13, 37 (C4 list, proved).
   - **The complete list is {3, 5, 7, 9, 13, 25, 37}.** The completeness of Euler's 65 is not needed.
9. *The hints, answered.*
   - Gal(L/K) vs its 2-torsion is not the criterion: at 25, Gal(L/K) has order 20 and is not 2-torsion, yet L/Q is abelian.
     What matters is whether c commutes with all of A.
   - Ramification at the primes dividing n is exactly where eps lives.
   - Maximal vs non-maximal order is irrelevant: 9 and 25 have non-maximal orders and are abelian; 21 has a maximal order (disc -84) and is not. [Correction: an earlier version said "15 has a maximal order"; Z[sqrt -15] has conductor 2 - see C5-proof-v3.md.]

Status: **DERIVED (steps 2 and 7 at sketch level) + CONFIRMED** (14/14 n, exact real-root counts). [Superseded 2026-10-28: proof repaired in C5-proof-v3.md, referee rounds 1-3 -> ACCEPTED WITH FIXES; see CONJECTURES.md C5.]

### Verdicts (scored as sealed)
- P2.1 (integral, degree h(-4n) phi(n)/2, irreducible): **HOLDS** at all 13 sealed n. The convention-2 control failed wherever it
  was informative, and was not run at 105.
- P2.2 (real-root counts and abelian verdicts per the table; 9, 25 abelian; the others not): **HOLDS** 13/13.
- Q(j) ⊂ Q(b_1), and Q(b_1) is strictly larger than Q(zeta_15)^+ at 15: **HOLDS**.
- Vein 2a: the no-abelian-form claim at 85, 93, 105 at any conductor is **CERTIFIED** (non-real roots). R1's wording must be softened.

### Sources
- Kani, "Idoneal numbers and some generalizations", Ann. Sci. Math. Québec 35 (2011) 197-227 (labmath.uqam.ca PDF).
  **OPENED**, text extracted this session:
  - Thm 1: Euler's 65 numbers.
  - Thm 3: square idoneal numbers are 1, 4, 9, 16, 25.
  - Thm 12 (Grube), p. 203.
  - Thm 32 (Weber), pp. 213-214, with its proof that "sigma acts on H by inversion".
  - §5 (generalizations) covers Watson-type and form-valued generalizations. It does **not** cover ray class fields.
- Koo-Shin-Yoon, arXiv:2506.14139, Prop 4.1 and §4. I did not re-open it. **OPENED by the proof seat**, as quoted in
  proof/v5/proof-C3c-C4-v5.1.md §0. Used exactly as in proof/cert/cert.gp.
- One web search for criteria saying when a ray class field of an order is abelian over Q found nothing matching. SNIPPET-level
  only; this is not a prior-art clearance.

### New vs prior art; ceiling; next strike
- **Classical:** Weber's j-criterion (Kani Thm 32), Grube's square-factor theorem, class field theory.
- **New here, after one search:** the sign-vector rule for Ramanujan's theta pieces, and the complete list {3, 5, 7, 9, 13, 25, 37}.
  Also new: the real-root formula, the exact non-abelian certificates, and the observation that imprimitive pieces can be abelian
  when b_1 is not.
- **Ceiling:** it closes the composite-n question cleanly and extends Weber's criterion from j to the dissection pieces. The
  mechanism (does c commute with a ray class group?) is standard once seen. It is a solid lemma-level result, not a revolutionary one.
- **Next strike:**
  - A blind referee on steps 2 and 7.
  - Then a strong-form (sine-product) certificate at 9 and 25, using the proof/cert pipeline with Q(zeta_36)^+ and Q(zeta_100)^+.
  - A prior-art scout on "ray class field of an order modulo sqrt(-n), abelian over Q".

---

## Vein 3

Files: v3.gp, run_v3a_out.txt, run_v3c_out.txt, proot_out.txt.
- **GRH:** bnfinit results for F_23 and F_31 are conditional on GRH. bnfcertify(F_7) = 1 (unconditional). bnfcertify was not tried at 23 or 31.
- **Labelling bug:** run_v3c_out.txt's "12 of 14" at p = 31 was a labelling bug (an absolute tolerance on tiny values). It is fixed,
  and proot_out.txt supersedes it.

| p | [F_p:Q] | signature | unit rank | h(F_p) | rank of <-1, b_1..b_m> | index | factorization | squares null |
|---|---|---|---|---|---|---|---|---|
| 7 | 3 | (3, 0) | 2 | 1 (certified) | 2 = FULL | **28** in O^* | 2^2 · 7 (el. div. 14, 2) | x4 = 2^2, OK |
| 23 | 33 | (11, 11) | 21 | 1 (GRH) | 11, NOT full | 911383246700278 in its saturation | 2 · 11 · 23^10 | x2^11, OK |
| 31 | 45 | (15, 15) | 29 | 1 (GRH) | 15, NOT full | 22708318056623889609630 in its saturation | 2 · 3 · 5 · 31^14 | x2^15, OK |
| 23, in L = F_23(sqrt -23), degree 66 | | | 32 | ? | | **NOT RUN**: bnfinit did not finish in 20 min (RSS ~0.5 GB) | | |
| 31, in L, degree 90 | | | | | | NOT RUN (skipped: larger than the 66 case) | | |

**Further facts:**
- **p = 7, against cyclotomic units.** The cyclotomic units <-1, d_1, d_2> (d_1 = 2cos(pi/7), d_2 = d_1^2 - 1) have index 1 in O^*.
  This is consistent with the Kummer/Sinnott value h^+ = 1, a standard theorem I did not open here. The pieces are exactly
  b_1 = d_1^-2 d_2^6, b_2 = d_1^6 d_2^-4, b_3 = d_1^-4 d_2^-2. So E has index 28 inside the cyclotomic units.
- **Why F_p cannot hold a finite-index subgroup (p = 23, 31).**
  - F_p = L^c, where L = K(b_1) has Galois group A ⋊ <c> over Q.
  - Real embeddings correspond to the elements of A fixed by c. Here those are Gal(L/H_O) = (Z/p)^*/+-1, of order m.
  - So the signature is (m, m(h-1)/2), and only the m conjugates b_1..b_m lie in F_p.
  - The other (h-1)m conjugates lie in L. A finite-index question therefore needs L, which has degree 2hm.
- **p-part of the index (POST HOC, verified).**
  - For every k, b_1^(k^2)/b_k is a p-th power in F_p: 2/2 at 7, 10/10 at 23, 14/14 at 31.
  - The control b_1/b_2 (sum of exponents times k^2 = -3, not 0 mod p) is not a p-th power at all three primes.
  - So u_1^(k^2)/u_k lies in F_p. This is the Kubert-Lang quadratic relation for the p-th roots u_k (q-exponent k^2/p).
  - It accounts for p^(m-1) at 23 and 31. At 7 it accounts for p^(m-2) = 7, because there b_1 b_2 b_3 = 1 cuts the rank to m - 1.
  - The remaining factor is 2·m at 23 and 31 (2·11 and 2·15). At 7 it is 2^2: all b_k are squares there. Pattern only, unexplained.

**Verdicts (as sealed):**
- P3.1 (p = 7: full rank, index 28, h = 1): **HOLDS**.
- P3.2 (F_p not totally real, signature (m, m(h-1)/2), rank exactly m, so the brief's suggested "full rank in F_p" FAILS):
  **HOLDS** at 23 and 31.
- P3.3 (full rank in L; index/h_L has only primes 2, 3, 11, 23): **NOT RUN**.

**Comparison with Oukhaba 2003.**
- ABSTRACT: the paper's abstract was seen in search results. Theorem A is quoted by the gate seat (veins/external-gate-reply.md);
  I did not open it.
- Theorem A measures the full elliptic-unit group in an abelian F/K. Here that F is L, which is out of reach, so no numerical
  comparison was possible. What can be said is the h(F_p) = 1 column and the saturation indices above.

**New vs prior art; ceiling; next strike.**
- The full index is a known type of theorem (Oukhaba; de Shalit-Goren). The index of the orbit subgroup is not found in prior art.
- New here: the signature obstruction, and the exact p^(m-1) explanation via p-th roots of Ramanujan's units.
- Ceiling: small, a structural remark.
- **Next strike:**
  - Compute in L at p = 23 without a full bnfinit. L is the Hilbert class field of Q(zeta_23) (folklore, not opened). Possible
    routes: bnfinit with a lower technical bound, run overnight with the coordinating author's go; or a regulator comparison, since Reg(E_L) is
    exactly computable from the analytic conjugates as a group determinant over Z/3 x Z/11.
  - Then test index/h_L against Oukhaba's trivial factor.

---

## Engine log
- WSL PARI/GP; -s 2G (4G for bnfinit); one gp at a time; every run under 20 min.
- Two runs hit the 20-min cap: the run_c control at 105, and bnfinit(L) at p = 23. Both were killed by timeout, their own processes only.
