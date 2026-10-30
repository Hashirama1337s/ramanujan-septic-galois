# STRUCTURE — what the p = 11 … 37 tables have in common (structure seat, 2026-10-27)

## In plain words
1. The product P of the pieces is not a new number: it is a power of Weber's classical number at √−p, and the number system it
   generates is exactly the one that classical theory attaches to √−p (its size is the class number h(−4p)).
2. Each eleventh/thirteenth/… power b_k lives in that number system with cosines of 2π/p (or 2π/4p) added. This held at all 8 primes.
3. The pieces are shuffled among themselves by one rule: the symmetry "cos(2π/N) → cos(2πa/N)" sends piece k to piece x·k, where x² ≡ ±a (mod p).
   So one piece determines all the others, and the whole table is really just one row.
4. The odd denominators (53, 43, 258071, …) are bookkeeping. They disappear in a better basis, and every b_k turns out to be an
   algebraic integer whose only prime factors lie over 2. At p ≡ 7 (mod 8) the b_k are units.
5. Rebák-style "products of cosines" exist only when the class number is at most 2. Among odd primes that happens only for p = 3, 5, 7, 13 and 37.
   We found such products at 5, 7, 13 and 37. A numerical search found none at 11, 17, 19, 23, 29 and 31.
6. The big coefficients are mostly forced: their size is set by the largest "mirror image" (conjugate) of b_1. A different basis of small numbers cannot shrink them by more than one or two digits.

Scope: everything below is numerical (PARI/GP, 400–6400 digits) unless labelled otherwise. "Proved" means proved by
standard theory that I cite. Literature labels: OPENED = I read the cited text; ABSTRACT = abstract or listing only;
SNIPPET = search-engine snippet; MEMORY = a standard textbook fact I did not reopen today. Scripts and outputs are in this folder.

Notation. K = Q(√−p), O = Z[√−p] (discriminant −4p), H_O = K(j(√−p)) the ring class field of O, h = h(−4p).
N = p if p ≡ 3 (mod 4), N = 4p if p ≡ 1 (mod 4). L_p = Q(P_p, cos 2π/N).

---

## F1. Q(P_p) = Q(j(√−p)), of degree h(−4p): PROVED-BY-KNOWN-THEORY (identity) + exact field check
**Identity (proved here, three lines).** The Jacobi triple product gives Π_k f(q^{p+2k}, q^{p−2k}) = (q^{2p};q^{2p})^m (−q;q²)_∞/(−q^p;q^{2p})_∞
with m = (p−1)/2, and Σ_{k=1}^{m} k²/p = (p²−1)/24. With q = e^{−π/√p} and 𝔣(−1/τ) = 𝔣(τ), this gives

  **P_p = 2^{(p−1)/2} / 𝔣(√−p)^{p−1}**  (𝔣 = Weber's function).

Numerical check of the identity: 807–814 digits at all 10 primes p = 5 … 37 (a_fields_out.txt).

**Field.** For each p, the minimal polynomial of P_p was found (algdep, 800 digits) and polredabs'd. nfisisom against
polredabs(polclass(−4p)) (the ring class polynomial of O) succeeds at **all 10 primes 5, 7, 11, 13, 17, 19, 23, 29, 31, 37**.
So Q(P_p) ≅ Q(j(√−p)), the real subfield of H_O fixed by the complex conjugation that fixes j(√−p).

| p | p mod 8 | h(−4p) | h(−p) | deg P | polredabs model of Q(P) | disc Q(P) | smallest k with Q(𝔣^k) = Q(P) |
|---|---|---|---|---|---|---|---|
| 7 | 7 | 1 | 1 | 1 | x | 1 | 2 (𝔣 = √2) |
| 11 | 3 | 3 | 1 | 3 | x³−x²+x+1 | −2²·11 | 1 |
| 19 | 3 | 3 | 1 | 3 | x³−2x−2 | −2²·19 | 1 |
| 23 | 7 | 3 | 3 | 3 | x³−x²+1 | −23 | 2 |
| 31 | 7 | 3 | 3 | 3 | x³+x−1 | −31 | 2 |
| 5 | 5 | 2 | – | 2 | x²−x−1 | 5 | 4 |
| 13 | 5 | 2 | – | 2 | x²−x−3 | 13 | 4 |
| 37 | 5 | 2 | – | 2 | x²−x−9 | 37 | 4 |
| 17 | 1 | 4 | – | 4 | x⁴−x³−2x²−x+1 | −2²·17² | 4 |
| 29 | 5 | 6 | – | 6 | x⁶−3x⁵+5x³+2x²−5x+1 | 2⁴·29³ | 4 |

Notes.
- The sweep's probe counted non-primitive forms. Its "h(−4p) = 2" at p = 7 and "4" at p = 11 are not the class numbers, which are 1 and 3.
  The rule deg P = h(−4p) holds with the correct (primitive) class number at all 10 primes.
- h(−4p) = h(−p) when p ≡ 7 (mod 8) and 3h(−p) when p ≡ 3 (mod 8) (2 splits / is inert in K). So for p ≡ 7 (mod 8), Q(P) is the cubic
  inside the Hilbert class field of Q(√−p) (disc −p). For p ≡ 3 (mod 8) it is the ring-class cubic of conductor 2 (disc −4p).
- p ≡ 1 (mod 4): genus theory puts Q(√p) inside Q(P). The BAR-SWEEP assumption that "Q(P_p) contains Q(√p)" therefore holds, and nfisincl confirms it at 13, 17, 29 and 37.
- The minimal k with 𝔣^k ∈ Q(j) follows a mod-8 pattern: 1 (p ≡ 3 mod 8), 2 (p ≡ 7 mod 8), 4 (p ≡ 1 mod 4). Because k always divides p−1, P_p always lies in Q(j).
  This matches Weber's classical class-invariant results, as systematised via Shimura reciprocity by Gee (J. Théor. Nombres Bordeaux 11 (1999) 45–72; ABSTRACT, full text not
  readable here) and Yui–Zagier (Math. Comp. 1997; known via MathWorld's table, see DRAFT). That Q(j(√−p)) has degree h(−4p) and K(j) = H_O is
  Cox, *Primes of the form x²+ny²*, Thm 11.1 (MEMORY).
- Status: the identity is proved. The field statement is exact *given* P's minimal polynomial. That polynomial is numerical (800 digits, coefficients
  ≤ 10^18), and each one was confirmed independently by the field isomorphism with polclass. Observation A of DRAFT is the special case p = 11.

