# Ramanujan's septic theta identity at every odd prime: explicit analogues, a Galois rule, the abelian cases at every odd level, and Ramanujan's units

Moki & Julio (AI-assisted). Release version 2, October 2026.

---

## In plain words

On page 206 of his "lost notebook", Ramanujan wrote a formula that splits one of his theta functions, at a special point,
into 1 plus three further pieces, and he left the three pieces blank. Rebák filled them in in 2023. The same split exists for
every odd prime p, with 1 plus (p−1)/2 pieces. We found explicit formulas for the pieces at p = 11 and p = 13 (checked numerically
to more than 1,500 digits), computed them for every prime below 100, and proved rules that govern all of them. (The pieces as
functions, before one plugs in the special point, were studied for every prime by Gallouin in 2026; our results are about the
numbers one gets at the special point.)

Four words are used below. An algebraic number is a *unit* when its inverse is also an algebraic integer (as for 1 + √2). A real
number is *cyclotomic* (it "generates an abelian extension of the rationals") when it can be written as a polynomial with rational
coefficients in cos(2π/N) for some N. *Idoneal numbers* are a classical list of 65 numbers found by Euler, from 1 to 1848 (one more
might exist, beyond 1848). A *Stark unit* is a unit whose logarithms give the first derivatives at 0 of certain L-functions; Stark
predicted they exist, and proved it in the setting used here.

- Each piece, raised to the p-th power, lives in one predictable number field, and one symmetry rule produces every piece from the
  first one.
- Every piece is an algebraic integer whose only prime factors lie over 2, and it is a unit exactly when p leaves remainder 7 on
  division by 8. In that case the sizes of the first piece's norm down to the cyclotomic field Q(cos 2π/p) (the product of its
  conjugates over that field) are given by Bernoulli numbers, that is, by values of L-functions.
- Closed forms built from sines, like Ramanujan's at p = 7, can exist only for the primes 3, 5, 7, 13 and 37; we found them at 5, 7,
  13 and 37 (at p = 3 the cube of the piece is just 2). If p may be any odd number, the pieces are cyclotomic exactly for 3, 5, 7, 9, 13, 25 and
  37; at 9 and 25 we have not computed sine forms.
- One rule covers every odd level: the first theta piece of odd level l at the point i√m is cyclotomic exactly when m is idoneal and
  l is a power of a single prime dividing m (never when l has two different prime factors), plus one small accident at level 3 (when
  m leaves remainder 2 on division by 3). The same question has clean answers for the Rogers–Ramanujan continued fraction (only at
  n = 1) and for two continued fractions of even level: the Göllnitz–Gordon fraction (at m = 3, 7 and 15 among m ≥ 2) and Ramanujan's
  cubic continued fraction (at n = 2 and 8 among n ≥ 2).
- For p leaving remainder 7 on division by 8 (proof drafts, one review round): a norm of the first piece is a Stark unit. For
  p ≥ 23 the first piece itself is not one: it is an explicit product of three classical elliptic units (units built from modular
  functions at special points) and a factor from the Hilbert class field (a number field attached to Q(√−p)). At p = 7 the norm is
  the first piece itself, so there a Galois conjugate of the first piece is the Stark unit.

**How far to trust this.** Most of these rules have written proofs that were checked by independent AI reviewers. **No human expert
has checked any of them yet.** That reading is the real bar for calling them theorems, and we ask for it. Some statements are proof
drafts with one review round, and we label them so. The explicit cosine tables are numerical: at p = 11–37 two independent programs
agree; at 41–79 one program found them, cross-checked by a second method at 73 and 79. The exact minimal polynomials at every prime up
to 97 are certified in ball arithmetic. Nothing here depends on the generalised Riemann hypothesis.

---

## Status words and conditions used in this paper

