# Proof write-up v4: Galois rule (C2), field rule (C1) and integrality (C3) for the dissection pieces b_k
Proof seat (blind), 2026-10-27. v4 = v3 plus the three fixes of reviewer B referee round 3 (proof/referee-3-seatB-reply.md); nothing else is changed. v1–v3 are kept.
This version is self-contained: no step says "as in v1". Scripts and transcripts are in `proof/checks/`. The v3 change list is kept at the end, followed by the v4 changes.

> **Referee status**
> - **C1 and C2 (p ≥ 5) and C3a: PROVED.** Two independent referees accepted them with fixes; the fixes are applied here.
> - **C3b (p ≡ 3 mod 8, p ≥ 11): PROVED modulo the named standard facts G3′ and G5.**
> - **C3c (unit iff p ≡ 7 mod 8): CONJECTURE.** It depends on G4.

## In plain words
Each piece u_k is a ratio of two classical "Siegel functions" evaluated at √−p. These functions have exact rules for how they change
under the modular group. A published, explicit form of Shimura's reciprocity law for orders turns those rules into rules for how the
Galois group moves the values. That form is Proposition 5.1 of Koo–Shin–Yoon 2025, after Stevenhagen; I opened it.

The outcome, for every prime p ≥ 5: a symmetry that multiplies the p-th roots of unity by a square t² sends b_k to b_{tk}. The field rule
(C1) and the Galois rule (C2) follow from it.

For C3, every b_k is an algebraic integer whose norm is ±(power of 2). For p ≡ 3 (mod 8), p ≥ 11, b_k is not a unit. That proof now uses
only Weber's transformation laws, derived on the page from opened definitions. The full "unit iff p ≡ 7 (mod 8)" remains a **conjecture**.

| claim | status |
|---|---|
| C2 (σ_a fixes Q(j(√−p))), p ≥ 5 | **PROVED** (opened sources: KSY25 Prop 5.1, KSY10) |
| C1 (field rule; degree h(p−1)/2; b_1 generates), p ≥ 5 | **PROVED** (same) |
| C3a: b_k algebraic integer, N(b_k) = ±2^e, p ≥ 5 | **PROVED** |
| C3b: p ≡ 3 (mod 8), p ≥ 11: v(y) = v(2)/3, not a unit, e = p·h(−4p)(p−1)/6 | **PROVED**, modulo the definitional gap G3′ |
| C3c: unit iff p ≡ 7 (mod 8) | **CONJECTURE** (one half = C3b; the rest needs the unopened Hasse–Deuring theorem, G4) |
| p = 3 | trivial: b_1 = 2 (checked to 210 digits) |

## 0. Sources
- **[KSY25]** Koo, Shin, Yoon, *A simplified algorithmic realization of Galois actions on special values of modular functions*,
  arXiv:2506.14139v1. OPENED (PDF text, today). Two sections are used:
  - §2 defines K_{O,N}, the ray class field of the order O modulo NO, via C_N(O) ≅ Gal(K_{O,N}/K).
  - §4 says: "Let F_N denote the field of meromorphic modular functions of level N whose Fourier coefficients lie in the Nth
    cyclotomic field". A lift of α ∈ SL2(Z/N) acts by composition, and diag(1,d) acts on coefficients through ζ_N ↦ ζ_N^d.
    The CM point is τ_O = √D/2 if D ≡ 0 (mod 4), with irr(τ_O, Q) = x² + b_O x + c_O, "so that O = Zτ_O + Z".
    Also: "K_{O,N} = K(f(τ_O) | f ∈ F_N is finite at τ_O)" (cf. Shimura Thm 6.2.3).
  - **§5, Prop 5.1** ("concrete version of Shimura's reciprocity law … due to Stevenhagen"):
    W_{O,N} = {[t − b_O s, −c_O s; s, t] ∈ GL2(Z/N)}, and T_{O,N} is the image of O*.
    "there exists a well-defined isomorphism W_{O,N}/T_{O,N} → Gal(K_{O,N}/H_O), [α] ↦ (f(τ_O) ↦ f^α(τ_O) | f ∈ F_N is finite at τ_O)".
    Its proof is cited as Stevenhagen [ASPM 30] §§3, 4, 6, and Cox Lemma 15.17, Thm 15.22.
  - Remark 5.2(i): O* = O ∩ O_K* has order 2 unless D = −3, −4.
  - Remark 3.2(i) / Prop 3.1: C_1(D) ≅ C_1(O) ≅ Gal(K_{O,1}/K), and |C_1(D)| = h = the number of reduced forms (citing Cox Thm 2.8, 7.7).
  - (H_O = K(j(τ_O)) = K_{O,1} is derived in C1 step 1. Remark 5.2(ii) is not cited for it.)
