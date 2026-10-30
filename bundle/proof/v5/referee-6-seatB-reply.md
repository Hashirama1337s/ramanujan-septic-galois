I'll referee only the new v5.1 pieces: Lemma E′, the class-number-2 reading, and the two round-1 fixes. First I'll open the cited pages and the house boot notes so the verdict rests on text I actually read.**In plain words.** Lemma E′ is a real proof that h(−4p) is odd for p ≡ 3 (mod 4) and even and at least 2 for p ≡ 1 (mod 4). The two round-1 fixes are applied in the right places. The class-number-2 numbers on the page do give {5, 13, 37}, once −4p is identified as the field discriminant. One quotation is not on the page as it stands today.

## 1. Lemma E′ — CORRECT

Complex conjugation c preserves H_O = K(j(τ₀)). Deuring §1, equation (9), opened on ar5iv: j(ω) = q⁻¹ + c₀ + ⋯ with rational integer coefficients, and q(τ₀) = e⁻²π√p is real, so j(τ₀) is real and c(K) = K. Thus c restricts to an automorphism of H_O. For σ in G = Gal(H_O/K), ι(σ) = cσc fixes K pointwise (c is applied twice) and ι(ι(σ)) = σ, so ι is an involution of the set G.

On values, ι(σ_Q)(j(τ₀)) = c(j(t_Q)). Lemma E step 1, already accepted, gives c(j(t_Q)) = j(t_{Q′}) with Q′ = (a, −b, c). An element of G is determined by its image of j(τ₀) (Lemma B).

Fixed points are exactly the reduced Q with b = 0, b = a, or a = c.
- If |b| < a < c, both (a, b, c) and (a, −b, c) are reduced. Distinct reduced forms give distinct j-values by [KSY25] Remark 3.2(i) and Lemma B, so this pair is not fixed.
- The only reduced Q whose opposite fails the sign rule in that same remark (“b ≥ 0 if either |b| = a or a = c”) are those with b > 0 and (b = a or a = c).
- b = a gives t_{Q′} = t_Q − 1. Deuring §1: a modular function satisfies f(ω+1) = f(ω), and j is one, so j(t_{Q′}) = j(t_Q).
- a = c gives t_Q · t_{Q′} = −c/a = −1, so t_{Q′} = −1/t_Q. The matrix (0 −1; 1 0) lies in the modular group, so j(−1/τ) = j(τ).

For p ≥ 5 the two boundary conditions cannot hold together: b = a = c forces 3a² = 4p.

Lemma E step 3 does not use reality. It is a shape count for b² − 4ac = −4p with b even. The only reduced primitive forms of those three shapes are (1, 0, p), and, when p ≡ 1 (mod 4), also (2, 2, (p+1)/2). The second has content 2 when p ≡ 3 (mod 4), so it is not in C₁(D). The two forms are distinct reduced forms when p ≡ 1 (mod 4), so [KSY25] Remark 3.2(i) gives h ≥ 2. An involution pairs the non-fixed points, hence h ≡ (number of fixed points) (mod 2).

## 2. Class-number-2 list — CORRECT WITH FIXES

**Fix.** Do not quote “From P. Ribenboim, Classical Theory of Algebraic Numbers, p. 636, Springer 2001” as a sentence on the page opened on 2026-10-27. That sentence is on the Wayback capture of 16 Jan 2012. It is absent from the live page and from the 4 Feb 2024 capture. What is on the live page, opened today, is the heading “Tables of imaginary quadratic fields with small class numbers,” then “class number 2,” then “Note: The following are the squarefree d, not field discriminants,” then

5, 6, 10, 13, 15, 22, 35, 37, 51, 58, 91, 115, 123, 187, 235, 267, 403, 427.

The only primes in that list are 5, 13, 37, each ≡ 1 (mod 4).

The identification is in opened text. Wikipedia, “Quadratic field,” Discriminant: for squarefree d, the discriminant of Q(√d) is d if d ≡ 1 (mod 4), and 4d otherwise, and the ring of integers is Z[√d] in the second case. For d = −p with p ≡ 1 (mod 4) one has −p ≡ 3 (mod 4), so the field discriminant is −4p and O_K = Z[√−p]. Keith Matthews, `krm_calc.html`, opened: “If d is the discriminant of an imaginary quadratic field K, then the primitive forms class-number h(d) is also the class number of K.” Thus h(−4p) is the class number of Q(√−p). The same site’s negative-discriminant index, opened, writes the fields as Q(√−d) for squarefree d. So the primes ≡ 1 (mod 4) cut out of that table are {5, 13, 37}. Completeness of the eighteen numbers remains the unopened Baker–Stark theorem, already named GAP-L′. Ribenboim’s book was not opened.

## 3. The two round-1 fixes — CORRECT

The split “h = 1 when p ≡ 3 (mod 4), h = 2 when p ≡ 1 (mod 4)” is now stated from Lemma E′ alone, before any appeal to (i). Odd and at least 1 forces h = 1; even and at least 2 forces h = 2. The list corollary uses the same split.

Deuring §22, opened on ar5iv, case 2.3: if p = 𝔭², then φ_{P_𝔭}(α) ≈ p⁶ when P_𝔭(α₁; α₂) is a basis of a_{R_f} 𝔭_{R_f}. Section 13 defines P_𝔭 as a determinant-p matrix, unique up to equivalence, whose image of the basis is a basis of a_R 𝔭_R. Here det P_C = 2, and P_C(√−p; 1) = (1+√−p, 2), which Lemma G shows is a Z-basis of the ideal 𝔭 = 2Z + Z(1+√−p) with 𝔭² = 2O_K and a = O_K = R_1. That is Deuring’s basis condition at t = 0, so case 2.3 applies and gives φ ≈ 2⁶. Deuring’s own line, “For t = 0 the assertions of 1.3 and 2.3 are proven in §13,” matches this use.

**v5.1 as a whole: ACCEPTED WITH FIXES.** The only fix is the Ribenboim sentence in item 2. Lemma E′ and both round-1 repairs stand. GAP-L′ stays a named, unopened completeness theorem for the list form only.

Next strike: open Ribenboim p. 636, or Baker 1971 and Stark 1971, and check that those eighteen squarefree d are stated there as the complete class-number-2 list.