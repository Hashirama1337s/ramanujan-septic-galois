# Proof write-up v5.1: C4 (abelian iff h(-4p) <= 2) and C3c (unit iff p = 7 mod 8)
Proof seat, 2026-10-27; v5.1 applies the referee round-1 fixes (proof/v5/referee-5-seatB-reply.md, ACCEPTED WITH FIXES) and adds
Lemma E′ (parity of h). Builds on proof write-up v4 (C1, C2, C3a, C3b; in proof/) and keeps its notation. Internal; not for release.
See "Changes from v5" at the end.

## In plain words
Two open rules are now proofs. First (C4): the pieces b_k all live inside a "cyclotomic" number system (one built from roots of
unity, where Galois groups are commutative) exactly when the class number h(-4p) is 1 or 2. The key new step: the product of all the
pieces already determines Klein's j-value at sqrt(-p). This holds because, among all its algebraic conjugates, that product is the
smallest in size. A size estimate on Weber's functions proves it. So if the pieces were cyclotomic, j would be too. That forces every
reduced quadratic form of discriminant -4p to be its own mirror image. A short count of such forms gives h <= 2. Second (C3c): a
classical theorem of Deuring (after Hasse) states exactly which power of 2 divides Weber-type ratios of discriminants at CM points.
Read at sqrt(-p), it gives the 2-adic size of every piece in all three cases. The pieces are units exactly when p = 7 (mod 8), carry
2^(1/3) when p = 3 (mod 8), and carry 2^(1/2) when p = 1 (mod 4). The p = 3 (mod 8) case re-proves C3b by a second, independent
route that needs neither of v4's gaps G3', G5. What stays open: the stronger "explicit products of sines" form of C4, and the
identification of the h <= 2 primes as exactly {3, 5, 7, 13, 37}. The h = 2 half of that list rests on the class-number-2 theorem,
which I did not open.

> **Status (p >= 5 throughout; p = 3 is the trivial case b_1 = 2, h(-12) = 1)**
> - **C4 (abelian form): all b_k lie in an abelian extension of Q <=> F_p is abelian over Q <=> h(-4p) <= 2. PROVED.**
>   Also proved: Q(b_1 b_2 ... b_m) = Q(j(sqrt -p)) and Q(b_1, ..., b_m) = F_p (m = (p-1)/2). For p = 3 mod 4 the condition means
>   h = 1, and for p = 1 mod 4 it means h = 2.
> - **C4 (field form): if h(-4p) <= 2 then F_p = Q(zeta_{4p})^+ (p = 1 mod 4) or F_7 = Q(zeta_7)^+. PROVED**, modulo the classical
>   Gauss-sum fact sqrt(p) in Q(zeta_p) (GAP-G, already used in v4 step 3).
> - **C4 (list form): h(-4p) <= 2 <=> p in {3, 5, 7, 13, 37}. PROVED, citing the published class-number-1 and -2 lists.**
>   p = 3 (mod 4): Lemma E′ (on the page) shows h(-4p) is odd, so h <= 2 means h = 1, and the order list in [KSY25] Rem 5.2(iii)
>   (OPENED) gives p in {3, 7}. p = 1 (mod 4): -4p is a field discriminant, and the class-number-2 field list (Baker 1971, Stark 1971),
>   OPENED as the table reproduced from Ribenboim (2001, p. 636), gives p in {5, 13, 37}. The theorems' own proofs are not opened (GAP-L′).
> - **C4 (strong form): each b_k is an explicit product of sines/cosines times powers of 2 and p. OPEN.** It is observed numerically
>   at 5, 7, 13, 37 and not proved.
> - **C3c: b_k is a unit <=> p = 7 (mod 8). PROVED.** The full 2-adic valuation is v_P(y) = v_P(2)·{0, 1/3, 1/2} for
>   p = 7 mod 8, 3 mod 8, 1 mod 4, so e = 0, p·h(p-1)/6, p·h(p-1)/4. The proof cites Deuring §22 (OPENED, English translation).
> - **C3b: re-proved by this route**, so it no longer depends on G3' or G5.

---

## 0. Sources
OPENED = I read the statement in this session; locators are to the opened text.
- **[KSY25]** Koo–Shin–Yoon, arXiv:2506.14139v1. **OPENED** (PDF text, this session).
  - §3, display before Prop 3.1: tau_Q = (-b + sqrt D)/(2a) for Q = ax^2+bxy+cy^2.
  - **Prop 3.1**: C_N(D) ≅ C_N(O) ≅ Gal(K_{O,N}/K).
  - **Remark 3.2(i)**: Q is *reduced* if "|b| <= a <= c and b >= 0 if either |b| = a or a = c"; a reduced Q satisfies a <= sqrt(|D|/3);
    and "if Q_1, ..., Q_h are all the reduced forms of discriminant D, then |C_1(D)| = h and C_1(D) = {[Q_1], ..., [Q_h]}" (cites Cox Thm 2.8).
  - **§4**: F_N, its GL2(Z/N)/{±1} action, tau_O = sqrt D/2 for D = 0 mod 4, and K_{O,N} = K(f(tau_O) | f in F_N finite at tau_O).
  - **Prop 4.1**: the map C_N(D) -> Gal(K_{O,N}/K), [Q] -> ( f(tau_O) -> f^{[1, -a'(b+b_O)/2; 0, a']}(-conj(tau_Q)) ), is a
    well-defined group isomorphism (proof cited to [13, Thm 12.3]).
  - **Lemma 7.3**: K_{O,N} is Galois over Q with Gal = Gal(K_{O,N}/K) ⋊ <c> (cited to [14]).
  - **Remark 5.2(iii)**: |C_1(D)| = 1 iff D in {-3, -4, -7, -8, -11, -12, -16, -19, -27, -28, -43, -67, -163} (Baker, Heegner, Stark).