- **[KSY10]** Koo, Shin, Yoon, arXiv:1008.0473v2. OPENED.
  - (1.3): the Siegel function definition.
  - Prop 2.1: F_N is Galois over F_1 = Q(j), with group GL2(Z/N)/{±1}, and the action described as above.
  - Prop 2.2(i)–(iii): integrality; units for a composite denominator; no zeros or poles on H; g_r^{12N/gcd(6,N)} ∈ F_N.
  - Prop 2.4(ii),(iii),(v): transformation and translation formulas; ord_q g_r = ½B2(⟨r1⟩).
  - Prop 2.6(ii), and the proof of 2.6(i).
  - Prop 3.1(i): j(τ0) is an algebraic integer.
  - Prop 4.3: K(N) = K F_N(θ_K).
  - Prop 4.7: W_{K,N} → Gal(K(N)/H_K), with kernel {±1} for K ≠ Q(i), Q(√−3).
- **[Wiki-W]** Wikipedia, "Weber modular function". OPENED.
  - Definition: 𝔣(τ) = q^{−1/48}Π(1+q^{n−1/2}) = η²(τ)/(η(τ/2)η(2τ)); 𝔣1 = q^{−1/48}Π(1−q^{n−1/2}) = η(τ/2)/η(τ);
    𝔣2 = √2 q^{1/24}Π(1+q^n) = √2 η(2τ)/η(τ).
  - Verbatim: "The transformation τ → −1/τ fixes f and exchanges f1 and f2."
  - "Relation to j-function": "The three roots of the cubic equation" j(τ) = (x−16)³/x are x_i = 𝔣^{24}, −𝔣1^{24}, −𝔣2^{24}.
- **[Wiki-η]** Wikipedia, "Dedekind eta function", §Definition. OPENED. η(τ+1) = e^{πi/12}η(τ) and η(−1/τ) = √(−iτ)η(τ), with √(−iτ) = 1 at τ = i.
- **[CMS]** arXiv:math/0311202. OPENED. Used here only for the transpose convention and as a consistency check.
  Its (3.1) is stated for Γ_0(n)-functions with rational q-expansion, so it is **not** used for B_k.
- **[Gee]** JTNB 1999. OPENED, but the text layer is broken. No longer load-bearing.
- Not opened: Shimura's book, Stevenhagen 2001 (listing only), Cox, Schertz, Kubert–Lang, Neukirch. SNIPPET only: Cais–Conrad, Yang.

## 1. Setting, Siegel expression, level
p ≥ 5 is prime. τ0 = √−p. O = Z[√−p] = Zτ0 + Z, with D = −4p ≡ 0 (mod 4). So τ_O = √D/2 = τ0, b_O = 0, c_O = p.
O* = {±1} (KSY25 Rem 5.2(i)), so T_{O,N} = {±I}. K = Q(√−p). H_O is the ring class field of O; H_O = K(j(τ0)) = K_{O,1} is shown in C1 step 1.
**h = h(−4p) := |C_1(D)|** (KSY25 Prop 3.1 / Rem 3.2(i)).
θ[a](τ) = Σ_n e^{πiτ(n+a)²}. a_k = ((p+2k)/2p, 1/2) and a_0 = (1/2, 1/2).

For an integer m with p ∤ m, define B_m := (2θ[m/p]/θ[0])^p. Since θ[a+1] = θ[a] (shift n) and θ[−a] = θ[a] (n ↦ −n),
**B_m depends only on ±m mod p** (exact identity). So B_{tk} is well defined for t ∈ (Z/p)*.

**Lemma 1.** For 1 ≤ k ≤ (p−1)/2 (so p ∤ k): u_k = 2θ[k/p](τ0)/θ[0](τ0) = 2e^{−πik/2p} g_{a_k}(τ0)/g_{a_0}(τ0), and b_k = B_k(τ0) with
B_k = 2^p(−i)^k (g_{a_k}/g_{a_0})^p. The Siegel form also holds for every integer m with p ∤ m (with a_m := ((p+2m)/2p, 1/2)).
*Proof.* q^{k²/p}f(q^{p+2k}, q^{p−2k}) = Σ_n q^{(pn+k)²/p} = θ[k/p](i√p), because (pn+k)²/p = p(n+k/p)² and q = e^{−π/√p}. Likewise φ(q^p) = θ[0](i√p).
The Jacobi triple product gives θ[a](τ) = q^{a²/2}Π_{n≥1}(1−q^n)(1+q^{n−1/2+a})(1+q^{n−1/2−a}), with q = e^{2πiτ}.
In KSY10 (1.3) with r = (a+½, ½): q_z = −q^{a+1/2} and B2(a+½) = a² − 1/12. So
g_{(a+½,½)} = −e^{πi(a/2−1/4)} q^{a²/2−1/24} Π(1+q^{n−1/2+a})(1+q^{n−1/2−a}).
Taking the ratio of the a = m/p case to the a = 0 case gives θ[m/p]/θ[0] = e^{−πim/2p} g_{a_m}/g_{a_0}. ∎
Check: `a_siegel_out.txt`, ≥ 269 digits at p = 7, 11, 13.

**Lemma 2.** B_k ∈ F_{4p}.
*Proof.* Three points.
1. *q-expansion.* By the triple product, B_k = 2^p q^{k²/2p} Π_{n≥1}(1+q^{n−1/2+k/p})^p (1+q^{n−1/2−k/p})^p (1+q^{n−1/2})^{−2p}.
   Every exponent lies in (1/2p)Z ⊂ (1/4p)Z. Every exponent n−1/2±k/p is positive (k < p/2), and the coefficients are integers, hence in Q(ζ_{4p}).