## F2. The field rule: b_k ∈ L_p = (H_O · Q(ζ_N))^+, of degree h(−4p)(p−1)/2. NEW-CONJECTURE (8/8 primes)
The sweep (BAR-SWEEP S1–S3, all HOLD) found integer relations at 11, 13, 17, 19, 23, 29, 31 and 37. By F1, L_p = Q(j(√−p), cos 2π/N).
- Degree check: H_O ∩ Q^ab is the genus field. For p ≡ 3 (mod 4) that is K (h odd), and K ⊂ Q(ζ_p). For p ≡ 1 (mod 4) it is Q(i, √p) ⊂ Q(ζ_{4p}).
  So [H_O(ζ_N):Q] = h(p−1), and its real subfield has degree h(p−1)/2, which equals the sweep's basis size (15, 12, 32, 27, 33, 84, 45, 36). L_p is that
  real subfield.
- Negative control (sweep): the wrong conductor (N ↔ 4p) gives no valid relation at 13, 17, 29 and 37. At 11, 19, 23 and 31 the "relations" found have 60–80-digit
  coefficients, i.e. noise, in place of 3–14-digit ones.
- Not abelian over Q unless h ≤ 2. L_p is a non-abelian class field of K (generalised dihedral over Q), not a cyclotomic field.
- Why it is expected: b_k = u_k^p, and u_k = 2q^{k²/p}(−q^{p+2k};q^{2p})(−q^{p−2k};q^{2p})/(−q^p;q^{2p})² is a quotient of Siegel-type
  functions (characteristic ((p−2k)/2p, 1/2)) with rational q-coefficients. By Shimura reciprocity, CM values of such functions lie in ray class
  fields of K (see Jung–Koo–Shin, Tohoku Math. J. 63 (2011), arXiv:1007.2317, ABSTRACT; Gee 1999, ABSTRACT). The sharp claim is that the field is *only*
  H_O(ζ_N): the ring class field with the cyclotomic field adjoined, far smaller than the ray class field. I have not derived it, so it is labelled a conjecture.
- **Conjecture F2.** For every odd prime p, b_k = u_k(e^{−π/√p})^p ∈ (K(j(√−p), ζ_N))^+, and b_1 generates it over Q(j(√−p)).