- **[Deu]** M. Deuring, *Class Fields of Complex Multiplication*, English translation by C. Chin, arXiv:2006.04531v1. **OPENED**
  (PDF; the bars on 𝔭 were read from rendered page images, because the text layer drops them). The bibliographic details of the
  German original are not checked.
  - §1 (pp. 3–4): Delta(omega) = g2^3 - 27 g3^2 = (2 pi)^12 eta^24, of weight -12. Eq. (9): j = q^{-1} + c_0 + ... with rational
    integer c_nu. "ΛM consists of all modular functions ... whose Fourier expansion has coefficients in Λ" (so F_1 = Q(j)).
  - §3 eq. (15) (p. 11): phi_S(omega) = s^12 Delta(S(omega_1; omega_2)) / Delta(omega_1; omega_2) for a primitive integer matrix S
    of determinant s, with Delta homogeneous of degree -12. The p. 31 computation phi_{CP}(alpha) = c^12 p^12 gamma^{-12} uses
    exactly this homogeneity.
  - §8 (pp. 19–20): R_f is the order of conductor f; a *characteristic ideal* of R is an ideal a with (a : a) = R.
  - **§22 (pp. 41–42), the divisor theorem** ("Essentially in Hasse, Monatsh. f. Math. 38, p. 331 (1931)"). Let p be prime,
    p^t || f, and let alpha_1, alpha_2 be a basis of a characteristic ideal of R_f, alpha = alpha_1/alpha_2. For P primitive of
    determinant p:
    - 1.2 (p = 𝔭 𝔭̄, 𝔭 ≠ 𝔭̄): "phi_P(alpha) ≈ p^12 when P(alpha_1; alpha_2) is a basis of a characteristic ideal of R_{f p^{-1}}";
    - 2.3 (p = 𝔭^2, t = 0): "phi_{P_𝔭}(alpha) ≈ p^6 when P_𝔭(alpha_1; alpha_2) is a basis of a_{R_f} 𝔭_{R_f}";
    - 3.2 (p prime in Σ): "phi_P(alpha) ≈ p^{12[1 - 1/(p^{t-1}(p+1))]} when P(alpha_1; alpha_2) is a basis of a characteristic ideal
      of R_{f p^{-1}}".
    - "≈" means "associated" (same divisor; the §22 preliminary remark proves two values associated by showing their ratio is a unit).
  - §13 eqs. (36)–(39) (pp. 31–32): the t = 0 cases, and the product over the p+1 classes, Π phi_{P_nu}(alpha) = p^12.
- **[Wiki-W]** Wikipedia, "Weber modular function". **OPENED** (this session and v4): f(tau) = q^{-1/48} Π(1+q^{n-1/2}) =
  e^{-pi i/24} eta((tau+1)/2)/eta(tau); "The transformation tau -> -1/tau fixes f and exchanges f1 and f2"; the three roots of
  j = (x-16)^3/x are f^24, -f1^24, -f2^24. The definitions f1 = q^{-1/48}Π(1-q^{n-1/2}) = eta(tau/2)/eta(tau) and
  f2 = sqrt2 q^{1/24}Π(1+q^n) = sqrt2 eta(2tau)/eta(tau) were opened in v4.
- **[Wiki-JTP]** Wikipedia, "Jacobi triple product". **OPENED**: Π_{m>=1}(1-x^{2m})(1+x^{2m-1}y^2)(1+x^{2m-1}y^{-2}) = Σ_n x^{n^2}y^{2n},
  for |x| < 1 and y ≠ 0.
- **[Wiki-CNP]** Wikipedia, "Class number problem". **SNIPPET-level for our use.** It says only "Class number 2: solved, Baker (1971),
  Stark (1971)"; it does not list the discriminants.
- **[CN-tab]** "Tables of imaginary quadratic fields with small class numbers", http://www.numbertheory.org/classnos/ (last modified
  4 Dec 2007). **OPENED** 2026-10-27 (v5.1). Class number 2 entry: "From P. Ribenboim, Classical Theory of Algebraic Numbers, p. 636,
  Springer 2001 / Note: The following are the squarefree d, not field discriminants / 5,6,10,13,15,22,35,37,51,58,91,115,123,187,235,267,403,427".
  Ribenboim's book itself is not opened.
- **[LMFDB-h2]** LMFDB number-field search, degree 2, signature [0,1], class number 2,
  https://www.lmfdb.org/NumberField/?degree=2&signature=[0,1]&class_number=2 . **OPENED** 2026-10-27. Verbatim: "The results below are
  complete, since the LMFDB contains all number fields with signature [0,1], class number at most 100 (except 98)". "Results (18 matches)";
  the discriminants of the form -4p (p prime) among them are -20 (2.0.20.1, x^2+5), -52 (2.0.52.1, x^2+13), -148 (2.0.148.1, x^2+37).
  Independent of [CN-tab]; the 18 fields agree with [CN-tab]'s 18 squarefree d. (The completeness claim rests on the Baker–Stark theorem and
  Watkins' class-number-up-to-100 computation, Math. Comp. 73 (2004) 907–938; the AMS page is behind a bot check and was not opened.)