Every result carries one status word, used exactly as in our status list (§7.7; also the bundle's STATUS.md). "AI reviewer" means an
independent AI model run as a hostile referee on the written proof; "implementation A/B" means two programs written independently
(B from a written specification, without seeing A's code or results).

- **CLASSICAL**: follows from known theory, with a reference.
- **PROVED (AI-refereed)**: a written proof exists in the supplementary bundle and was accepted (with fixes, which were applied)
  by independent AI reviewers. *It has not been checked by a human expert.*
- **PROOF DRAFT**: a written proof exists in the bundle, but it is not yet listed as proved; where a referee round has been run,
  its verdict is given next to the word.
- **RIGOROUS (ball arithmetic)**: every analytic step enclosed in certified error balls (Arb), plus exact algebra; rests on the
  correctness of the ball-arithmetic library and on the cited theorems.
- **CERTIFIED numerics**: exact algebra plus high-precision floating point with very large margins; no interval arithmetic.
- **NUMERICAL**: found and verified numerically (usually by two independent programs), not proved.
- **CONJECTURE**: a new statement supported by evidence only.
- **OPEN**: not settled. **REFUTED**: a stated claim or sealed prediction shown false by a counterexample. **POST HOC**: seen after
  the run, not pre-registered. **NOT CLAIMED**: computed, but resting on an unproved hypothesis or an unfinished check.

Every theorem also carries a **condition tag**:

- **[unconditional]**: no unproved hypothesis; in particular no generalised Riemann hypothesis (GRH).
- **[Euler-list]**: the criterion is unconditional, but an *explicit list* uses Euler's 65 idoneal numbers where Grube's theorem
  does not decide; such a list is complete except possibly for one odd squarefree idoneal number m > 1848, which would be ≡ 1 (mod 4)
  (Kani [Ka] Cor 23, Rem 24).
- **[cited proof unopened]**: the argument uses a published theorem whose own proof we did not open (named where it occurs).

---

## Abstract

On page 206 of the lost notebook Ramanujan recorded an incomplete septic identity for φ(q) = Σ q^{n²}; Rebák (2023) supplied the
missing terms, and cubic, quintic and ninth-degree analogues followed (Berndt–Rebák; Kim–Rebák). For an odd prime p the
p-dissection of φ at q = e^{−π/√p} gives the classical identity φ(e^{−pπ√p}) = p^{−3/4} φ(e^{−π√p}) (1 + u_1 + ⋯ + u_m),
m = (p−1)/2. We study b_k = u_k^p and its relatives at other levels.

(1) *Explicit identities* (NUMERICAL): for p = 11 the b_k are the roots of a quintic over the Weber cubic field Q(P), P = u_1⋯u_5,
and each b_k is an integer combination of P^i cos(2πj/11); for p = 13 each b_k is an integer combination of cos(2πj/52). Both were
found and checked by two independent implementations to more than 1,500 digits. A sweep gives explicit cosine tables at every
prime 11 ≤ p ≤ 79 except 59 and 71, and the exact minimal polynomial of b_1 at every prime 5 ≤ p ≤ 97 (certified in ball arithmetic);
every prime p < 100 passes.

(2) *Structure* (PROVED (AI-refereed), p ≥ 5, unconditional): b_k lies in F_p = (K(j(√−p))·Q(ζ_p))^+, K = Q(√−p), of degree
h(−4p)(p−1)/2; the automorphism of F_p fixing Q(j(√−p)) with ζ ↦ ζ^a sends b_k to b_{±xk} with x² ≡ ε(a)a (mod p); each b_k is an algebraic integer with norm
±2^e, the 2-adic valuation is v(2)·p·{0, 1/3, 1/2} for p ≡ 7 (mod 8), 3 (mod 8), 1 (mod 4), and b_k is a unit iff p ≡ 7 (mod 8).
(The pieces as modular functions, their Siegel form and their modular Galois action are Gallouin's (2026); these statements are about
their values at the CM point.)

(3) *Cyclotomic cases* (PROVED (AI-refereed)): the product b_1⋯b_m generates Q(j(√−p)), so Weber's classical criterion transfers to
the pieces: all b_k lie in an abelian field iff h(−4p) ≤ 2 iff p ∈ {3, 5, 7, 13, 37}. At p = 5, 7, 13, 37 each b_k is explicitly
2^a p^b Π (2 sin(πj/N))^{n_j} (RIGOROUS (ball arithmetic)). For odd composite n the field of all pieces is abelian iff n is idoneal
and a prime power, giving the complete list {3, 5, 7, 9, 13, 25, 37} (unconditional, by Grube's theorem).

(4) *Units* (p ≡ 7 mod 8; PROVED (AI-refereed)): products Π u_j^{n_j} with Σ n_j j² ≡ 0 (mod p) lie in F_p; the norm of b_1 to
Q(ζ_p)^+ has character components (p/2)·χ(2)(χ(2) − 1)·B_{1,χψ} times those of the cyclotomic unit; its conjugates have index
Π_{χ(2)≠1} p|B_{1,χψ}| in their saturation inside the group of Hasse units.

(5) *One law at every odd level* (Theorem G; PROVED (AI-refereed): three referee rounds, then a gap in one case found by a later
reader and repaired, the repair accepted by two referees): for odd l and odd m ≥ 3, the first level-l theta-dissection piece
B_1^{(l)}(i√m) generates an abelian extension of Q iff m is idoneal and (l is a prime power dividing m, or l = 3 and m ≡ 2 mod 3). This
contains the septic family (l = m), Berndt–Rebák's cubic and quintic pieces (l = 3, 5), and, through its stabiliser frame, the
Rogers–Ramanujan continued fraction (abelian only at n = 1). *Shape* (PROOF DRAFT, one referee round): for every odd prime level
the degree and the number of real conjugates are given by explicit formulas.

(6) *Even levels* (PROOF DRAFT, one referee round, unconditional): the Göllnitz–Gordon continued fraction H(e^{−π√m}), m ≥ 2, is
abelian over Q iff m is odd and 4m is idoneal, i.e. m ∈ {3, 7, 15}; Ramanujan's cubic continued fraction G(e^{−π√n}), n ≥ 2, iff n is
even and 9n is idoneal, i.e. n ∈ {2, 8}.

(7) *Stark dictionary* (p ≡ 7 mod 8; PROOF DRAFTS, one referee round each): σ_2 of the norm of b_1 to Q(ζ_p)^+ is, up to a root of
unity, the rank-one Stark unit of Q(ζ_p)/Q(√−p) for S = {∞, (√−p), 𝔓}, 𝔓 | 2; b_1 itself is three conductor-(√−p) Robert units
times a Δ-quotient from the Hilbert class field, and for p ≥ 23 it is not a Stark unit of its own field over K for any S (at p = 7,
b_1 equals the norm and σ_2(b_1) is the Stark unit). The mechanism is
classical (Kronecker's limit formulas; Stark 1980), and the Hilbert-class-field half is in Stark 1980 and in Hajir–Rodriguez
Villegas (1997).

(8) *Rigour*: the conjugate method is a theorem (PROVED (AI-refereed)); the minimal polynomial G_p is certified in ball arithmetic at
every prime 5 ≤ p ≤ 97, so Q(b_1) = F_p at every prime p ≤ 97.

All proofs were checked by independent AI reviewers only; none has yet been read by a human expert.

---

## 1. Introduction

### 1.1 Ramanujan's entry
Ramanujan's general theta function is f(a, b) = Σ_{n∈Z} a^{n(n+1)/2} b^{n(n−1)/2}, and φ(q) = f(q, q). Entry 1.1 on page 206 of the
lost notebook, as corrected by Rebák [R23] (Ramanujan wrote 7^{3/4} for 7^{−3/4}), reads

  φ(e^{−7π√7}) = 7^{−3/4} φ(e^{−π√7}) { 1 + ( )^{2/7} + ( )^{2/7} + ( )^{2/7} },

with the three terms left blank. It is reproduced in Andrews–Berndt, *Ramanujan's Lost Notebook, Part II*, §8.3 (pp. 180–194) [AB].

### 1.2 What was known, and whose work we build on
- **Rebák (2023)** [R23] identified the three terms as (cos(π/7)/(2cos²(2π/7)))^{2/7}, (cos(2π/7)/(2cos²(3π/7)))^{2/7} and
  (cos(3π/7)/(2cos²(π/7)))^{2/7}.
- **Berndt–Rebák** [BR] gave cubic and quintic analogues (their Thm 2.1, Thm 4.2) and recorded the Borwein–Zucker evaluations of
  φ(e^{−π√n}) used below. Their cubic and quintic pieces are exactly our pieces with the level frozen at l = 3 or 5 while the special
  point moves (§5.5). They close by inviting "the examination of higher-order identities", while noting that the modular equations
  needed for a general theory become less understood as the order grows.
- **Kim–Rebák** [KR] gave a ninth-degree analogue, including a product formula for a subset of the pieces (their Thm 2.1(ii)), and
  state the dissection identity for every odd n as a lemma. They regard these results as special cases of a "grand theory"
  Ramanujan envisioned; Berndt–Rebák likewise speak of "a possible grand theory". This paper treats the arithmetic of the special values:
  which number fields the pieces generate at the CM point, how the Galois group moves them, when they are units and when they are
  cyclotomic.
- **Weber; Grube; Kani.** The product of the pieces is a power of Weber's class invariant 𝔣(√−p) (§2.3, CLASSICAL). Weber's criterion
  (Kani 2011, Thm 32 [Ka]): Q(j(√−n)) is Galois (hence abelian) over Q iff n is idoneal. Grube's theorem (Kani Thm 12) and Kani's
  corollaries supply the unconditional finite lists we use. This is the j-side of every abelian criterion in §5.
- **Gallouin (2026).** As modular *functions*, Ramanujan's prime-dissection pieces of φ were treated for every prime p ≥ 5 by Gallouin
  [Ga, Zenodo 10.5281/zenodo.22285880]: the dissection identity (his Prop 4.1), a modular Galois action permuting the pieces (Prop 5.2;
  Thm 6.1: the pieces generate a cyclic extension of C(X(Γ_0(4p) ∩ Γ^0(2))) with group (Z/p)^×/{±1}), and their Siegel-function form
  (Prop 10.1). His pieces λ^φ_{p,r} are our u_k/2. He works at the level of functions and states (his §15) that assertions about particular
  singular values need separate arguments. Our results concern exactly those values; the function-level statements are his (and, for the
  identity, also Kim–Rebák's), and we cite them where they appear.
- **Siegel functions and Shimura reciprocity.** Siegel functions and their transformation laws (Koo–Shin–Yoon 2010 [KSY10]); an
  explicit form of Shimura's reciprocity law for orders, after Stevenhagen (Koo–Shin–Yoon 2025 [KSY25], Prop 5.1) and its form-class
  version (Prop 4.1); Deuring's divisor theorem for Weber-type quotients (Deuring §22, after Hasse 1931 [De]). Bengoechea [Be] uses
  Shimura reciprocity on theta values; Yui–Zagier [YZ] give the 2-adic facts for Weber's function on the product side.
- **Elliptic units and Stark units.** Kubert–Lang [KL] (norms of conductor-p Siegel units over Q(√−p) are cyclotomic units with
  Bernoulli exponents, Thm 4.2) is the direct predecessor of our unit identities (§4.5). Stark [St80] proved his rank-one conjecture
  over imaginary quadratic fields and worked out the conductor-(2) case explicitly; Hajir–Rodriguez Villegas [HRV] give explicit
  elliptic units including the Weber case. The Hilbert-class-field half of our Stark dictionary (§6) is theirs in substance.
- **Continued fractions.** That the Rogers–Ramanujan value R(i√n) generates the ray class field mod 5 over K is Gee–Honsbeek [GH],
  Lemma 4.1; Duke [Du] gives a radical criterion. Cho–Koo–Park proved that the Göllnitz–Gordon fraction [CKP09, Thm 5] and
  Ramanujan's cubic continued fraction [CKP10, Thm 4] are Hauptmoduln and that their singular values generate ray class fields over
  K at points with (2, a) = 1, resp. (6, a) = 1. Akkarapakam–Morton [AM24] compute degrees of Ramanujan's level-8 values at
  discriminants −d ≡ 1 (mod 8). The degree mechanism for class invariants is the Gee–Stevenhagen orbit/stabiliser criterion (as
  quoted by Kontogeorgis [Ko], Thm 1); the real-conjugate rule at level 1 is Chavan's [Ch, Prop 2.3].
- **Level 11 elsewhere.** Campbell [Ca] gives a level-11 Ramanujan–Sato coefficient formula for series for 1/π. It concerns a
  different object and gives no values of φ(e^{−11π√11}) or of the dissection pieces.

### 1.3 What is new here (as far as our searches reach)
The prior-art statement, with its search floor, is in the section "Prior art". Within that caveat:

1. Explicit degree-11 and degree-13 analogues of Entry 1.1 (§3.1–3.2; NUMERICAL), and explicit formulas for every prime p < 100
   (§3.3).
2. The field rule C1 and the arithmetic Galois rule C2 at the CM point τ = i√p, for every prime p ≥ 5 (§4; PROVED (AI-refereed)). The
   method (Siegel functions plus Shimura reciprocity) is standard, and the function-level Galois action on the pieces is Gallouin's [Ga];
   the statements at the CM point we have not found in print.
3. Integrality and the exact 2-adic size of every piece, including "unit iff p ≡ 7 (mod 8)" (§4.4; PROVED (AI-refereed)). The inputs
   (Siegel units; Deuring–Hasse) are classical.
4. Proposition D (the pieces carry j), which transfers Weber's criterion from j to Ramanujan's pieces (§5.1–5.2; PROVED (AI-refereed)).
5. Explicit products-of-sines forms at p = 5, 13, 37, and the septic forms recovered exactly at p = 7 (§5.3; RIGOROUS (ball arithmetic)).
6. The composite rule C5 (§5.4; PROVED (AI-refereed), for the field of all pieces).
7. Units for p ≡ 7 (mod 8) (§4.5): the w-unit criterion, the L-value identity for the norm of b_1, and the index theorem C8 (PROVED
   (AI-refereed)). The mechanism is classical; the explicit identities are ours (not found in print at our search floor).
8. The frozen-level wall C6 for Berndt–Rebák's cubic and quintic pieces and the Rogers–Ramanujan classification C7 (§5.5–5.6;
   PROVED (AI-refereed)).
9. **Theorem G** (§5.7; PROVED (AI-refereed); case (D) repaired after a gap found by a later reader, repair accepted by two referees):
   one Galois law for the theta pieces at every odd level.
10. The shape theorem S-A (degrees and real conjugates) and the real-conjugate count for R(i√n) (§5.6, §5.8; PROOF DRAFT).
11. The even-level laws U-GG and U-CF (§5.9; PROOF DRAFT, one referee round).
12. The Stark dictionary for p ≡ 7 (mod 8): the explicit recipe for b_1 (D5) and the statement that b_1 is not a Stark unit for
    p ≥ 23 (§6; PROOF DRAFTS; corollary-level, mechanism classical).
13. Rigour upgrades (§7.4; C10, PROVED (AI-refereed)): the fast conjugate method is a theorem; ball-arithmetic certificates for every
    G_p at every prime 5 ≤ p ≤ 97. The 2-adic valuation law C9 and the corrected residue-degree law above 2 (§4.4).

Most of these are corollary-level results in explicit class field theory; the methods are standard. What we add is their
application to Ramanujan's pieces, complete classifications, and explicit, machine-checked tables.

### 1.4 Fairness note
Our work corrects others in one place and ourselves in several; we record all of them in the same neutral way.

- **Ferrara [Fe], Theorem 2.8.** As printed in arXiv:1904.10561v2 (we did not check the journal version), the formula omits a factor χ(σ) inside the sum. With the factor inserted, the formula
  agrees with our numerical checks (and with Stark's formulation [St80, Conjecture 1(i)]); without it, it fails numerically. This was
  found by the AI worker that used the theorem and confirmed by an AI reviewer. We use the corrected form in §6 (D5) and say so there. We
  have not examined whether the slip affects anything else in that paper, and we read it as a typographical omission.
- **Ramanujan's exponent** 7^{3/4} for 7^{−3/4} in Entry 1.1 was corrected by Rebák [R23]; the credit is his.
- **Our own corrections**, kept visible in the text: a residue-degree law we first stated was REFUTED at p = 23, 31, 47 and replaced by
  a corrected law (§4.4); a sealed prediction "cosine forms iff n idoneal" for composites was REFUTED (§5.4); the proof of Theorem G
  had a gap in one case that three referee rounds missed, found later and repaired (§5.7); several sealed nulls failed as nulls
  (design errors), and are reported as failed.

### 1.5 Conditions (GRH audit)
No result claimed in this paper rests on the generalised Riemann hypothesis. GRH entered our work only through PARI's `bnfinit` in
two places: an exploratory cosine-form search (superseded by the proofs of §5, not used) and the full unit-group indices of F_23 and
F_31 (§4.5), which are NOT CLAIMED. Where an explicit list depends on Euler's list of idoneal numbers beyond Grube's theorem, the tag
[Euler-list] says so; where a cited theorem's proof was not opened by us, the tag [cited proof unopened] names it.

---

## 2. Setting and the dissection pieces

### 2.1 Notation
Throughout, p is an odd prime (n an odd integer ≥ 3 in §5.4), m = (p−1)/2, and

  q = e^{−π/√p},  u_k = 2 q^{k²/p} f(q^{p+2k}, q^{p−2k}) / φ(q^p)  (k = 1, …, m),  b_k = u_k^p,  P_p = u_1 u_2 ⋯ u_m.

K = Q(√−p), O = Z[√−p] (discriminant D = −4p), τ_0 = i√p, h = h(−4p) the class number of primitive forms of discriminant −4p,
H_O = K(j(τ_0)) the ring class field of O, J = Q(j(τ_0)) = H_O ∩ R. We write N = p for p ≡ 3 (mod 4) and N = 4p for p ≡ 1 (mod 4)
when naming cosine bases, and use the level 4p in the proofs. F_p := (K(j(τ_0))·Q(ζ_p))^+ is the real subfield of M = H_O(ζ_p); for
p ≡ 1 (mod 4) it equals the real subfield of K(j(τ_0), ζ_{4p}).

### 2.2 The identity I_p (CLASSICAL)
For 0 < q < 1 the p-dissection of φ gives φ(q^{1/p})/φ(q^p) = 1 + Σ_{k=1}^{m} u_k. At q = e^{−π/√p} the transformation
φ(e^{−π/x}) = √x φ(e^{−πx}) gives φ(q^{1/p})/φ(q^p) = p^{3/4} φ(e^{−pπ√p})/φ(e^{−π√p}), hence

  **φ(e^{−pπ√p}) = p^{−3/4} φ(e^{−π√p}) (1 + u_1 + ⋯ + u_m).**        (I_p)

For p = 7 this is Entry 1.1. The dissection identity for every odd n appears as a lemma in Kim–Rebák [KR], and for every prime p, with
the pieces as modular functions, in Gallouin [Ga, Prop 4.1]; we claim nothing for it. All content lies in the
explicit description of the u_k, equivalently of b_k = u_k^p (Ramanujan's exponent 2/7 is septic-specific: at p = 7 the b_k are
squares in the cubic field; at other primes the natural exponent is 1/p).

**Theta form (exact).** With θ[a](τ) = Σ_n e^{πiτ(n+a)²}, u_k = 2θ[k/p](τ_0)/θ[0](τ_0) and b_k = B_k(τ_0) with
B_k := (2θ[k/p]/θ[0])^p; B_m depends only on ±m mod p.

**Monotonicity (PROVED (AI-refereed), part of the C1–C3 write-up [S-C13]).** u_1 > u_2 > ⋯ > u_m > 0. (Poisson summation turns
θ[k/p](τ_0) into a positive constant times Π_{n≥1}(1 − r^{2n})(1 + 2r^{2n−1}cos(2πk/p) + r^{4n−2}), r = e^{−π/√p}, each factor
strictly decreasing in k.)

### 2.3 The product (CLASSICAL)
By the Jacobi triple product,

  **P_p = u_1 ⋯ u_m = 2^{(p−1)/2} / 𝔣(√−p)^{p−1}**,  𝔣(τ) = q^{−1/48} Π_{n≥1} (1 + q^{n−1/2}),  q = e^{2πiτ}

(Weber's function; a five-line derivation using 𝔣(−1/τ) = 𝔣(τ) is in [S-C4]). Hence Q(P_p) ⊂ J = Q(j(√−p)), and in fact Q(P_p) = J
with deg P_p = h(−4p): this is classical class-invariant theory; we checked it by field isomorphism with the ring class polynomial
at p = 5, …, 37 and by degree at the primes 41–97 other than 89 (where the degree probe did not return a value; the field degree at
89 is settled by C1 and C10). For p = 11, P_11 = 32/𝔣(√−11)^{10} and

  **P_11³ − 8P_11² + 80P_11 − 32 = 0**,  P_11 = 0.4164394342758640956…,  discriminant −2^{10}·11³.

We claim no novelty for the product. An analogous product formula for a subset of the pieces appears at degree 9 in [KR, Thm 2.1(ii)].

### 2.4 Siegel form (PROVED (AI-refereed) [S-C13])
With a_k = ((p+2k)/2p, 1/2), a_0 = (1/2, 1/2) and g_r the Siegel function of [KSY10, (1.3)],

  u_k = 2 e^{−πik/2p} g_{a_k}(τ_0)/g_{a_0}(τ_0),  B_k = 2^p (−i)^k (g_{a_k}/g_{a_0})^p,  and B_k lies in F_{4p}

(modular functions of level 4p with coefficients in Q(ζ_{4p})). The Siegel expression was checked against theta series to ≥ 269
digits (and to about 306 digits by a second program). Siegel-function forms of the pieces also appear in Eum–Koo–Shin [EKS, Example 4.3] and, for every prime p, in Gallouin [Ga, Prop 10.1,
(10.3)]; ours is the form adapted to the CM point.

---

## 3. Explicit identities

### 3.1 Degree 11 (NUMERICAL; two independent implementations)
Let p = 11, P = P_11, c_j = cos(2πj/11).

**The quintic.** b_1, …, b_5 are the roots of x⁵ − e_1x⁴ + e_2x³ − e_3x² + e_4x − e_5 with

  e_1 = 1088 − 616P + 66P²
  e_2 = −136448 + 438592P − 48752P²
  e_3 = 44664832 − 114667520P + 17898496P²
  e_4 = 2327674880 − 5377613824P − 508727296P²
  e_5 = −756547584 + 1957953536P − 339181568P²  (= P^{11} reduced modulo the cubic).

**The cyclotomic table.** Each b_k is the integer combination of the 15 numbers P^i c_j (i = 0, 1, 2; c_0 = 1) given in Table 1.

Table 1. Coefficients of b_k = u_k^{11} in the basis P^i·c_j.

| k | 1 | c1 | c2 | c3 | c4 | P | P·c1 | P·c2 | P·c3 | P·c4 | P² | P²·c1 | P²·c2 | P²·c3 | P²·c4 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 320 | 448 | 352 | 256 | −32 | −80 | 136 | 88 | −32 | 240 | 10 | −12 | −4 | 4 | −20 |
| 2 | 336 | 288 | 32 | 384 | 480 | −200 | −272 | −240 | −152 | −104 | 20 | 24 | 20 | 16 | 8 |
| 3 | 192 | −256 | 192 | −288 | 96 | −64 | 32 | 168 | 272 | 120 | 8 | −4 | −16 | −24 | −8 |
| 4 | 96 | −96 | −480 | −448 | −192 | −148 | −48 | 104 | −136 | −168 | 16 | 8 | −8 | 12 | 16 |
| 5 | 144 | −384 | −96 | 96 | −352 | −124 | 152 | −120 | 48 | −88 | 12 | −16 | 8 | −8 | 4 |

**Eleventh-degree analogue of Entry 1.1.**

  φ(e^{−11π√11}) = 11^{−3/4} φ(e^{−π√11}) { 1 + b_1^{1/11} + b_2^{1/11} + b_3^{1/11} + b_4^{1/11} + b_5^{1/11} },

with P from its cubic, b_k from Table 1, and positive real eleventh roots. Combined with the Borwein–Zucker evaluation recorded by
Berndt–Rebák [BR, Thm 1.3, (1.12)],

  φ(e^{−π√11}) = (2 + (3√33 + 17)^{1/3} − (3√33 − 17)^{1/3}) · ( Γ(1/11)Γ(3/11)Γ(4/11)Γ(5/11)Γ(9/11) / (72·11^{1/4}π³) )^{1/2},

this gives a closed form for φ(e^{−11π√11}).

**Function-level companion.** At the level of modular functions, Gallouin [Ga11] treats the five p = 11 φ-dissection radicands as one
degree-five (dihedral) structure on a modular curve and states that no CM interpretation is needed there. Our quintic and Table 1 concern
the values at τ = i/√11, with coefficients in Q(P); we have not compared the two descriptions. (The evaluation is quoted from [BR]; we did not re-check it numerically in a saved run.)

**Status after §4.** C1 (proved) says b_k ∈ Q(P, cos 2π/11), so *some* rational expression of this shape must exist; what remains
numerical is the specific integer table and the quintic. Table 1 is integral (all denominators 1).

**Evidence.** Implementation A (theta series, mpmath PSLQ): table residuals 10^{−1497} to 10^{−1499}; e_j residuals 10^{−1491} to 10^{−1498};
P's cubic to 2,998 digits; the identity rebuilt only from the cubic and Table 1 matches the direct theta value to 10^{−1294}, and one
coefficient changed by 1 breaks it to 10^{−1}. Implementation B (blind, Jacobi triple products, from a written specification): identical cubic,
identical e_j and all 80 table integers; identity to 1,595 digits (1,545 on φ − 1 ≈ 3.35·10^{−50}); an exact symbolic check that the
table multiplies out to the quintic; all 168 one-coefficient perturbations fail (best 6 digits); positive control p = 7 to 1,599
digits. A third program (PARI/GP lattice reduction, §3.3) reproduced Table 1 exactly. A clean-room rebuild in a fresh environment
passed (1,000 digits; one entry +1 gives 2 digits).

### 3.2 Degree 13 (NUMERICAL; two independent implementations; sealed bar HOLDS)
Let p = 13 and B_j = cos(2πj/52). Each b_k = u_k^{13} equals 64·Σ_{j=0}^{11} m_{kj} B_j with the integers of Table 2.

Table 2. Coefficients m_{kj}.

| k | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8 | B9 | B10 | B11 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 23021 | 150562 | −247962 | 4300 | 243256 | −207292 | 33774 | −184608 | 212810 | 143690 | −405522 | 304124 |
| 2 | −179740 | 4300 | 439296 | 143690 | −405522 | −304124 | 192712 | 207292 | −157560 | −150562 | 162266 | 184608 |
| 3 | −179740 | −4300 | 439296 | −143690 | −405522 | 304124 | 192712 | −207292 | −157560 | 150562 | 162266 | −184608 |
| 4 | −98607 | 143690 | 30446 | −150562 | 162266 | −184608 | −4706 | 304124 | −277030 | −4300 | 243256 | −207292 |
| 5 | 23021 | −150562 | −247962 | −4300 | 243256 | 207292 | 33774 | 184608 | 212810 | −143690 | −405522 | −304124 |
| 6 | −98607 | −143690 | 30446 | 150562 | 162266 | 184608 | −4706 | −304124 | −277030 | 4300 | 243256 | 207292 |

The automorphism cos(2π/52) ↦ −cos(2π/52) sends B_j to (−1)^j B_j and swaps b_1↔b_5, b_2↔b_3, b_4↔b_6 (an instance of C2).

The elementary symmetric functions lie in Z[√13]:
e_1 = −25584768 + 7096960√13, e_2 = −1739650004385792 + 482492099641344√13,
e_3 = −13407412385575915749376 + 3718547140575764676608√13,
e_4 = 4073748678240307299282321408 − 1129854595596083116067782656√13,
e_5 = −291409856951108964762503293698048 + 80822552416373045699853250723840√13,
e_6 = −47361305026477074845022535286784 + 13135662595834881877398488350720√13.

**Thirteenth-degree analogue.** φ(e^{−13π√13}) = 13^{−3/4} φ(e^{−π√13}) {1 + b_1^{1/13} + ⋯ + b_6^{1/13}}, and, from [BR, (1.13)],
φ(e^{−π√13}) = (18 + 5√13)^{1/8} · ( Γ(1/52)Γ(7/52)Γ(9/52)Γ(11/52)Γ(15/52)Γ(17/52)Γ(19/52)Γ(25/52)Γ(29/52)Γ(31/52)Γ(47/52)Γ(49/52) / (1664π⁷) )^{1/4}.

At p = 13 the pieces are also products of sines (§5.3), which is the prettier form Ramanujan's septic entry suggests.

**Evidence.** Implementation A (theta series, 2,000 digits): all six relations with denominator ±1 hold to 1,993–1,994 digits; e_j in Q(√13) to
2,000 digits; identity rebuilt from Table 2 to 1,988 digits; 144 single-integer changes, best 5 digits; negative controls (wrong field
Q(cos 2π/13); b_1 + 10^{−300}) give no relation. Implementation B (blind, triple products, 1,750 digits): identical Table 2 and e_j; rebuild to
1,738 digits; 150 single changes, best 5 digits.

### 3.3 The sweep to p < 100

**Method A: lattice reduction (LLL), primes 11–79.** For each prime, find an integer relation between b_k and the basis
P^i cos(2πj/N) (i < h for p ≡ 3 mod 4, i < h/2 for p ≡ 1 mod 4; basis size h(p−1)/2) at working precision W; accept it only if it
holds to ≥ 0.9W at W + 400 (S1); rebuild (I_p) from the table alone (S2 ≥ 0.9W); require single ±1 changes to destroy it (S3); and
require the wrong conductor (N ↔ 4p) to give no genuine relation (negative control). From p = 29 on, most primes used *Galois
transport* (a sealed amendment): one lattice relation for b_1, every other piece matched to ≥ 0.9W as an explicit Galois image of
b_1's expression. Every sealed bar and amendment was hashed before its runs.

**Method B: fast exact conjugates, primes 59, 71, 83, 89, 97 (and cross-checks at 13, 73, 79).** Once C1–C3 were proved, the remaining
primes no longer test the rules, so a sealed amendment replaced the lattice search: compute every Q-conjugate of b_1 directly
(the m principal values b_k, plus, for each non-principal reduced form Q, the values B_k(t_Q + a′) given by [KSY25] Prop 4.1 at
N = 4p), multiply out Π (x − conjugate), and round to Z[x]. Bar: coefficients integral to < 10^{−300}; monic, irreducible, degree
h(p−1)/2; constant term ±2^e with e from C3; a wrong reading of the twist (convention 2) must fail to round. The output is the exact
minimal polynomial G_p of b_1, not a cosine table. (Theorem M, §7.4, later made this method a theorem.)

Table 3. Sweep verdicts: **complete; every prime 11 ≤ p ≤ 97 passes.** Methods: lattice reduction with two independent implementations at
11–37; lattice reduction, one implementation, at 41, 43, 47, 53, 61, 67, 73, 79; fast exact-conjugate method at 59, 71, 83, 89, 97; p = 79 (and 73)
by both. "S2" is the rebuilt identity in digits; "NC" the negative control.

| p | p mod 8 | h(−4p) | deg F_p | method | W | S1 | S2 | S3 best | NC | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| 11 | 3 | 3 | 15 | PSLQ ×2 impl.; LLL control | 1500 | 5/5 | 1901 | 5 | junk (1198 < 0.9W) | PASS (+ impl. B) |
| 13 | 5 | 2 | 12 | PSLQ ×2 impl.; LLL control | 1500 | 6/6 | 1894 | 5 | none | PASS (+ impl. B) |
| 17 | 1 | 4 | 32 | LLL | 3000 | 8/8 | 3395 | 8 | none | HOLDS; impl. B identical |
| 19 | 3 | 3 | 27 | LLL | 3000 | 9/9 | 3391 | 12 | junk (2399) | HOLDS; impl. B identical |
| 23 | 7 | 3 | 33 | LLL | 3000 | 11/11 | 3383 | 16 | junk (2397) | HOLDS; impl. B identical |
| 29 | 5 | 6 | 84 | LLL | 6000 | 14/14 | 6373 | 24 | none | HOLDS; impl. B identical |
| 31 | 7 | 3 | 45 | LLL | 4000 | 15/15 | 4366 | 24 | junk (3196) | HOLDS; impl. B identical |
| 37 | 5 | 2 | 36 | LLL | 4000 | 18/18 | 4324 | 13 | none | HOLDS; impl. B identical |
| 41 | 1 | 8 | 160 | LLL + transport | 14400 | 20/20 | 14741 | 2 | none | HOLDS |
| 43 | 3 | 3 | 63 | LLL | 3000 | 21/21 | 3331 | 48 | junk (2391) | HOLDS |
| 47 | 7 | 5 | 115 | LLL + transport | 10400 | 23/23 | 10717 | 3 | junk (8309 < 9360) | HOLDS |
| 53 | 5 | 6 | 156 | LLL + transport | 14000 | 26/26 | 14291 | 1 | none | HOLDS |
| 59 | 3 | 9 | 261 | fast | 4584 | — | — | — | conv. 2 fails | PASS (err 10^{−1362}; const −2^{5133}) |
| 61 | 5 | 6 | 180 | LLL + transport | 16200 | 30/30 | 16448 | 1 | none | HOLDS |
| 67 | 3 | 3 | 99 | LLL + transport | 9000 | 33/33 | 9240 | 1 | junk (7193 < 8100) | HOLDS |
| 71 | 7 | 7 | 245 | fast | 3900 | — | — | — | conv. 2 fails | PASS (err 10^{−1209}; const −1) |
| 73 | 1 | 4 | 144 | LLL + transport; fast | 26000 | 36/36 | 26204 | 0 | none | HOLDS; fast PASS (const +2^{5256}) |
| 79 | 7 | 5 | 195 | LLL + transport; fast | 31200 | 39/39 | 31405 | 4 | junk (24944 < 28080) | HOLDS; fast PASS (const −1); cross-method control PASS |
| 83 | 3 | 9 | 369 | fast | 9773 | — | — | — | conv. 2 fails | PASS (err 10^{−2604}; const −2^{10209}) |
| 89 | 1 | 12 | 528 | fast | 16697 | — | — | — | relative-closure control passes | PASS (err 10^{−4240}; const +2^{23496}) |
| 97 | 1 | 4 | 192 | fast (LLL failed on resources) | 9720 | — | — | — | conv. 2 fails | PASS (err 10^{−2533}; const +2^{9312}) |

Notes on Table 3.
- "junk (d)" means the wrong-conductor search returned a relation with huge coefficients holding only d digits, below 0.9W and at
  the chance level (basis size × coefficient digits); it is not a relation.
- S3 at p = 43 (48 digits) is close to the sealed 50-digit bar; as coefficients grow to 30+ digits, a ±1 change is a tiny relative
  change, so S3 weakens with p (a sealed amendment notes this). S1 and S2 carry the weight.
- At p = 73 and 79 both methods were run. At p = 79 the lattice run took 10,478 s and the fast method 168 s; at p = 73, 85 minutes
  against 4 minutes. The sealed cross-method control passed: the lattice expression for b_1 is a root of the fast-method polynomial
  G_79 to about 31,686 digits (|G_79(b_1)| ≈ 10^{−26922}, |G_79′(b_1)| ≈ 10^{4764}; bar ≥ 28,080).
- Every fast-method constant term equals the C3 prediction exactly: 2^{5133} (59), 1 (71, 79), 2^{5256} (73), 2^{10209} (83),
  2^{23496} (89), 2^{9312} (97).
- p = 89: the first run passed degree (528), rounding (10^{−4240}) and irreducibility, but hit its 3-hour cap during the full
  wrong-convention control. A cheaper control (absolute closure at 60 digits) failed its own validation at 73 and 97 and was voided by a
  sealed amendment; its replacement (relative closure at 120 digits; correct < 10^{−60}, wrong > 10^{−3}) passed validation at 13, 73,
  97 and passed at 89. A rerun reproduced the first three checks exactly and saved G_89.
- p = 97: the lattice run failed on resources (stack overflow), which is not a verdict; the fast method passed in 1,384 s.
- Since C1 and C2 are proved (§4), the sweep's field-rule and Galois-rule verdicts confirm theorems; its lasting output is the
  explicit tables (every prime 11 ≤ p ≤ 79 except 59 and 71) and the minimal polynomials at 59, 71, 73, 79, 83, 89, 97; G_p at every prime
  5 ≤ p ≤ 97 is now certified in ball arithmetic (§7.4).

---

## 4. Structure theorems

All statements in this section are for primes p ≥ 5 (p = 3 is trivial: b_1 = 2) and are [unconditional]. Proofs are condensed; full
write-ups are in the bundle ([S-C13] for C1, C2, C3a, C3b; [S-C4] for C3c, C3b by a second route, Prop D and C4).

### 4.1 Reciprocity at √−p
[KSY25, Prop 5.1] (a concrete form of Shimura's reciprocity law for an imaginary quadratic order, due to Stevenhagen): with O = Z[√−p],
τ_O = √−p, b_O = 0, c_O = p and N = 4p, the matrices g(x) = [t, −ps; s, t], for x = t + s√−p with d = t² + ps² prime to 4p, give an
isomorphism W_{O,N}/{±1} ≅ Gal(K_{O,N}/H_O), acting by f(τ_O) ↦ f^{g(x)}(τ_O) for every f ∈ F_N finite at τ_O. Here K_{O,N} is the
ray class field of O modulo NO. [cited proof unopened: the proof of Prop 5.1 is cited in [KSY25] to Stevenhagen and Cox.]

**Lemma 3 (key lemma; PROVED (AI-refereed)).** B_k^{g(x)} = B_{tk} exactly.

*Proof sketch.* Write g(x) = diag(1, d)·γ with γ ∈ SL2(Z/4p); diag(1, d) fixes B_k and B_{tk} (rational coefficients), so it suffices
that B_k∘γ̃ = B_{k′}, k′ ≡ tk (mod p), for a lift γ̃. By [KSY10, Prop 2.4(ii),(iii)], B_k∘γ̃ = i^E B_{k′} with an explicit six-term
exponent E. Splitting x = x_1x_2 by the Chinese remainder theorem into a class ≡ 1 (mod 4O) and a class ≡ 1 (mod pO), E ≡ 0 (mod 4)
is checked by hand in each class (in the second, separately for s even and s odd). Exhaustive machine checks: 76,602 cases
(5 ≤ p ≤ 31, two lifts) and all x, k for 5 ≤ p ≤ 61; an independent referee-written check of 30,624 pairs; non-transposed controls
fail. ∎ (A geometric analogue, the action of Γ_0(4p) ∩ Γ^0(2) on the pieces with no residual multiplier, is Gallouin's
Prop 5.2 [Ga]; his phase computation is an independent check of the same kind of bookkeeping.)

### 4.2 Field rule C1 (PROVED (AI-refereed))
**Theorem 1 (C1).** b_k ∈ F_p = (K(j(√−p))·Q(ζ_p))^+, [F_p : Q] = h(−4p)(p−1)/2, and F_p = Q(j(√−p))(b_1).

*Proof sketch.* (1) Every class of W_{O,4p} fixes j(τ_O) (j∘γ = j, rational coefficients), so K(j(τ_O)) ⊂ H_O; both have degree h over
K ([KSY25] Prop 3.1, Rem 3.2(i); the CM isomorphism), so H_O = K(j(τ_O)). (2) By Lemma 3 and Prop 5.1, σ_{g(x)} sends b_k to b_{tk} and
ζ_{4p} to ζ_{4p}^d with d ≡ t² (mod p); elements with d ≡ 1 (mod p) have t ≡ ±1 and fix every b_k, so b_k ∈ M = H_O(ζ_p) and, being
real, b_k ∈ F_p. (3) For p ≡ 1 (mod 4), i and √p lie in H_O. (4) The b_t are distinct (monotonicity), so the orbit of b_1 under
Gal(M/H_O) has m elements; hence [M : H_O] = m, M = H_O(b_1), and [F_p : Q] = h(p−1)/2. ∎

### 4.3 Galois rule C2 (PROVED (AI-refereed))
**Theorem 2 (C2).** Let σ_a be an automorphism of F_p that fixes Q(j(√−p)) and maps cos(2πj/N) ↦ cos(2πaj/N). Put ε(a) = (a/p) if
p ≡ 3 (mod 4) and ε(a) = (−1)^{(a−1)/2} if p ≡ 1 (mod 4). Then **σ_a(b_k) = b_{±xk} with x² ≡ ε(a)a (mod p)**. Such σ_a exists for
every a when p ≡ 3 (mod 4), and exactly when (a/p) = 1 when p ≡ 1 (mod 4).

Consequences: one row of any table (the expression of b_1) plus C2 gives every b_k; the symmetric functions of the b_k lie in Q(P_p).
*Proof sketch.* Extend σ_a to σ̃ on M fixing √−p; then σ̃ ∈ Gal(M/H_O) acts on ζ_N by a″ ≡ ±a, and the sign is forced by √−p ∈ Q(ζ_p)
(p ≡ 3 mod 4) or by i, √p ∈ H_O (p ≡ 1 mod 4) to be a″ = ε(a)a. Lift to Gal(L/H_O) and apply Lemma 3 with t² ≡ a″. ∎

*Credit.* The modular (function-level) Galois action permuting the pieces by (Z/p)^×/{±1} is Gallouin's [Ga, Prop 5.2, Thm 6.1]; C2 is
its arithmetic form at τ_0, where the twist ε(a) appears. Data: all 161 stored Galois maps match; 86/86 checks by a separate structure program; 141/141 transport matches at p = 29, …, 67.

### 4.4 Integrality, units and the 2-adic law (C3a, C3b, C3c, C9)
**Lemma 5.** b_k = c_k · g_{a_k}(τ_0)^p · y^p, where y := 2/𝔣(τ_0)² and c_k = (−i)^k e^{−3πip/4} is a root of unity.

**Theorem 3a (C3a; PROVED (AI-refereed)).** b_k is an algebraic integer and a {2}-unit; N(b_k) = ±2^e; b_k is a unit iff y is a unit.
*Proof.* a_k has exact denominator 2p (composite), so g_{a_k}(τ_0) is a unit [KSY10, Prop 2.2(i),(ii), 3.1(i)]; y and g_{a_0}(τ_0) are
integral and y·g_{a_0}(τ_0) = 2·(root of unity) [KSY10, 2.6(ii)], so y | 2. ∎

**Theorem 3 (C3, complete; PROVED (AI-refereed)).** For every prime 𝔓 above 2,

  v_𝔓(y) = 0 (p ≡ 7 mod 8),  v_𝔓(2)/3 (p ≡ 3 mod 8),  v_𝔓(2)/2 (p ≡ 1 mod 4).

Hence v_𝔓(b_k) = p·v_𝔓(y), **b_k is a unit iff p ≡ 7 (mod 8)**, and |N_{F_p/Q}(b_k)| = 2^e with

  **e = 0,  p·h(−4p)(p−1)/6,  p·h(−4p)(p−1)/4** respectively.

*Proof sketch.* With P_C = [1, 1; 0, 2], Deuring's quotient φ_{P_C}(τ_0) = Δ((τ_0+1)/2)/Δ(τ_0) = −𝔣(τ_0)^{24}, so
y^{12} = −2^{12}/φ_{P_C}(τ_0). The lattice P_C(√−p; 1) = 2Z + Z(1 + √−p) is 2O_K when p ≡ 3 (mod 4) and the ramified prime above 2
when p ≡ 1 (mod 4); 2 splits in K for p ≡ 7 (mod 8) and is inert for p ≡ 3 (mod 8). Deuring's divisor theorem [De, §22, cases 1.2,
3.2, 2.3] then gives φ_{P_C}(τ_0) ≈ 2^{12}, 2^{8}, 2^{6}, i.e. y^{12} ≈ 2^0, 2^4, 2^6. ∎ A first, independent proof of the p ≡ 3 (mod 8)
case (C3b) uses Weber's transformation laws and inertia in the ring class field modulo 2 [S-C13]; it rests on two standard facts that
the Deuring route does not need. [cited proof unopened: Deuring credits the divisor theorem to Hasse 1931, which we did not open.]

*Checks.* The minimal polynomial of w = 𝔣(τ_0)^{24} has |constant term| = 2^{(12−c)h} at 18 primes 5…79; observed norms of b_1:
2^{55} (11), 2^{78} (13), 2^{272} (17), 2^{171} (19), 2^{1218} (29), 2^{666} (37), units at 23, 31; and every fast-method constant term
in Table 3.

**Theorem F (C9, the 2-adic valuation law; PROVED (AI-refereed), valuation part only).** Put (c, e) = (0, 1), (4, 3), (6, 2) for
p ≡ 7 (mod 8), 3 (mod 8), 1 (mod 4). For every k and every prime 𝔓 of F_p above 2, v_𝔓(b_k) = p·c·e(𝔓|2)/12, and e(𝔓|2) = e.
Hence, for p ≢ 7 (mod 8), v_𝔓(b_k) = p at every 𝔓 | 2 and every k: the ideal (b_k) = 𝔯^p, with 𝔯 the radical of 2 in F_p, does not
depend on k, and every ratio b_j/b_k is a unit. A sealed test holds; its seal predates the test data, but its items are consistency
checks of the already-proved C3 rather than blind tests. Ceiling: a corollary.

**Residue degrees above 2. The claim we first stated is REFUTED.** Our first write-up stated, for every prime p ≥ 5, that each prime
𝔓 | 2 of F_p has residue degree f_𝔓 ∈ {f_M/2, f_M} with f_M = lcm(2, ord_p 2). Its own table already breaks this at p = 23 (f = 33, not
11 or 22), and an exact rebuild breaks it at p = 31 (15, not 5 or 10) and p = 47 (115, not 23 or 46); a referee rebuilt 23 and 31 with
its own script.

*Corrected law (PROOF DRAFT; one referee round, CORRECT WITH FIXES, fixes applied; [unconditional]).* Let M = H_O(ζ_p), r = ord_p 2,
and f_H the residue degree of 2 in H_O: f_H = 2 if p ≢ 7 (mod 8), and the order of the class of a prime above 2 in Cl(−p) if
p ≡ 7 (mod 8). Put f_M := lcm(f_H, r). Then every 𝔓 | 2 of F_p has e(𝔓|2) = e and f_𝔓 ∈ {f_M/2, f_M}. (The proof is local: the residue
extension at a prime of H_O is generated by ζ_p, so its degree is the order of 2^{f_H} mod p.) The old closed form fails only through
f_H ≠ 2 at p ≡ 7 (mod 8). *Exact lists:* for p ≡ 3 (mod 8), F_p has (p−1)/r primes [e, f] = [3, r/2] and (p−1)(h(−p)−1)/(2r) primes
[3, r]; for p ≡ 7 (mod 8) all primes are [1, lcm(f_H, r)]; for p ≡ 1 (mod 8) with r odd all primes are [2, 2r]. The [3, r] branch (it
needs h(−p) > 1) is untested at the level of F_p: its one sealed item, p = 59, did not run; it is tested only on the subfield J (18/18).
OPEN: the exact counts for p ≡ 5 (mod 8) and for p ≡ 1 (mod 8) with r even.
*Checks (sealed; exact maximal order at 2 and prime decomposition, no GRH):* controls 11, 17, 23, 43 hold; new items 31 ([1, 15] ×3),
47 ([1, 115]), 73 ([2, 18] ×4) hold; 59, 71, 41 not run (cost); on J alone 18/18 at 79 ≤ p ≤ 251. *Credit:* corollary-level (cyclotomic
reciprocity: the residue degree of 2 in Q(ζ_p) is ord_p 2 [Sh2, Prop 3.1.21]; Artin and genus facts); new are only the correction and
the explicit lists.

### 4.5 Units for p ≡ 7 (mod 8): p-th roots, the norm to Q(ζ_p)^+, and the index (V3, C8)
Throughout this subsection p ≡ 7 (mod 8), so every b_k is a unit (C3c). Put m = (p−1)/2, ψ = (·/p), ζ = e^{2πi/p}, G = (Z/p)^×/{±1}
= Gal(Q(ζ_p)^+/Q), and let χ run over the even Dirichlet characters mod p. Write N := N_{F_p/Q(ζ_p)^+}(b_1) and
ξ_a := (ζ^{a/2} − ζ^{−a/2})/(ζ^{1/2} − ζ^{−1/2}) (Hasse units, as defined in [Sh]; ζ^{x/2} := ζ^{x(p+1)/2}), C′ := ⟨−1, ξ_2, …, ξ_m⟩.

**Theorem V3 (p-th roots; PROVED (AI-refereed), referee round 4 ACCEPTED WITH FIXES; [unconditional]).** For any prime p ≥ 5 and
integers n_j with Σ_j n_j j² ≡ 0 (mod p), the real number Π_j u_j^{n_j} lies in F_p. In particular w_k := u_1^{k²}/u_k ∈ F_p for every
k, and for p ≡ 7 (mod 8) the w_k are units. The group they generate with −1 and b_1 equals the group E_R of all such products.
*Idea.* The product is a Siegel-function product; under the reciprocity matrices of §4.1 it acquires a 4th root of unity times
e^{πiB′Σ n_j j²/p}, and the hypothesis kills the p-power part (the Kubert–Lang quadratic condition in this setting); a Kummer argument
finishes. The converse (products with Σ n_j j² ≢ 0 are not in F_p) is NUMERICAL (26/26 nulls at p = 7, 23, 31).

**Theorem V3C (the L-value identity; PROVED (AI-refereed), referee round 2 ACCEPTED WITH FIXES; [unconditional]).** With
A_χ := Σ_{a=1}^{m} χ(a) log|ι_a(N)| and C_χ := Σ_{a=1}^{m} χ(a) log|1 − ζ^a|² (ι_a(ζ + ζ^{−1}) = 2cos(2πa/p)), for every even χ ≠ 1:

  **A_χ = (p/2) · χ(2)(χ(2) − 1) · B_{1,χψ} · C_χ.**

Hence A_χ = 0 iff χ(2) = 1. *Where the factors come from:* p from b = u^p; 1/2 and B_{1,χψ} from L(1, χψ); the single factor
χ(2) − 1 from the conductor 2 of Z[√−p] in the lattice sum. *Proof route:* Kronecker's second limit formula (as stated in [St80],
eq. (11), p. 207) plus bookkeeping over ideal classes, with the Galois step taken from [KSY25] Props 3.1, 4.1, 5.1 and its Example 8.1
(which fixes the order of action). The mechanism is CLASSICAL.
*Direct predecessor.* Kubert–Lang [KL], Thm 4.2 (p. 168): norms of Siegel–Ramachandra–Robert units of conductor p over Q(√−p) to
Q(ζ_p) are cyclotomic units with exponents −12p·B_1(⟨b/p⟩). The Bernoulli-exponent shape of Corollary 1 below,
(b/p)(p − 2b) = (b/p)(−2p·B_1(b/p)), is therefore classical in mechanism. Our units are level-2p theta quotients (denominator
φ(q^p)), not covered by Kubert–Lang's conductor-p units; the factor (1 − χ(2)), the Hasse unit ξ_2 and the index/rank formula C8 come
from that level-2 part and were not found in [KL].
*Corollary 1 (closed form; PROVED (AI-refereed), part of the same refereed write-up).* N = ± Π_{b=1}^{m} σ_{(4b)^{−1}}(ξ_2)^{(b/p)(p−2b)};
at p = 7 this is b_1 = s_3^6 s_1^{−4} s_2^{−2}, the septic form of §5.3. Checked in every embedding at p = 7, 23, 31, 47, 71, 127.
*Corollary 2 (PROVED (AI-refereed), referee round 3 ACCEPTED WITH FIXES).* If 2 generates G, then N ∈ C′ and

  [C′/{±1} : ⟨N^G⟩] = Π_{χ≠1} p|B_{1,χψ}| = 2^{m−1} p^{m−2} h^−(Q(ζ_p))/h(−p)

(28 at p = 7; 2^{10}·23^9 at p = 23). Whether C′ is the full group of cyclotomic units is not used and not claimed.

**Theorem C8 (the index at every p ≡ 7 mod 8; PROVED (AI-refereed), one referee round, ACCEPTED WITH FIXES; [unconditional]).** Let
f = ord_p(2), r = m − m/f, X = the subgroup of C′/{±1} generated by the G-conjugates of N, S its saturation, and W the group generated
by X and the norms of the w_k. Then (a) rank X = r (the drop is the number of χ ≠ 1 with χ(2) = 1); (b) S is generated by the conjugates
of ξ_2 and consists of the units of C′ whose norm to the fixed field of σ_2 is ±1; (c) **[S : X] = Π_{χ even, χ(2)≠1} p|B_{1,χψ}|**;
(d) rank W = r, its saturation is S, and **[S : W] = [S : X]/p^{r−1}**. When f = m this is Corollary 2.
*Proof route:* Corollary 1 writes N as φ(θ) for an explicit θ in the group ring; a cyclic-norm-kernel lemma and a determinant
computation in the group ring give (a)–(c); a Teichmüller-component argument gives (d).
*Sealed test (no GRH; analytic conjugates at 150–500 digits, then exact integer lattice algebra):* controls 7, 23, 47 and tests 31, 127,
151, 223 all hold. Examples: p = 31 (f = 5): rank 12, [S : X] = 2^{12}·31^{11}, [S : W] = 2^{12}; p = 127 (f = 7): rank 54,
[S : X] = 2^{54}·43·127^{53}·547·883·626599. *Credit:* the index/rank formula with the (1 − χ(2)) factor is ours (not found in print at our search floor); [KL] Thm 4.2 is its
direct predecessor and must be read alongside it.

**What is not claimed here.** The full unit group of F_p at p = 23, 31 (degree 33, 45; not totally real, signature (m, m(h−1)/2)):
exact indices there are GRH-conditional and NOT CLAIMED, because an unconditional class-group certificate for F_23 did not finish in
7,500 s. The ranks there are unconditional: the b_k span rank m (11, resp. 15) of unit rank 21, resp. 29, and adding cyclotomic units
fills the rank. The identity P_p = ε_J^{±(p−1)} (ε_J a fundamental unit of J, at p = 23, 31) is NUMERICAL (P_p ∈ J is proved). At p = 7
everything is unconditional: the b_k have index 28 = 2²·7 in the units of Q(ζ_7)^+, and ⟨−1, b_1, w_k⟩ has index 4. A two-point
pattern for the remaining "mixed" index, p·Π(2 + χ(2)) (23·683 and 3²·11³·31), is OBSERVED, GRH-conditional, and NOT CLAIMED.

---

## 5. Cyclotomic and abelian laws

A real number z generates an abelian extension of Q exactly when Q(z) is Galois over Q with abelian group; for the real CM values
in this paper that happens iff every Q-conjugate of z is real (§7.6). Sections 5.1–5.4 treat the septic-type pieces; §5.5–5.9 freeze
the level, move the point, and treat continued fractions.

### 5.1 The pieces carry j (PROVED (AI-refereed); [unconditional])
**Proposition D.** Let v = b_1 b_2 ⋯ b_m = P_p^p. Then Q(v) = J = Q(j(√−p)). Hence Q(b_1, …, b_m) = F_p.

*Proof sketch.* v is fixed by Gal(L/H_O) (C2 permutes the b_k) and real, so v ∈ J. By [KSY25, Prop 4.1] at N = 1, the K-conjugates of
j(τ_0) are the j(t_Q) over reduced forms Q = (a, b, c), t_Q = (b + √D)/(2a), and they are distinct. A non-trivial σ ∈ Gal(H_O/K) sends
w = 𝔣(τ_0)^{24} to one of 𝔣^{24}, −𝔣_1^{24}, −𝔣_2^{24} at some t_Q with a ≥ 2, and an elementary size bound (these are below
4.89 e^{π√p/2} or 19.7, while w > e^{π√p}) gives |σ(w)| < w. From v^{24} = 2^{12p(p−1)} w^{−p(p−1)}, |σ(v)| > v, so only the identity
fixes v and [Q(v) : Q] = h. ∎ (Check: all 2,388 non-principal reduced forms with 5 ≤ p ≤ 1000 satisfy the bound; the principal form
fails it, as it must.) [cited proof unopened: the proof of [KSY25] Prop 4.1 is cited there to a source we did not open.]

Remark. Q(P_p) = J is classical (§2.3); Proposition D is the statement that the p-th power v, which is what the field of the pieces
visibly contains, still generates J. That is what lets Weber's criterion pass from j to the pieces.

### 5.2 The criterion C4 (PROVED (AI-refereed))
**Theorem 4 (C4).** For a prime p ≥ 5 the following are equivalent: (i) all b_k lie in one abelian extension of Q; (ii) F_p is abelian
over Q; (iii) h(−4p) ≤ 2. Moreover h(−4p) is odd for p ≡ 3 (mod 4) and even for p ≡ 1 (mod 4), so (iii) means h = 1, resp. h = 2.
When (iii) holds, F_p = Q(ζ_7)^+ (p = 7) or F_p = Q(ζ_{4p})^+ (p ≡ 1 mod 4). [unconditional]

**Corollary (list form).** h(−4p) ≤ 2 iff p ∈ {3, 5, 7, 13, 37}. [unconditional; cited proof unopened: the class-number-1 and -2 lists
are complete by the theorems of Heegner, Baker and Stark, whose proofs we did not open; we cite the published lists.]

*Proof sketch.* (i) ⇒ (iii): by Proposition D, J lies in an abelian field, so J/Q is Galois and every conjugate j(t_Q) is real. The
mirror form Q′ = (a, −b, c) has conj(j(t_Q)) = j(t_{Q′}), so every reduced form must be its own mirror up to the boundary cases; counting
reduced forms of discriminant −4p of shapes b = 0, b = a, a = c leaves (1, 0, p) and, for p ≡ 1 (mod 4), (2, 2, (p+1)/2). The parity
statement comes from the involution σ ↦ cσc on Gal(H_O/K), whose fixed points are exactly those forms. (iii) ⇒ (ii): if h = 1 then
H_O = K ⊂ Q(ζ_p); if h = 2 then H_O = Q(i, √p); either way M is cyclotomic (or, avoiding Gauss sums, H_O/Q is Galois of degree ≤ 4 by
[KSY25, Lemma 7.3]). List: h(−4p) = 1 only for p ∈ {3, 7} ([KSY25] Rem 5.2(iii), the class-number-1 list of orders); for p ≡ 1 (mod 4),
−4p is a field discriminant and the class-number-2 imaginary quadratic fields with d = p prime are p = 5, 13, 37 [LMFDB]. ∎ (Check: h(−4p)
has the predicted parity for all 428 primes 5 ≤ p < 3000, and h ≤ 2 exactly at 5, 7, 13, 37.)

**Credit.** The equivalence "Q(j(√−n)) abelian iff n idoneal" is Weber's (Kani 2011, Thm 32 [Ka]); the counting of ambiguous forms used
above re-proves classical facts and is presented as such. What is ours (not found in print at our search floor) is Proposition D and the resulting transfer to Ramanujan's
pieces, the explicit field F_p = Q(ζ_{4p})^+, and the sine forms below.

### 5.3 The strong form: products of sines (RIGOROUS (ball arithmetic) at 5, 7, 13, 37)
For p ∈ {5, 7, 13, 37}, Theorem 4 puts b_k in Q(ζ_N)^+ (N = 4p, or N = 7). Each b_k is an explicit product of sines,
s_j := 2 sin(πj/N), times powers of 2 and p, with exponent 1 on b_k:

- **p = 7** (N = 7, positive control). b_1 = s_1^{−4} s_2^{−2} s_3^{6} = d_2^6/d_1^2, b_2 = d_1^6/d_2^4, b_3 = d_1^{−4}d_2^{−2}, with
  d_j = sin((j+1)π/7)/sin(π/7). These are Rebák's terms: b_1 = u_1^7 = (cos(2π/7)/(2cos²(3π/7)))². Minimal polynomial x³ − 41x² + 54x − 1.
  (The d_j are the quantum dimensions of SU(2)_5; see §7.6.)
- **p = 5** (N = 20). **b_1 = 4 s_4 s_5 / (s_1 s_3² s_6 s_8)**; also b_1² = 2^5 s_2^4/(s_1² s_3^4); b_2 is the same with j ↦ 9j (mod 20)
  inside |sin|. Minimal polynomial x⁴ + 72x³ − 1056x² + 3328x − 1024.
- **p = 13** (N = 52). **b_1 = 2^5 · 13^{−1} · Π_{j=1}^{25} s_j^{n_j}** with
  n = (1, 3, −2, 2, −4, 0, −2, 2, 0, −4, −3, 1, 3, 0, 3, 5, 3, 3, 0, 1, 1, −2, 2, 1, 2);
  b_k is the same with |2 sin(π a_k j/52)|, a_k = 1, 17, 9, 23, 25, 3 for k = 1, …, 6 (in agreement with C2).
  Minimal polynomial of degree 12 with 40-digit coefficients and constant term 2^{78}.
- **p = 37** (N = 148). **b_1 = 2^{15} · 37^{−1} · Π_{j=1}^{73} s_j^{n_j}** with
  n = (3, 9, −4, 4, 3, 6, 9, 1, 2, −7, −4, −1, −10, 8, −3, 6, −7, 1, 0, −8, 8, 5, 6, −1, 6, −5, 12, −1, −7, −3, −2, −1, 3, −6, −13, 4,
  7, 2, 5, 17, 12, 10, 4, 11, 7, 4, 1, 12, 9, 13, −2, −4, 1, 9, 2, −3, 6, −1, 2, −4, 7, 4, 6, 13, −2, 6, −7, −2, −12, 0, 8, −7, 4);
  b_k is the same with |2 sin(π a_k j/148)|, a_k = 1, 41, 9, 53, 25, 73, 49, 47, 67, 11, 27, 33, 21, 63, 71, 3, 7, 65 (k = 1, …, 18).
  Minimal polynomial of degree 36, coefficients up to 518 digits, constant term 2^{666}.

The exponent vectors are not unique (the sines satisfy multiplicative relations among themselves); those shown are the ones the
lattice step found, and each is verified exactly.

**Method.** (A) Compute all h(p−1)/2 conjugates of b_1 analytically: the principal values b_k, and for the second class
(2, 2, (p+1)/2), used as ((p+1)/2, −2, 2), the values B_k(t_Q + a′) from [KSY25] Prop 4.1 at N = 4p (both composition orders give the
same translation). (B) Round Π(x − conjugate) to a monic integer polynomial G (rounding error ≤ 10^{−2483}; distinct roots at least
10^{−50.6} apart). (C) Build the sine product c_1 exactly in Q(2cos(2π/N)) and check G(c_1) = 0 by exact algebra. (D) c_1 agrees with
b_1 to ≥ 10^{−2956}, far below half the root separation, so c_1 = b_1. An independent norm-gap argument needs the conjugates only as
size bounds: thresholds 10^{−3.8}, 10^{−6.7}, 10^{−90.9}, 10^{−1353} at p = 7, 5, 13, 37, against observed differences near 10^{−3000}.
Wrong readings of the twist give polynomials that miss integrality by 10^0 to 10^{539}. The negative control p = 11 gives an integral
degree-15 polynomial whose field has only 5 automorphisms (not Galois, hence no sine form can exist), as C4 requires.

**Upgrade to ball arithmetic (sealed; HOLDS).** The first run was CERTIFIED numerics (3,000-digit floating point). Every analytic step
was then redone inside Arb error balls: G_p re-certified at twice the working precision (identical; conjugate balls pairwise disjoint),
G_p(c_1) = 0 exactly in Q(2cos(2π/N)), the ball of ι(c_1) meets the ball of b_1 and no other, positivity checked, and every Galois image
matched bijectively. The four identities are therefore RIGOROUS (ball arithmetic), resting on Theorem M (§7.4), the correctness of Arb,
exact FLINT arithmetic and the cited theorems.

Combined with Theorem 4: the strong form holds exactly at {3, 5, 7, 13, 37} and nowhere else (at the four non-trivial primes RIGOROUS
by ball arithmetic; the "nowhere else" half is the proved abelian form). A conceptual proof (via the cyclotomic-unit index) is OPEN.

### 5.4 Odd composite n: the rule C5 (PROVED (AI-refereed), for the field of all pieces; [unconditional])
Define u_k, b_k as in §2 with p replaced by an odd n ≥ 3 (q = e^{−π/√n}, k = 1, …, (n−1)/2), O = Z[√−n], and E = Q(b_1, …, b_{(n−1)/2}).

**Theorem 5 (C5).** (a) [E : Q] = h(−4n)φ(n)/2 and E ⊃ Q(j(√−n)). (b) The number of real embeddings of E is
(φ(n)/2) · #{c ∈ Cl(O)[2] : ε(c) constant}, with the sign vector ε below. (c) **E is abelian over Q iff n is idoneal and a prime power,
iff n ∈ {3, 5, 7, 9, 13, 25, 37}.** (d) If n is idoneal but not a prime power, Q(b_1) itself is not abelian.

**The sign-vector mechanism.** A principal ideal νO prime to 4n acts on the pieces by b_k ↦ b_{k·t(ν)}, where t(t + s√−n) := t mod n
(a ring map O → Z/n, since (√−n)² ≡ 0). Complex conjugation c satisfies c·ρ([𝔞])·c = ρ([𝔞̄]) on the pieces, so a conjugate is real iff
ρ(𝔞̄/𝔞) fixes it. If [𝔞]² = 1, write 𝔞² = λO; then 𝔞̄/𝔞 acts by k ↦ k·t(λ)/N𝔞, and t(λ)² ≡ (N𝔞)² (mod n), so
ε_r(𝔞) := t(λ)/N𝔞 ≡ ±1 modulo each prime power r^e ‖ n. The action is trivial iff the vector ε = (ε_r) is constant. For the ambiguous
class of (r^e, 0, n/r^e) an explicit representative of norm r^e + 4n/r^e gives ε_r = −1 and ε_s = +1 at every other prime power s^f ‖ n.
So ε is constant iff n is a prime power. Grube's theorem (Kani Thm 12 [Ka]) leaves 9 and 25 as the only odd idoneal prime powers
with exponent ≥ 2, and C4 gives the primes; completeness of Euler's list of idoneal numbers is not needed.

*Proof and referee history.* The write-up [S-C5] contains a transformation lemma (the multiplier is exactly 1 for all needed matrices,
two classes checked by congruences on the page, including the all-odd case), the action of principal classes from [KSY25] Props 3.1 and
4.1, the degree, conjugation computed from the Prop 4.1 formula, and ε exactly. Three referee rounds: NOT A PROOF, NOT A PROOF (one gap),
ACCEPTED WITH FIXES (fixes applied).

**Evidence (sealed; 13/13 sealed predictions HOLD, plus n = 57 computed after the seal).** Exact integer minimal polynomials G_n of b_1
and exact real-root counts:

| n | h(−4n) | deg G_n | real roots | verdict |
|---|---|---|---|---|
| 7 | 1 | 3 | 3 | abelian (Q(ζ_7)^+) |
| 9 | 2 | 6 | 6 | abelian, Q(b_1) = Q(ζ_36)^+ |
| 11 | 3 | 15 | 5 | not abelian |
| 15 | 2 | 8 | 4 | not abelian |
| 21 | 4 | 24 | 12 | not abelian |
| 25 | 2 | 20 | 20 | abelian, Q(b_1) = Q(ζ_100)^+ |
| 27 | 3 | 27 | 9 | not abelian |
| 33 | 4 | 40 | 20 | not abelian |
| 45 | 4 | 48 | 24 | not abelian |
| 49 | 4 | 84 | 42 | not abelian |
| 57 | 4 | 72 | 36 | not abelian |
| 85 | 4 | 128 | 64 | not abelian |
| 93 | 4 | 120 | 60 | not abelian |
| 105 | 8 | 192 | 48 | not abelian (convention-2 control not run) |

A field with both real and non-real embeddings is not Galois over Q, so at 15, 21, 33, 45, 57, 85, 93, 105 b_1 lies in no abelian field of
any conductor (exact once G_n is accepted; rounding errors ≤ 10^{−310}; CERTIFIED numerics).

**Status of the b_1-only version.** For idoneal n, (c) and (d) hold for Q(b_1) (PROVED (AI-refereed)). For primes p with h(−4p) > 2,
Q(b_1) is not abelian (PROVED (AI-refereed), via C4: an abelian Q(b_1) would be Galois and contain every conjugate of b_1, hence every
b_k). For every prime 5 ≤ p ≤ 97 the equality Q(b_1) = F_p is PROVED (AI-refereed) (C10, §7.4). For prime powers n = p^e ≥ 25, Q(b_1) = E is a
PROOF DRAFT (a by-product of the Theorem G repair, refereed with it, §5.7). In general, for primes p > 97 and for other composite n,
Q(b_1) = E is OPEN; it is NUMERICAL wherever tested (deg G_n = h(−4n)φ(n)/2 at all 14 n of the table).

**R1 (REFUTED).** The sealed prediction "cosine forms iff n idoneal" failed for composites: idoneal 15, 21, 33, 45, 57, 85, 93, 105 give no
abelian form, while 25 does. It is superseded by the exact non-real-root certificates above.

### 5.5 Frozen level: Berndt–Rebák's cubic and quintic pieces (C6; PROVED (AI-refereed), referee rounds 1–4; the case l = 3, 5 of Theorem G)
Berndt–Rebák's cubic piece u = 2q^{1/3} f(q, q^5)/φ(q^3) and quintic pieces u = 2q^{1/5} f(q^3, q^7)/φ(q^5), v = 2q^{4/5} f(q, q^9)/φ(q^5)
([BR] Thm 2.1, Thm 4.2) are our u_k with p replaced by a fixed level l ∈ {3, 5}. Freezing the level and moving the point τ = i√m gives
B^{(l)}_1(i√m) := u_1(i√m)^l (the "B-family"; Berndt–Rebák's values at q = e^{−π√n}, n = m/l²) and the companion "W-family" (the l-th
powers of the theta pieces inside Berndt–Rebák's Entry-1.1 analogues, at n = m).

**Theorem W (C6).** Let l ∈ {3, 5} and m ≥ 3 odd. Then B^{(l)}_1(i√m) is abelian over Q iff m is idoneal and either l | m, or l = 3 and
m ≡ 2 (mod 3). For l | m the same holds for all pieces together. The W piece is abelian iff l ∤ m and the B condition holds: for the
cubic, n idoneal with n ≡ 2 (mod 3); for the quintic, never (odd n ≥ 3). [criterion unconditional; explicit lists Euler-list]

*Why it differs from C5.* In C5 the level equals the point, and every prime of n carries its own sign (a sign vector), so two primes can
disagree. With a frozen level there is a single sign, so composite m return: the cubic piece is abelian at m = 15, 21, 33, 45, 57, 93,
105, 165, …, 1365. The obstruction is instead the norm-one torus of (O/lO)^×, which acts trivially only when l | m (or, for l = 3, when
3 splits, m ≡ 2 mod 3). *Proof route:* the torus element moves the value (an explicit separation lemma for theta values at
Im τ ≥ √3); the "if" direction uses C5's transformation lemma; for non-idoneal m the pieces are Hauptmoduln (the cubic B_1 for an
index-12 group, the quintic product p = u·v for Γ*_5), so they generate the ring class field and Weber's criterion applies.

*Evidence (sealed).* 116 sealed values, 0 misses, including the predicted degree and the exact number of real conjugates; 22 more
idoneal m checked afterwards. Examples: cubic B, m = 15: x² − 7x + 1; cubic B, m = 45: x⁴ + 1120x³ − 1344x² − 8960x + 64; cubic W, m = 5:
x⁴ − 64x² + 64 (Berndt–Rebák's Cor 3.9, u³ = 2(√3 + √5)).

*Corollaries.* Among odd n, the theta pieces u^l inside Berndt–Rebák's Entry-1.1 analogues are abelian only at n = 1, 5 (cubic)
[Euler-list: a possible further idoneal number could add to this list] and n = 1 (quintic; unconditional); their values p at q = e^{−π√n}
(n odd) are abelian only at n = 1, 5 (cubic) [Euler-list] and n = 1 (quintic; unconditional). These statements concern the pieces, not the
φ-ratios themselves.

*Status notes.* The sealed run had only one working null (the coefficient-action null FAILED as a null: dropping the action only permutes
the conjugate set). The criterion is unconditional, but the *explicit* lists (cubic B: 3, 5, 9, 15, 21, 33, 45, 57, 93, 105, 165, 177, 273,
345, 357, 1365; quintic B: 5, 15, 25, 45, 85, 105, 165, 345, 385, 1365) rely on Euler's list of idoneal numbers where Grube's theorem does
not decide [Euler-list]. The real-conjugate count is a proof sketch only; even m (e.g. Berndt–Rebák's cubic n = 2, 8) is undecided.

### 5.6 The Rogers–Ramanujan continued fraction (C7; PROVED (AI-refereed), ACCEPTED WITH FIXES; real-count supplement: PROOF DRAFT)
Let R(τ) = q^{1/5} Π_{k≥0} (1 − q^{5k+1})(1 − q^{5k+4})/((1 − q^{5k+2})(1 − q^{5k+3})), q = e^{2πiτ}, and z_n := R(i√n) = R(e^{−2π√n}).

**Theorem R (C7).** For every integer n ≥ 1, Q(z_n) is abelian over Q iff n = 1. [unconditional; no class-number list is needed]

At n = 1, z_1 = 2cos(π/10) − 2cos(π/5), with minimal polynomial x⁴ + 2x³ − 6x² − 2x + 1 and group Z/4. *Mechanism:* for n ≥ 2 the
commutator of complex conjugation with the class of ν = 1 + √−n (or 2 + √−n) moves z_n, because R takes distinct values on distinct
points of the level-5 modular curve; at n = 1 the same symmetry is the unit i of Z[i], which fixes the point i.
*Evidence (sealed, 219 values: n = 1..200 and every idoneal n ≤ 1848):* the conclusion held at all 219; degrees and real-root counts
matched at all 218 n ≥ 2. One certificate clause FAILED: at n = 1848 the search for a non-Galois prime hit its cap (the conclusion still
held). *Credit:* that R(τ_O) generates the ray class field mod 5 over K is Gee–Honsbeek's Lemma 4.1 [GH]; Duke's theorem [Du] is a
radical criterion. Jha [Jha, Thm 3.4, Prop 4.2] (D = −5n, fields over K) and Guadalupe [Gu25, abstract only] study Rogers–Ramanujan
singular values; neither classifies when the values are abelian over Q (for [Gu25], judging from the abstract). No classification over Q was found.

**Supplement: real conjugates (PROOF DRAFT; one referee round, CORRECT; [unconditional]).** For n ≥ 2, the number of real Q-conjugates
of z_n is r(n)·|Cl(O)[2]|, with r(n) = 4 if 5 ∤ n and r(n) = 2 if 5 | n. The degree h(−4n)e(n) is prior art (Gee–Honsbeek [GH], Lemma 4.1
with the exact sequence (3.1)). The new step is a Hilbert-90 count: for each class C of order ≤ 2 pick an integral ideal 𝔟 ∈ C prime to 5,
write 𝔟̄/𝔟 = εO with N(ε) = 1, and solve x̄/x = ±ε^{−1} mod 5. (Two standard ideal-theoretic facts are taken from Cox's book, Cor 7.17 and
Lemma 7.14; we did not open them.) *Checks:* n = 2..40, 39/39 on degree, real count (Sturm on the exact integer polynomial),
squarefreeness and integrality; the 218 values of the sealed run, including n with 5 | n, also match. *Credit:* the mechanism is the
level-1 rule "j(𝔞) is real iff [𝔞] has order ≤ 2" (Chavan [Ch], Prop 2.3) plus a fixed-point count on (O/5O)^×. Corollary-level.

### 5.7 One Galois law at every odd level (Theorem G; PROVED (AI-refereed), referee rounds 1–3; case (D) repaired, repair accepted by two referees)
For odd l ≥ 3 let B^{(l)}_k := (2θ[k/l, 0]/θ[0, 0])^l, i.e. u_k^l for the level-l dissection u_k = 2q^{k²/l} f(q^{l+2k}, q^{l−2k})/φ(q^l),
and evaluate at τ = i√m, m odd ≥ 3. The septic-type family of §§2–5.4 is the diagonal l = m; Berndt–Rebák's pieces are l = 3, 5.

**Theorem G.** For odd l ≥ 3 and odd m ≥ 3, Q(B^{(l)}_1(i√m)) is abelian over Q iff m is idoneal and either l is a prime power dividing m,
or l = 3 and m ≡ 2 (mod 3). [criterion unconditional; explicit lists Euler-list]

*Specialisations.* l = m prime: C4. l = m odd: C5 (prime powers 9, 25 pass; two primes fail). l = 3, 5: C6. For a prime level l ≥ 5 the
law reads "abelian iff m is an idoneal multiple of l": l = 7: m ∈ {7, 21, 105, 133, 273, 357, 385, 1365}; l = 11: {33, 165, 253, 385};
l = 13: {13, 273, 1365}; l = 17: {85, 357}; l = 19: {57, 133}; l = 23: {253, 345}; l = 31: {93}; l = 37: {37}; l = 59: {177}; any other prime
l ≥ 5: none. Prime-power levels: l = 9: {9, 45}; l = 25: {25}; higher prime powers and levels with two primes: never. (These explicit lists
use Euler's 65 idoneal numbers [Euler-list]; the criterion itself is unconditional.)

*Mechanism.* The field generated has Galois group "abelian ⋊ complex conjugation"; the value is abelian iff conjugation commutes with every
symmetry acting on it. Two things can break this: the class group of Z[√−m] (it must be 2-torsion: m idoneal), and the norm-one torus of
(O/lO)^×, whose action on the piece must be invisible; that happens only when l is a prime power dividing m, or in the split case l = 3,
m ≡ 2 (mod 3). *Proof route [S-G]:* an explicit separation lemma for theta values gives "only if" when l ∤ m; a size argument
(Proposition D_l, the level-l analogue of Proposition D) shows the product of the pieces generates the ring class field when l | m, so
non-idoneal m fail (for l = p^e with e ≥ 2 the product must be restricted to the unit pieces: Proposition D′_l below); a further
proposition (cases (i)–(v)) handles composite l with a prime-power part not dividing m; the "if" direction uses C5's transformation lemma.
Referee rounds: (1) ACCEPTED WITH FIXES for the parts then proved, full theorem not yet a proof; (2) Proposition D_l and every odd prime l
ACCEPTED WITH FIXES; (3) the composite cases and "Theorem G for every odd l and odd m ≥ 3": ACCEPTED (no fixes). Round 3 relied on earlier
rounds' readings of Kani 2011, the C5 notes and [KSY25] Prop 3.1 rather than re-opening them.

**A gap found in a fourth reading, and its repair.** Case (D) of the proof ("only if" for l = p^e, e ≥ 2, dividing a non-idoneal m) took the
product V of all pieces B_k, 1 ≤ k ≤ (l−1)/2, and placed it in K(z) by a lemma that covers only k prime to l; for e ≥ 2, V also contains the
pieces with p | k (e.g. B_3 at l = 9), and their membership in K(z) is equivalent to what was being proved. The three referee rounds missed
this; the AI worker that used Theorem G for the shape formulas of §5.8 found it; the numbers had always fit. *Repair (Proposition D′_l)
[S-GD]:* use only the unit pieces, V′ := Π_{gcd(k, p) = 1} B_k(τ_O), which do lie in K(z). Then V′ = 2^c (𝔣(τ_O/l)/𝔣(τ_O/l′))^l
𝔣(τ_O)^{−lφ(l)} (l′ = l/p), a product of three Weber values, and the same kind of size comparison as Proposition D_l gives |σ(V′)| > V′ for
every σ ≠ 1 in Gal(H_O/K) (worst case l = 9, m/9 = 3: margin 6.948 > 0; ≥ 62 for l ≥ 25), so K(V′) = H_O ⊂ K(z) for every such (l, m) except
(9, 9), where m is idoneal and nothing is to be proved. Two independent referees accepted the repair with fixes (constant roundings 8.2128
and 6.948, an invalid sealed item, a saved diagnosis file; fixes applied): the closed form, the size bound, K(V′) = H_O and the absence of
circularity were each re-derived, and the closed form was re-checked numerically to 10^{−208}. Theorem G is therefore PROVED
(AI-refereed) again in full. *Sealed check of the repair, scored as sealed:* FAILED on two items, both set-up errors: (9, 51) is not a
valid item (9 ∤ 51), and at (9, 27) the CM point was computed at 38 digits (POST HOC at 150 digits the closed form holds to 7.8·10^{−153});
the valid items (9, 63), (27, 27), (25, 75) hold.

*Evidence (sealed).* The first sealed bar had 243 values at levels 7, 9, 11, 13, 15, 21, 25, plus 18 controls at levels 3, 5. Only items
with an exact layer are quoted here: 133 of the 243 (integer minimal polynomial, rounding as an integrality check, Sturm count, and a
non-Galois prime or an explicit Galois group) plus the 18 controls; on all of them the abelian/not-abelian verdict, degree and real count
are as predicted. The other 110 items rest only on the numerical layer of a fixed-tolerance clustering script, which is now known to
merge distinct conjugates silently at large m; their counts are held back until a re-run through the fixed routine (§7.5). Scored strictly
as sealed there are misses: the degree formula (242/243) and the real-count formula (156/157) FAILED at (l, m) = (11, 1365), traced post
hoc to that clustering (two conjugates agree to a relative 2.6·10^{−50}); the fixed, precision-tied routine gives the predicted 960 and
160 there (a float separation test, not an exact certificate). One of the two wrong-convention nulls FAILED as a null (it gives a different
but Galois-stable value set); the null at (13, 13) was not run. A second sealed bar (22 values at composite levels 27, 45, 49, 63, 75 and
three controls) is exact at (27, 9), (45, 45) and the three abelian controls, all as predicted; the other 17 verdicts and degrees rest on
the old numerical layer and are held back with the 110 above. **Post-hoc label:** the item (75, 15) was tagged as a gap at sealing; the
extension of case (v) to composite l that covers it was derived after the seal, so that case is post hoc (the proof does not depend on the
numbers; the 22 predictions were fixed at sealing).

**Theorem U (the stabiliser frame; PROVED (AI-refereed) as part of Theorem G).** For a modular function f of level N with rational
q-coefficients at τ_O = i√m (O^× = {±1}): f(τ_O) is abelian over Q if Cl(O) is 2-torsion and the torus elements g_{x̄/x} and g_{ε(𝔞)} lie in
the stabiliser S_f of f; the converse holds when f(τ_O) has a generic stabiliser. The Galois action is that of [KSY25] Prop 5.1, which is
valid at every level. Computing S_f for B^{(l)}_1 gives Theorem G (and C4–C6); for R, a Hauptmodul of Γ(5) with S_f = {±1}, it gives C7
(at m = 1 the units ±i of Z[i] absorb the torus); for the two even-level continued fractions it gives §5.9.

*Ceiling.* A complete, explicit Galois classification of Ramanujan's theta pieces at every odd level in one sentence. The mechanism
(Shimura reciprocity, ray class groups of orders, Weber's criterion, Hilbert 90) is standard; the theorem is a clean result in explicit
class field theory, not a new method.

### 5.8 Shape: degrees and real conjugates (Theorem S-A; PROOF DRAFT; one referee round: CORRECT WITH FIXES for prime l, CORRECT for the all-inert composite family; fixes applied)
Let z = B^{(l)}_1(i√m), O = Z[√−m], h = h(−4m), Cl2 = |Cl(O)[2]|. [unconditional: no idoneal, GRH or Euler-list input]

**Theorem S-A.** For every odd prime l and every odd m ≥ 3:

  [Q(z) : Q] = h(l−1)/2 (l | m),  h(l−1)²/2 ((−m/l) = +1),  h(l²−1)/2 ((−m/l) = −1);
  number of real conjugates = Cl2·(l−1)/2 (l | m),  Cl2·(l−1) (l ∤ m).

For odd composite l prime to m with −m a non-square modulo every prime of l: degree h·J_2(l)/2 (J_2 the Jordan totient) and Cl2·φ(l)
real conjugates. For l = p^e | m (e ≥ 2, (l, m) ≠ (9, 9)), the case-(D) repair gives degree h·φ(l)/2 and Cl2·φ(l)/2 real conjugates (a
by-product, checked by the referee of the repair). OPEN: composite l with a prime split in K or dividing m, outside the prime-power case;
there only "degree = h × orbit size × [K(z) ∩ H_O : K]" is proved.

*Proof ingredients [S-SA].* An exact stabiliser lemma for the torus (a principal class fixes z iff it acts on the characteristic (1, 0) by
±1; no accidental coincidences, by the theta size lemmas); an all-division-point theta product that equals a power of Weber's function
(proved on the page; it is of Kubert–Lang distribution-relation type, but we have not verified that citation); the orbit norm of z then
generates H_O by the size argument (at l = 3 split the cubic Hauptmodul of C6 is used instead); the real count is genus theory (classes of
order ≤ 2) times a fixed-point count on the norm-one torus mod l.
*Checks (sealed):* 14/14 degrees (two of the 14, (35, 3) and (9, 51), are OPEN-class items with no real-count prediction) and 12/12 sealed
real counts as predicted, but only 5 items are exact (integer polynomial, irreducible, Sturm count): (5, 9), (17, 3), (23, 69), (9, 13),
(9, 51); the other 9 are float separation tests, not certificates. One null FAILED: at (5, 9) the "wrong" line was the conjugate line with
the same product (a design error of the null).
*Credit.* The degree mechanism is the Gee–Stevenhagen orbit/stabiliser criterion (as quoted by Kontogeorgis [Ko], Thm 1); the real count
extends Chavan's level-1 rule [Ch, Prop 2.3]. We found no source that gives these formulas for the level-l theta pieces. Corollary-level.

### 5.9 Even levels: the Göllnitz–Gordon and cubic continued fractions (U-GG, U-CF; PROOF DRAFT, one referee round, CORRECT WITH FIXES, fixes applied)
Let H(q) = q^{1/2} (q;q^8)_∞(q^7;q^8)_∞ / ((q^3;q^8)_∞(q^5;q^8)_∞) (the Göllnitz–Gordon continued fraction) and
G(q) = q^{1/3} (q;q^2)_∞ / (q^3;q^6)_∞^3 (Ramanujan's cubic continued fraction). Write O = Z[√−m], h = h(−4m), and w_3(n) = |(O/3O)^×| for
O = Z[√−n].

**Theorem U-GG.** For m ≥ 2, z = H(e^{−π√m}) generates an abelian extension of Q iff m is odd and 4m is idoneal, i.e. iff m ∈ {3, 7, 15}.
Moreover [Q(z) : Q] = 8h(−4m) for every m ≥ 2. [unconditional: the list follows from Grube's theorem, Kani Thm 12(c), not from Euler's
list; no GRH]

**Theorem U-CF.** For n ≥ 2, z = G(e^{−π√n}) generates an abelian extension of Q iff n is even and 9n is idoneal, i.e. iff n ∈ {2, 8}.
Moreover [Q(z) : Q] = h(−4n)w_3(n) for n odd and h(−4n)w_3(n)/2 for n even. [unconditional: Kani Thm 12(a) and Cor 10(a); no GRH]

In words: Ramanujan's two even-level continued fractions are abelian at e^{−π√n} exactly where Weber's j(2√−m), resp. j(3√−n) with n
even, is; their abelian lists are Grube's lists in disguise.

*Proof sketch [S-U].* (1) *Siegel forms.* From the product formula [KSY10, (1.3)], H(z/2) = g_{(1/8,0)}(4z)/g_{(3/8,0)}(4z) and
G(z/2) = g_{(1/6,0)}(3z)/g_{(1/2,0)}(3z); both are holomorphic and non-vanishing on the upper half-plane with rational q-coefficients, and
invariant under Γ(8), resp. Γ(6) (checked by hand from [KSY10] Prop 2.4(iii)). That such a function lies in F_N is standard (Shimura's book,
Prop 6.9; not opened by us). (2) *Exact stabilisers and Hauptmodul.* The images of the stabilisers in SL2(Z/8), resp. SL2(Z/6), are explicit
groups of order 8, resp. 4; a cusp-order computation from [KSY10] 2.4(v) shows that each function has exactly one simple pole and one simple
zero on its modular curve, so it is a Hauptmodul and its stabiliser is exactly that group. The Hauptmodul property itself is known:
Cho–Koo–Park [CKP09, Thm 5, p. 932] for the Göllnitz–Gordon fraction and [CKP10, Thm 4, p. 586] for the cubic fraction; our cusp-order route
is an independent derivation, not a new fact. (3) *The value.* With the Hauptmodul property, j(τ_O) is a rational function of z, so H_O ⊂ K(z);
a principal class acts through [KSY25] Prop 5.1 and fixes z iff its matrix lies in the stabiliser; this gives the degree formulas. (4) *The
abelian criterion.* Under Theorem U, z is abelian iff m is idoneal and every norm-one element arising from the torus and from the ambiguous
classes lies in the stabiliser. A 2-adic lemma (for m odd and y of norm one, the matrix of y lies in the level-8 stabiliser iff its
√−m-coordinate is even) and a 3-adic analogue reduce this to "the Galois action fixes j(2τ_O)", resp. j(3τ_O); the lemma behind that step
(the kernel of Cl(Z + nO) → Cl(O)) is CLASSICAL (Cox §7, not opened by us) and is proved directly on the page. For even m the element
1 + √−m moves z (Göllnitz–Gordon). Weber's criterion (Kani Thm 32) at 4m, resp. 9n, finishes the
Göllnitz–Gordon case. For the cubic fraction the stabiliser is a product of a 3-part and a 2-part: the 3-part condition is "9n idoneal";
the 2-part is automatic for n even and, for n odd, holds iff 4n is idoneal. Since 4n and 9n are both idoneal only for n = 1 (Kani Cor 8 and
Thm 12(a)), for n ≥ 2 the condition is exactly "n even and 9n idoneal" (the two forms differ only at n = 1, where the value is not
abelian, POST HOC below). (5) *Lists.* For odd m, 4 ‖ 4m and Kani
Thm 12(c) leave 4m ∈ {4, 12, 28, 60}, so m ∈ {3, 7, 15} for m ≥ 2. For U-CF, Kani Thm 12(a) leaves n ∈ {1, 2, 5, 8}; n = 5 fails because 20 is
not idoneal (Kani Cor 10(a)); n = 1 is excluded by n ≥ 2. ∎

*Evidence (sealed bar, hashed before the run; one process, one thread).* Göllnitz–Gordon, m = 2..40 and 60: verdicts 40/40 as predicted
(abelian exactly at 3, 7, 15, with groups of Smith form [4, 2], [4, 2], [4, 2, 2]); degree 8h(−4m) at 40/40 (degrees 8 to 48); the decisive
m = 15 is abelian, degree 16, all 16 conjugates real. Cubic continued fraction, n = 2..100: verdicts 99/99 (abelian exactly at 2 and 8,
Smith forms [2] and [2, 2]); degree formula 99/99. Every "not abelian" verdict is backed by a non-real conjugate (Sturm count on the rounded
integer polynomial), exact given a root identity checked to at least 249 digits; rounding errors are at most 10^{−126}; denominators are 1
(Göllnitz–Gordon) and powers of 2 up to 2^{21} (cubic). Controls: the level-7 piece at m = 7 is abelian (degree 3) and at m = 3 is not
(degree 18); Göllnitz–Gordon at m = 7 computed at level 16 agrees with level 8. One null FAILED as a null: told the wrong level 4, the
pipeline returned half the conjugates and the rounding test (which tolerates denominators up to 10^{W/4}) could not detect that the
resulting polynomial was not rational; this is a design error of the null, and the main items do not rest on that test. An AI reviewer
re-derived the cusp-order formula, re-ran the pole count with its own code (orders [0, −1/4, 1/4] with multiplicities [320, 32, 32] over the
384 elements for H; [0, −1/3, 1/6] with [108, 12, 24] over 144 for G) and confirmed the stabilisers numerically.
*External control.* Cho–Koo–Park [CKP10, p. 602] print the minimal polynomial X⁴ − 20X³ + 12X² + 16X − 8 (d_K = −8) of 1/G at n = 8
without discussing whether it is abelian; a prior-art search worker checked at 80 digits that its field is Q(√2, √3) (group V_4, abelian) and that
the n = 4 value has group D_4, in agreement with U-CF and with the degree h·w_3/2.
*POST HOC (numerical, not part of the theorems).* m = 1: H(e^{−π}) = √(4 + 2√2) − 1 − √2 (213 digits), minimal polynomial
x⁴ + 4x³ − 6x² − 4x + 1, group C_4: abelian. n = 1: G(e^{−π}) is a root of 2x⁴ + 8x³ + 2x − 1 with group D_4: not abelian.
*Credit.* Classical or in print: the mechanism (Shimura reciprocity; Weber/Grube via Kani), the kernel lemma, both Hauptmodul statements
[CKP09, CKP10], Γ_1(8)-modularity and degree 4h(−d) for discriminants −d ≡ 1 (mod 8) in Akkarapakam–Morton [AM24, Thm 6.1]. The ray class
field results of [CKP09, Thm 15, p. 946] and [CKP10, Thm 13, p. 597] need (2, a) = 1, resp. (6, a) = 1, and do not reach our points (a = 4).
Not found in print: the abelian-over-Q classifications U-GG and U-CF and the degree formulas at D = −4m. Corollary-level. Guadalupe [Gu26] (abstract and reference list
consulted; full text not available to us) proves that values such as 2^{2/3}C(τ) are units when d_K ≡ 5 (mod 8) and constructs ray class
fields modulo 2 over K from C³(τ) under conditions on τ; it does not address abelian-over-Q questions (and our abelian points n = 2, 8 have
d_K = −8, outside its unit theorem). The body is unread, so a small residual risk remains. The companion paper of Akkarapakam–Morton on the cubic continued
fraction [AM24c, Thm 1.1] shows that its values at their arguments generate ring class fields over Q, without an abelian classification. Real-conjugate
counts are not derived.

---

## 6. A Stark dictionary for the p.206 pieces (p ≡ 7 mod 8; PROOF DRAFTS, one referee round each; corollary-level)

Every item below is a PROOF DRAFT; two referee rounds (one for D1, D1′, D2, D4; one for D5) returned CORRECT or CORRECT WITH FIXES, fixes
applied. The mechanism is CLASSICAL. All items are [unconditional]: they use Stark's theorem for imaginary quadratic fields, which is
proved, and no GRH.

*Setting.* p ≡ 7 (mod 8), K = Q(√−p), L = Q(ζ_p), 𝔮 = √−p·O_K, 2O_K = 𝔓𝔓̄. The field M = H_O(ζ_p) of §2 is the ray class field K(𝔮) of K
modulo 𝔮, and L ⊂ K(𝔮) (one line each). Characters X of Gal(L/K) correspond to even Dirichlet characters χ mod p, and
L_{S0}(s, X) = L(s, χ)L(s, χψ) for S0 = {∞, 𝔮} (CLASSICAL). Over an imaginary quadratic base the rank-one Stark conjecture is a theorem:
Stark [St80], Theorem 2 (p. 199), proved in his Section 5 (pp. 222–227). We also use its modern statement by Ferrara [Fe], Thm 2.11, with the
uniqueness in his Rem 2.2(3).

- **D1 (the norm).** Let N = N_{F_p/Q(ζ_p)^+}(b_1) and ε := σ_2(N). For every character X of Gal(L/K),
  L′_S(0, X) = −(1/2p) Σ_σ X(σ) log|σ(ε)|², S = {∞, 𝔮, 𝔓}. So ε is, up to a root of unity, the rank-one Stark unit of L/K for this S
  (D1′, via [St80] Thm 2 and [Fe] Thm 2.11). *Proof:* Theorem V3C (§4.5) plus Lerch's formula L′(0, χ) = −C_χ/2 (from [DLMF] 25.11.18,
  25.15.3, 5.5.3; checked against L-function values to 1.5·10^{−76}) and the Euler factor (1 − χ(2)) at 𝔓. *Scope:* this is a statement
  about σ_2 of the norm of b_1; it is a statement about b_1 itself only at p = 7, where h = 1. Novelty credit belongs to V3C: Kubert–Lang
  Thm 4.2 [KL] plus V3C Corollary 1 nearly give D1.
- **D2 (Robert form).** σ_2(N)^6 = ζ·E(J)/σ_2^{−1}(E(J)) with E(J) a product of Robert's units θ(1, 𝔮𝔠^{−1})^p over J = Gal(M/L)
  ([Fe] Def 2.10). Sealed at p = 7 only (J trivial); the referee's check at p = 23 is POST HOC.
- **D3** is the index theorem C8 (§4.5; PROVED (AI-refereed)). **D4:** Stark's abelian condition holds (via [Fe] Thm 2.11); its p-part is
  witnessed explicitly by the w_k of Theorem V3.
- **D5 (b_1 itself; every p ≡ 7 mod 8).** For each embedding σ,
  12 log|σ(b_1)| = p[G(C_1) + G(C_2) − 2G(C_3)] − p·Dd(𝔟),  G(C) := log|θ(1; 𝔮C^{−1})|,
  where C_3 is the ray class attached to σ, C_1 = C_3𝔓̄, C_2 = C_3𝔓, and Dd(𝔟) = log|2^{12}Δ(𝔟𝔓)Δ(𝔟𝔓̄)/Δ(𝔟)²| (𝔟 the ideal class part of
  σ): b_1 is three conductor-𝔮 Robert units times a Δ-quotient from the Hilbert class field H_K. Character by character, for X = ρ ⊗ χ on
  Gal(M/K): (i) if χ ≠ 1, Σ_σ X(σ) log|σ(b_1)|² = −p[X(Fr_𝔓)(1 − X(Fr_𝔓̄)) + X(Fr_𝔓̄)(1 − X(Fr_𝔓))]·L′(0, X) (L of conductor 𝔮); (ii) if
  χ = 1 and ρ ≠ 1, the sum is 2pm(ρ(𝔓) + ρ(𝔓̄) − 2)·L′_K(0, ρ) = −2pm·L′_S(0, ρ) with S = {∞, 𝔓, 𝔓̄}. *Proof route:* the V3C steps applied
  to one Galois element at a time, Kronecker's first limit formula ([St80], eq. (8), p. 206), [Fe] Thm 2.8 with the character χ(σ) inserted
  (see the Fairness note, §1.4), and Hecke's functional equation. The result does not depend on the direction of the Artin map (b_1 is real).
- **Consequences.** (a) *For p ≥ 23 (so h(−p) > 1), b_1 is not a Stark unit of M/K for any S:* S must contain the ramified prime 𝔮,
  ρ(𝔮) = 1 kills every χ = 1 component of any Stark unit of M/K, and the χ = 1 components of b_1 with ρ ≠ 1 are non-zero (checked at
  p = 23, 31, 47). The argument needs class-group characters ρ ≠ 1, which exist only when h(−p) > 1. *At p = 7* (h = 1) there are none:
  M = L = Q(ζ_7), b_1 = N, and by D1 σ_2(b_1) is the Stark unit of M/K for S = {∞, 𝔮, 𝔓}; so at p = 7 a Galois conjugate of b_1 is a
  Stark unit. (b) Since the χ = 1 part of b_1 is its norm to H_K, a
  power of P_p = 2^m/𝔣(√−p)^{p−1} (§2.3), (ii) says that 2/𝔣(√−p)² is, up to ±1, the Stark unit of H_K/K for S = {∞, 𝔓, 𝔓̄}.
  **This half is not new.** Stark [St80] treats the conductor f = (2) explicitly (p. 227; the eta-quotient value is eq. (49), p. 226), removes
  the Euler factors at the primes dividing f (p. 198), and identifies his eta quotient at ω = (1 + √−p)/2 with the Schläfli–Weber function at
  √−p (p. 218); when 2 splits this is exactly S = {∞, 𝔓, 𝔓̄}. The same unit appears in Hajir–Rodriguez Villegas [HRV], Thm 25 with Lemma 23
  and Thm 28 / Table 5 (for d_0 ≡ 7 mod 8, 𝔣(√−d_0)/√2 is the unit attached to the prime above 2). Joining these to our statement takes a few
  lines of bookkeeping (written out by our prior-art worker and not yet checked by a second reviewer); we cite both sources for it.

*Evidence.* Sealed test at p = 7, 23: 70/70 as predicted, agreement ≤ 10^{−151}, six nulls fail; but only 10 of the 70 items test content
beyond V3C, and the nulls test conventions (a missing χ(2), a factor 2, complex conjugation), not content (as the referee noted). Sealed test
at p = 23 for b_1 itself: 12/12 verdict lines as predicted; D5 at all 33 embeddings and its Robert form at 11 (≤ 10^{−130}); (i) on 20
characters and (ii) on 2 characters (≤ 10^{−131}); content nulls (wrong ideal class, wrong level, ū = u, Δ term dropped) and the old guess
"σ_2(b_1) is a Stark unit of M/K" fail on every item (the guess by ≥ 100 on all 22 characters with ρ ≠ 1). Referee checks at p = 31 and 47
(POST HOC, unsealed) and an independent re-implementation at 23 and 31 agree.

*What is open in print, as far as searched.* We found no source that writes the p.206 pieces as Stark units character by character, and none
for the b_1 decomposition D5 or for the negative statement (a) at p ≥ 23; Stark 1980 itself contains neither (no Ramanujan-type theta quotient, no unit
shown to be non-Stark, no decomposition of such a unit into elliptic units). Ceiling: a corollary-level dictionary. OPEN: p ≢ 7 (mod 8) (there
b_1 is not a unit, but the ratios b_j/b_k are, by C9) and the other families.

---

## 7. Methods and certification

### 7.1 Evaluating the pieces
Theta series θ[k/p](i√p), truncated with a rigorous Gaussian tail bound (every omitted term below 10^{−(prec+40)}); an independent program
used the Jacobi triple product. Implementation A used mpmath (PSLQ) for p = 11, 13 and PARI/GP for the sweep; implementation B used
PARI/GP from a written specification without seeing A's code or results.

### 7.2 Integer relations (lattice reduction)
- Precision rule (learned): working precision must exceed about 2 × (basis size) × (coefficient digits). With 45 × basis size, p = 47 and 67
  first gave chance-level relations; sealed amendments raised W to 90 × and then 160 × basis size. A sharper acceptance criterion, suggested
  by the p = 67 and 79 negative controls (7,193 and 24,944 digits held, each right at basis size × coefficient digits), is that a genuine
  relation must clearly exceed that product, not merely a fixed fraction of W.
- Galois transport: one relation for b_1 and explicit Galois images for the rest; validated against brute force at 29 and 31.
- Instrument faults found and logged: mpmath PSLQ's default iteration cap silently returns "no relation" (an early run missed even P^{11};
  all p = 11/13 "not found" verdicts from that run were voided); a float literal at 38-digit default precision produced a spurious relation
  in a side test (voided, rerun).

### 7.3 Exact minimal polynomials from analytic conjugates (fast method)
Described in §3.3 (Method B) and §5.3 (steps A–B). It needs no lattice search: the conjugates come from [KSY25] Prop 4.1, and integrality
(C3a) plus monicity make rounding a check rather than a fit. The wrong composition convention is run as a negative control every time.

### 7.4 The fast method is a theorem; ball-arithmetic certificates (C10; PROVED (AI-refereed); [unconditional])
**Theorem M (p ≥ 5).** For each reduced primitive form of discriminant −4p (replaced by a properly equivalent form with odd first
coefficient a when needed) put x_Q = −a′b/2 (aa′ ≡ 1 mod 4p) and t_Q = (b + 2i√p)/(2a). The h(p−1)/2 values B_k(t_Q + x_Q) correspond
bijectively to the embeddings of F_p, each equal to the image of b_1. Hence Π(x − v) = G_p^l with l = [F_p : Q(b_1)], and the values are
pairwise distinct iff l = 1, i.e. Q(b_1) = F_p. A lemma shows that the twist in [KSY25] Prop 4.1 acts on B_k as the translation by x_Q in
either composition order. Theorem M specialises the mechanism of [KSY25] Thm 7.5 (the general adelic framework of [KSY26], Thm 10.1, does not specialise to
theta pieces by itself); the identification of l is new here (not found in print at our search floor). Referee: ACCEPTED
WITH FIXES (fixes applied; no certified run depended on the corrected statements).

**Ball-arithmetic certificates (sealed; HOLD).** Each conjugate is computed as an Arb ball (python-flint 0.9.0), with theta tails bounded on
paper; a coefficient is accepted only when its ball contains exactly one integer. Results: G_p is certified at every prime 5 ≤ p ≤ 97 (23
polynomials). The first sealed run certified the 19 floating-point polynomials then on disk plus the cubic at p = 7, identical digit for
digit to them (§3.3, §5.3; coefficient radii ≤ 10^{−15}; the largest, p = 89, degree 528, 12,456-digit coefficients, in 584 s). The three
primes 47, 61, 67 had lattice tables but no minimal polynomial; an editor caught their absence, and a second sealed run (seal 7372a46a…, same
unchanged script) certified them: degrees 115, 180, 99 as predicted, constant terms −1, −2^{5490}, −2^{2211} as C3 predicts, every
coefficient ball holding exactly one integer, all conjugates provably distinct; its positive control (p = 53) reproduced the stored
certificate byte for byte; 19.7 s in all. All conjugate balls are pairwise disjoint, so **Q(b_1) = F_p is PROVED (AI-refereed) at every
prime 5 ≤ p ≤ 97**. The wrong reading of the twist is certified non-integral wherever it differs. One instrument fault
(p = 37: a comparison script glued two copies of the same polynomial) is logged; each copy matches. This also makes the constant terms of
Table 3 (powers of 2 matching C3) exact. [rests on the correctness of Arb and FLINT]

### 7.5 Instrument note: numerical conjugate counting
Our older conjugate-counting scripts merged numerical conjugates with a fixed tolerance. At large m distinct conjugates can agree to 50
digits, so counts came out too small without warning (found at (11, 1365)). A precision-tied routine that refuses to answer when clusters
are not cleanly separated replaces it. Counts protected by an exact integer polynomial are unaffected (the C5 table, the C6 and C7 runs, the
even-level run, and every count quoted in §5); numeric-only counts from the old scripts are held back until re-run (§5.7).

### 7.6 Side observations (not claims)
- *The abelian test.* For a real CM value z = f(τ_O) of a modular function with rational coefficients, z generates an abelian extension of
  Q iff every Q-conjugate of z is real. This is elementary once K_{O,N}/Q is known to be generalised dihedral ([KSY25] Lemma 7.3); it is
  folklore-level and we do not claim it. In an early sealed test (127 values, 0 mismatches) it reproduced "R abelian only at n = 1" for
  n ≤ 60 and "cubic continued fraction abelian only at n = 2, 8" for n ≤ 60, both now proved for all n (§5.6, §5.9). Our sealed guess
  {1, 2, 5, 8} for the cubic continued fraction FAILED (1 and 5 are not abelian); U-CF explains why (n must be even and 9n idoneal).
- *Rational conformal field theory.* The Galois rule C2 has the shape of the Galois symmetry of modular data in rational conformal field
  theory: the T-eigenvalues e^{πik²/p} are permuted as k ↦ xk with x² ≡ ±a, as in Harvey–Hu–Wu, eq. (33) [HHW]; all 141 recorded Galois
  images at p = 29–67 obey this. For SU(2)_3 at τ = i, χ_1/χ_0 is algebraic of degree 16, and three of its conjugates are again character
  ratios at the same point (2,000 digits; a non-CM control gives no relation). Ramanujan's septic terms are monomials in SU(2)_5 quantum
  dimensions; that is forced by unit theory in Q(cos 2π/7) and is a rewriting, not a discovery. Experts may regard all of this as a
  consequence of Shimura reciprocity.
- *Negative findings.* No Gross–Zagier-type smallness: N(b_1 − b_k) carries a large extra prime (e.g. 5,901,083,011 at p = 11). The
  coefficients in the cosine tables are essentially forced by the size of the largest conjugate of b_1; a reduced basis does not shrink them
  by more than a digit or two.

### 7.7 Status and conditions of every result

| item | status | conditions |
|---|---|---|
| I_p; product P_p = 2^m 𝔣^{1−p}; Q(P_p) = J | CLASSICAL | — |
| C1, C2, C3a–c; monotonicity; Prop D; C4 (abelian form) | PROVED (AI-refereed) | unconditional; [KSY25] Props 4.1, 5.1 proofs unopened |
| C4 list {3, 5, 7, 13, 37} | PROVED (AI-refereed) | unconditional (published class-number-1 and -2 lists; Heegner–Baker–Stark proofs unopened) |
| C5 for E, and for b_1 at idoneal n; list {3, 5, 7, 9, 13, 25, 37} | PROVED (AI-refereed) | unconditional (Grube) |
| V3 (w-units in F_p); V3C L-value identity; Corollaries 1–2; C8 | PROVED (AI-refereed) | unconditional |
| C6 (Theorem W); C7 (Theorem R) | PROVED (AI-refereed) | unconditional; C6 explicit lists [Euler-list] |
| Theorem G (case (D) via the repair, two referees); Theorem U frame | PROVED (AI-refereed) | criterion unconditional; explicit lists [Euler-list] |
| C9 valuation law; C10 Theorem M; Q(b_1) = F_p for 5 ≤ p ≤ 97 | PROVED (AI-refereed) | unconditional; C10 certificates rest on Arb/FLINT |
| Sine forms at 5, 7, 13, 37; certified G_p, 5 ≤ p ≤ 97 | RIGOROUS (ball arithmetic) | Arb/FLINT; Theorem M |
| Non-abelian certificates at composite n (§5.4) | CERTIFIED numerics | — |
| Theorem S-A (prime l; all-inert composite l; l = p^e \| m) | PROOF DRAFT (one round, CORRECT WITH FIXES / CORRECT) | unconditional |
| Q(b_1) = E for prime powers n ≥ 25 (repair by-product) | PROOF DRAFT (refereed with the repair) | unconditional |
| C7 real-conjugate count r(n)\|Cl(O)[2]\| | PROOF DRAFT (one round, CORRECT) | unconditional; Cox Cor 7.17, Lemma 7.14 unopened |
| C9 corrected residue-degree law and lists | PROOF DRAFT (one round, CORRECT WITH FIXES) | unconditional |
| C9 residue degrees as first stated (f_M = lcm(2, ord_p 2)) | REFUTED (p = 23, 31, 47) | — |
| U-GG, U-CF (classifications and degree formulas) | PROOF DRAFT (one round, CORRECT WITH FIXES) | unconditional (Grube); Shimura Prop 6.9 and Cox §7 unopened |
| Stark dictionary D1, D1′, D2, D4, D5 and consequences (consequence (a) for p ≥ 23) | PROOF DRAFT (one round each) | unconditional (Stark's theorem) |
| Cosine tables at 11, 13 (and every prime 17 ≤ p ≤ 79 except 59, 71); quintic over Q(P_11); e_j ∈ Z[√13]; Q(b_1) = E at other composites | NUMERICAL | — |
| Converse of the w-unit criterion; P_p = ε_J^{±(p−1)}; mixed-index pattern | NUMERICAL / OBSERVED | — |
| Full unit indices of F_23, F_31 | NOT CLAIMED | GRH |
| "Cosine forms iff n idoneal" (composites) | REFUTED | — |
| Q(b_1) = F_p for p > 97; conceptual proof of the sine forms; S-A for composite l split or dividing m; C9 counts for p ≡ 5 (mod 8) and p ≡ 1 (mod 8) with ord_p 2 even; Stark dictionary for p ≢ 7 (mod 8) and other families; U at m = 1, n = 1 | OPEN | — |
| Theorem G sealed counts at 110 + 17 items without an exact layer | held back | old fixed-tolerance instrument; re-run pending |

**GRH audit.** No result above rests on the generalised Riemann hypothesis. GRH enters only through PARI's `bnfinit` in a superseded
exploratory search and in the full-unit-group indices at p = 23, 31 (§4.5), which are NOT CLAIMED. C8 and the unit identities use analytic
conjugates and exact integer algebra only.

---

## 8. Open problems
1. **Expert reading.** Every "PROVED" here is AI-refereed only; C7, C8, C9 (valuation) and C10 had one review round each, and every
   PROOF DRAFT one round. Theorem G is the cautionary case: three review rounds accepted it, and a gap in case (D) was found only by a later
   AI worker that used it.
2. **Generation by b_1.** Is Q(b_1) = F_p for every prime p? PROVED (AI-refereed) for every prime p ≤ 97 (C10, prime by prime); open in general (a
   separation lemma for all p is missing). The composite analogue Q(b_1) = E is open for non-prime-power n.
3. **The strong form.** A conceptual proof of the sine identities at 5, 7, 13, 37 (cyclotomic-unit index in Q(ζ_{4p})^+, Sinnott) is open.
   Extend the sine forms to n = 9 and 25 (Q(ζ_36)^+, Q(ζ_100)^+) and to the abelian cases of Theorems G, U-GG and U-CF.
4. **Tables for p > 100** (fast method; the sweep below 100 is complete).
5. **A closed form for the coefficients** of the tables at non-cyclotomic primes (p = 11, 17, 19, …), e.g. a canonical "sine part times
   Weber part" factorisation; none was found at 11.
6. **Units** (§4.5): the mixed part of the unit index in F_p (the pattern p·Π(2 + χ(2)) at 23, 31), unconditional indices at 23, 31, and
   whether C′ is the full group of cyclotomic units.
7. **Other Hauptmoduln.** The C7 and U arguments should cover any function with rational coefficients that separates the points of its
   curve (e.g. Hauptmoduln of Γ(3), Γ(4), and R at other CM points); this is a prediction, untested.
8. **Beyond Theorem G.** The degree and real-count formulas for composite l with a prime split in K or dividing m (outside l = p^e | m); a
   second referee round on Theorem S-A; even m for the frozen-level pieces (e.g. Berndt–Rebák's cubic n = 2, 8); the real-conjugate count in
   C6 (Theorem S-A at l = 3, 5 may cover the B-family; not yet compared); real-conjugate counts for U-GG and U-CF; the cases m = 1, n = 1.
9. **Stark dictionary** (§6): p ≢ 7 (mod 8), where b_1 is not a unit but the ratios b_j/b_k are; the other families (C5, C6, C7, Theorem G,
   U-GG, U-CF).
10. **Residue degrees above 2** (§4.4): exact counts for p ≡ 5 (mod 8) and for p ≡ 1 (mod 8) with ord_p 2 even; a test of the [3, r] branch
    at the level of F_p.

---

## Prior art

The pieces u_k are Ramanujan's prime-dissection radicands for φ. As modular functions they were treated for every prime p ≥ 5 by Gallouin
[Ga], who showed that they generate a cyclic extension of C(X(Γ_0(4p) ∩ Γ^0(2))) with group (Z/p)^×/{±1} (his Thm 6.1), gave their
Siegel-function form (Prop 10.1), and noted that statements at particular singular values need separate arguments (§15); the dissection
identity itself is his Prop 4.1 and a lemma of Kim–Rebák [KR]. Our results concern exactly those values, at τ = i√p and its level-l
analogues: the arithmetic field, the Galois law over Q, integrality, the idoneal and abelian criteria, Stark units and the even levels.
Using Weber's criterion [Ka, Thm 32] and the explicit reciprocity of Koo–Shin–Yoon ([KSY25]; their general framework [KSY26] is a tool, with
no theta functions, Ramanujan pieces or abelian-over-Q statements), we found none of these in print. Partial predecessors are named where
they apply: Kubert–Lang [KL] for the unit identities and C8; Stark [St80] and Hajir–Rodriguez Villegas [HRV] for the Hilbert-class-field half
of the Stark dictionary; Gee–Stevenhagen (via [Ko]) and Chavan [Ch] for the shape mechanism; Cho–Koo–Park [CKP09, CKP10] and
Akkarapakam–Morton [AM24, AM24c] for the even-level continued fractions. Over K, Guadalupe [Bull. Iranian Math. Soc. 52 (2026),
art. 24] ([Gu26]; abstract and reference list consulted; full text not available to us) constructs ray class fields modulo 2 from C³(τ) and
proves unit statements for d_K ≡ 5 (mod 8); it does not address abelian-over-Q questions, and none of its 22 references concerns idoneal
numbers or Galois groups over Q. Jha [Jha] studies Rogers–Ramanujan singular values at D = −5n (fields over K and fixed fields
of complex conjugation in the Hilbert class field, his Thm 3.4); he states no criterion for being abelian over Q and does not mention
idoneal numbers. Gallouin's further Zenodo records
(10.5281/zenodo.22295157, 22309469; September 2026) treat cusp specialisations and auxiliary equations, and [Ga11] (10.5281/zenodo.22307759)
treats the p = 11 radicands as a dihedral quintic structure at the level of functions (§3.1); none of them treats CM values. One earlier
source, Srivastava, Gupta, Qureshi and Baboo, RACSAM 119 (2025), art. 120 (doi 10.1007/s13398-025-01785-2), on evaluations of series in
e^{−pπ(qn+r)²}, was seen at abstract level only and could not be ruled out.

Coverage of the release search (October 2026): Zenodo (metadata search; records to 30 October 2026), arXiv (abstract search; newest
27 October 2026), Semantic Scholar and OpenAlex citation trails of the nearest papers, and full-text reads of the closest sources. Zenodo
indexes metadata rather than PDF text, and the arXiv search covers abstracts only. **This is a search floor, not a clearance.**

---

## References
Only sources that we, or an AI worker acting for us, opened are listed; the locators are those recorded when they were opened. Sources named in
the text as "not opened" are not listed.

- [AB] Andrews, Berndt, *Ramanujan's Lost Notebook, Part II* (2009), §8.3 "Septic identities", pp. 180–194. Contents page opened; the entry
  is cited as reproduced in [R23].
- [AM24c] Akkarapakam, Morton, "On Ramanujan's cubic continued fraction", Ramanujan J. 65 (2024) 1709–1756, doi
  10.1007/s11139-024-00957-9; arXiv:2311.06591. Opened (arXiv version): Thm 1.1.
- [AM24] Akkarapakam, Morton, "Periodic points of algebraic functions related to a continued fraction of Ramanujan", New York J. Math. 30
  (2024) 783–827. Opened: Thm 6.1 (pp. 801–802).
- [Be] Bengoechea, J. Théor. Nombres Bordeaux 28 (2016) 347–360, doi 10.5802/jtnb.943; arXiv:1409.7214. Opened (TeX): Galois action on theta values via Shimura reciprocity.
- [BR] Berndt, Rebák, Ramanujan J. 66(4), art. 66 (2025); arXiv:2312.15513. Opened (arXiv HTML): (1.4), (1.6), Thm 1.3 eqs. (1.12)–(1.13),
  Thm 2.1, Thm 4.2, Cor 3.9, closing paragraph.
- [Ca] Campbell, arXiv:2610.00551 (2026). Opened (TeX): level-11 Ramanujan–Sato coefficient formula.
- [CKP09] Cho, Koo, Park, "Arithmetic of the Ramanujan–Göllnitz–Gordon continued fraction", J. Number Theory 129 (2009) 922–947. Opened:
  Thm 5 (p. 932), p. 933, Thm 15 (p. 946).
- [CKP10] Cho, Koo, Park, "On Ramanujan's cubic continued fraction as a modular function", Tohoku Math. J. 62 (2010) 579–603. Opened: Thm 4
  (p. 586), Thm 13 (p. 597), Lemma 15 (p. 598), table (p. 602).
- [Ch] Chavan, "On discriminants of minimal polynomials of the Ramanujan t_n class invariants", arXiv:2210.00681v1. Opened: Prop 2.3 (p. 5),
  §5 (p. 7).
- [De] Deuring, *Class Fields of Complex Multiplication*, English translation by C. Chin, arXiv:2006.04531v1. Opened: §1 eq. (9); §3 eq. (15);
  §8; §13 eqs. (36)–(39); §22 (pp. 41–42), divisor theorem, "essentially in Hasse, Monatsh. f. Math. 38 (1931) p. 331".
- [DLMF] NIST Digital Library of Mathematical Functions, 25.11.18, 25.15.3, 5.5.3 (Lerch's formula).
- [Du] Duke, "Continued fractions and modular functions", Bull. Amer. Math. Soc. 42 (2005). Author text opened: Thm 1 (radical criterion),
  Hauptmodul property of r for Γ(5).
- [EKS] Eum, Koo, Shin, arXiv:1207.1609. Opened: Example 4.3 (an alternative Siegel form of the pieces).
- [Fe] Ferrara, Acta Arith. 193 (2020), doi 10.4064/aa190212-15-8; arXiv:1904.10561v2. Opened (arXiv v2 only; journal version not
  checked): §2.1, Rem 2.2(3), Def 2.6, Prop 2.7(ii), Thm 2.8 (pp. 6–7; see §1.4), Def 2.10, Thm 2.11.
- [Ga] Gallouin, "A Galois–Siegel framework for three prime dissections of Ramanujan", Zenodo, doi 10.5281/zenodo.22285880 (v2,
  September 2026). Opened: Prop 4.1 (p. 5), Prop 5.2 (p. 6), Thm 6.1, Prop 10.1 (10.3) (p. 11), §15 (p. 16), §17.
- [Ga11] Gallouin, "Ramanujan's level-11 quintic branch: a dihedral Kummer-line map and a cyclotomic phase ideal", Zenodo, doi
  10.5281/zenodo.22307759 (September 2026). Opened: abstract and statement that no CM interpretation is needed.
- [Jha] Jha, "Cyclic Kronecker Fourier transforms, Weber norms, and Rogers–Ramanujan singular values", arXiv:2610.18910 (2026). Opened
  (arXiv HTML full text): Thm 3.4 (§3), Lemma 4.1, Prop 4.2, Rem 4.4 (§4), §§5–8 examples (D = −155, −95, −895, −3295, −8495).
- [GH] Gee, Honsbeek, "Singular values of the Rogers–Ramanujan continued fraction", KdVI preprint 1999 (UvA DARE hdl 11245/1.418851).
  Opened: p. 3; Thm 2.4 p. 6; (3.1)–(3.4) p. 7; Lemma 4.1 p. 9; Table 1.
- [HHW] Harvey, Hu, Wu, arXiv:1912.11955. Opened (first part): eq. (33).
- [HRV] Hajir, Rodriguez Villegas, "Explicit elliptic units I", Duke Math. J. 90 (1997) 495–521. Author copy opened: Def 22, Lemma 23
  (pp. 514–515), Thm 25 (p. 516), Thm 28 and Table 5 (p. 518).
- [Ka] Kani, "Idoneal numbers and some generalizations", Ann. Sci. Math. Québec 35 (2011) 197–227. Opened: Thm 1, Thm 3, Thm 6 / Rem 7,
  Cor 8, Cor 10, Thm 12 (Grube), Rem 13(b), Cor 23 and Rem 24, Thm 32 (Weber) with its proof.
- [KL] Kubert, Lang, "Modular units inside cyclotomic units", Bull. Soc. Math. France 107 (1979) 161–178. Opened (scan): p. 162 (setting
  K = Q(√−p), H = K(μ_p), Thm 1.1), Thm 4.2 p. 168.
- [Ko] Kontogeorgis, "Constructing class invariants", arXiv:1203.4902v1. Opened: Thm 1 (p. 2), quoting Gee–Stevenhagen.
- [KR] Kim, Rebák, arXiv:2506.01181 (2025). Opened (arXiv HTML and TeX): Thm 2.1(ii); the dissection lemma for every odd n; conclusion.
- [KSY10] Koo, Shin, Yoon, arXiv:1008.0473v2. Opened: (1.3); Props 2.1, 2.2(i)–(iii), 2.4(ii),(iii),(v), 2.6(i)–(ii), 3.1(i), 4.3, 4.7.
- [KSY26] Koo, Shin, Yoon, "Adelic framed form class groups and explicit class field theory", arXiv:2608.04873v2. Opened (full
  text): Thm 10.1 (p. 25).
- [KSY25] Koo, Shin, Yoon, "A simplified algorithmic realization of Galois actions on special values of modular functions",
  arXiv:2506.14139v1 (2025). Opened: §§2–4, Prop 3.1, Rem 3.2(i),(ii), Prop 4.1, Prop 5.1, Rem 5.2(i),(iii), Thm 6.2, Lemma 7.1, Lemma 7.3,
  Thm 7.5, Rem 7.6, Example 8.1.
- [LMFDB] The LMFDB Collaboration, number fields of degree 2, signature [0,1], class number 2 (18 fields; completeness statement on the
  page).
- [R23] Rebák, Ramanujan J. 60(4) (2023) 885–911; arXiv:2112.11884. Opened (arXiv HTML/TeX).
- [Sh] Sharifi, *Iwasawa theory* lecture notes, ch. 4. Opened: Prop 4.2.13, Thm 4.2.14, Lemmas 4.2.16–17, Thm 4.2.20, Thm 4.3.3 (definition
  of the Hasse units only).
- [Sh2] Sharifi, *Algebraic number theory* lecture notes, ch. 3. Opened: Prop 3.1.21.
- [St80] Stark, "L-functions at s = 1. IV. First derivatives at s = 0", Adv. Math. 35 (1980) 197–235. Opened (full scan): Conjecture 1
  (p. 198), Theorem 1(ii) (p. 198), Theorem 2 (p. 199), eq. (8) (p. 206), eq. (11) (p. 207), Lemma 2 (p. 212), p. 218, Section 5 (pp. 222–227,
  incl. eq. (49) p. 226 and the case f = (2) p. 227), p. 228.
- [Wiki] Wikipedia articles "Weber modular function", "Dedekind eta function", "Jacobi triple product", "Quadratic field". Opened
  (definitions and transformation laws only).
- [YZ] Yui, Zagier, Math. Comp. 66 (1997) 1645–1662 (MPI preprint 94-35). Preprint opened: 2-adic facts on Weber's function.

Consulted at abstract level only (named as neighbours, not used as support):
- [Gu25] Guadalupe, "Modularity of certain products of the Rogers–Ramanujan continued fraction", Ramanujan J. 68(2) (2025), art. 56,
  doi 10.1007/s11139-025-01221-4. Abstract only.
- [Gu26] Guadalupe, "Remarks on the values of the cubic continued fraction", Bull. Iranian Math. Soc. 52 (2026), art. 24, doi
  10.1007/s41980-026-01042-1. Abstract and reference list consulted; full text not available to us.

---

## Appendix A. Verification protocol
- **Sealed bars.** Every prediction was written down and hashed (SHA-256) before its run, and every amendment was hashed before the data it
  covers. Failures are kept as FAILED: the septic "exponent p/2" shape failed at p = 11; the composite idoneal prediction failed (R1); the
  cubic continued fraction guess {1, 2, 5, 8} failed; the first literal residue-degree law failed (C9); several nulls failed as nulls (C6
  coefficient-action null; Theorem G wrong-convention null; the (5, 9) shape null; the even-level wrong-level null); two items of the
  Theorem G repair bar were invalid set-ups.
- **Two implementations.** Degrees 11, 13 and the sweep 17–37 were each reproduced by a blind second implementation from a written specification.
- **Controls.** Positive: the p = 7 septic terms (to 1,599 digits; reproduced exactly as an algebraic identity by the certificate);
  negative: wrong conductor, wrong twist convention, perturbed coefficients, non-CM points.
- **Referees.** All referees are independent AI reviewers; no human expert has read any proof. C1–C3a: two AI reviewers, three
  rounds (NOT A PROOF ×2 → ACCEPTED WITH FIXES), plus a second reviewer accepting with fixes in round 1. C3c, Prop D, C4: two rounds (ACCEPTED
  WITH FIXES ×2). C5: three rounds (NOT A PROOF ×2 → ACCEPTED WITH FIXES). V3: four rounds; V3C: two rounds (Corollary 2: three). C6: four
  rounds. C7, C8, C9 (valuation), C10: one round each. Theorem G: three rounds, then a gap in case (D) found by a later AI worker; the repair was
  accepted with fixes by two independent referees. Shape statements (Theorem S-A, C7 real count, C9 residue degrees), the even-level laws
  and the Stark dictionary: one round each.
- **Process rules.** Runs are meant to use one thread; one batch of shape-theorem runs used the library's default thread count instead
  (logged; numbers unaffected). Instrument faults are logged, never silently corrected (§7.2, §7.5).
- **Clean room.** A standalone script for the degree-11 and degree-13 identities (Python 3 and mpmath only) passes in a fresh environment
  (1,000 digits; perturbation control 2 digits); its hash is in the bundle.

## Appendix B. Supplementary bundle
The supplementary code-and-data bundle (folder `bundle/`, released with this paper) contains, for every result, the written proof, the
scripts, their outputs, the sealed bars with their hashes, and the referee replies. Its top-level files are:
- `README.md`: what the bundle is, the software (PARI/GP, one thread; Python 3 with mpmath; python-flint 0.9.0 for Arb and FLINT), status
  words and the statement that all proofs were checked by AI reviewers only;
- `STATUS.md`: the status list of every claim (the source of the status words used here);
- `REDACTIONS.md`: every change made to lab files before release (AI-worker names replaced by roles, machine paths made relative, personal
  lines removed), file by file and line by line, with the sha256 of each file before and after;
- `SHA256SUMS`: hashes of the released (redacted) files;
- `CLEANROOM.md`: the rebuild commands, run in a fresh folder, with pass/fail per output.
**Seal hashes.** The sealed bars were hashed before their runs, on the unredacted bytes. Where a sealed file had to be redacted, its
hash no longer matches the released file; `REDACTIONS.md` lists the pre-redaction sha256 of each such file and the exact substitutions,
so a reader can restore the original bytes and check them against the seal. Files that needed no redaction match their seals directly.
Files are grouped by result; each group has a short README stating status, conditions and how to rerun.

| ID | contents |
|---|---|
| [S-T] | Degree 11 and 13: implementations A and B (theta series; triple products), PSLQ outputs, Tables 1–2 sources, the clean-room script and its output |
| [S-SW] | The sweep: sealed bars and amendments, lattice and Galois-transport scripts and outputs (p = 11–79), fast-method script, outputs and the minimal polynomials G_p at p = 59, 71, 73, 79, 83, 89, 97 |
| [S-C13] | Write-up of C1, C2, C3a, C3b (with Lemmas 1–4′), its check scripts and outputs, three referee rounds |
| [S-C4] | Write-up of C3c, Prop D, C4 (with the product lemma and the size bound), checks, two referee rounds |
| [S-CERT] | Sine forms at 5, 7, 13, 37: certificate scripts and outputs; ball-arithmetic re-certification (sealed) |
| [S-C5] | Write-up of C5 (three rounds), the sealed composite run, minimal polynomials G_n |
| [S-V3] | Units: V3 write-up (four rounds), V3C write-up (Kronecker limit formula route), C8 write-up and sealed index test |
| [S-W] | C6: write-up, sealed run (116 values), referee rounds 1–4 |
| [S-R] | C7: write-up, sealed run (219 values), referee round |
| [S-G] | Theorem G and the stabiliser frame: write-up, sealed bars 1–2, outputs, referee rounds 1–3 |
| [S-GD] | The case-(D) repair: write-up, sealed check, diagnosis, two referee replies |
| [S-SA] | Theorem S-A, C7 real count, C9 corrected law: write-up, sealed bar, outputs, the fixed counting routine, referee reply, prior-art reply |
| [S-F] | C9 valuation law: write-up and sealed test |
| [S-M] | C10: Theorem M write-up, ball-arithmetic script, certified G_p at every prime 5 ≤ p ≤ 97 (first run and the sealed run for 47, 61, 67), sealed bars |
| [S-U] | U-GG, U-CF: sealed bar and run, proof write-up and its exact computations, referee reply and scripts, prior-art replies |
| [S-K] | Stark dictionary: write-up, sealed tests at p = 7, 23, scripts and outputs, two referee replies, prior-art replies (incl. the Stark 1980 reading) |

The exact file list and hashes are in `SHA256SUMS` and `REDACTIONS.md`; the rebuild commands are in `CLEANROOM.md`.
