# CERT-C4-STRONG: the products-of-sines form of C4 at p = 5, 7, 13, 37
Certificate seat, 2026-10-27. Internal; not for release. Engine: PARI/GP (WSL), every run under 2 GB stack and under 1 minute.
Builds on proof/proof-C1-C3-v4.md (v4) and proof/v5/proof-C3c-C4-v5.1.md (v5.1); notation as there.

## In plain words
At the four primes where it can happen, each piece b_k is now pinned down **exactly** as a product of sines (times a power of 2
and of p). The method has two halves that do not lean on each other.
- **Analytic half.** We compute every algebraic "twin" (conjugate) of b_1 straight from theta series. For p = 5, 13, 37 this
  includes the twins that live at a second special point. That point comes from the published Galois formula (Koo–Shin–Yoon 2025,
  Prop 4.1). Multiplying out (x − twin) over all twins must give whole-number coefficients. It does, to 2,400–3,000 digits.
- **Exact half.** We build the sine product exactly, inside the cyclotomic number field, and check by exact algebra that it is a
  root of that whole-number polynomial. Its numerical value agrees with b_1 to about 3,000 digits. Two different roots of the
  polynomial are never closer than 10^-51. So the product cannot be any root other than b_1, and the identity holds exactly.

A bonus: with **all** the sines 2 sin(πj/N), 0 < j < N/2, allowed, b_1 itself (not just a power of it) is such a product, at all
four primes. The same holds for every b_k, by the Galois rule. At p = 7 the certificate reproduces the known septic forms exactly.
At the control prime p = 11 (class number 3), the analytic polynomial is again integral. But its field is not Galois, hence not
abelian, so no sine product can exist there.

How solid is it? **STATUS UPDATE 2026-10-28: rigorous (ball arithmetic) at all four primes.** The algebra was always exact.
The analytic half has now been redone inside guaranteed error balls (vectors/v5_method/stepd, sealed bar BAR-D1, every item held;
see "Status update" at the end). Each identity now rests on four things: Theorem M of vectors/v5_method/RESULT-M1.md (not yet
refereed), the cited published theorems, and the correctness of the Arb and FLINT libraries. The original floating-point run below
(the "certified numerics" verdicts) is kept as written. The details are in "What it rests on".

| p | N | exact identity certified | degree | max coeff. digits | rounding error | min separation | agreement with b_1 | verdict |
|---|---|---|---|---|---|---|---|---|
| 7 | 7 | b_1 = 7^3 / (s_1^10 s_2^8) = d_2^6/d_1^2 (and b_2, b_3: Rebák forms) | 3 | 2 | 10^-3001 | 10^0.1 | 10^-3001 | **CERTIFIED** |
| 5 | 20 | b_1^2 = 2^5 s_2^4/(s_1^2 s_3^4); also b_1 = 4 s_4 s_5/(s_1 s_3^2 s_6 s_8) | 4 | 4 | 10^-2999 | 10^0.6 | 10^-3002 | **CERTIFIED** |
| 13 | 52 | b_1^6 = 2^39 13^7 Π s_j^{C_j} (e_mult form); also b_1 = 2^5 13^-1 Π s_j^{n_j} | 12 | 40 | 10^-2962 | 10^-5.1 | 10^-2999 | **CERTIFIED** |
| 37 | 148 | b_1^4 = 2^74 37^-5 Π s_j^{-e_j} (e_mult form); also b_1 = 2^15 37^-1 Π s_j^{n_j} | 36 | 518 | 10^-2483 | 10^-50.6 | 10^-2968 | **CERTIFIED** (certified numerics) |
| 11 (neg. control) | — | none can exist: Q(b_1) has 5 automorphisms, degree 15 | 15 | 27 | 10^-1473 | 10^-3.0 | — | control PASSES |