- v4 results used: Lemma 1, Prop 4, Lemma 4′, Theorem C1 (steps 1–5), C3a / Lemma 5, and the formula f^24(tau) = -Delta((tau+1)/2)/Delta(tau).
- Not opened: Cox (book), Baker 1971 / Stark 1971, Hasse 1931, Yui–Zagier, Kronecker–Weber (not needed).

Notation: p >= 5 prime, tau_0 = i sqrt p, D = -4p, O = Z[sqrt -p], K = Q(sqrt -p), H_O = K(j(tau_0)) = K_{O,1} (v4 C1 step 1),
J := Q(j(tau_0)) = H_O ∩ R, M = H_O(zeta_p), F_p = M ∩ R, m = (p-1)/2, h = h(-4p) = |C_1(D)|.
Write R_0 = f^24, R_1 = -f1^24, R_2 = -f2^24 (the three roots of (X-16)^3 - jX, [Wiki-W]) and w := f(tau_0)^24 > 0.

---

## 1. C4

**Precise statement (C4).** For a prime p >= 5 the following are equivalent:
- (i) all b_1, ..., b_m lie in one abelian extension of Q;
- (ii) F_p is an abelian extension of Q;
- (iii) h(-4p) <= 2.

Moreover, (iii) means h = 1 when p = 3 (mod 4) and h = 2 when p = 1 (mod 4). This holds unconditionally by Lemma E′ (§1.5′):
h(-4p) is odd for p = 3 (mod 4) and even (>= 2) for p = 1 (mod 4). (v5 deduced it only under (i); referee fix, round 1.)

The separate **strong form** (each b_k is a product of sines/cosines of rational multiples of pi times powers of 2 and p) is **not**
proved here; see §1.7.

### 1.1 Lemma A (product formula, on the page)
**P := u_1 ⋯ u_m = 2^m f(tau_0)^{1-p}**, hence **v := b_1 b_2 ⋯ b_m = P^p = 2^{n/2} w^{-n/24}**, with n := p(p-1). All quantities are real and positive.

*Proof.*
1. Put q = e^{2 pi i tau} and theta[a](tau) = Σ_n q^{(n+a)^2/2} (v4 §1).
2. [Wiki-JTP] with x = q^{1/2}, y^2 = q^a gives theta[a] = q^{a^2/2} Π_{n>=1}(1-q^n)(1+q^{n-1/2+a})(1+q^{n-1/2-a}).
3. As k runs over -m..m, the exponents p(n-1/2)+k run over exactly the half-integers in (p(n-1), pn), so
   Π_{n>=1} Π_{|k|<=m} (1+q^{n-1/2+k/p}) = Π_{n>=1} (1+q_1^{n-1/2}), where q_1 = q^{1/p} = e^{2 pi i tau/p}.
4. Since Σ_{k=1}^m k^2/(2p^2) = (p^2-1)/(48p), this gives
   Π_{k=1}^m theta[k/p] / theta[0]^m = q^{(p^2-1)/(48p)} Π(1+q_1^{n-1/2}) / Π(1+q^{n-1/2})^{p}.
5. With f(tau) = q^{-1/48}Π(1+q^{n-1/2}) ([Wiki-W]), the powers of q cancel exactly: (p^2-1)/(48p) + 1/(48p) - p/48 = 0. So
   P(tau) = 2^m f(tau/p) / f(tau)^p.
6. At tau_0, tau_0/p = i/sqrt p = -1/tau_0, and f(-1/tau) = f(tau) ([Wiki-W]). So P = 2^m f(tau_0)^{1-p}.
7. Positivity: u_k > 0 (v4 Lemma 4′), and f(tau_0) > 0 because q is real and positive. ∎

Check: (B) in `g_c4c3c_out.txt`, all primes 5..61 at 300 digits.

### 1.2 Lemma B (the K-conjugates of j(tau_0), from [KSY25])
Let Q_1, ..., Q_h be the reduced primitive forms of discriminant D. Then:
- Gal(H_O/K) = {sigma_1, ..., sigma_h}, with sigma_i(j(tau_0)) = j(t_i), where t_i := -conj(tau_{Q_i}) = (b_i + sqrt D)/(2a_i);
- the numbers j(t_1), ..., j(t_h) are pairwise distinct.

*Proof.*
1. Apply [KSY25] Prop 4.1 with N = 1. The matrix there lies in GL2(Z/1Z) = {1}, so it acts trivially, and F_1 = Q(j) ([Deu] §1).
   Hence [Q] -> (j(tau_O) -> j(-conj(tau_Q))) is an isomorphism C_1(D) -> Gal(K_{O,1}/K), with tau_O = tau_0 ([KSY25] (5)) and K_{O,1} = H_O.
2. By [KSY25] Rem 3.2(i), C_1(D) = {[Q_1], ..., [Q_h]} with h distinct classes, so the sigma_i are distinct.
3. An element of Gal(K(j(tau_0))/K) is determined by its value on j(tau_0), so the j(t_i) are distinct. ∎

**Lemma B′ (heights).** If Q = (a,b,c) is reduced with a >= 2, then y := Im t_Q = sqrt p / a satisfies sqrt3/2 <= y <= sqrt p/2.
Also (1,0,p) is the only reduced form with a = 1.

