# RESULT-M1: the fast method is a theorem, and G_p is now certified by ball arithmetic
Vector 5 (method seat), 2026-10-28. Internal; not for release. Folder: vectors/v5_method/. Builds on proof/proof-C1-C3-v4.md (v4),
proof/v5/proof-C3c-C4-v5.1.md (v5.1), proof/cert/CERT-C4-STRONG.md and veins/v4_fast/fastmin.gp; notation as there.

## In plain words
The "fast method" makes the minimal polynomial G_p of b_1 like this. It computes every algebraic twin (conjugate) of b_1 from theta
series at a few special points, one point per reduced quadratic form of discriminant -4p. It multiplies out the product of (x - twin)
and rounds the coefficients to whole numbers. Two things were missing:
1. a proof that those numbers really are all the twins, each counted once;
2. a proof that the rounding is right, rather than trusted floating point.

Both are now done.
- **Theorem M** (below) proves, for every prime p >= 5, that the computed numbers are exactly the twins of b_1, one for each way of
  embedding the field F_p in the complex numbers. So their product is an integer polynomial: a power G_p^l of the minimal polynomial.
  When the computed numbers are all different, l = 1. Then G_p is the product itself, and b_1 alone generates F_p (a question v5.1
  had left open).
- **The new algorithm** (`certmin.py`) does the same arithmetic with error balls (Arb, through python-flint). The theta tails are
  bounded on paper and added to the balls. A coefficient is accepted only when its ball holds exactly one integer.
- **Results.** Each of the 19 floating-point polynomials on disk (every p from 5 to 97 except 7, 47, 61, 67) and the known p = 7 cubic came back identical, digit for digit. All conjugates
  were provably distinct. The wrong reading of the published Galois formula was provably non-integral every time it differed from
  the right one. The run took seconds per prime; the largest, p = 89 (degree 528), took under 10 minutes (584 s).
- **One slip, mine.** At p = 37 the sealed run printed "not identical". The disk file holds the same polynomial twice, and my
  comparison code glued the two copies together. Each copy on its own matches; this is logged as an instrument fault.
- **New side fact, now proved at those primes:** Q(b_1) = F_p.
- **Ceiling.** This is rigour and housekeeping, not a discovery. It turns "certified numerics" into proofs that rest on ball
  arithmetic and on the cited theorems.

---

## 1. Theorem M (every prime p >= 5)
Setting (v4 §1, v5.1 §0): D = -4p, N = 4p, m = (p-1)/2, tau_0 = i sqrt p, K = Q(sqrt -p), O = Z[sqrt -p], L = K_{O,N},
H_O = K(j(tau_0)), M = H_O(zeta_p), F_p = M ∩ R, h = h(-4p).
B_k(tau) = (2 theta[k/p](tau)/theta[0](tau))^p, theta[a](tau) = Σ_n exp(pi i tau (n+a)^2), b_k = B_k(tau_0).

**Data.** For each reduced primitive form Q_0 = (a_0, b_0, c_0) of discriminant D, as defined in KSY25 Rem 3.2(i):
- Put Q = (a, b, c) := Q_0 if a_0 is odd. If a_0 is even, put Q := (c_0, -b_0, a_0), which is properly equivalent via (x, y) -> (-y, x).
- Let a' satisfy a a' ≡ 1 (mod N), and put x_Q := -a' b/2 ∈ Z and t_Q := (b + 2i sqrt p)/(2a).
- Finally v_{Q,k} := B_k(t_Q + x_Q), for 1 <= k <= m.
This is exactly `conjs(p, 1)` of proof/cert/cert.gp and `points(p, 1)` of certmin.py.

**Theorem M.**
- (i) The hm pairs (Q, k) correspond bijectively to the field embeddings tau: F_p -> C, with v_{Q,k} = tau(b_1). Here
  hm = [F_p : Q] (v4 C1).
- (ii) chi_p(x) := Π_{Q,k} (x - v_{Q,k}) lies in Z[x], is monic, and chi_p = G_p^l, where G_p is the minimal polynomial of b_1 and
  l = [F_p : Q(b_1)].