Here s_j = 2 sin(πj/N) and d_j = sin((j+1)π/7)/sin(π/7). All verdicts are "certified numerics" (see below). The full exponent vectors
are in §3.

---

## 1. Method (per prime)
Notation: m = (p−1)/2, τ_0 = i√p, B_m(τ) = (2θ[m/p](τ)/θ[0](τ))^p, θ[a](τ) = Σ_n exp(πiτ(n+a)^2) (v4 §1). Then b_k = B_k(τ_0)
exactly (v4 Lemma 1, first line of the proof). θ = 2cos(2π/N) generates Q(ζ_N)^+, and ι denotes the real embedding θ ↦ 2cos(2π/N).

**Step A (analytic conjugates).**
- *Principal class* (1, 0, p): the values b_1, ..., b_m. These form the orbit of b_1 under Gal(L/H_O), by v4 Prop 4 (via KSY25 Prop 5.1).
- *Second class* (h = 2; p ≡ 1 mod 4): the reduced form is (2, 2, (p+1)/2). KSY25 Prop 4.1 needs gcd(a, N) = 1. So I use the
  SL2(Z)-equivalent form Q = ((p+1)/2, −2, 2), via (x, y) ↦ (−y, x). Its a = (p+1)/2 is odd and prime to p.
  - Prop 4.1 at N = 4p reads σ_[Q](f(τ_O)) = f^{[1, −a′(b+b_O)/2; 0, a′]}(−conj ω_Q), with ω_Q = (−b+√D)/(2a), aa′ ≡ 1 (mod N),
    and b_O = 0 since D ≡ 0 mod 4.
  - **Reduction to a translation (derived here).** B_k has a q^{1/(2p)}-expansion with rational-integer coefficients (v4 Lemma 2
    step 1). By the KSY25 §4 rule f^{diag(1,d)} = Σ c_n^{σ_d} q^{n/N}, diag(1,d) therefore fixes B_k. Write
    [1, x; 0, a′] = diag(1, a′)·T^x = T^{x a}·diag(1, a′) (mod N), with T = [1,1;0,1].
    - In the first factorisation, diag(1, a′) acts first and fixes B_k, and then T^x gives B_k(τ + x).
    - In the second, B_k(τ + xa) = Σ c_n ζ_N^{n x a} q^{n/N}, and applying σ_{a′} gives Σ c_n ζ_N^{n x a a′} q^{n/N} = B_k(τ + x).
    So both composition orders give **σ_Q(b_k) = B_k(t_Q + x)**, with t_Q = (b + √D)/(2a) = (−1 + i√p)/a and x = −a′b/2 = a′.
    (KSY25 does not fix the order; my reading of §4 confirms that it states none.)
  - The two other "readings", x·a′ and x·a, were run as negative controls (conventions 2 and 3 in the outputs).
- *All of them.* The orbit of b_1 under Gal(L/K) is {b_k} ∪ {σ_Q(b_k)}, because [H_O : K] = 2 and σ_Q is non-trivial on H_O: it sends
  j(τ_0) to j(t_Q) ≠ j(τ_0) (Lemma B of v5.1). Complex conjugation fixes the real number b_1, and L/Q is Galois with group
  Gal(L/K) ⋊ ⟨c⟩ (KSY25 Lemma 7.3, opened in v5.1). So the Q-orbit equals the K-orbit.

**Step B (integer polynomial).** G = Π (x − v) over the h(p−1)/2 analytic values. It must round to Z[x] and be monic, because b_1 is an
algebraic integer (v4 C3a). The values are pairwise distinct, with the separations listed in the table, so G is the minimal
polynomial of b_1. In particular **Q(b_1) = F_p** at these primes, since deg G = [F_p : Q]. (v5.1 left this open in general.)

**Step C (exact candidate).** R := 2^A p^B Π_j S_j^{C_j/2}, with S_j = s_j^2 = 2 − 2cos(2πj/N) ∈ Z[θ] (all C_j are even).
- c_1 is the root of x^E − R in Q(θ) (nfroots) whose ι-value is nearest b_1.
- **Exact check: G(c_1) = 0 in Q(θ)**, by polmod arithmetic.