*Proof.*
- Upper bound: Im t_Q = sqrt(4p)/(2a) <= sqrt p/2.
- Lower bound: a <= sqrt(|D|/3) ([KSY25] Rem 3.2(i)), so y = sqrt|D|/(2a) >= sqrt3/2.
- a = 1: then |b| <= 1, and b is even because b^2 ≡ D (mod 4). So b = 0 and c = p. ∎

### 1.3 Lemma C (size bound, on the page)
Let tau be in H with sqrt3/2 <= Im tau = y <= sqrt p/2. Then:
- |R_0(tau)| and |R_1(tau)| are at most 4.89 e^{pi y} <= 4.89 e^{pi sqrt p/2};
- |R_2(tau)| <= 19.7;
- w > e^{pi sqrt p}.

Hence **max_i |R_i(tau)| < w** for every prime p >= 3.

*Proof.*
1. Let r = |q| = e^{-2 pi y} <= r_0 := e^{-pi sqrt3} < 0.004334. Use |1 ± z| <= e^{|z|}.
2. R_0 and R_1: by [Wiki-W], |R_0|, |R_1| <= r^{-1/2} exp(24 Σ_{n>=1} r_0^{n-1/2}) = e^{pi y} exp(24 r_0^{1/2}/(1-r_0)) < 4.888 e^{pi y}.
3. R_2: |R_2| = 2^12 r |Π(1+q^n)|^24 <= 4096 r_0 exp(24 r_0/(1-r_0)) < 19.7.
4. w: w = e^{pi sqrt p} Π(1+e^{-pi sqrt p (2n-1)})^24 > e^{pi sqrt p}.
5. Comparison: 4.888 e^{pi sqrt p/2} < e^{pi sqrt p} iff sqrt p > 2 ln(4.888)/pi = 1.0103, which holds for all p >= 2. And 19.7 < e^{pi sqrt 3} < w. ∎

Check: (A) in `g_c4c3c_out.txt`.
- All 2388 non-principal reduced forms for primes 5 <= p <= 1000 satisfy every inequality.
- Control: for the principal form, |R_0| equals w, so the strict inequality correctly fails there.

### 1.4 Proposition D (the key step): Q(b_1 b_2 ⋯ b_m) = J = Q(j(sqrt -p)). Hence Q(b_1, ..., b_m) = F_p.
*Proof.*
1. *v lies in J.* By v4 Prop 4, every sigma in Gal(L/H_O) maps b_k to b_{tk}, and k -> ±tk mod p permutes {1..m}. So v is fixed
   by Gal(L/H_O), which puts v in H_O. Also v is real, and H_O ∩ R = J (v4 C1 step 1). So v ∈ J.
2. *Set-up for a conjugate.* Let sigma ∈ Gal(H_O/K), sigma ≠ 1. Extend sigma to sigma~ on a Galois extension of K containing H_O and w.
   - Since (w-16)^3 = j(tau_0) w ([Wiki-W]), the value sigma~(w) is a root of (X-16)^3 - sigma(j(tau_0)) X.
   - By Lemma B, sigma(j(tau_0)) = j(t_Q) for a reduced Q. Here Q ≠ (1,0,p): otherwise t_Q = tau_0, and sigma would fix j(tau_0), hence fix H_O = K(j(tau_0)).
   - So a >= 2 (Lemma B′), and sigma~(w) ∈ {R_0(t_Q), R_1(t_Q), R_2(t_Q)} ([Wiki-W]).
3. *Size.* By Lemma C, |sigma~(w)| < w. From v^24 = 2^{12n} w^{-n} (Lemma A), sigma(v)^24 = 2^{12n} sigma~(w)^{-n}. Therefore
   |sigma(v)| = 2^{n/2}|sigma~(w)|^{-n/24} > 2^{n/2} w^{-n/24} = v. So sigma(v) ≠ v.
4. *Degree.* Only the identity of Gal(H_O/K) fixes v, so K(v) = H_O.
   - v is real, so K ⊄ Q(v), and [Q(v):Q] = [K(v):K] = h = [J:Q].
   - With Q(v) ⊂ J, this gives Q(v) = J.
5. *Generation.* J = Q(v) ⊂ E := Q(b_1, ..., b_m) ⊂ F_p, and F_p = J(b_1) (v4 C1 step 5). So E = F_p. ∎

Remark. This replaces the "b_1 is a primitive element" route. Generation by b_1 alone (Q(b_1) = F_p) is still **not proved**. It is
not needed: the product v pins down J, and b_1 then generates F_p over J.

Check: (C) in `g_c4c3c_out.txt`, at p = 5, 7, 11, 13, 17, 19, 23.
- The minimal polynomial of v has degree exactly h, and Q(v) ≅ Q(j) (nfisisom with polclass(-4p)).
- The best relation of degree h-1 has 10^{500..1000}-size coefficients, a numerical artefact rather than a relation.

### 1.5 Lemma E (ambiguous reduced forms, on the page)
Suppose every K-conjugate j(t_i) of j(tau_0) is real. Then h = 1 if p = 3 (mod 4), and h = 2 if p = 1 (mod 4).

*Proof.*
1. *Mirror values.* j has rational Fourier coefficients ([Deu] (9)), so conj(j(t)) = j(-conj t). Let Q = (a,b,c) be reduced and
   Q′ = (a,-b,c). Then -conj(t_Q) = tau_Q = -conj(tau_{Q′}) = t_{Q′}, so conj(j(t_Q)) = j(t_{Q′}).