## F3. One Galois rule at every prime: σ_a(b_k) = b_{xk}, x² ≡ ε(a)·a (mod p). NEW-CONJECTURE (86/86 automorphisms)
Let σ_a act on Q(cos 2π/N) by cos(2πj/N) ↦ cos(2πaj/N), extended to L_p by fixing P. This is well defined for every a ∈ (Z/N)^×/±1 when p ≡ 3 (mod 4).
When p ≡ 1 (mod 4) it is well defined exactly for (a/p) = +1, since it must fix √p ∈ Q(P). Put ε(a) = (a/p) for p ≡ 3 (mod 4), ε(a) = (−1)^{(a−1)/2} for p ≡ 1 (mod 4).
Then, observed:

  **σ_a(b_k) = b_{±x·k mod p}, where x² ≡ ε(a)·a (mod p).**

(Equivalently σ_a(b_1) = b_k with k² ≡ ±a (mod p). The coordinator reports the same rule from MAP lines in sweep/galois_p29.txt and p31.)
- Evidence (b_galois_out.txt, 400 digits, every image matched to > 300 digits): all automorphisms at every prime. That is 5 + 6 + 8 + 9 + 11 + 14 + 15 + 18 = 86
  automorphisms × all k. The variant k ↦ x⁻¹k fails (discriminating control).
- Negative control: at p = 13 a non-residue a (it moves √13, so it cannot fix P) sends b_1 to none of the b_k (0 hits).
- p = 13 pairing explained: cos(2π/52) ↦ −cos(2π/52) is σ_27 = σ_25 on the real field, so x = 5 with 5² ≡ −1 (mod 13). That gives k ↦ 5k: {1,5}, {2,3}, {4,6}.
  The analogue at every p ≡ 1 (mod 4) is the involution σ_{2p+1}, which pairs k ↔ i·k with i² ≡ −1 (mod p):
  p = 17 (i = 4): {1,4} {2,8} {3,5} {6,7}; p = 29 (i = 12): {1,12} {2,5} {3,7} {4,10} {6,14} {8,9} {11,13};
  p = 37 (i = 6): {1,6} {2,12} {3,18} {4,13} {5,7} {8,11} {9,17} {10,14} {15,16}. (Predicted by the rule. The rule itself was checked for every a.)
  At p ≡ 3 (mod 4) no such sign involution exists.
- Consequences (immediate from F3):
  (i) Gal(L_p/Q(P)) ≅ (Z/p)^×/±1 acts simply transitively on {b_k}. **The whole table is one row**: b_k = σ_{a_k}(b_1) with a_k ≡ ±k² (mod p).
  (ii) The elementary symmetric functions of the b_k lie in Q(P). That is DRAFT's Observation B (in Z[P] at p = 11) and Observation E (Q(√13) at p = 13), now one statement.
  (iii) Shape expected from Shimura reciprocity: a rational idèle x acts on Q(ζ_N) through its norm x², and on the level structure of the theta
  characteristic by k ↦ xk. Not derived here.

## F4. Denominators are an artefact of Z[P]; every b_k is an algebraic integer and a {2}-unit. Denominators: EXPLAINED. Integrality: NEW-CONJECTURE
**Denominators.** d always divides the index [O_{Q(P)} : Z[P]] (a_fields_out.txt):

| p | sweep d | index [O_{Q(P)}:Z[P]] | poldisc(minpoly P) |
|---|---|---|---|
| 19 | 53, 106 | 2^10·19·**53** | −2^22·19^3·53^2 |
| 23 | 43 | 23·**43** | −23^3·43^2 |
| 31 | 258071 = 11·29·809 | **11·29·809**·31 | −11^2·29^2·31^3·809^2 |
| 29 | 173304, 346608 = 2^3(·2)·3^2·29·83 | 2^115·3^6·29^7·83^2·9661^2·125777 (from poldisc/nfdisc) | 2^234·3^12·29^17·83^4·9661^4·125777^2 |

(At p = 29 the sweep basis is P^i with i < 3 over Q(cos 2π/116), a relative basis, so only part of the index shows up in d. Rule: d divides the index at all four primes.)

In the basis (integral basis w_l of the polredabs model) × (1, 2cos(2πj/N)) the relations were re-found by lindep and verified at W + 300 digits
(c_basis_p*.txt). **Every denominator becomes 1** at 19, 23 and 31 (and at 11, 13, 17, 37, where it was already 1). At p = 29 (basis ω^i, i < 3, over Z[2cos 2π/116]) rows k = 1 and 2 were redone. Both give d = 1 (was 173304) and hold to 6292 digits at 6300. The coefficients grow from 16.6 to 25.6 digits, as at p = 17: a power basis in ω is worse than one in P when P is tiny. The run was stopped after 2 of 14 rows to respect the 10-minute budget. By F3, every row is σ_a of row 1, and σ_a maps Z[2cos 2π/N] to itself, so d = 1 for one row gives d = 1 for all.
Coefficients shrink at 23 (7.8 → 6.2 digits) and 31 (13.9 → 8.4). They are about the same at 11, 13 and 19, and larger at 17 (ω-power basis 11.2 vs P-power 7.6).