**Step D (conclusion).**
- ι(c_1) is a real root of G, within 10^-2956 of b_1.
- Distinct roots of G are at least 10^-50.6 apart.
- Hence ι(c_1) = b_1, and b_1^E = ι(R) is the sine-product identity.
- Applying σ_a (ζ_N ↦ ζ_N^a) to c_1 hits **every** analytic conjugate exactly once, each within 10^-2956. That gives exact forms for
  all b_k (§3) and agrees with the C2 rule (extra_out.txt: 3 + 2 + 6 + 18 checks, 0 mismatches).

**Step D′ (independent gap argument; uses the analytic conjugates only for an upper bound).**
- b_1 ∈ F_p = Q(ζ_N)^+ (v5.1 §1.6), and b_1 is an algebraic integer (C3a).
- c_1 is an algebraic integer, since it is a root of the exact monic G.
- If δ = b_1 − ι(c_1) ≠ 0, then |N(δ)| ≥ 1. That forces |δ| ≥ (H_b + H_c)^{−(d−1)}, where H_b and H_c are the largest absolute
  conjugates of b_1 and of c_1.
- Thresholds: 10^-3.8 (p = 7), 10^-6.7 (5), 10^-90.9 (13), 10^-1353.0 (37).
- Observed |δ| is about 10^-3000, so δ = 0. Unlike Step D, this argument does not need the conjugate set to be exactly right. It
  needs it only as a bound on the sizes.

**Step E (smallest power; minexp.gp).**
- Generators: 2, p, and every s_j with 0 < j < N/2.
- LLL on the log-embedding matrix (36 embeddings at p = 37) finds the integer relations.
- The smallest exponent of b_1 in any relation is **E = 1 at all four primes**.
- Each relation b_1 = 2^a p^b Π s_j^{n_j} is checked **exactly** as c_1^2 = 4^a p^{2b} Π S_j^{n_j} in Q(θ). The sign follows because
  both sides are positive under ι.
- The relations are not unique: the sines satisfy their own multiplicative relations. The vectors printed are just the ones LLL found.

## 2. What the certificate rests on
1. **Exact definitions:** b_k = B_k(τ_0) (v4 Lemma 1, exact series identity).
2. **Proved results used as inputs:** b_1 is an algebraic integer (v4 C3a); the Gal(L/H_O)-orbit is {b_k} (v4 Prop 4, from
   KSY25 Prop 5.1); F_p = Q(ζ_{4p})^+ or Q(ζ_7)^+ (v5.1 §1.6; used only in Step D′).
3. **KSY25 Prop 4.1 at N = 4p** (for p = 5, 13, 37 only; p = 7 has h = 1 and does not use it).
   - Opened in v5.1 and re-opened by me: arXiv:2506.14139v1 HTML, §3 and §4.
   - Locators: the forms set Q(D, N) requires "gcd(a, N) = 1"; Prop 4.1 has "a′ ∈ Z satisfies aa′ ≡ 1 (mod N)"; the bar is complex conjugation.
   - §4 defines f^α for SL2 elements, f^α = f∘α̃, and for diag(1, d), via σ_d on the coefficients. It states no composition order;
     §1 Step A shows the order does not matter for B_k.
   - The proof of Prop 4.1 is cited there to its [13, Thm 12.3], which I did not open (inherited gap, as in v5.1).
   - **Self-check:** with the derived translation, the polynomial is integral to 10^-2483 or better. Both wrong readings give
     coefficients that miss integers by 10^0 to 10^544 (p = 5: errors 10^4 and 10^5; p = 13: 10^41 and 10^44; p = 37: 10^517 and
     10^539), with conjugates far from real.