- (iii) The following are equivalent: the v_{Q,k} are pairwise distinct; chi_p is squarefree; l = 1, i.e. chi_p = G_p and
  Q(b_1) = F_p.

### Lemma S (the data is well defined; heights)
- (a) b is even, and gcd(a, N) = 1.
- (b) Im(t_Q) = sqrt p / a. It equals sqrt p for the principal form (1, 0, p). It lies in [sqrt3/2, sqrt p/2] for an unswapped
  Q_0 ≠ (1, 0, p) (v5.1 Lemma B′). It is at least 2 sqrt p/(p+1) for a swapped one.
- (c) t_Q = t_{Q_0} if Q is unswapped, and t_Q = -1/t_{Q_0} if it is swapped.

*Proof.*
- (a) b^2 ≡ D ≡ 0 (mod 4), so b is even. Also a_0 <= sqrt(4p/3) < p (Rem 3.2(i)), so p ∤ a_0; hence an odd a_0 is prime to 4p. Now let a_0 be even.
  - c_0 is odd: otherwise a_0, b_0, c_0 would all be even, and Q_0 would not be primitive.
  - p ∤ c_0: if p | c_0, then a_0 c_0 = b_0^2/4 + p gives p | (b_0/2)^2. Since |b_0| <= a_0 < p, this forces b_0 = 0, so a_0 c_0 = p and a_0 = 1. That is not even.
  - So gcd(c_0, 4p) = 1.
- (b) Swapped case: c_0 = (b_0^2/4 + p)/a_0 <= a_0/4 + p/a_0. On 2 <= a_0 <= sqrt(4p/3) this is convex in a_0, with values (p+1)/2 at a_0 = 2
  and (2/sqrt3) sqrt p <= (p+1)/2 at the right end. So c_0 <= (p+1)/2.
- (c) -1/t_{Q_0} = -2a_0/(b_0 + sqrt D) = -2a_0(b_0 - sqrt D)/(4a_0c_0) = (-b_0 + sqrt D)/(2c_0) = t_Q. ∎

Note for the brief: the swapped points do **not** satisfy Im >= sqrt3/2. At p = 5, 13, 37 the swapped point (2, 2, (p+1)/2) attains the
bound 2 sqrt p/(p+1) exactly, which is 0.745, 0.515 and 0.320. The truncation lemma below therefore uses the actual Im of each point.

### Lemma R (the KSY25 twist acts on B_k as the translation by x_Q; derived here)
[KSY25] §4: a lift γ̃ ∈ SL2(Z) of γ ∈ SL2(Z/N) acts by f^γ = f∘γ̃, and diag(1, d) acts on q-expansion coefficients through
σ_d: zeta_N -> zeta_N^d. A re-fetch of the arXiv HTML on 2026-10-28 confirms that §4 states **no** composition order.

**(a) The action is a right action**, f^{αβ} = (f^α)^β.
- On SL2 the rule gives (f^{γ1})^{γ2}(τ) = f(γ̃1γ̃2 τ) = f^{γ1γ2}(τ).
- A left action would instead require f^{γ1γ2} = f∘(γ̃2γ̃1) for all f ∈ F_N. The action of GL2(Z/N)/{±1} on F_N is faithful: it is
  the Galois group of F_N/F_1 (KSY10 Prop 2.1, opened in v4). Take γ1 = S, γ2 = T, for which γ1γ2 ≠ ±γ2γ1 (mod N). Some f then
  separates f∘(S̃T̃) from f∘(T̃S̃), so a left action is impossible.

**(b) The twist is a translation.** α_Q := [1, x_Q; 0, a'] = diag(1, a')·T^{x_Q}. B_k has rational-integer q^{1/(2p)}-coefficients
(v4 Lemma 2 step 1), so diag(1, a') fixes it. Hence B_k^{α_Q} = (B_k^{diag(1,a')})^{T^{x_Q}} = B_k(τ + x_Q).