2. *Each reduced form is ambiguous.* Suppose Q′ is reduced and Q′ ≠ Q. Then j(t_Q) and j(t_{Q′}) are two distinct values of Lemma B,
   so j(t_Q) is not real, a contradiction. So either Q′ = Q (b = 0), or Q′ is not reduced. Q′ inherits |b| <= a <= c, so it fails
   only through the sign rule: b > 0 and (b = a or a = c).
3. *Count for D = -4p* (b is even, since b^2 ≡ D mod 4):
   - **b = 0.** Then ac = p with a <= c, so Q = (1,0,p).
   - **b = a = 2s.** Then 4s^2 - 8sc = -4p, i.e. s(2c - s) = p, so s ∈ {1, p}.
     - s = p gives c = (p+1)/2 < a = 2p, which is not reduced.
     - s = 1 gives (2, 2, (p+1)/2). It is reduced since 2 <= (p+1)/2, and primitive iff (p+1)/2 is odd iff p ≡ 1 (mod 4).
   - **a = c, b = 2s >= 0.** Then (a-s)(a+s) = p, so a = (p+1)/2 and b = p-1. Then b <= a forces p <= 3, which is excluded.
4. *Conclusion.* The reduced forms are among (1,0,p) and, when p ≡ 1 (mod 4), (2,2,(p+1)/2). Both are always reduced and primitive
   in their cases, so h = 1 resp. h = 2 ([KSY25] Rem 3.2(i)). ∎

Note on the brief. The suggested genus route says "p prime: two genera". That holds only for p = 1 (mod 4). For p = 3 (mod 4),
D = -4p has a single genus, and h is then odd (1, 3, 3, 3, ... in our tables). Lemma E avoids genus theory and Gal(H_O/Q) structure
altogether. It needs only reality of the conjugates and the reduced-form list.

### 1.5′ Lemma E′ (parity of h(-4p), on the page; new in v5.1)
h(-4p) is odd for p ≡ 3 (mod 4), and even with h >= 2 for p ≡ 1 (mod 4) (p >= 5 prime).

*Proof.* Let c be complex conjugation. Write G = Gal(H_O/K) = {sigma_Q : Q reduced} (Lemma B).
1. *c acts on G.* H_O = K(j(tau_0)) with j(tau_0) real and c(K) = K, so c(H_O) = H_O. Hence iota(sigma) := c sigma c is in G for every
   sigma in G (it fixes K pointwise, since c does twice), and iota is an involution of the set G.
2. *iota on the labels.* An element of G is fixed by its value on j(tau_0). Using c(j(tau_0)) = j(tau_0) and Lemma E step 1,
   iota(sigma_Q)(j(tau_0)) = c(j(t_Q)) = j(t_{Q′}), with Q′ = (a, -b, c).
3. *Fixed points.* sigma_Q is fixed by iota iff j(t_{Q′}) = j(t_Q). Three cases:
   - Q′ = Q (b = 0): fixed.
   - Q′ is reduced and Q′ ≠ Q: then j(t_{Q′}) is the Lemma B value of a different reduced form, so it differs from j(t_Q). Not fixed.
   - Q′ is not reduced (Lemma E step 2: b > 0 and b = a or a = c):
     With t_Q = (b + sqrt D)/(2a) (Lemma B) and t_{Q′} = (-b + sqrt D)/(2a):
     - b = a: t_Q = 1/2 + sqrt D/(2a) and t_{Q′} = -1/2 + sqrt D/(2a) = t_Q - 1. Since j(tau + 1) = j(tau), j(t_{Q′}) = j(t_Q). Fixed.
     - a = c: t_Q · t_{Q′} = (D - b^2)/(4a^2) = -4ac/(4a^2) = -c/a = -1, so t_{Q′} = -1/t_Q. Since j(-1/tau) = j(tau),
       j(t_{Q′}) = j(t_Q). Fixed.
   So the fixed points of iota are exactly the sigma_Q with Q reduced and b = 0, b = a, or a = c.
4. *Count.* Lemma E step 3 lists every reduced form of discriminant -4p with b = 0, b = a or a = c: only (1, 0, p) when p ≡ 3 (mod 4),
   and (1, 0, p), (2, 2, (p+1)/2) when p ≡ 1 (mod 4). (That step 3 uses only the shape of Q, not the reality hypothesis of Lemma E.)
5. *Parity.* The non-fixed points of an involution come in pairs, so h = |G| ≡ (number of fixed points) (mod 2). That gives h odd for
   p ≡ 3 (mod 4), and h even for p ≡ 1 (mod 4), with h >= 2 since the two listed forms are distinct reduced forms. ∎

Remark. This is the reduced-form shadow of "the 2-torsion of the class group is counted by ambiguous forms" (Gauss), proved here
without the group law: only Lemma B, j(tau+1) = j(tau), j(-1/tau) = j(tau) and the reduced-form list are used.
Check (E), `g_parity.gp` / `g_parity_out.txt`: h(-4p) is odd for all 217 primes p ≡ 3 (mod 4) in [5, 3000) and even for all 211
primes p ≡ 1 (mod 4); the primes with h(-4p) ≤ 2 are exactly 5, 7, 13, 37; controls h(-28) = 1, h(-20) = 2, h(-60) = 2 correct.

### 1.6 Proof of C4
**(ii) => (i):** trivial (b_k ∈ F_p by C1).

**(i) => (iii):**
1. Let E ⊂ A with A/Q abelian. By Prop D, J ⊂ E ⊂ A. Every subfield of an abelian extension is Galois over Q, so J/Q is Galois.
2. Then every Q-conjugate of j(tau_0) lies in J ⊂ R. In particular, all the K-conjugates j(t_i) are real.
3. Lemma E gives h ≤ 2, with the stated split by p mod 4. ∎

