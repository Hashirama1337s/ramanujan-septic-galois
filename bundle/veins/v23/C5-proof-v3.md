# C5-proof-v3: which odd n give abelian (cyclotomic) p.206 pieces. Repair after referee round 2.
2026-10-28, computation seat. Answers veins/v23/referee-c5r2-seatB-reply.md (round 2: NOT A PROOF; single GAP = Lemma 3* Class II*).
v2 is kept unchanged; RESULT-V23.md is unchanged. Internal; not for release.

**Changes from v2:**
- Lemma 3* Class II* is now proved by congruences on the page, with no residue table. A mod-8 exhaustive run is kept only as a confirmation.
- The six-term exponent E is derived on the page from KSY10 Prop 2.4(ii), (iii) (opened this session) and the triple product.
- B_{-k} = B_{k+n} = B_k is proved on the page.
- §1 citations are fixed: 2.4(ii) is cited for the move and 2.4(iii) for the phase. "n | B" replaces "lower triangular mod n". The
  Γ(4n)-invariance is now a special case of Class I*.
- §6: "eps = 1" is replaced by "eps constant". The Galois criterion now uses the referee's argument: S is normal, and E is the
  maximal real subfield of KE.

## In plain words
The referee's one remaining hole was in the step that shows a stray root of unity is exactly 1. The old check divided by 2 inside
a residue table, which does not cover every matrix. That step is now done by hand, with no table: the hidden half-integers are
cleared and every case is checked by congruences. Two smaller wording errors are fixed. What stays numerical is unchanged:
"b_1 alone generates the field of all pieces" at non-idoneal composite n.

## Statement (C5)
For odd n >= 3:
- let b_k = B_k(i sqrt n), with B_k = (2 theta[k/n]/theta[0])^n, for k = 1..m, m = (n-1)/2;
- let E = Q(b_1, ..., b_m), the field of all the pieces.

Then:
- (a) [E:Q] = h(-4n) phi(n)/2, and E contains Q(j(sqrt -n)).
- (b) The number of real embeddings of E is (phi(n)/2) · #{c in Cl(O)[2] : eps(c) constant}. Here O = Z[sqrt -n], and eps is
  defined in §5.
- (c) **E is abelian over Q iff n is idoneal and a prime power, iff n is in {3, 5, 7, 9, 13, 25, 37}.**
- (d) For idoneal n that is not a prime power, Q(b_1) itself is not abelian.
- (e) For non-idoneal n: Q(b_1) = E (hence non-abelian) is verified numerically at 11, 27, 49; for primes, C4 proves b_1 non-abelian (its conjugates include every b_k), but Q(b_1) = E itself is OPEN for primes too (editor gap G1).
  It is NOT proved in general.

## Sources
- **[KSY25]** Koo-Shin-Yoon, arXiv:2506.14139v1. **OPENED** (PDF text, round 1 of this repair). Used:
  - §2: C_N(O) = I(O,N)/P_N(O,N), with P_N = {lambda O : lambda = 1 mod NO}; K_{O,N}.
  - Prop 3.1: [Q] -> [Z tau_Q + Z], an isomorphism C_N(D) -> C_N(O) ≅ Gal(K_{O,N}/K).
  - Remark 3.2(i),(ii).
  - §4: the GL2(Z/N) action on F_N; diag(1, d) acts on Fourier coefficients; "f^γ = f∘γ̃ for any lift γ̃ in SL2(Z)".
  - Prop 4.1.
  - Lemma 7.3.
  - Proofs inside are cited to [13], [14], [23] (not opened).
- **[KSY10]** Koo-Shin-Yoon, arXiv:1008.0473. **OPENED this session** (ar5iv HTML), short quotes:
  - (1.3): "g_{(r_1,r_2)}(τ) = −q^{½B₂(r₁)} e^{πir₂(r₁−1)}(1−q_z) ∏ (1−q^n q_z)(1−q^n q_z^{-1})", with q_z = e^{2πiz}, z = r₁τ + r₂,
    and B₂(x) = x² − x + 1/6.
  - Prop 2.4(ii): g_r∘γ = ε g_{rγ}, with "ε a 12th root of unity (depending on γ)", i.e. on γ only, not on r.
  - Prop 2.4(iii): for s in Z², g_{r+s} = (−1)^{s₁s₂+s₁+s₂} e^{−πi(s₁r₂−s₂r₁)} g_r.
  - Prop 2.4(v): ord_q g_r = ½B₂(⟨r₁⟩).
  - Prop 2.2(iii): g_r holomorphic, no zeros or poles on H.