**(c) Consistency check.** The other factorisation α_Q = T^{x_Q a}·diag(1, a') gives the same answer: B_k(τ + x_Q a) = Σ c_n zeta_N^{n x_Q a} q^{n/N},
and σ_{a'} turns this into Σ c_n zeta_N^{n x_Q} q^{n/N} = B_k(τ + x_Q).

**(d) Why the controls fail.** The left-action readings give B_k(τ + x_Q a') ("convention 2") or B_k(τ + x_Q a) ("convention 3").
These are the negative controls. Below, convention 2 is *certified* non-integral at every prime where it differs. ∎

### Proof of Theorem M
1. **σ_Q.** Q is primitive, positive definite, of discriminant D, with gcd(a, N) = 1, so Q ∈ Q(D, N) ([KSY25] §3). Write
   τ_O = τ_0, b_O = 0 and τ_Q = (-b + sqrt D)/(2a), so -conj(τ_Q) = (b + sqrt D)/(2a) = t_Q (with sqrt D = 2i sqrt p).
   - [KSY25] Prop 4.1 at N = 4p (opened in v5.1 and CERT-C4-STRONG; isomorphism C_N(D) -> Gal(K_{O,N}/K)) gives σ_Q ∈ Gal(L/K) with
     σ_Q(f(τ_0)) = f^{α_Q}(t_Q) for every f ∈ F_N finite at τ_0.
   - B_k ∈ F_N and is holomorphic on H (v4 Lemma 2). So by Lemma R, **σ_Q(b_k) = B_k(t_Q + x_Q) = v_{Q,k}**.
2. **Restriction to H_O.**
   - j ∈ F_1 ⊂ F_N has rational coefficients and is SL2(Z)-invariant, so j^{α_Q} = j and σ_Q(j(τ_0)) = j(t_Q).
   - By Lemma S(c) and j(-1/τ) = j(τ), this equals j(t_{Q_0}).
   - By v5.1 Lemma B (KSY25 Prop 4.1 at N = 1 and Rem 3.2(i)), these h values are pairwise distinct. So the restrictions σ_Q|H_O are the
     h distinct elements of Gal(H_O/K), because H_O = K(j(τ_0)) (v4 C1 step 1).
3. **Gal(M/K).**
   - M ⊂ L (v4 Prop 4). M/K is Galois, as the compositum of H_O and K(zeta_p).
   - By v4 C1 step 4 and Lemma 4′, |Gal(M/H_O)| = m, and ρ -> ρ(b_1) is a bijection Gal(M/H_O) -> {b_1, ..., b_m}. Write ρ_k(b_1) = b_k.
   - By step 2 the cosets σ_Q|M · Gal(M/H_O) are distinct. Since [M:K] = hm, they exhaust Gal(M/K).
   - So σ -> σ(b_1) on Gal(M/K) takes the values σ_Q ρ_k(b_1) = v_{Q,k}, with each (Q, k) arising from exactly one σ.
4. **Embeddings of F_p.**
   - M = F_p(sqrt -p) = F_p·K with F_p ∩ K = Q (F_p is real, sqrt -p is not).
   - Restriction Gal(M/K) -> Hom(F_p, C) is injective: σ is fixed by its values on F_p and on K.
   - Both sides have hm = [F_p : Q] elements, so restriction is a bijection. This proves (i). (Lemma 7.3 of [KSY25], that L/Q is
     Galois with group Gal(L/K) ⋊ <c>, is not needed beyond this.)
5. **Integrality and l.**
   - b_1 is an algebraic integer (v4 C3a), so G_p ∈ Z[x] is monic.
   - The characteristic polynomial of b_1 for F_p/Q is Π over Hom(F_p, C) of (x - τ(b_1)) = G_p^l, with l = [F_p : Q(b_1)]. By (i)
     this is chi_p. That proves (ii).
   - Every root of G_p^l has multiplicity exactly l. So the v are distinct ⟺ chi_p is squarefree ⟺ l = 1. That proves (iii). ∎

**Relation to the literature.** [KSY25] Thm 7.5 (re-fetched 2026-10-28) gives a general recipe for the irreducible polynomial of
f(τ_O) over Q: a product p(x) built from the extended form class group, with p(x) = irr(f(τ_O), Q)^l, taking "the unique monic
irreducible factor". Theorem M is that mechanism specialised to f = B_1, with four things made explicit:
- one point per reduced form (h points, not the whole of C_N(D));
- the twist as an integer translation (Lemma R);
- l = [F_p : Q(b_1)];
- bounds that make the rounding rigorous (§2).

It is a specialisation, not a new principle.

## 2. Rigorous bounds

**Lemma T (theta tail).** Let 0 <= α <= 1/2, Im τ = y > 0, M >= 0 an integer, and T = M + 1/2. Then
  |θ[α](τ) - Σ_{|n|<=M} exp(πiτ(n+α)^2)| <= 2 e^{-πyT^2} / (1 - e^{-2πyT}).
*Proof.* Each omitted term has modulus e^{-πy(n+α)^2}.
- For n >= M+1: n + α >= M + 1 > T.
- For n <= -M-1: |n + α| >= M + 1 - α >= T.
- On each side the values of |n + α| are spaced by 1, so each side is at most Σ_{j>=0} e^{-πy(T+j)^2} <= e^{-πyT^2} Σ_j e^{-2πyTj},
  using (T+j)^2 >= T^2 + 2Tj. ∎

certmin.py takes M = ⌈sqrt((W+30) ln 2/(π y))⌉ + 1, so the tail is below 2^{-W-30}. It adds the Lemma T bound, computed in Arb and
rounded up, as an error disc to every theta sum. The smallest y used: 0.745 (p = 5), 0.320 (37), 0.256 (59 bound; actual 0.512), and
2 sqrt p/(p+1) in general (Lemma S). At p = 59, W = 10777 bits, this means about 130 terms per side.

**Lemma Z (θ[0] has no zeros; lower bound).** With s = e^{-πy}:
  |θ[0](τ)| >= Π_{n>=1}(1 - s^{2n})(1 - s^{2n-1})^2 >= L(y) := (Π_{j>=1}(1 - s^j))^2 > 0.
*Proof.*
- The triple product ([Wiki-JTP], v5.1 Lemma A step 2, a = 0) gives θ[0] = Π(1 - q^n)(1 + q^{n-1/2})^2, with |q| = s^2.
- Use |1 ± z| >= 1 - |z|.
- The odd-index product is at least the full product, since every factor lies in (0, 1).
- In the code, L(y) is computed as the product up to J = 400 times the tail factor 1 - s^{J+1}/(1-s) (Weierstrass inequality). ∎

**Lemma H (a-priori bound on the coefficients of G_p).** For every computed value:
  |v_{Q,k}| <= U(y_Q) := (2(2 + y_Q^{-1/2}) / L(y_Q))^p.
This uses |θ[α](τ)| <= Σ_n e^{-πy(n+α)^2} <= 2(1 + ∫_0^∞ e^{-πyt^2} dt) = 2 + y^{-1/2}, together with Lemma Z.
Each coefficient of chi_p is an elementary symmetric function e_j(v), and |e_j(v)| <= e_j(|v|) <= Π (1 + |v_i|). Hence:
- **closed form:** |coefficients of G_p| <= H_A(p) := Π_{Q} (1 + U(y_Q))^m, with nothing computed;
- **certified-ball form (sharper):** |coefficients| <= Π (1 + U_i), where U_i is the Arb upper bound of |v_i| from a cheap 256-bit pass.
  This is what sets W.

| p | log2 H, ball form | log2 H_A, closed form | ratio |
|---|---|---|---|
| 11 | 88.8 | 421.3 | 4.7 |
| 37 | 1720.6 | 4751.8 | 2.8 |
| 59 | 10694.4 | 41886.4 | 3.9 |
| 89 | 41379.7 | 139717.7 | 3.4 |

**Rounding criterion (Algorithm C, certmin.py).**
1. Enumerate the reduced forms exactly. Build (Q, a', x_Q, t_Q) in exact integer arithmetic (Lemma S).
2. Pass 1, at 256 bits (doubled until every ball has more than 20 bits of relative accuracy):
   - Compute all v as Arb balls, with the Lemma T tails added.
   - Cross-check each theta value against Arb's own acb_modular_theta: θ[α](τ) = e^{πiτα^2} θ_3(ατ, τ). This is an independent
     instrument.
   - Set log2 H := Σ log2(1 + U_i).
3. Set W := ⌈log2 H⌉ + 2⌈log2 d⌉ + 64. Recompute the v at W bits, and form Π(x - v) by Arb's acb_poly.from_roots.
4. **Certificate.** Each coefficient ball C_j contains the exact coefficient e_j (ball arithmetic plus Lemma T). By Theorem M(ii),
   e_j ∈ Z. If Re C_j has radius < 1/2 and contains exactly one integer n_j, then e_j = n_j. Im C_j must contain 0; it always does, since
   e_j is real, so this is a consistency check.
   - If the certificate fails, W is multiplied by 1.5 and the step repeated. This was never needed.
5. **Distinctness.** If all d value balls are pairwise disjoint, the v are distinct. Then l = 1 and G_p = chi_p (Theorem M(iii)).
6. Redundant exact checks (FLINT, exact integers): monic, degree d, squarefree (gcd with the derivative), irreducible (fmpz_poly.factor),
   and constant term ±2^e with the C3 exponent (v5.1 Thm C3).

**What a certificate rests on.**
- Theorem M: v4 C1, C3a, Lemma 2, Lemma 4′, Prop 4; v5.1 Lemma B; [KSY25] Prop 4.1 and Prop 5.1 statements (opened). Their proofs
  are inherited, cited by KSY25 to [13] and Stevenhagen.
- Lemma R: new on this page, not refereed.
- Correctness of Arb ball arithmetic (FLINT 3, through python-flint 0.9.0).

No GRH. No floating-point trust, and no LLL.

## 3. Results

### Sealed test BAR-M1 (sha256 75dd04f6…, sealed 14:52; run `certmin_out_11_23_37_59_ctrl.txt`, total 16.3 s)
| p | h | d | min Im y | W bits | max coeff radius | max digits | M1 | M2 identical to disk | M3 disjoint + exact | M4 Arb theta | M5 conv 2 | time |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 11 | 3 | 15 | 1.106 | 161 | 2.3e-18 | 27 | yes | yes | yes; const -2^55 | 15/15 | non-integral (15/15 coeffs) | 0.0 s |
| 23 | 3 | 33 | 1.599 | 397 | 8.3e-19 | 96 | yes | yes (also veins/v23/G_p23.gp) | yes; unit | 33/33 | non-integral (33/33) | 0.0 s |
| 37 | 2 | 36 | 0.320 | 1797 | 2.8e-17 | 518 | yes | **printed False: instrument fault**; post hoc identical | yes; const -2^666 | 36/36 | non-integral (36/36) | 0.1 s |
| 59 | 9 | 261 | 0.512 | 10777 | 1.6e-18 | 3218 | yes | yes | yes; const -2^5133 | 261/261 | non-integral (261/261) | 16.0 s |

**The p = 37 fault.**
- vectors/v4_factor/minpoly_p37.gp has two lines, and both are the same polynomial: the 08:39 re-run appended a second copy.
- certmin.py v1.0 concatenated the lines. The parsed "polynomial" therefore had doubled middle coefficients and a garbage leading term,
  and the script printed "NOT CERTIFIED" because of the comparison flag alone.
- Post hoc, each line separately is identical to the certified G_37 (posthoc/p37_line1.gp, p37_line2.gp, p37_compare_out.txt).
- The certificate itself at 37 is complete: M1, M3, M4 and M5 all hold.

**Sealed verdict, scored as run, no goalpost moved: BAR-M1 HOLDS at 11, 23, 59. At 37 it holds on M1, M3, M4, M5, M6, with M2 =
INSTRUMENT FAULT in the comparison code; the polynomial is identical post hoc.** M6 holds: under 10 minutes each, 16 s in all; the
prediction for 59 was 2 to 60 s.

### Extension AMENDMENT-M1b (sha256 d1a35c97…, sealed 14:54; parser fixed in v1.1; runs `ext_run_console_13_to_83_crash.txt` + `certmin_out_83_89_97_ctrl.txt`)
| p | h | d | min Im y | W bits | max coeff radius | max digits | const term (C3) | identical to disk | conv 2 | time |
|---|---|---|---|---|---|---|---|---|---|---|
| 13 | 2 | 12 | 0.515 | 203 | 4.9e-18 | 40 | -2^78 | yes | non-integral | 0.0 s |
| 17 | 4 | 32 | 0.458 | 483 | 6.8e-18 | 123 | +2^272 | yes | non-integral | 0.0 s |
| 19 | 3 | 27 | 0.872 | 420 | 1.9e-17 | 104 | -2^171 | yes | non-integral | 0.0 s |
| 29 | 6 | 84 | 0.359 | 1998 | 3.6e-18 | 577 | -2^1218 | yes | non-integral | 0.2 s |
| 31 | 3 | 45 | 1.114 | 772 | 1.5e-17 | 210 | -1 (unit) | yes (veins/v23/G_p31.gp) | non-integral | 0.0 s |
| 41 | 8 | 160 | 0.305 | 5343 | 9.6e-18 | 1584 | +2^3280 | yes | non-integral | 2.7 s |
| 43 | 3 | 63 | 0.596 | 2609 | 1.5e-16 | 763 | -2^903 | yes | non-integral | 0.3 s |
| 53 | 6 | 156 | 0.270 | 7968 | 6.3e-17 | 2375 | -2^4134 | yes | non-integral | 5.6 s |
| 71 | 7 | 245 | 0.936 | 9039 | 9.0e-17 | 2697 | -1 (unit) | yes | non-integral | 9.3 s |
| 73 | 4 | 144 | 0.231 | 12267 | 1.6e-16 | 3669 | +2^5256 | yes | non-integral | 13.2 s |
| 79 | 5 | 195 | 0.808 | 9135 | 1.5e-16 | 2726 | -1 (unit) | yes | non-integral | 7.8 s |
| 83 | 9 | 369 | 0.434 | 23930 | 1.0e-17 | 7177 | -2^10209 | yes | non-integral | 122.7 s |
| 89 | 12 | 528 | 0.210 | 41464 | 2.9e-17 | 12456 | +2^23496 | yes | non-integral | 583.9 s |
| 97 | 4 | 192 | 0.201 | 23964 | 9.6e-16 | 7190 | +2^9312 | yes | non-integral | 70.9 s |

In every row: rounding certified at the first W (no retries), all value balls pairwise disjoint, Arb-theta cross-check 100%,
monic, degree h(p-1)/2, squarefree, irreducible, constant term = C3 prediction exactly.

- **Instrument crash (logged 14:57).** The first M1b run crashed at p = 83, after certification and the exact checks. The cause was
  Python's 4300-digit int-to-str guard, hit while counting digits. 13-79 had completed: `ext_run_console_13_to_83_crash.txt`.
  certmin v1.2 lifts the guard (one line, hash in SEALS.txt) and re-ran 83, 89, 97 (`certmin_out_83_89_97_ctrl.txt`).
- **Sealed verdict for M1b: HOLDS at all 14 extension primes.** M6' holds: about 15 minutes in all. p = 89 took 584 s, inside the
  predicted 1-15 minutes.

### Development and control primes (before the seal, not scored)
| p | result |
|---|---|
| 7 | G_7 = x^3 - 41x^2 + 54x - 1, identical to the known septic polynomial (Rebák control), W = 75 bits |
| 5 | identical to disk, conv 2 certified non-integral |
| 29 | certified (identity to disk checked under M1b) |

## 4. Verdicts
- **Theorem M: PROVED on the page** for every prime p >= 5. It rests on refereed v4/v5.1 results, on opened [KSY25] statements, and on
  the new Lemma R. Lemma R and the Theorem M write-up are **not yet refereed**.
- **Rigorous algorithm: DONE** (Algorithm C, certmin.py v1.2). Truncation (Lemma T), non-vanishing (Lemma Z), an a-priori coefficient
  bound (Lemma H) and a ball-arithmetic rounding certificate.
- **Certified G_p: every floating-point G_p on disk, 19 primes 5..97, plus p = 7, is now CERTIFIED** (subject to Arb correctness), and identical to
  the floating-point one. The sealed four: 11, 23, 59 clean, and 37 with the comparison-code fault above.
- **By-product:** Q(b_1) = F_p (l = 1) is PROVED at every certified prime. v5.1 had left this open in general. These certificates also
  upgrade the "certified numerics" G_p of CERT-C4-STRONG at 5, 11, 13, 37 to rigorous.
- **Negative control:** the left-action reading (convention 2) is certified non-integral wherever it differs from convention 1. It is
  identical at p = 7, where h = 1 and the control is not applicable.

## 5. Ceiling
Low, and honestly so. Theorem M is a specialisation of [KSY25] Thm 7.5's mechanism. The new content is the explicit translation form
(Lemma R), the identification of l = [F_p : Q(b_1)], and explicit bounds. The practical gain is real but small:
- every G_p in the project now has a proof-grade certificate (seconds per prime);
- "Q(b_1) = F_p" becomes a theorem at each such prime.

It is not the "separation lemma for every prime" of lead 4. Distinctness of the conjugates is certified prime by prime, not proved in
general.

## 6. Next strike
1. **Cheapest win (minutes):** upgrade CERT-C4-STRONG's Step D (the sine-product identities at 5, 13, 37) from certified numerics to
   rigorous.
   - Evaluate ι(c_1) in Arb from its exact Q(θ) form.
   - Show its ball overlaps the b_1 ball and is disjoint from every other conjugate ball.
   - G_p(c_1) = 0 is already exact.
2. **The general statement:** prove l = 1, i.e. Q(b_1) = F_p, for every p.
   - A size argument in the style of v5.1 Prop D might do it, showing that |σ_Q(b_k)| ≠ b_1 for Q non-principal.
   - The principal values are already distinct (Lemma 4′). A non-principal conjugate equal to b_1 would need |σ_Q(b_k)| = b_1, which
     is a Lemma-C type inequality on Siegel functions at Im >= 2 sqrt p/(p+1).
   - Ceiling: closes v5.1's open "b_1 alone generates F_p".

## 7. Files (vectors/v5_method/)
- `certmin.py` (v1.2; v1.0 as sealed in posthoc/certmin_sealed_v1.py), `BAR-M1.md`, `AMENDMENT-M1b.md`, `SEALS.txt`.
- Run logs: `certmin_out_11_23_37_59_ctrl.txt` (sealed run); `ext_run_console_13_to_83_crash.txt` (extension, before the crash), `certmin_out_83_89_97_ctrl.txt` / `ext_run_console_83_89_97.txt` (after the fix); dev logs certmin_out_7_5_ctrl.txt, certmin_out_7_29_ctrl.txt, certmin_out_5_7_ctrl.txt.
- Certified polynomials: `certG_p<p>.txt` (coefficients x^0..x^d, one per line).
- `posthoc/`: the p = 37 comparison repair.
- Install log: python-flint 0.9.0 (`py -3.11 -m pip install --user python-flint`, 2026-10-28, user site). The script appends the
  user-site path, because `-I` excludes it.

## Addendum 2026-10-28 15:14: next strike 1 DONE
BAR-D1 (stepd/, sealed 2b45878d...) HOLDS: CERT-C4-STRONG Step D is rigorous (ball arithmetic) at 5, 7, 13, 37 (stepd/stepd_out.txt). CERT-C4-STRONG.md status updated.