4. **Numerics (trusted, not interval-certified):**
   - PARI/GP multiprecision floating point at 3000 significant digits (1500 for p = 11).
   - Theta sums are truncated at |n| ≤ ⌈√((prec+40) ln 10/(π Im τ))⌉ + 3. Every omitted term is below 10^-(prec+40), with a Gaussian
     (faster than geometric) tail, so the truncation error is rigorously below 10^-(prec+39).
   - Floating-point round-off is **not** rigorously bounded. The margins make an undetected error implausible: about 2,400 digits
     against the < 1/2 needed for rounding, and about 2,900 digits against half the separation, or 1,600 digits against the gap of
     Step D′.
   - This is why the verdict is "certified numerics", not "rigorous".
5. **Exact algebra (trusted software):** nfroots, polmod arithmetic in Z[t]/(minpoly of 2cos(2π/N)), and polisirreducible, all in PARI/GP.
6. **Hidden assumption check:** the e_mult relations were found numerically and are used only to *propose* c_1. Nothing in Steps
   B–D′ trusts them.

Precision rule (working precision > 2 × basis size × coefficient digits): no integer-relation search is used to certify. Steps B–D
round a product of conjugates, so 3000 digits against at most 518-digit coefficients is ample. The one LLL step (Step E, the
minimal exponent) only proposes; the exact check certifies. Its "no smaller E" is moot, since E = 1.

## 3. Per-prime results (outputs: run_small_out.txt, run_37_out.txt, run_11_out.txt, extra_out.txt, minexp_out.txt)

### p = 7 (positive control; h(−28) = 1, N = 7, s_j = 2 sin(πj/7))
- G = x^3 − 41x^2 + 54x − 1, irreducible. The constant term −1 means b_1 is a unit, as C3c predicts for p ≡ 7 mod 8.
- c_1 = 8θ^2 + 17θ + 6 = 7^3 s_1^-10 s_2^-8, and G(c_1) = 0 exactly. ι(c_1) − b_1 is about 10^-3001.
- **Rebák septic forms, reproduced exactly:**
  - c_1 = S_3^3/(S_1^2 S_2), i.e. b_1 = d_2^6/d_1^2, as an exact identity in Q(θ).
  - b_2 = d_1^6/d_2^4 and b_3 = d_1^-4 d_2^-2, each to 10^-3004 or better.
- Galois: σ_3(c_1) ↔ b_2 and σ_2(c_1) ↔ b_3.
- Smallest form: b_1 = s_1^-4 s_2^-2 s_3^6 (= d_2^6/d_1^2).
- **CERTIFIED.**

### p = 5 (h(−20) = 2, N = 20, s_j = 2 sin(πj/20))
- Second form (2, 2, 3) is used as (3, −2, 2), with a′ = 7 and t_Q = (−1 + i√5)/3 + 7.
- G = x^4 + 72x^3 − 1056x^2 + 3328x − 1024. The constant term 2^10 matches the C3c norm 2^{p h (p−1)/4}.
- c_1 = −16θ^3 + 20θ^2 + 60θ − 68, with c_1^2 = R = 2^5 S_2^2/(S_1 S_3^2). G(c_1) = 0 exactly; agreement 10^-3002.
- Galois: a = 9 ↦ b_2; a = 7, 3 ↦ σ_Q(b_1), σ_Q(b_2).
- **Exact identities:**
  - b_1^2 = 2^5 s_2^4/(s_1^2 s_3^4);
  - b_1 = 4 s_4 s_5/(s_1 s_3^2 s_6 s_8);
  - b_2 = the same with j ↦ 9j mod 20 inside |sin|.
- **CERTIFIED.**