2. *Meromorphy.* B_k is holomorphic on H, because g_{a_0} has no zeros (KSY10 2.2(iii)). At a cusp γ∞, KSY10 2.4(ii) gives
   B_k∘γ = 2^p(−i)^k(g_{a_kγ}/g_{a_0γ})^p, and each g_r has a q-expansion of finite order (KSY10 2.4(v), (1.3)). So B_k is meromorphic at every cusp.
3. *Γ(4p)-invariance.* Let γ = I + 4pM ∈ SL2(Z). The ε(γ) of KSY10 2.4(ii) cancels in the ratio. Next, a_kγ = a_k + s with
   s = (2((p+2k)M11 + pM21), 2((p+2k)M12 + pM22)), and a_0γ = a_0 + c with c = (2p(M11+M21), 2p(M12+M22)).
   Both s and c lie in (2Z)², so the signs (−1)^{s1s2+s1+s2} and (−1)^{c1c2+c1+c2} in KSY10 2.4(iii) are 1. The p-th powers of the exponentials are:
   - e^{−πip(s1/2 − s2(p+2k)/2p)} = (−1)^{p(p+2k)M11 + p²M21 + (p+2k)²M12 + p(p+2k)M22} = (−1)^{M11+M21+M12+M22};
   - e^{−πip(c1/2 − c2/2)} = (−1)^{p²(M11+M21−M12−M22)} = (−1)^{M11+M21+M12+M22}.
   They cancel, so B_k∘γ = B_k. ∎

## 2. Key lemma
For x = t + s√−p with d := t² + ps² prime to 4p (so t + s is odd), put g(x) = [t, −ps; s, t]. This is exactly the element of W_{O,4p}
attached to (t, s) in KSY25 Prop 5.1, since b_O = 0 and c_O = p.

**Lemma 3.** B_k^{g(x)} = B_{tk} (exact; see §1 for B_m).

*Set-up.* γ := diag(1,d^{−1})g(x) ∈ SL2(Z/4p), with any lift γ̃ = [A, B; C, D] ∈ SL2(Z). Lemma 2 makes the choice of lift irrelevant.
Then A ≡ t, B ≡ −ps, C ≡ sd^{−1}, D ≡ td^{−1} (mod 4p). Also g(x) = diag(1,d)·γ.

Whichever composition convention the GL2(Z/N)-action uses, B_k^{g(x)} = B_{tk} follows from B_k∘γ̃ = B_{tk}. The reason:
- If diag(1,d) acts first, it fixes B_k (rational coefficients).
- If it acts last, it fixes B_{tk} (rational coefficients).
So it suffices to prove **B_k∘γ̃ = B_{k′}**, where k′ ∈ [0,p) and k′ ≡ kt (mod p).

By KSY10 2.4(ii), B_k∘γ̃ = 2^p(−i)^k (g_{a_kγ̃}/g_{a_0γ̃})^p. Define the integers
- s1 = ((p+2k)A + pC − p − 2k′)/2p
- s2 = ((p+2k)B + pD − p)/2p
- c1 = (A+C−1)/2
- c2 = (B+D−1)/2

They are integers because A + C ≡ t + s ≡ 1 (mod 2), the first numerator is ≡ 2kt − 2k′ ≡ 0 (mod p), and B = pB′ with B′ ≡ −s (mod 4).
Then a_kγ̃ = a_{k′} + (s1, s2) and a_0γ̃ = a_0 + (c1, c2).

KSY10 2.4(iii), raised to the p-th power (p odd), gives B_k∘γ̃ = i^E B_{k′} with
**E = T1+T2+T3+T4+T5+T6**, where
- T1 = −(k−k′)
- T2 = 2(s1s2+s1+s2)
- T3 = −p·s1
- T4 = (p+2k′)s2
- T5 = −2(c1c2+c1+c2)
- T6 = p(c1−c2)

These come from ε(a_{k′}, s)^p = i^{2(s1s2+s1+s2) − p s1 + (p+2k′)s2}, ε(a_0, c)^p = i^{2(c1c2+c1+c2) − p(c1−c2)}, and (−i)^{k−k′} = i^{−(k−k′)}.
We show E ≡ 0 (mod 4).

**Class I: x ≡ 1 (mod 4O)** (t ≡ 1, s ≡ 0 mod 4).
Then d ≡ 1 (mod 4) and γ̃ ≡ I (mod 4); also B ≡ 0 (mod 4p). Write A = 1+4α, B = 4pβ, C = 4κ, D = 1+4δ. Exactly:
- c1 = 2(α+κ) and c2 = 2(pβ+δ);
- s2 = 2((p+2k)β+δ);
- p·s1 = (k−k′) + 2(p+2k)α + 2pκ, so s1 ≡ k−k′ (mod 2).