**(iii) => (ii), in explicit form:**
1. *p ≡ 3 (mod 4), h = 1.* Then H_O = K = Q(sqrt -p) ⊂ Q(zeta_p) (v4 C2 proof uses sqrt -p ∈ Q(zeta_p); GAP-G).
   So M = Q(zeta_p) and F_p = Q(zeta_p)^+.
   This case occurs only for p = 7: by [KSY25] Rem 5.2(iii), the only D = -4p with |C_1(D)| = 1 are -12 and -28.
2. *p ≡ 1 (mod 4), h = 2.* By v4 C1 step 3, i and sqrt p lie in H_O. Hence Q(i, sqrt p) ⊂ H_O, and both have degree 4 = 2h, so
   H_O = Q(i, sqrt p). With sqrt p ∈ Q(zeta_p) (GAP-G), M = Q(i, zeta_p) = Q(zeta_{4p}) and **F_p = Q(zeta_{4p})^+**.
   Degree check: phi(4p)/2 = p-1 = h(p-1)/2.
3. In both cases F_p is abelian. ∎

(Without GAP-G: H_O/Q is Galois of degree 2h ≤ 4, by [KSY25] Lemma 7.3 at N = 1, hence abelian. Then M = H_O·Q(zeta_p) is abelian,
so F_p is abelian. This proves (iii) => (ii) with no Gauss sum.)

**Corollary (list form).**
- h(-4p) = 1 iff p ∈ {3, 7} ([KSY25] Rem 5.2(iii), OPENED as a quoted theorem).
- h(-4p) = 2 for p ∈ {5, 13, 37} (computed).
- Conversely, let h(-4p) ≤ 2.
  - p ≡ 3 (mod 4): h is odd (Lemma E′), so h = 1 and p = 7 by the first bullet. (The non-maximal order needs no field theorem.)
  - p ≡ 1 (mod 4): D = -4p is a field discriminant (O = O_K, Lemma G), so h(-4p) is the class number of Q(sqrt -p). The class-number-2
    imaginary quadratic fields Q(sqrt -d) are d ∈ {5, 6, 10, 13, 15, 22, 35, 37, 51, 58, 91, 115, 123, 187, 235, 267, 403, 427}
    ([CN-tab], OPENED: "class number 2 / From P. Ribenboim, Classical Theory of Algebraic Numbers, p. 636, Springer 2001 / ... squarefree d").
    The primes ≡ 1 (mod 4) in that list are exactly 5, 13, 37.
  - Completeness of that list is the Baker–Stark class-number-2 theorem (1971); its proof is not opened (**GAP-L′**, a cited theorem, not a hole).
  - Agrees with the direct computation for p < 3000 (`structure/idoneal_out.txt`).

So "C4 iff p ∈ {3, 5, 7, 13, 37}" is PROVED, citing the class-number-1 order list [KSY25] Rem 5.2(iii) and the class-number-2 field list
[CN-tab]. The intrinsic form "iff h ≤ 2" is PROVED with no list at all.

### 1.7 The strong (products-of-sines) form: OPEN
- For p ∈ {5, 7, 13, 37}, §1.6 puts each b_k in Q(zeta_N)^+ (N = 4p, or N = 7). Each b_k is a {2}-unit there (C3a); for p = 7 it is a unit (C3c).
- The observed explicit forms (example at 7: u_1^7 = d_2^6/d_1^2, with d_j the sine ratios) say more: b_k lies in the subgroup generated
  by cyclotomic units, 2 and p. That is a finite question for these four primes, but I have not proved it.
- A proof would need (a) an exact identification of b_k in Q(zeta_N)^+, and (b) control of the cyclotomic-unit index in that field.
  - For (a): compute all Q-conjugates from [KSY25] Prop 4.1 at N = 4p (including the non-principal form), round the minimal polynomial
    to Z, and verify the unit identity exactly in the number field.
  - For (b): the index fact (Sinnott) is not opened.
- Status: **OPEN (numerical only)**.

---

## 2. C3c (and C3b again)

### 2.1 Lemma F (Weber's f at tau_0 is a Deuring value, on the page)
Let P_C = [1, 1; 0, 2]. With alpha_1 = sqrt -p and alpha_2 = 1 (a basis of O, a characteristic ideal of O), [Deu] (15) gives

phi_{P_C}(tau_0) = 2^12 Delta(tau_0+1, 2)/Delta(tau_0, 1) = Delta((tau_0+1)/2)/Delta(tau_0) = -f(tau_0)^24 = -w.

(Homogeneity: Delta(omega_1, 2) = 2^{-12} Delta(omega_1/2); and f^24 = -Delta((tau+1)/2)/Delta(tau) from [Wiki-W], derived in v4 §4.)

Since y = 2/f(tau_0)^2 (v4 Lemma 5), we get **y^12 = 2^12 / w = -2^12 / phi_{P_C}(tau_0)**.

P_C(alpha_1; alpha_2) = (1 + sqrt -p, 2) is a Z-basis of the lattice Λ_C := 2Z + Z(1 + sqrt -p).