### p = 13 (h(−52) = 2, N = 52, s_j = 2 sin(πj/52))
- Second form (7, −2, 2), with a′ = 15.
- G has degree 12 and 40-digit coefficients, and is irreducible. The constant term is 2^78 (C3c).
- c_1 = 9731968θ^11 − 12976704θ^10 − ... + 70323008 (in run_small_out.txt) satisfies c_1^6 = R and G(c_1) = 0. Agreement 10^-2999.
- **Exact identities:**
  - b_1^6 = 2^39·13^7·s_2^50/(s_1^6 s_3^24 s_4^40 s_5^30 s_6^8 s_7^12 s_8^44 s_9^18 s_10^58 s_11^36);
  - b_1 = 2^5·13^-1·Π_{j=1}^{25} s_j^{n_j}, with
    n = (1, 3, −2, 2, −4, 0, −2, 2, 0, −4, −3, 1, 3, 0, 3, 5, 3, 3, 0, 1, 1, −2, 2, 1, 2).
- **All k:** b_k = 2^5·13^-1·Π_j |2 sin(π a_k j/52)|^{n_j}, with a_k = 1, 17, 9, 23, 25, 3 for k = 1..6. These agree with C2.
- **CERTIFIED.**

### p = 37 (h(−148) = 2, N = 148, s_j = 2 sin(πj/148))
- Second form (19, −2, 2), with a′ = 39.
- G has degree 36 and coefficients of up to 518 digits; it is monic and irreducible. The constant term is 2^666 (C3c).
- Minimum root separation: 10^-50.6.
- c_1 (1779 characters) satisfies c_1^4 = R and G(c_1) = 0. Agreement 10^-2968; the Step D′ threshold is 10^-1353.
- **Exact identities:**
  - b_1^4 = 2^74·37^-5·Π_{j=1}^{35} s_j^{-e_j}, with e = (4, −62, 48, 12, −60, 48, −64, 46, −16, 174, 40, −70, 68, 152, 20, −74,
    52, 2, 8, −28, −28, 80, −32, 58, 12, 130, −44, −146, 56, 174, 24, 22, 36, 110, 72);
  - b_1 = 2^15·37^-1·Π_{j=1}^{73} s_j^{n_j}, with n = (3, 9, −4, 4, 3, 6, 9, 1, 2, −7, −4, −1, −10, 8, −3, 6, −7, 1, 0, −8, 8, 5, 6,
    −1, 6, −5, 12, −1, −7, −3, −2, −1, 3, −6, −13, 4, 7, 2, 5, 17, 12, 10, 4, 11, 7, 4, 1, 12, 9, 13, −2, −4, 1, 9, 2, −3, 6, −1, 2,
    −4, 7, 4, 6, 13, −2, 6, −7, −2, −12, 0, 8, −7, 4).
- **All k:** b_k = (same) with |2 sin(π a_k j/148)|, where
  a_k = 1, 41, 9, 53, 25, 73, 49, 47, 67, 11, 27, 33, 21, 63, 71, 3, 7, 65 for k = 1..18.
- **CERTIFIED** (certified numerics).

### p = 11 (negative control; h(−44) = 3)
- Forms (1, 0, 11), (3, ±2, 4), with a = 3 prime to 44 and a′ = 15.
- G has degree 15, rounding error 10^-1473, 27-digit coefficients, and is irreducible. The constant term is −2^55, matching C3b
  (e = p h (p−1)/6 = 55).
- The wrong conventions fail, with error 10^0.
- polredbest gives a degree-15 field with only **5 automorphisms**: not Galois over Q, hence not abelian. Its field discriminant is
  −2^10·11^13.
- It contains Q(j(√−11)) (polclass(−44), Galois group S3).
- So b_1 lies in no cyclotomic field, and no sine-product form exists. This agrees with C4 (abelian form, v5.1) and with
  e_mult_out.txt ("NO multiplicative relation").
- **Control PASSES.**

## 4. Surprises and notes
- **E = 1 everywhere.** The e_mult exponents 2, 6, 4 at p = 5, 13, 37 came from the greedy generator choice. With all s_j, 0 < j < N/2,
  allowed (the omitted ones include s_{N/4} = √2), each b_k is itself a product of sines times 2^a p^b, with a = 2, 5, 15 and b = 0, −1, −1.