Mod 4:
- T1 = −(k−k′).
- T2 ≡ 2s1 ≡ 2(k−k′), since s2 is even.
- T3 ≡ −(k−k′) − 2α − 2κ.
- T4 ≡ 2(β+δ).
- T5 ≡ 0.
- T6 = 2p(α+κ−pβ−δ) ≡ 2(α+κ+β+δ).

Sum ≡ 4(β+δ) ≡ 0.

**Class II: x ≡ 1 (mod pO)** (t ≡ 1, s ≡ 0 mod p).
Then k′ = k and γ̃ = I + pM, so A = 1+pM11, B = pM12, C = pM21, D = 1+pM22. Exactly:
- c1 = p(M11+M21)/2 and c2 = p(M12+M22)/2;
- s1 = c1 + kM11 and s2 = c2 + kM12.

Hence:
- **T3 + T6 = −p(c1 + kM11) + pc1 − pc2 = −pkM11 − pc2**;
- **T4 = (p+2k)s2 = pc2 + pkM12 + 2ks2**;
- so T3 + T4 + T6 = −pkM11 + pkM12 + 2ks2 = k(B − A + 1) + 2ks2, using pM11 = A−1 and pM12 = B (the pc2 terms cancel);
- **T2 + T5 = 2·Δ**, with Δ := (s1+1)(s2+1) − (c1+1)(c2+1), since Z1Z2 + Z1 + Z2 = (Z1+1)(Z2+1) − 1.

So E = 2Δ + k(B−A+1) + 2ks2 exactly. Put X = t−1+ps and Y = t−1−ps (both even). Then, mod 4:
- 2c1 = A−1+C ≡ X
- 2c2 = B+D−1 ≡ Y
- 2s1 = 2c1 + 2kM11 ≡ X + 2ks
- 2s2 ≡ Y + 2ks
- B − A + 1 ≡ −X

These use M11 ≡ t−1 ≡ s and M12 ≡ s (mod 2). For s even (t odd): d ≡ 1, C ≡ s ≡ ps, D ≡ t. For s odd (t even): d ≡ d^{−1} ≡ p, C ≡ ps, D ≡ tp ≡ t.
- *s even:* s1 ≡ c1 and s2 ≡ c2 (mod 2), so **Δ is even and 2Δ ≡ 0 (mod 4)**.
  E ≡ −kX + k(2s2) ≡ −kX + kY = −2kps ≡ 0 (mod 4), because s is even.
  (k·(2s2) ≡ kY is the congruence 2s2 ≡ Y multiplied by the integer k.)
- *s odd:* X − Y = 2ps ≡ 2 (mod 4), so c1 + c2 ≡ (X+Y)/2 = t−1 ≡ 1 (mod 2). Then (c1+1)(c2+1) is even.
  Likewise s1 + s2 ≡ c1 + c2 ≡ 1 (mod 2), so (s1+1)(s2+1) is even. Thus **Δ is even and 2Δ ≡ 0 (mod 4)**.
  E ≡ −kX + k(Y+2k) = −2kps + 2k² = 2k(k−ps) ≡ 2k(k−1) ≡ 0 (mod 4).

**General x.** O/4pO ≅ O/4O × O/pO, so x = x1x2 with x1 ≡ x (mod p), x1 ≡ 1 (mod 4), and x2 ≡ 1 (mod p), x2 ≡ x (mod 4); both are prime to 4p.
g(x1x2) = g(x1)g(x2) = g(x2)g(x1), because O is commutative and the multiplication matrices commute.
So, in either composition order, B_k^{g(x)} = B_{t1t2k} = B_{tk}. ∎

*Checks.*
- `f_v2checks_out.txt (b)`: every displayed identity and residue, all x in classes I and II, 5 ≤ p ≤ 31, two lifts; 76,602 cases, 0 failures.
- `b_rootcheck_out.txt`: E ≡ 0 for every x and k, 5 ≤ p ≤ 61; the negative control fails.
- `a_siegel_out.txt`: analytic check from theta series.
- Independently, the first referee's from-scratch code: 30,624 pairs, 0 failures.

## 3. C2 and C1 (p ≥ 5)
β_k := b_k = B_k(τ0), which is real and positive. M := H_O(ζ_p). L := K_{O,4p}.

**Proposition 4.** Every σ ∈ Gal(L/H_O) has the form σ_α with α = g(x) for some (t, s) with d = t² + ps² ∈ (Z/4p)*. For such σ:
- σ(β_k) = β_{tk};
- σ(ζ_{4p}) = ζ_{4p}^{d}, with d ≡ t² (mod p).

Also β_k, ζ_{4p} ∈ L and H_O ⊂ L.
*Proof.* B_k ∈ F_{4p} (Lemma 2) is finite at τ0, and so is the constant ζ_{4p} ∈ F_{4p}. So both values lie in L (KSY25 §4).
KSY25 Prop 5.1 with N = 4p, τ_O = τ0, b_O = 0, c_O = p: Gal(L/H_O) = {σ_α : α ∈ W_{O,4p}} with W_{O,4p} = {g(x)}, and σ_α(f(τ0)) = f^α(τ0).
- For f = B_k, Lemma 3 gives B_{tk}(τ0) = β_{tk}.
- For f = ζ_{4p}, the action of α = diag(1,d)γ on coefficients (KSY25 §4, KSY10 2.1) gives ζ_{4p}^d.
- H_O ⊂ K_{O,4p}: this is part of the statement of KSY25 Prop 5.1, which identifies Gal(K_{O,4p}/H_O). ∎