- **[JTP]** Jacobi triple product (Wikipedia, opened by the v5.1 seat): Π_{m>=1}(1−x^{2m})(1+x^{2m−1}y²)(1+x^{2m−1}y^{−2}) = Σ x^{n²}y^{2n}.
- **[Kani]** Ann. Sci. Math. Québec 35 (2011). **OPENED** (RESULT-V23): Thm 6 / Rem 7(b), Thm 12, Thm 32.
- Lab lemmas, with the "only n odd is used" audit stated where used: v4 Lemma 4′; v5.1 Lemmas A, B, B′, C, Prop D, E/E′, the
  C4 list form.

Notation:
- n odd >= 3; D = -4n; O = Z[sqrt -n]; tau_O = i sqrt n (b_O = 0, c_O = n); K = Q(sqrt -n); H_O = K(j(tau_O)) = K_{O,1}.
- N := 4n; L := K_{O,4n}; G := Gal(L/K).
- For nu = t + s sqrt -n in O, **t(nu) := t mod n**. This is a ring homomorphism O -> Z/n, because (sqrt -n)^2 = -n = 0 mod n.
  It extends multiplicatively to elements of norm prime to n. Also t(nu bar) = t(nu).
- theta[a](τ) = Σ_{j in Z} e^{πiτ(j+a)²}, and B_x := (2 theta[x/n]/theta[0])^n for any integer x with n ∤ x.
- a_x := ((n+2x)/2n, 1/2), and a_0 := (1/2, 1/2).

**Lemma 0 (on the page).** theta[a+1] = theta[a] and theta[-a] = theta[a]. Hence **B_{x+n} = B_x and B_{-x} = B_x**, so B_x
depends only on ±x mod n.

*Proof.*
- Substituting j -> j - 1 in the sum gives theta[a+1](τ) = Σ e^{πiτ(j+1+a)²} = Σ e^{πiτ(j+a)²}.
- theta[-a](τ) = Σ_j e^{πiτ(j-a)²}. Substituting j -> -j turns this into Σ_j e^{πiτ(-j-a)²} = Σ_j e^{πiτ(j+a)²} = theta[a](τ).
- Both sums converge absolutely for Im τ > 0. ∎

**Lemma 1 (Siegel form, on the page).** For an integer x with n ∤ x: **B_x = 2^n (−i)^x (g_{a_x}/g_{a_0})^n.**

*Proof.*
1. [JTP] with x_J = q^{1/2} and y² = q^a (q = e^{2πiτ}) gives theta[a] = q^{a²/2} Π_{j>=1}(1−q^j)(1+q^{j−1/2+a})(1+q^{j−1/2−a}).
2. In (1.3) take r = (a+½, ½). Then q_z = e^{2πi((a+½)τ+½)} = −q^{a+½}, and ½B₂(a+½) = ½(a² − 1/12). Hence
   g_{(a+½,½)} = −e^{πi(a/2 − 1/4)} q^{a²/2 − 1/24} Π_{j>=1}(1+q^{j−1/2+a})(1+q^{j−1/2−a}).
   (The factor (1−q_z) = (1+q^{a+½}) together with the product gives the two products shown, after re-indexing.)
3. Dividing the case a = x/n by the case a = 0 gives theta[x/n]/theta[0] = e^{−πix/2n} g_{a_x}/g_{a_0}.
4. Raise to the n-th power and multiply by 2^n. ∎

(This is v4 Lemma 1 with p -> n. v4 checked it analytically to >= 269 digits.)

---

## 1. Level (referee step 1): B_k in F_{4n}
1. *q-expansion.* By [JTP], B_k = 2^n q^{k²/2n} Π_{j>=1}(1+q^{j−1/2+k/n})^n (1+q^{j−1/2−k/n})^n (1+q^{j−1/2})^{−2n}.
   All exponents lie in (1/2n)Z, all are positive since k < n/2, and the coefficients are integers.
2. *Meromorphy.* B_k is holomorphic on H, because g_{a_0} has no zeros there (KSY10 2.2(iii)).
   At a cusp γ∞: by **2.4(ii)** (the move), B_k∘γ = 2^n (−i)^k (g_{a_kγ}/g_{a_0γ})^n, the ε(γ) cancelling in the ratio.
   Each g_r has a q-expansion of finite order ((1.3), and 2.4(v)), so B_k is meromorphic at every cusp.
3. *Γ(4n)-invariance.* This is the special case M ≡ I (mod 4n) of Lemma 3* Class I* below (A ≡ 1 mod n, so k′ = k).
   The phase computation there uses **2.4(iii)**.

**Hence B_k is in F_{4n}** for 1 <= k <= m. Its coefficients are rational, so diag(1, d) acts trivially on it ([KSY25] §4).