### 2.2 Lemma G (the order data and the splitting of 2, on the page)
Let omega = (1 + sqrt -p)/2 when p ≡ 3 (mod 4).
- **p ≡ 3 (mod 4).**
  - O_K = Z[omega], O = Z + 2Z omega = R_2 (conductor f = 2, so t = 1), and Λ_C = 2(Z + Z omega) = 2 O_K.
  - Λ_C is therefore a characteristic ideal of R_1 = R_{f/2}.
  - The minimal polynomial of omega is X^2 - X + C with C = (p+1)/4.
  - *p ≡ 7 (mod 8): C is even.* Then 𝔭 := 2Z + Z omega and 𝔭̄ := 2Z + Z(omega - 1) are O_K-ideals: omega^2 = omega - C, and
    omega(omega-1) = -C ∈ 2Z. They have index 2 and are distinct (1 lies in neither, and omega - 1 ∉ 𝔭).
    Also 𝔭𝔭̄ = 2O_K: 𝔭𝔭̄ is generated by 4, 2omega - 2, 2omega and -C, which all lie in 2O_K, and it contains 2omega - (2omega - 2) = 2.
    So 2 is a product of two distinct prime ideals of norm 2: **split**.
  - *p ≡ 3 (mod 8): C is odd.* Then O_K/2O_K ≅ F_2[X]/(X^2+X+1) = F_4 is a field, so 2O_K is prime: **inert**.
- **p ≡ 1 (mod 4).** O = O_K = Z[sqrt -p] (conductor f = 1, t = 0), and Λ_C = 𝔭 := 2Z + Z(1 + sqrt -p).
  - Ideal check: sqrt -p (1 + sqrt -p) = (1 + sqrt -p) - (1+p), with 1 + p even. So Λ_C = 𝔭 = O_K·𝔭 = a_{R_f} 𝔭_{R_f} with a = O_K.
  - 𝔭^2 ⊂ 2O_K, because its generators 4, 2(1 + sqrt -p) and (1 + sqrt -p)^2 = 2(1 + sqrt -p) - (1+p) all lie in 2O_K.
  - 𝔭^2 ∋ 1 + p ≡ 2 (mod 4) and 4, so 2 ∈ 𝔭^2.
  - Hence 𝔭^2 = 2O_K: **ramified**.

These are exactly the hypotheses of [Deu] §22, cases 1.2 (split, t = 1), 3.2 (inert, t = 1) and 2.3 (ramified, t = 0), with Deuring's prime p := 2, P := P_C and alpha = tau_0.

*Ramified case, P_C is Deuring's P_𝔭 (referee fix, round 1).* [Deu] §13 defines P_𝔭 as a matrix of determinant p, unique up to
equivalence, for which P_𝔭(alpha_1; alpha_2) is a basis of a_R 𝔭_R. Here det P_C = 2 = p, and P_C(sqrt -p; 1) = (1 + sqrt -p, 2) is a
Z-basis of Λ_C = 𝔭 = O_K·𝔭 (the ideal check above, with a = O_K = O). So P_C is a P_𝔭 in Deuring's sense, and case 2.3 applies to it.

### 2.3 Theorem C3 (complete)
For every prime P of Q-bar above 2:
- p ≡ 7 (mod 8): v_P(y) = 0;
- p ≡ 3 (mod 8): v_P(y) = v_P(2)/3;
- p ≡ 1 (mod 4): v_P(y) = v_P(2)/2.

Hence b_k is a unit iff p ≡ 7 (mod 8), and |N_{F_p/Q}(b_k)| = 2^e with e = 0, p·h(p-1)/6, p·h(p-1)/4 respectively.

*Proof.*
1. *Deuring's divisors.* By Lemmas F, G and [Deu] §22, phi_{P_C}(tau_0) ≈ 2^{12-c}, where:
   - c = 0 (1.2: phi ≈ 2^12);
   - c = 4 (3.2 with t = 1: exponent 12(1 - 1/3) = 8);
   - c = 6 (2.3: phi ≈ 2^6).
2. *Valuation of y.* By Lemma F, y^12 = -2^12/phi_{P_C}(tau_0) ≈ 2^c, so v_P(y) = (c/12) v_P(2).
3. *Unit criterion.* By v4 Lemma 5, b_k = c_k g_{a_k}(tau_0)^p y^p, with g_{a_k}(tau_0) a unit (C3a). So b_k^12 / 2^{pc} is a unit. It lies
   in F_p, being a ratio of elements of F_p, and it is an algebraic-integer unit. So N_{F_p/Q}(b_k)^12 = ±2^{pc [F_p:Q]}, which gives
   e = pc·h(p-1)/24. Also b_k is a unit iff c = 0 iff p ≡ 7 (mod 8). ∎

Consistency: the three Deuring cases also give the product rule Π_nu phi_{P_nu} ≈ 2^12 ([Deu] (36)) with the other two matrices
[2,0;0,1] and [1,0;0,2]. Their lattices Z + 2Z sqrt -p and 2Z + Z sqrt -p have multiplier ring R_{2f}, which gives units,
2^2·2^2, and 2^3·2^3 respectively.

**C3b re-proved.** The case p ≡ 3 (mod 8) gives v_P(y) = v_P(2)/3 directly at tau_0. It does not go through the level-2 inertia
argument, so G3′ and G5 are no longer needed. The v4 proof remains as an independent second route.

Numerical agreement:
- (D) in `g_c4c3c_out.txt`, for 18 primes 5..79: the minimal polynomial of w = f(tau_0)^24 is monic of degree h, with
  |constant term| = 2^{(12-c)h} exactly, odd part 1. For example 2^36 at p = 23 (7 mod 8), 2^72 at p = 59 (3 mod 8), and 2^48 at p = 41 (1 mod 8).