For p ≡ 1 (mod 4), KSY10 Prop 4.7 at θ_K = √−p (O = O_K) gives the same statement independently.

**Lemma 4′ (distinctness).** u_1 > u_2 > … > u_{(p−1)/2} > 0.
*Proof.* Let c = π/p^{3/2}. Then θ[k/p](τ0) = Σ_n e^{−c p²(n+k/p)²}. Poisson summation gives (π/cp²)^{1/2} Σ_m r^{m²}e^{2πimk/p}, with r = e^{−π²/cp²} = e^{−π/√p} ∈ (0,1).
The triple product turns this into C·Π_{n≥1}(1−r^{2n})(1 + 2r^{2n−1}cos(2πk/p) + r^{4n−2}), with C > 0.
Every factor is positive (it is ≥ (1−r^{2n−1})²) and strictly decreasing in k ∈ [0, p/2]. ∎

**Theorem C1.** b_k ∈ F_p := (K(j(√−p))·Q(ζ_p))^+, the real subfield of K(j(√−p), ζ_p) = M.
(The letter N is the level 4p. By step 3, M equals the brief's K(j(√−p), ζ_{4p}) when p ≡ 1 (mod 4).)
Moreover [F_p:Q] = h(p−1)/2 and F_p = Q(j(√−p))(b_1).

*Proof.*
1. *Facts about H_O.*
   - j∘γ = j for γ ∈ SL2(Z), and the Fourier coefficients of j are rational. So every class in W_{O,4p} fixes j(τ_O) (KSY25 §4 action and Prop 5.1).
   - Hence j(τ_O) lies in the fixed field of Gal(K_{O,4p}/H_O), i.e. K(j(τ_O)) ⊂ H_O.
   - Degrees: K(j(τ_O)) = K(f(τ_O) | f ∈ F_1) = K_{O,1} (KSY25 §4 with F_1 = Q(j), KSY10 2.1), which has degree |C_1(D)| = h over K (KSY25 Prop 3.1, Rem 3.2(i)). H_O also has degree h over K, by the CM isomorphism C_1(D) ≅ Gal(H_O/K): CMS §3, "C(O) … naturally isomorphic to … Gal(H_O/K)", which KSY25 Rem 5.2(ii) also quotes.
   - Both have degree h over K, so **H_O = K(j(τ_O)) = K_{O,1}**.
   j(τ0) is real (q real) and an algebraic integer (KSY10 3.1(i)).
   Since j(τ0) is real, K and ζ_p are mapped into H_O and M by complex conjugation. So H_O and M are stable under it.
   Also H_O ∩ R = Q(j(τ0)), because Q(j(τ0)) ⊂ H_O ∩ R ⊊ H_O and [H_O : Q(j(τ0))] = [K(j):Q(j)] = 2.
2. *β_k ∈ M.* Gal(L/M) = {σ_α : d ≡ 1 (mod p)}. Then t ≡ ±1, so σ_α(β_k) = β_{±k} = β_k (Prop 4). Hence β_k ∈ M, and since β_k is real, β_k ∈ M ∩ R =: F_p.
3. *M = H_O(ζ_N).* For p ≡ 1 (mod 4), every σ ∈ Gal(L/H_O) acts on ζ_p by a square d ≡ t². So √p ∈ Q(ζ_p) is fixed, √p ∈ H_O, and i = √−p/√p ∈ H_O.
4. *Degree.* Restriction to ζ_p embeds Gal(M/H_O) into the squares of (Z/p)*, so |Gal(M/H_O)| ≤ (p−1)/2.
   Conversely, for each t0 ∈ (Z/p)*, take (t, s) = (t, 0) with t ≡ t0 (mod p) and t ≡ 1 (mod 4). Then σ_α(β_1) = β_{t0}.
   By Lemma 4′ the β_t are distinct for t ∈ (Z/p)*/±1. So the orbit of β_1 under Gal(M/H_O) has (p−1)/2 elements.
   Hence |Gal(M/H_O)| = (p−1)/2 and β_1 has trivial stabiliser, so M = H_O(β_1).
5. *Conclusion.* [M:Q] = 2h(p−1)/2 = h(p−1). M ⊄ R, so [F_p:Q] = h(p−1)/2.
   F_p ∩ H_O = Q(j(τ0)) and F_p·H_O = M, so restriction gives Gal(M/H_O) ≅ Gal(F_p/Q(j(τ0))), and F_p = Q(j(τ0))(β_1). ∎

**Theorem C2.** Let σ_a be an automorphism of F_p that **fixes Q(j(√−p))** and maps cos(2πj/N) ↦ cos(2πaj/N). (This is the meaningful reading: the Q-orbit of b_1 has h(p−1)/2 elements.)
Define the sign **ε(a) = (a/p) for p ≡ 3 (mod 4)**, and **ε(a) = (−1)^{(a−1)/2} for p ≡ 1 (mod 4)**.
Then **σ_a(b_k) = b_{±xk}, with x² ≡ ε(a)a (mod p)**, and the lift σ̃ below acts on ζ_N by a″ = ε(a)a.
Such σ_a exists for every a when p ≡ 3 (mod 4), and iff (a/p) = 1 when p ≡ 1 (mod 4).

*Proof.* M = F_p(√−p). Extend σ_a to σ̃ on M with σ̃(√−p) = √−p. Then σ̃ fixes K(j(τ0)) = H_O, so σ̃ ∈ Gal(M/H_O).
σ̃(ζ_N) = ζ_N^{a″} with a″ ≡ ±a (mod N), since σ̃ acts on cosines as σ_a does.
- p ≡ 3 (mod 4): √−p ∈ Q(ζ_p) is fixed, so (a″/p) = 1. Since (−1/p) = −1, a″ = (a/p)a.
- p ≡ 1 (mod 4): i ∈ H_O (step 3) is fixed, so a″ ≡ 1 (mod 4), i.e. a″ = (−1)^{(a−1)/2}a. Also √p ∈ H_O is fixed, which requires (a/p) = 1.
  Conversely, suppose (a/p) = 1. Restriction to ζ_{4p} maps Gal(M/H_O) injectively into the set of classes mod 4p that are ≡ 1 (mod 4) and squares mod p.
  That set has (p−1)/2 elements, the same as |Gal(M/H_O)| (step 4), so the map is onto and σ̃ exists.
  For p ≡ 3 (mod 4), the analogous map onto the squares mod p is bijective, so σ̃ exists for every a.
- In all cases a″ = ε(a)a. Lift σ̃ to σ_α ∈ Gal(L/H_O). By Prop 4, σ̃(b_k) = b_{tk} with t² ≡ d ≡ a″ (mod p). ∎

Data: all 161 stored MAP lines match (`c_mapcheck_out.txt`).

## 4. C3
**Lemma 5.** For 1 ≤ k ≤ (p−1)/2 (so p ∤ k):
**b_k = c_k · g_{a_k}(τ0)^p · y^p**, where y := 2/𝔣(τ0)² = i·g_{(0,1/2)}(τ0)g_{(1/2,0)}(τ0) and c_k := (−i)^k e^{−3πip/4}.
c_k is a root of unity. Equivalently c_k = (−i)^k e^{−πip/4}·i^{−p} = (−i)^k·(−e^{πip/4}), because e^{−3πip/4}/e^{πip/4} = e^{−πip} = −1 for odd p.
The referee's mismatch came from comparing with (−i)^k e^{−πip/4}, which drops the factor i^{−p}. With that factor kept, the two forms are equal.

*Proof.* The proof of KSY10 2.6(i) gives g_{(1/2,1/2)} = −e^{−πi/4}𝔣². KSY10 2.6(ii) gives 2/g_{a_0} = e^{−πi/4}g_{(0,1/2)}g_{(1/2,0)}.
So y = 2/𝔣² = −2e^{−πi/4}/g_{a_0} = −e^{−πi/2}g_{(0,1/2)}g_{(1/2,0)} = i·g_{(0,1/2)}g_{(1/2,0)}, and
b_k = 2^p(−i)^k g_{a_k}^p g_{a_0}^{−p} = (−i)^k e^{−πip/4}(g_{(0,1/2)}g_{(1/2,0)})^p g_{a_k}^p = (−i)^k e^{−πip/4} i^{−p} y^p g_{a_k}^p. ∎
Checked: `d_units_out.txt` computes exactly (−i)^k e^{−πip/4} g_{a_k}^p (g_{(0,1/2)}g_{(1/2,0)})^p and matches u_k^p to 1502 digits.

**Theorem C3a.** b_k is an algebraic integer, a {2}-unit, N(b_k) = ±2^e, and b_k is a unit iff y is a unit.
*Proof.* p ∤ k and p + 2k is odd, so the first coordinate (p+2k)/2p of a_k has exact denominator 2p, which is composite.
KSY10 2.2(i),(ii) and 3.1(i) make g_{a_k}(τ0)^{±1} algebraic integers, so g_{a_k}(τ0) is a unit.
(a_0 = (½,½) has denominator 2, which is not composite. It is handled through y.)
KSY10 2.2(i) and 2.6(ii): y and g_{a_0}(τ0) are integral, and y·g_{a_0}(τ0) = 2·(root of unity). So y | 2. ∎

**Identity.** For p ≡ 3 (mod 4) and τ′ = (−1+√−p)/2: **y^{12} = −𝔣2(τ′)^{24}**.
*Proof.* Put Δ = η^{24}. [Wiki-W] gives 𝔣(τ) = e^{−πi/24}η((τ+1)/2)/η(τ), so 𝔣^{24}(τ) = e^{−πi}Δ((τ+1)/2)/Δ(τ) = −Δ((τ+1)/2)/Δ(τ).
It also gives 𝔣2 = √2η(2τ)/η(τ), so 𝔣2^{24}(τ) = 2^{12}Δ(2τ)/Δ(τ).
With τ0 = 2τ′+1 and Δ(τ+1) = Δ(τ) ([Wiki-η]): 𝔣(τ0)^{24} = −Δ(τ′)/Δ(τ0) and 𝔣2(τ′)^{24} = 2^{12}Δ(τ0)/Δ(τ′). Multiply. ∎
(Checked to 615 digits.)

**Weber laws (derived, not numerical).** Let R0 = 𝔣^{24}, R1 = −𝔣1^{24}, R2 = −𝔣2^{24}, the three roots of (X−16)³ − jX ([Wiki-W]).
- *T: τ ↦ τ+1.* In the [Wiki-W] q-products, q^{n−1/2} = e^{2πi(n−1/2)τ} picks up e^{2πi(n−1/2)} = −1, and q^n is unchanged.
  So 𝔣(τ+1) = e^{−πi/24}𝔣1(τ), 𝔣1(τ+1) = e^{−πi/24}𝔣(τ), and 𝔣2(τ+1) = e^{πi/12}𝔣2(τ).
  In 24th powers: R0∘T = R1, R1∘T = R0, R2∘T = R2.
- *S: τ ↦ −1/τ.* From the eta forms and η(−1/τ) = √(−iτ)η(τ) ([Wiki-η]), checked on τ = iy (all square roots positive) and extended by holomorphy:
  - 𝔣1(−1/τ) = η(−1/2τ)/η(−1/τ) = √(2y)η(2τ)/(√y η(τ)) = 𝔣2(τ);
  - 𝔣2(−1/τ) = √2 η(−2/τ)/η(−1/τ) = √2·√(y/2)η(τ/2)/(√y η(τ)) = 𝔣1(τ);
  - 𝔣(−1/τ) = y·η(τ)²/(√(2y)η(2τ)·√(y/2)η(τ/2)) = 𝔣(τ).
  This agrees with [Wiki-W]'s "fixes f and exchanges f1 and f2". So R0∘S = R0, R1∘S = R2, R2∘S = R1.
- *Level 2.* R_i∘T² = R_i and R_i∘(ST²S) = R_i follow from these rules. The R_i are series in q^{1/2} with integer coefficients.
  That Γ(2) is generated by T², ST²S^{−1} and −I is MEMORY (G5); [Gee] §4's "of level 2" says the same but its text layer is unreliable.
  So R_i ∈ F_2, and their GL2(Z/2)-action is given by S and T.
- *The 3-cycle.* α ≡ [1,1;1,0] (mod 2) lifts to TS = [1,−1;1,0] ∈ SL2(Z). Then R0∘(TS) = (R0∘T)∘S = R1∘S = R2, R2∘(TS) = R2∘S = R1, and R1∘(TS) = R0∘S = R0.
  So α acts as the 3-cycle R0 → R2 → R1 → R0. If the convention is f^{α} = f∘(ST) instead, it is the inverse 3-cycle; either way it is a 3-cycle.

**Theorem C3b (p ≡ 3 mod 8, p ≥ 11).** At every prime 𝔓 above 2, v_𝔓(y) = v_𝔓(2)/3. Hence b_k is not a unit, and e = p·h(−4p)(p−1)/6.
*Proof.*
1. θ_K = τ′, with irr = X² + X + C and C = (p+1)/4 odd. KSY10 4.7 (N = 2): W_{K,2} = {[t−s, −Cs; s, t]} with det ≡ t² + ts + s² (mod 2).
   So |W_{K,2}| = 3, and the kernel {±1} is trivial mod 2 (K ≠ Q(i), Q(√−3)). Therefore |Gal(K(2)/H_K)| = 3, and σ_α ↔ α = [−1, −C; 1, 0] ≡ [1,1;1,0].
2. R_i ∈ F_2, so R_i(τ′) ∈ K(2) (KSY10 4.3), and σ_α(R_i(τ′)) = R_i^α(τ′). By the Weber laws, σ_α permutes R0(τ′), R1(τ′), R2(τ′) as a 3-cycle.
3. Inertia (G3′). H_K/K is unramified and K(2)/K is unramified outside 2. If the inertia group at 2 in K(2)/K were trivial, K(2) ⊂ H_K, contradicting degree 3.
   It lies in Gal(K(2)/H_K) of prime order 3, so it equals Gal(K(2)/H_K) ∋ σ_α. Hence σ_α fixes every 𝔓 | 2.
4. So the three values have equal 𝔓-valuations. Their product is 4096 (constant term of X³ − 48X² + (768−j)X − 4096), so v_𝔓(R2(τ′)) = 4v_𝔓(2).
   By the Identity, v_𝔓(y) = v_𝔓(2)/3.
5. e = p·(1/3)·[F_p:Q] = p·h(−4p)(p−1)/6. ∎

The equivalent form p·h(−p)(p−1)/2 needs h(−4p) = 3h(−p). That relation is **computed, not cited**: 310/310 primes p ≡ 3 (mod 8), 11 ≤ p < 10^4. It fails at p = 3.

**C3c — CONJECTURE: b_k is a unit iff p ≡ 7 (mod 8).**
- Proved half: non-unit for p ≡ 3 (mod 8), p ≥ 11 (C3b).
- The rest would follow from the Hasse–Deuring ideal theorem (G4, unopened):
  - for p ≡ 7 (mod 8), 𝔣2(τ′) is a unit;
  - for p ≡ 1 (mod 4), v(y) = v(2)/2 and e = p·h(p−1)/4.
- Numerical support at 1500 digits: p = 7, 23, 31, 47, 71 (unit) and 5, 13, 17, 29, 37, 41 (v = 1/2).
- **STRUCTURE.md F4 correction** (p ≡ 3 mod 8): e = p·h(−4p)(p−1)/6. The old "(p−1)/2" fails when h(−p) > 1 (p = 59, 83).

**p = 3.** h(−12) = 1, F_3 = Q, b_1 = u_1³ = 2 (210 digits), and e = 1.

## 5. GAPs
- **G1 (closed for C1/C2):** reciprocity is now KSY25 Prop 5.1 (OPENED), stated for any order at τ_O, for all of F_N.
  Its own proof is cited there to Stevenhagen 2001 §§3, 4, 6 and Cox Thm 15.22 (not opened by me). CMS (3.1) is no longer used for B_k.
- **G2 (closed):** H_O = K(j(τ0)) and [H_O:K] = h now come from KSY25 §4 and Prop 3.1 together with KSY10 2.1; the integrality of j from KSY10 3.1(i).
- **G3′:** H_K/K is unramified, and the ray class field K(2) is unramified outside 2. These are definitions, not opened.
- **G4:** Hasse–Deuring, not opened. This is why C3c is a conjecture.
- **G5:** Γ(2) = ⟨T², ST²S^{−1}, −I⟩ is MEMORY. It is used only to place R_i in F_2 for KSY10 4.7.
  An alternative is to apply 4.7 at level 48, where 𝔣 ∈ F_48, but that also leans on [Gee].

## 6. Files (proof/checks/)
a_siegel, b_rootcheck, c_mapcheck, d_units, e_valuations / e2_trules, f_v2checks (`.gp` / `.py` and `_out.txt`).
No new PARI run for v3: every new step is a derivation or an opened citation.

## Next strike
Prove C3c at p ≡ 7 (mod 8). Use the non-unit idele / ideal form of reciprocity (KSY25 Prop 4.1 gives Gal(K_{O,N}/K) on all of F_N via extended form classes)
with a form of norm 2, and cross-check against KSY10 Prop 3.1(ii).

## Changes from v2
1. Lemma 3:
   - T3 + T6 = −pkM11 − pc2, and its pc2 cancels against T4 = pc2 + pkM12 + 2ks2.
   - "Δ is even, so 2Δ ≡ 0 (mod 4)" replaces "the bracket is 0 mod 4".
   - "up to sign" is dropped: B_m is defined for p ∤ m and is exactly ±m-mod-p invariant (§1).
2. The p ≡ 3 (mod 4) reciprocity gap is closed with an opened source, KSY25 (arXiv:2506.14139) Prop 5.1: W_{O,N}/T_{O,N} ≅ Gal(K_{O,N}/H_O) for any order and all f ∈ F_N, at τ_O = √−p.
   - CMS (3.1) is no longer claimed for B_k.
   - C1 and C2 are re-proved in full inside K_{O,4p}.
   - Lemma 2 is written out explicitly.
   - G2 is closed by KSY25 §4 and Prop 3.1.
3. C3a: the constant is written as c_k = (−i)^k e^{−3πip/4} = (−i)^k e^{−πip/4}i^{−p} = −(−i)^k e^{πip/4}, with the equality shown. The condition p ∤ k is stated, and why a_0 is treated separately.
4. C3b: the numerical 3-cycle file is replaced by the Weber laws.
   - T is derived from the [Wiki-W] q-products; S from the eta forms and η(−1/τ) = √(−iτ)η(τ) ([Wiki-η]), matching [Wiki-W]'s sentence.
   - The 3-cycle R0 → R2 → R1 under TS ≡ α is derived on the page.
   - The cubic's roots are cited from [Wiki-W].
   - New named gap G5 (generators of Γ(2)).

## Changes from v3 (reviewer B referee round 3, accepted with fixes)
1. F_p is defined with Q(zeta_p): F_p := (K(j(sqrt -p)) Q(zeta_p))^+. The letter N is the level 4p.
2. H_O = K(j(tau_O)) = K_{O,1} is derived in C1 step 1: W_{O,4p} fixes j(tau_O), and both fields have degree h over K. Remark 5.2(ii) is not cited for this; Prop 4 cites Prop 5.1 for H_O inside K_{O,4p}.
3. eps(a) is defined inside the statement of C2, and sigma_a(b_k) = b_{+-xk}, x^2 = eps(a)a (mod p), is stated explicitly.
4. Referee status box added at the top.