## 2. Transformation lemma (referee step 2): the multiplier is exactly 1
Let **Gamma\*** be the set of M = [A, B; C, D] in SL2(Z) with **n | B** and **A + C, B + D both odd**, i.e. (1,1)M = (1,1) mod 2.
Gamma* is a group. Both conditions are preserved under products and inverses:
- n | B is the subgroup Γ^0(n);
- the second condition is the stabiliser of the row vector (1,1) mod 2.

**Lemma 3\*.** For M in Gamma* and 1 <= k <= m: **B_k ∘ M = B_{kA}** (index mod n, read up to sign by Lemma 0).
Note that A is invertible mod n (AD ≡ 1 mod n, because n | B), so n ∤ kA.

**Step 1: the exponent E, on the page.** Let k′ in [1, n) with k′ ≡ kA (mod n). Define
- s1 := ((n+2k)A + nC − n − 2k′)/2n,
- s2 := ((n+2k)B + nD − n)/2n,
- c1 := (A+C−1)/2,
- c2 := (B+D−1)/2.

These are integers:
- c1 and c2: A+C and B+D are odd.
- s1: the numerator is ≡ A + C − 1 ≡ 0 (mod 2), and ≡ 2(kA − k′) ≡ 0 (mod n); gcd(2, n) = 1.
- s2: the numerator is ≡ B + D − 1 ≡ 0 (mod 2), and ≡ 2kB ≡ 0 (mod n).

By direct multiplication, a_k M = a_{k′} + (s1, s2) and a_0 M = a_0 + (c1, c2).

By Lemma 1 and **2.4(ii)** (ε depends only on M, so it cancels):
- B_k∘M = 2^n (−i)^k (g_{a_{k′}+(s1,s2)} / g_{a_0+(c1,c2)})^n.

By **2.4(iii)**, with r = a_{k′} = ((n+2k′)/2n, ½) and r = a_0 = (½, ½):
- g_{a_{k′}+s} = (−1)^{s1s2+s1+s2} e^{−πi(s1/2 − s2(n+2k′)/2n)} g_{a_{k′}};
- g_{a_0+c} = (−1)^{c1c2+c1+c2} e^{−πi(c1/2 − c2/2)} g_{a_0}.

Raise to the n-th power, using n odd so that (−1)^{nX} = (−1)^X = i^{2X}. Then use (−i)^k = (−i)^{k′} i^{−(k−k′)} and Lemma 1 for
B_{k′}. This gives **B_k∘M = i^E B_{k′}**, with

E = −(k−k′) + 2(s1s2+s1+s2) − n s1 + (n+2k′) s2 − 2(c1c2+c1+c2) + n(c1 − c2).

**Step 2: reduction to two classes.**
- SL2(Z) → SL2(Z/4n) is onto ([KSY25] §4 uses "any lift").
- By CRT write M ≡ M_a M_b (mod 4n), where M_a ≡ M (mod 4), M_a ≡ I (mod n), and M_b ≡ I (mod 4), M_b ≡ M (mod n). Lift both
  to SL2(Z); then M = M_a M_b γ with γ ≡ I (mod 4n).
- All three factors lie in Gamma*. M_a, M_b and γ each satisfy n | B; mod 2 they are M, I and I respectively.
- (f∘XY)(τ) = (f∘X)(Yτ), so B_k∘M = ((B_k∘M_a)∘M_b)∘γ.
- So it suffices to prove E ≡ 0 (mod 4) for **Class II\*** (M ≡ I mod n) and **Class I\*** (M ≡ I mod 4). γ is in Class I*.

**Class I\* (M ≡ I mod 4, n | B, so B = 4nβ).**
- Write A = 1+4α, C = 4κ, D = 1+4δ; k′ ≡ kA (mod n). Then exactly:
  - c1 = 2(α+κ) and c2 = 2(nβ+δ);
  - s2 = 2((n+2k)β + δ);
  - n s1 = (k−k′) + 2(n+2k)α + 2nκ, so s1 ≡ k − k′ (mod 2) since n is odd.
- Mod 4, term by term:
  - −(k−k′);
  - 2(s1s2+s1+s2) ≡ 2s1 ≡ 2(k−k′), since s2 is even;
  - −n s1 ≡ −(k−k′) − 2α − 2κ, using −n s1 = −(k−k′) − 2(n+2k)α − 2nκ and n odd;
  - (n+2k′)s2 ≡ 2(β+δ);
  - −2(c1c2+c1+c2) ≡ 0;
  - n(c1−c2) = 2n(α+κ−nβ−δ) ≡ 2(α+κ+β+δ).
- **Sum ≡ 4(β+δ) ≡ 0.** ∎