- The norms of b_1 in `structure/d_units_out.txt` match e:
  - p = 11: 55; 13: 78; 17: 272; 19: 171; 29: 1218; 37: 666;
  - p = 23, 31: units.

---

## 3. GAPs (named; none is used silently)
- **GAP-L′** (list form of C4 only; was GAP-L in v5): the proofs of the class-number-1 order list and the class-number-2 field list
  (Heegner/Baker/Stark) are not opened. The lists themselves are OPENED ([KSY25] Rem 5.2(iii); [CN-tab]). The p = 3 (mod 4) half no
  longer needs any class-number-2 statement (Lemma E′). Computed for p < 3000.
- **GAP-G** (minor; explicit cyclotomic field only): sqrt p ∈ Q(zeta_p) for p ≡ 1 (mod 4), and sqrt -p ∈ Q(zeta_p) for p ≡ 3 (mod 4)
  (quadratic Gauss sum). This is the same fact v4 already uses, not re-sourced. The abelian conclusion of C4 avoids it via [KSY25] Lemma 7.3.
- **Inherited:** [KSY25] Prop 4.1, Prop 5.1 and Lemma 7.3 are opened statements whose proofs are cited by that paper to [13], [23] and [14]
  (not opened). [Deu] is opened in translation; the German original and Hasse 1931 are not opened.
- **Glyph caveat:** the bars on 𝔭 in [Deu] §22 were read from rendered images. The proof uses only cases 1.2, 2.3 and 3.2, whose right-hand
  sides are powers of the rational prime p and carry no bar. Their consistency with (36) is checked above.
- **No longer needed:** G3′ and G5 (C3b), G4 (C3c).
- **Still open:** the strong products-of-sines form of C4; whether b_1 alone generates F_p over Q.
- **Referee status:** v5 refereed once (independent AI reviewer, round 1): ACCEPTED WITH FIXES; Lemma B, Lemma C/Prop D, Lemma E CORRECT;
  C4 and C3c CORRECT WITH FIXES (both fixes applied in v5.1); GAP-L confirmed as a gap for orders (now closed for p ≡ 3 mod 4 by Lemma E′).
  Lemma E′ is new in v5.1 and not yet refereed. An expert human reading remains the bar before any public theorem claim.

## 4. Files (proof/v5/)
- `g_c4c3c.gp` and `g_c4c3c_out.txt`: checks (A) bound lemma plus negative control, (B) product formula, (C) degree of v and Q(v) = Q(j), (D) 2-adic constant terms.
- Run: WSL PARI/GP, under 1 GB, a few minutes.

## Next strike
Send this v5 to a blind independent AI reviewer with the opened texts of [KSY25] Prop 4.1 / Rem 3.2(i) and [Deu] §22. The single point to attack
is Lemma B: that [KSY25] Prop 4.1 at N = 1 really gives sigma_[Q](j(tau_O)) = j(-conj tau_Q) with distinct values over the h reduced forms.
Everything in C4 "only if" rests on it.

## Changes from v5 (referee round 1: ACCEPTED WITH FIXES)
- Fix §4 (referee): "(iii) means h = 1 / h = 2" was proved only under (i). Now unconditional via new Lemma E′ (§1.5′, parity of h by
  the complex-conjugation involution on Gal(H_O/K); fixed points = the reduced forms with b = 0, b = a or a = c).
- Fix §6 (referee): stated that P_C is a Deuring P_𝔭 (det 2, image lattice = 𝔭) in the ramified case (end of Lemma G).
- GAP-L shrunk: the p ≡ 3 (mod 4) half (non-maximal order, conductor 2) now needs no class-number-2 theorem. The p ≡ 1 (mod 4) half
  cites the class-number-2 field list, OPENED as [CN-tab] (reproducing Ribenboim 2001 p. 636); only the theorems' proofs stay unopened (GAP-L′).
- New check (E) `g_parity.gp`: parity of h(-4p) and the h ≤ 2 list for p < 3000, with controls.
- Not yet refereed: Lemma E′ and the [CN-tab] reading.

## Prior-art correction (2026-10-27, after the vein gate; narrow)
[Kani] E. Kani, "Idoneal numbers and some generalizations", Ann. Sci. Math. Québec 35 (2011), author PDF from queensu.ca. **OPENED**
(text extracted locally), p. 19: "Theorem 32 (Weber) Let n ≥1 be an integer. Then Q(j(√−n)) is a Galois (and hence an abelian) field
extension of Q if and only if n is idoneal." Its proof uses that complex conjugation acts on Gal(L_n/K) by inversion (Cox, Lemma 9.3).
Consequences for this write-up:
- The step "Q(j(sqrt -p)) abelian over Q <=> h(-4p) <= 2" (Lemma E, Lemma E′, the parity count) is classical (Weber; Kani Thm 32);
  our versions are on-page reproofs via reduced forms and should be presented as such, citing [Kani] Thm 32.
- What is new is Proposition D (Q(b_1⋯b_m) = Q(j(sqrt -p)), so the pieces carry j) and hence the transfer of Weber's criterion from
  j to Ramanujan's dissection pieces, plus the explicit sine forms (proof/cert) and C3c.
- Kani p. 4–5 also records that completeness of Euler's 65 idoneal numbers is not settled ("This conjecture has not yet been completely
  settled ... due to the work of Chowla and Weinberger, this statement has 'almost' been proved").