**Integrality and norms** (d_units_out.txt, all h(p−1)/2 embeddings, 1500 digits). N_{L/Q}(b_1) = ±2^e exactly:
e = 55, 78, 272, 171, 0, 1218, 0, 666 for p = 11, 13, 17, 19, 23, 29, 31, 37.
That is e = p·v with v = (p−1)/2 (p ≡ 3 mod 8), v = 0 (p ≡ 7 mod 8), v = h(p−1)/4 (p ≡ 1 mod 4).
N(b_1) = N(P)^p is automatic (Π b_k = P^p together with F3). The real content is integrality: integer coefficients in a Z-basis of an order mean
b_k ∈ O_L, so **b_k is a {2}-unit, and a unit when p ≡ 7 (mod 8)** (p = 7 Rebák, 23, 31). Common 2-power content of the coefficient vectors: 2^3, 2^6, 2^8,
2^6, 1, 2^13, 1, 2^18 at 11, 13, 17, 19, 23, 29, 31, 37 (bases as in c_basis_p*.txt).
Expected from known theory: CM values of Siegel functions are units or S-units (Kubert–Lang, *Modular Units*, MEMORY). Not derived here.

## F5. Cosine-product (Rebák-style) forms exist iff h(−4p) ≤ 2, i.e. p ∈ {3, 5, 7, 13, 37}. NEW-CONJECTURE (the "only if"); "if" PROVED-BY-KNOWN-THEORY given F2 and F4
Test (e_mult.gp, 1700 digits, relations searched at 1200 and verified to > 1550). Is log b_1 a rational combination of log 2, log p,
log(2 sin(πa/N)) (all a), log P and log of the fundamental units of Q(P)? Generators were reduced greedily to an independent set.
These generators span, up to finite index, the {2,p}-units of Q(ζ_N)^+ (cyclotomic units have finite index, Sinnott; MEMORY) and of Q(P).
So "no relation" means b_1 ∉ (S-units of Q(P))·(S-units of Q(ζ_N)^+), even allowing roots.

| p | h(−4p) | result |
|---|---|---|
| 7 (positive control) | 1 | b_1 = 7³ / (s₁¹⁰ s₂⁸), s_a = 2 sin(πa/7), i.e. u^{7/2} = s₃³/(s₁² s₂) using s₁s₂s₃ = √7. Consistent with Rebák's septic terms |
| 5 | 2 | b² = 2⁵ s₂⁴ / (s₁² s₃⁴), s_a = 2 sin(πa/20) |
| 13 | 2 | b_1⁶ = 2³⁹·13⁷·s₂⁵⁰ / (s₁⁶ s₃²⁴ s₄⁴⁰ s₅³⁰ s₆⁸ s₇¹² s₈⁴⁴ s₉¹⁸ s₁₀⁵⁸ s₁₁³⁶), s_a = 2 sin(πa/52) (max exponent 58) |
| 37 | 2 | b_1⁴ = 2^74·37^−5·Π_{a≤35} s_a^{−e_a}, s_a = 2 sin(πa/148), e_a as printed in e_mult_out.txt, max |e_a| = 174 |
| 11, 17, 19, 23 | 3, 4, 3, 3 | **no relation** (e_mult_out.txt) |
| 29, 31 | 6, 3 | **no relation** (e_mult2_out.txt; 17 independent generators at 31 and 31 at 29, incl. P (and a unit of Q(P) at 29)) |
| negative control | | log(b_1 + 1) at p = 11 and 13: no relation |