**Class II\* (M = I + nM′, M′ integral).**
- Then k′ = k, s1 = c1 + kM′11, s2 = c2 + kM′12, c1 = nu, c2 = nv, with u := (M′11+M′21)/2 and v := (M′12+M′22)/2.
  u and v are integers, because A+C = 1 + n(M′11+M′21) (n odd) is odd exactly when M′11+M′21 is even, and likewise for
  M′12+M′22. (Referee round 3 fix: v3 first wrote "2 + n(...)", which was false.)
- Substituting, the n c terms cancel exactly in −n s1 + (n+2k)s2 + n(c1−c2), leaving nk(M′12 − M′11) + 2k s2. Writing
  Δ := (s1+1)(s2+1) − (c1+1)(c2+1):

  **E = 2Δ + nk(M′12 − M′11) + 2k s2**, an exact integer identity.
- E mod 4 involves u and v only through their parities: 2Δ mod 4 needs Δ mod 2, and 2k s2 mod 4 needs k s2 mod 2.
  The denominator 2 is gone: u and v are integers.

*Parity of M′.*
- From Gamma*: M′11 ≡ M′21 and M′12 ≡ M′22 (mod 2).
- From det M = 1: (1+nM′11)(1+nM′22) = 1 + n²M′12M′21, i.e. **M′11 + M′22 + n(M′11M′22 − M′12M′21) = 0** (♦).
- Mod 2, (♦) gives M′11 + M′22 ≡ 0, because M′11M′22 − M′12M′21 ≡ M′11M′12 − M′12M′11 = 0.
- So **all four M′ij have the same parity e**.

*Case e = 0 (all even).*
- s1 ≡ c1 ≡ u and s2 ≡ c2 ≡ v (mod 2), so Δ ≡ 0 and 2Δ ≡ 0 (mod 4).
- 2k s2 = 2knv + 2k²M′12 ≡ kn(M′12 + M′22) (mod 4), since M′12 is even and 2v = M′12 + M′22.
- So E ≡ kn(2M′12 + M′22 − M′11) (mod 4).
- 2M′12 ≡ 0 (mod 4).
- By (♦), M′11 + M′22 = −n(M′11M′22 − M′12M′21) ≡ 0 (mod 4) (products of even numbers). So M′22 − M′11 ≡ −2M′11 ≡ 0 (mod 4).
- **Hence E ≡ 0.**

*Case e = 1 (all odd).*
- The case occurs (referee round 3 witness): M′ = [1, 1; -1, -1] gives M = I + nM′ = [1+n, n; -n, 1-n], det M = 1, A+C = B+D = 1,
  so M ∈ Gamma*. (det M′ is even; det M is not, since M = I + nM′.) At n = 3 the same pattern gives M = [4, 3; 21, 16].
- Mod 2: c1 ≡ u, c2 ≡ v, s1 ≡ u + k, s2 ≡ v + k.
  - If k is even, Δ ≡ 0.
  - If k is odd, (s1+1)(s2+1) ≡ uv and (c1+1)(c2+1) ≡ uv + u + v + 1, so Δ ≡ u + v + 1.
  - In both cases **2Δ ≡ 2k(u+v+1) (mod 4)**.
- 2k s2 ≡ 2k(v + k) (mod 4), since k s2 = k(nv + kM′12) ≡ k(v + k) (mod 2).
- nk(M′12 − M′11) ≡ 2k·(M′12 − M′11)/2 (mod 4). The difference is even, and n(·)/2 ≡ (·)/2 mod 2 for n odd.
- Sum: E ≡ 2k(u + v + 1) + 2k(v + k) + 2k(M′12 − M′11)/2 ≡ 2k(1 + k) + 2k[u + (M′12 − M′11)/2] (mod 4), using 4kv ≡ 0.
- 2k(1+k) ≡ 0, because k(k+1) is even. And u + (M′12 − M′11)/2 = (M′12 + M′21)/2. So **E ≡ k(M′12 + M′21) (mod 4)**.
- Now use det M = 1 itself, not (♦) mod 2. In this case A = 1 + nM′11 and D = 1 + nM′22 are both even, so AD ≡ 0 (mod 4).
  Since AD = 1 + n²M′12M′21, this gives n²M′12M′21 ≡ −1 (mod 4). As n² ≡ 1 (mod 8), M′12M′21 ≡ 3 (mod 4).
- Two odd numbers with product ≡ 3 (mod 4) are ≡ 1 and 3 in some order. So **M′12 + M′21 ≡ 0 (mod 4)**, and **E ≡ 0**. ∎

Combining: B_k∘M_a = B_k, (B_k)∘M_b = B_{kA_b}, and B_{kA_b}∘γ = B_{kA_b}. Also A_b ≡ A (mod n). So **B_k∘M = B_{kA}**. ∎