- At p = 37 two conjugates of b_1 are only 10^-50.6 apart. This is still far above the 10^-2956 matching error.
- In Step E the LLL kernel came out one short of the expected dimension at every prime. The cause is probably the duplicate column
  s_{N/2} = 2, or a numerical-rank artefact. It does not matter: E = 1 is the minimum possible, and each relation is checked exactly.
- By-product: Q(b_1) = F_p at p = 5, 7, 11, 13, 37 (deg G = h(p−1)/2), in certified numerics.

## 5. Files (proof/cert/)
- `cert.gp`: library and certificate function.
- `run_small.gp` / `run_small_out.txt`: p = 7 with the Rebák control, then p = 5, 13.
- `run_37.gp` / `run_37_out.txt`.
- `run_11.gp` / `run_11_out.txt`: negative control.
- `extra.gp` / `extra_out.txt`: norms against C3b/C3c, and C2 against the Galois matching.
- `minexp.gp` / `minexp_out.txt`: smallest exponent and E = 1 forms, exact checks.

Run with `gp -q -s 2G <file>` in this folder. Each run takes under 30 s.

## Status line for CONJECTURES.md (suggested; not applied)
C4 strong form at p ∈ {5, 7, 13, 37}: CERTIFIED (certified numerics). Every b_k is 2^a p^b Π (2 sin(πj/N))^{n_j} with N = 4p (N = 7 at
p = 7). The conjugates were computed analytically (KSY25 Prop 4.1 at N = 4p), the minimal polynomial is integral to at least 2,400
digits, and the membership is exact in Q(ζ_N)^+. It is not interval-rigorous, and the proof of KSY25 Prop 4.1 is inherited and unopened.

## Status update 2026-10-28: Step D rigorous (ball arithmetic) at p = 5, 7, 13, 37
Seat: vector 5. Sealed bar vectors/v5_method/stepd/BAR-D1.md (sha256 2b45878d...). Run: stepd/stepd_out.txt. All items held at
all four primes, total run time 0.4 s.

**The analytic half, now enclosed.**
- G_p is re-certified by Theorem M with Arb balls (certmin.py v1.2, at 2x the certified precision). It is identical to the
  floating-point G_p of this file.
- The conjugate balls are pairwise disjoint.

**Exact checks (FLINT).**
- The minimal polynomial of 2cos(2π/N) satisfies x^deg P(x+1/x) = Φ_N(x).
- G_p(c_1) = 0.
- c_1^E = 2^A p^B Π S_j^{C_j/2}.
- c_1^2 = 4^a p^{2b} Π S_j^{n_j}, the E = 1 forms of §3.
- At p = 7, b_2^2 and b_3^2 equal the Rebák forms.

**Isolation.**
- The Arb ball of ι(c_1) meets the ball of b_1 and no other conjugate ball. So ι(c_1) = b_1.
- Signs are certified positive.
- Every σ_a(c_1) lands in exactly one conjugate ball, bijectively.
- The principal a_k agree with §3: p = 13 gives 1, 17, 9, 23, 25, 3; p = 37 gives the listed 18; p = 7 gives b_2 ← σ_3 and
  b_3 ← σ_2.

**What it rests on now.**
- Theorem M and Lemma R (vectors/v5_method/RESULT-M1.md; unrefereed).
- The inputs listed in §2, items 1–3.
- The correctness of Arb and FLINT.

§2 item 4 ("floating-point round-off is not rigorously bounded") no longer applies to the verdicts. PARI is used only to *propose*
c_1 (stepd/expc1.gp); every property of c_1 is verified independently. **Verdict at 5, 7, 13, 37: RIGOROUS (ball arithmetic).**
The control at p = 11 is unchanged.