Why the dichotomy: L_p is abelian over Q iff Cl(O) is an elementary 2-group iff h(−4p) ≤ 2 for prime p (one genus character). When it is abelian,
L_p ⊂ Q(ζ_{4p})^+ and F4 plus Sinnott force a cosine-product form for some power of b_k. When it is not abelian, the b_k are genuinely "elliptic" (Siegel-type) units, and
none was found at any of the six non-idoneal primes tested (11, 17, 19, 23, 29, 31). Primes p < 3000 with h(−4p) ≤ 2: exactly 2, 3, 5, 7, 13, 37 (idoneal_out.txt). That these are
the only prime idoneal numbers is classical (Euler's list; completeness is known up to at most one further idoneal number, Weinberger 1973; MEMORY).
**So the septic case is one of only five odd primes where a Rebák-style cosine form can exist, and p = 13 and p = 37 are the two
remaining new ones.** The exponents above come from a greedy, non-canonical generator choice. A prettier normalisation is open.

## F6. Coefficient size is set by the largest conjugate. No "dramatically smaller" basis of small elements exists: NOT-FOUND, with reason
house(b_1) = max over the h(p−1)/2 embeddings of |σ(b_1)| (d_units_out.txt). log10 house: 3.55, 7.96, 11.92, 7.34, 6.97, 26.60, 9.24, 38.36
(p = 11, 13, 17, 19, 23, 29, 31, 37). This grows fast for p ≡ 1 (mod 4) (about 1.27 digits per unit of p from 13 to 37) and slowly for p ≡ 3 (mod 4).
The big conjugates come from the non-principal ideal classes (other CM points).
If b = Σ m_i w_i, then max|m| ≥ house(b)/(n·H_w), where H_w is the largest conjugate of any basis element (f_bound_out.txt):

| p | n | forced log10 max|m| (integral/ω basis) | actual in that basis | sweep P-power basis |
|---|---|---|---|---|
| 11 | 15 | 1.8 | 3.0 | 2.7 |
| 13 | 12 | 6.6 | 7.1 | 7.4 |
| 17 | 32 | 9.8 | 11.2 | 7.6 |
| 19 | 27 | 5.1 | 6.7 | 7.0 (with d = 106) |
| 23 | 33 | 5.0 | 6.2 | 7.8 (with d = 43) |
| 29 | 84 | 23.7 | 25.6 | 16.9 (with d = 346608) |
| 31 | 45 | 7.1 | 8.3 | 13.9 (with d = 258071) |
| 37 | 36 | 36.5 | 37.3 | 37.6 |

So in every basis of small elements (normal bases and Gaussian periods included), the tables are within about 1–2 digits of the smallest possible. At
p = 17 and 29 the sweep's P-power basis does better, because P has a huge conjugate (|P'| ≈ 10^3.7 at 17) that absorbs b's huge conjugate.
At p = 13 and 37 (Q(P) ⊂ Q(ζ_N)) nothing like that is available, so the 37-digit coefficients at p = 37 are essentially forced for any
linear form. The genuinely compact presentations are (a) F3 (one row plus the rule) and (b) the multiplicative form of F5 where it exists.

## Literature (zero invention; labels as above)
- Rebák, Ramanujan J. 60 (2023) arXiv:2112.11884; Berndt–Rebák arXiv:2312.15513; Kim–Rebák arXiv:2506.01181 (ABSTRACT, opened today
  for 2506.01181). None mentions class fields, Galois action or Shimura reciprocity in the abstract. A search for "septic theta identity" with "class field /
  Shimura reciprocity / cyclotomic units" found nothing connecting them (SNIPPET-level negative).
- Gee, "Class invariants by Shimura's reciprocity law", JTNB 11 (1999) 45–72 (ABSTRACT; the PDF is a scan and was not machine-readable here).
- Enge–Morain, "Generalised Weber functions", arXiv:0905.3250 (OPENED via ar5iv): uses Shimura reciprocity (their Thm 2.2) to classify when powers of
  η-quotients at quadratic points generate ring class fields K_D = K(j). It does not state the f(√−m) mod-8 cases in the form above.
- Jung–Koo–Shin, "Ray class invariants over imaginary quadratic fields", Tohoku Math. J. 63 (2011), arXiv:1007.2317 (ABSTRACT): Siegel-function
  CM values generate ray class fields.
- Cox, *Primes of the form x² + ny²* (ring class fields, Thm 11.1; genus theory; idoneal numbers) and Kubert–Lang, *Modular Units*; Sinnott (cyclotomic unit
  index): MEMORY, not reopened today. Treat these as pointers, not quotations.
- Search link list: arxiv.org/abs/0905.3250, numdam.org/item/JTNB_1999__11_1_45_0/, arxiv.org/abs/1007.2317, arxiv.org/abs/2506.01181,
  arxiv.org/abs/0807.2976 (Broadhurst, Weber invariants N ≡ 3 mod 8; SNIPPET only).

## Files
a_fields.gp/_out (F1) · b_galois.gp/_out (F3) · c_basis.gp + c_basis_p*.txt (F4, NEWTABLE lines = re-expressed tables) · d_units.gp/_out (F4, F6) ·
e_mult.gp/_out + e_mult2_out (F5) · f_bound.gp/_out (F6) · idoneal_check.py/_out (F5) · tables.gp (sweep tables in gp syntax).