*Confirmations (not needed for the proof).*
- (A′) c5_checks_v3.gp: exhaustive over M′ mod 8 (the halves u, v carried exactly), all n ≡ 1, 3, 5, 7 (mod 8), k mod 8, with
  (♦) imposed mod 8 and the full det relation AD ≡ 1 + n²M′12M′21 (mod 8): 4096 residue cases, 0 failures (c5_checks_v3_out.txt).
- (B) Class I* integer check: 2904 matrices, 0 failures.
- (C) Analytic: B_k(Mτ) = B_{kA}(τ) to 10^-67 in 648 random cases, n in {9, 15, 21, 25, 27, 33, 45, 49}.
  Negative controls fail to agree: M = [1,15;0,1] and M = T at n = 15. (c5_checks_out.txt.)

Remark: v4's Cartan element γ = diag(1, d^{-1}) g(x) lies in Gamma*. Its B is −ns, and mod 2 it is [t, s; s, t] with t + s odd.
So v4 Lemma 3 is the case A = t.

## 3. The Galois action of principal classes, from Prop 3.1 + 4.1 alone (referee steps 3, 4)
Let ρ: C_{4n}(O) -> G be the isomorphism given by [KSY25] Prop 3.1^{-1} followed by Prop 4.1.

**Lemma P.** If nu is in O and nu O is prime to 4n, then **ρ([nu O]) sends b_k to b_{k·t(nu)}** for every k.

*Proof.*
1. *A primitive mu.* Let mu = d1 - d3 sqrt -n, with gcd(d1, d3) = 1 and a := N(mu) = d1^2 + n d3^2 prime to 4n.
   - Choose d2, d4 with gamma = [d1, d2; d3, d4] in SL2(Z), and let Q = Q0∘gamma, where Q0 = x^2 + n y^2.
   - Then Q has first coefficient a and middle coefficient b = 2(d1 d2 + n d3 d4), so Q is in Q(D, 4n).
   - Its root is tau_Q = gamma^{-1} tau_O, and Z tau_Q + Z = mu^{-1}(Z tau_O + Z) = mu^{-1} O, because
     [d4, -d2; -d3, d1] is unimodular. So Prop 3.1 sends [Q] to [mu^{-1} O].
2. *Prop 4.1 at Q.*
   - -conj(tau_Q) = gamma* tau_O, with gamma* = [d4, d2; d3, d1] (as in [KSY25] Lemma 7.4), because -conj(tau_O) = tau_O.
   - B_k has rational coefficients, so f^{[1,y;0,a']} = f(τ + y) whichever way [1, y; 0, a'] is factored:
     - diag(1, a') first, then [1, y; 0, 1]: diag acts trivially, then translate by y.
     - [1, y/a'; 0, 1] first, then diag(1, a'): diag acts on the coefficients of f(τ + y/a'), which turns ζ^{y/a'} into ζ^{y}.
   - Hence ρ([mu^{-1}O])(b_k) = B_k(M τ_O), with M := T^y gamma* = [d4 + y d3, d2 + y d1; d3, d1] and y = -a'b/2.
3. *M lies in Gamma\*.*
   - Mod n: a' = d1^{-2} and y = -a' d1 d2, so B = d2 + y d1 = 0 mod n.
   - Parity: a is odd, so exactly one of d1, d3 is odd.
     - d1 odd: d4 is odd and y = d2 mod 2. Then A + C = 1 and B + D = 2 d2 + 1, both odd.
     - d3 odd: d2 is odd and y = d4. Then A + C = 2 d4 + 1 and B + D = d2 = 1, both odd.
   - A = d1^{-1} mod n, since det = 1 and B = 0 mod n.
4. By Lemma 3*, ρ([mu^{-1} O])(b_k) = b_{k/d1} = b_{k t(mu^{-1})}.
5. *Rational classes.* For m in Z prime to 4n, take m' with m m' = 1 mod 4n and mu = m' - 4n sqrt -n (primitive, norm prime
   to 4n). Then mu m = 1 mod 4nO, so [mO] = [mu^{-1} O] in C_{4n}(O) (P_N of [KSY25] §2), and ρ([mO]) acts as b_k -> b_{km}.
6. *General nu.* Write nu = m nu_0 with nu_0 primitive. Since ρ is a homomorphism, ρ([nu O]) acts by k -> k·m·t(nu_0) = k t(nu). ∎

Check (D): Prop 4.1 values at Q0∘gamma equal b_{k/d1} to 10^-65 in 275 random cases (n = 9, 15, 21, 25, 45).

Consequences:
- (i) Every element of Gal(L/H_O) is ρ([nu O]) for some principal nu O. (The kernel of C_{4n}(O) -> C_1(O) consists of the
  principal classes. Prop 3.1, Remark 3.2(ii); a fractional principal ideal prime to 4n is (alpha/m)O with alpha in O, m in Z.)
  It permutes all the b_k, by k -> k t(nu).
- (ii) Every t in (Z/n)^* occurs as t(nu): take nu = t + 4n sqrt -n, with t replaced by t + n if needed to make it odd.
- (iii) *Distinctness.* v4 Lemma 4′ (Poisson plus triple product; it uses only k in [0, n/2]) gives b_1 > b_2 > ... > b_m.
  So ρ([nu O]) fixes b_1 iff t(nu) = ±1 mod n, and then it fixes every b_k.

**The field, without naming a ray class field (referee step 3).** Let S := {ρ([nu O]) : t(nu) = ±1 mod n}, a subgroup of
Gal(L/H_O) of index phi(n)/2. The b_k are fixed by S, and every element of Gal(L/H_O) outside S moves b_1.

## 4. E contains j, its degree, and complex conjugation (referee steps 3, 4)
- **Prop D transfer.** Let V := b_1 ··· b_m, the product over all k. v5.1 Lemma A gives V = 2^{n(n-1)/2} w^{-n(n-1)/24}, with
  w = f(tau_O)^24. Lemma A step 3 uses only that n is odd; step 6 is f(-1/τ) = f(τ).
  - By §3 (i), V is fixed by Gal(L/H_O). It is real, so V lies in H_O ∩ R = Q(j(sqrt -n)).
  - v5.1 Lemmas B, B′, C and Prop D steps 2-4 use only [KSY25] Prop 4.1 at N = 1, a <= sqrt(|D|/3), and sqrt n > 1.0103.
    They give **Q(V) = Q(j(sqrt -n)), hence H_O ⊂ KE**.
- **Degree.** Gal(L/KE) ⊂ Gal(L/H_O), since H_O ⊂ KE. By §3 it equals S. So [KE:K] = h · phi(n)/2. E is real, so E ∩ K = Q
  and **[E:Q] = h(-4n) phi(n)/2.** This proves (a). The referee's point is met: the real-field equality is now stated explicitly.
- **Complex conjugation, computed (replaces the Artin-symbol sentence).** Let Q = (a, b, c) be in Q(D, 4n) and Q′ = (a, -b, c).
  - B_k has rational coefficients, so conj(B_k(τ)) = B_k(-conj τ).
  - The Prop 4.1 values are σ_Q(b_k) = B_k(t_Q + y_Q), with t_Q = (b + sqrt D)/2a and y_Q = -a'b/2.
  - So conj(σ_Q(b_k)) = B_k(tau_Q + a'b/2) = B_k(t_{Q′} + y_{Q′}) = σ_{Q′}(b_k).
  - Prop 3.1 sends Q′ to Z tau_{Q′} + Z = Z(-conj tau_Q) + Z = conj(Z tau_Q + Z).
  - **So the complex conjugate of ρ([a])(b_k) is ρ([abar])(b_k)** for every class [a]. Hence ρ([a])(b_k) is real iff
    ρ([abar]/[a]) fixes b_k (apply ρ([a])^{-1}; G is abelian).
  - L is Galois over Q with group G ⋊ <c> ([KSY25] Lemma 7.3), and the conjugates of the b_k are the ρ(C)(b_k).

## 5. The sign vector (referee step 5): elements prime to 4n
Let a be an integral invertible O-ideal of norm a prime to 4n, and write abar/a = (a) a^{-2}.
- If [a]^2 != 1 in C_1(O), then ρ(abar/a) is non-trivial on H_O.
- If [a]^2 = 1, then a^2 = lambda O with lambda in O. Since N(lambda) = a^2 is prime to 4n, **lambda is prime to 4n**.
  - abar/a = (a/lambda) O, and Lemma P applies to the principal classes [aO] and [lambda O].
  - So ρ(abar/a) acts by b_k -> b_{k a/t(lambda)}.
  - From N(lambda) = a^2: t(lambda)^2 = a^2 mod n, so **eps_r(a) := t(lambda)/a mod r^e** is ±1 for each prime power r^e || n.
  - The action is trivial iff eps(a) = (eps_r) is constant.
- *Well defined on C_1-classes:* replacing a by a·nu O changes lambda/a by nu/nubar, and t(nu/nubar) = 1.

## 6. Count and verdict (referee step 6)
This section follows the referee's round-2 argument.

1. *S is normal; KE/Q is Galois.* S = Gal(L/KE) (§§3-4). KE = K(b_1, ..., b_m), with every b_k real, so c(KE) = KE and
   cSc^{-1} = Gal(L/c(KE)) = S. G is abelian, so S is normal in Gal(L/Q) = G ⋊ <c> ([KSY25] Lemma 7.3). Hence KE/Q is Galois,
   with group (G/S) ⋊ <c>.
2. *E is the maximal real subfield.* E is real and [KE:E] = 2 (§4), so E = (KE)^{<c>}.
3. *Conjugation on KE.* By §4, c ρ([a]) c and ρ([abar]) agree on every b_k and on K, hence on KE.
4. *Galois criterion.* E/Q is Galois iff <c> is normal in Gal(KE/Q), iff c is central (a normal subgroup of order 2 is central).
   That holds iff ρ([abar])|_{KE} = ρ([a])|_{KE} for every class, iff ρ(abar/a) is in S for every a. By §5, together with
   H_O ⊂ KE (§4), this holds iff **[a]^2 = 1 and eps(a) is constant for every class**.
5. *Galois means abelian.* If E/Q is Galois, then Gal(KE/Q) = (G/S) × <c> is abelian, so E is abelian. Conversely, abelian implies
   Galois. So **E is abelian iff Cl(O) = Cl(O)[2] (n idoneal, [Kani] Thm 6 / Rem 7(b)) and eps is constant on Cl(O).**
6. *Real embeddings.* The embeddings of E correspond to the cosets g<c>, g in G/S. Such an embedding is real iff g commutes with
   c, i.e. iff ρ(abar/a) is in S, which by §5 depends only on the C_1-class of a. Each C_1-class has phi(n)/2 elements of G/S.
   **Real embeddings of E = (phi(n)/2)·#{c in Cl(O)[2] : eps(c) constant}.** This proves (b).
- Data agreement (RESULT-V23 table, files run_a/b/c/d_out.txt; G_n monic integral with rounding error <= 10^-310): the real-root
  counts of G_n agree with this formula at all 14 n. Q(b_1) = E wherever deg G_n = h phi(n)/2, i.e. at all 14 n.

## 7. eps on ambiguous classes (referee step 7), exactly
Let r^e || n, and let Q_r = (r^e, 0, n/r^e). This form is primitive of discriminant D, with ideal q = [r^e, sqrt -n] and
q^2 = r^e O (since gcd(r^e, n/r^e) = 1).

*A representative prime to 2n.* pi := r^e + 2 sqrt -n lies in q, and N(pi) = r^e·(r^e + 4n/r^e). Put a := (pi/r^e) q
= pi qbar / r^e = pi q / r^e. Then:
- a is integral, of norm **N a = r^e + 4n/r^e**, which is odd and prime to n. So a is prime to 2n.
- [a] = [q]^{-1} = [q].
- a^2 = (pi^2/r^e), so **lambda = r^e - 4n/r^e + 4 sqrt -n** is in O, and **t(lambda) = r^e - 4n/r^e**.

*eps exactly:*
- mod r^e: t(lambda) = -4n/r^e and N a = 4n/r^e, so **eps_r = -1**.
- mod any other prime power s^f || n: t(lambda) = r^e = N a, so **eps_s = +1**.

So eps(a) is constant iff n is a prime power. This holds for every n, with no sketch.

Check (E): computed at 15, 21, 33, 45, 57, 85, 93, 105 (every ambiguous class: -1 at its own prime, +1 elsewhere) and at 9, 25
(one sign, trivial mod ±1).

**Referee's hand check at n = 15, reproduced:**
- P = (17, sqrt-15 - 6): 6^2 + 15 = 51 = 3·17.
- P^2 = (7 - 4 sqrt-15): 49 + 240 = 289.
- 7/17 = 11 mod 15, which gives (eps_3, eps_5) = (-1, +1).

The formula's representative for the class of (3,0,5) is N a = 23, lambda = -17 + 4 sqrt-15. It gives -17/23 = 2 mod 3, i.e.
-1, and 1 mod 5, i.e. +1. These agree.

**Proof of (c), (d).**
- *If n is not idoneal,* some [a]^2 != 1. Then ρ(abar/a) is non-trivial on H_O ⊂ KE, so it moves some b_k. That conjugate of
  b_k is not real, so E is not abelian.
- *If n is idoneal with two or more primes,* the class of Q_r has eps non-constant. Then ρ(abar/a) sends b_1 to b_{t}, t != ±1,
  and b_t != b_1 (Lemma 4′). So ρ([a])(b_1) is not real, and both Q(b_1) and E are non-abelian. This is (d), and it does not
  need Q(b_1) = E.
- *If n is an idoneal prime power,* Cl = Cl[2], and eps has a single component, so it is constant. (By §7, eps_r = -1 on the
  ambiguous class: a single -1 is constant.) By §6, step 5, E is abelian.

## 8. The list (referee step 8)
- Odd idoneal prime powers with exponent >= 2: by [Kani] Thm 12 (Grube; quoted verbatim in the referee reply), a square factor
  t^2 of an idoneal n has t^2 in {1, 4, 9, 16, 25}; 9 | n forces n in {9, 18, 45, 72}; 25 | n forces n = 25. So they are 9 and 25.
- Odd idoneal primes: p is idoneal iff Cl(-4p) is an elementary 2-group ([Kani] Thm 6). For p >= 5, C4 (v5.1, AI-refereed)
  shows abelian <=> h(-4p) <= 2 <=> p in {5, 7, 13, 37}, unconditionally:
  - Lemma E′ (parity) plus the class-number-1 order list ([KSY25] Rem 5.2(iii), opened);
  - the class-number-2 field list (LMFDB, opened, completeness stated; Baker-Stark).
  - A hypothetical further idoneal fundamental discriminant ([Kani] Thm 22(a)) would have to be a prime p with h(-4p) <= 2.
    The lists exclude it, so the prime part is exact. The proofs of those lists are not opened (GAP-L′ of v5.1, inherited).
- **List: {3, 5, 7, 9, 13, 25, 37}.** p = 3 has b_1 = 2 (trivially abelian).

## 9. Corrections to RESULT-V23 step 9
- **False sentence withdrawn:** "15 has the maximal order of Q(sqrt -15)". Z[sqrt -15] has discriminant -60 = 4·(-15),
  conductor 2. It is not maximal.
- Correct example: **Z[sqrt -21] is maximal** (-84 is fundamental: 21 = 1 mod 4 and squarefree), and 21 is not abelian. So are
  33, 85, 93, 105. 9 and 25 have non-maximal orders (conductors 3 and 5 in Z[i]) and are abelian.
  So the order being maximal or not is still irrelevant.
- "Inversion on Gal(L/K)" is the wrong test, as the referee notes. The test is whether c commutes with ρ(C), computed in §4.

## Gap ledger (round 3)

| Referee item | Status now |
|---|---|
| Step 1 (level) | CORRECT WITH FIXES (r2), fixes applied: 2.4(ii) cited for the move, 2.4(iii) for the phase; Γ(4n) is a case of Class I* |
| Step 2 (cocycle) | Round-2 GAP addressed: Class II* proved by congruences on the page (halves u, v are integers; case e = 1 uses det M = 1 mod 4); E derived on the page from opened KSY10 2.4(ii), (iii); Lemma 0 (B_{-k} = B_k) on the page; mod-8 run is a confirmation only |
| Step 3 (the field) | CLOSED by reformulation: E described inside K_{O,4n} via S; degree proved; no ray-class-field naming needed |
| Step 4 (conjugation) | CLOSED: computed from Prop 4.1 formula + rational coefficients; Artin symbol not used |
| Step 5 (prime to 4n) | CLOSED: lambda prime to 4n since N lambda = (N a)^2 |
| Step 6 (count) | CLOSED for E; for Q(b_1) needs Q(b_1) = E |
| Step 7 (eps) | CLOSED: exact formula for every ambiguous class; n = 15 hand check agrees |
| Steps 8, 9 | fixes applied (C4 dependency stated; maximal-order sentence corrected) |

**Remaining (stated, not hidden):**
1. **Q(b_1) = E for non-idoneal composite n.** Equivalently H_O ⊂ K(b_1). Verified numerically at 11, 27, 49 (and 9, 15, 21, 25,
   33, 45, 57, 85, 93, 105); for primes only the non-abelian conclusion is proved (C4), Q(b_1) = E stays OPEN (G1). It is not proved in general, so (c) is proved for the field of all pieces,
   while the b_1-only version is proved for idoneal n and numerical otherwise.
2. **Inherited citations:** [KSY25] Props 3.1/4.1/Lemma 7.3 (proofs cited to [13], [14] there); [KSY10] 2.4 (opened this session via ar5iv;
   the v4-seat opening agrees); the class-number lists (GAP-L′).
3. **Transfer audits:** the "only n odd is used" audits of v4 Lemmas 2, 3, 4′ and v5.1 Lemmas A-C / Prop D are by reading. They
   should get a referee look.

Files: c5_checks.gp, c5_checks_out.txt (checks A-E), c5_checks_v3.gp, c5_checks_v3_out.txt (mod-8 confirmation); earlier run files in this folder. Engine: WSL PARI/GP, -s 2G, one gp
process, under 1 minute.
