# RESULT-F1: vector 4, the ideal (b_k) at the primes above 2
2026-10-28, vector-4 seat (first seat 07:09-09:20, stopped by the pause; resume seat from 13:35 completed this file). Internal;
not for release. Unrefereed. BAR-F1 sealed 07:27 (sha256 ad31ce7e...; SEALS.txt, ../../LOG.md).

## Seal audit (resume seat, done first)
- Hashes now: BAR-F1.md ad31ce7e..., f1.gp a4960a9a..., test.gp 4bf7b6a6... = SEALS.txt = the 07:27 LOG line (unchanged since sealing).
- NTFS creation times: f1.gp 07:23:54, BAR-F1.md 07:27:37, test.gp 07:27:41, SEALS.txt 07:27:49; first test-prime data: test_out.txt
  created 07:28:12, minpoly_p37.gp 07:28:14, minpoly_p43.gp 07:28:17, minpoly_p41.gp 07:28:52, minpoly_p53.gp 07:30:00. The training
  runs (train_out.txt 07:13, train2_out.txt 07:24-07:28, h3_out.txt) contain no test prime (train: 5, 13, 17, 11, 19, 23, 29).
  minpoly_p37.gp shows mtime 08:39 only because T4 (the last step of the sealed run) rewrote it. So the seal PRECEDED all test-prime
  computation by this vector: the seal is valid and no fresh test primes were needed.
- Two honest qualifications. (a) The 09:20 LOG line says the sealed test was "about to launch" when stopped; that is wrong: the sealed
  run ran 07:28-08:41 (test_out.txt, "END OF SEALED RUN"); what was stopped was the 8G re-run of T3 (rerun.gp). (b) Not blind in the
  strong sense: proof v5.1 §2.3 (read by the first seat before sealing) already printed the norm exponent at 37 (666) and already
  proves Theorem C3, from which T1 and T2 follow for every p. So T1/T2 are consistency checks of a proved theorem and of the computed
  G, not tests of a guess; the clauses that test something new (Lemma R: every e_P = e in F_p) are T3/T4.

## In plain words
The pieces b_k have norms that are powers of 2. The question was how that power of 2 is shared out among the different prime
"pieces of 2" in the number field F_p where the b_k live, and whether the symmetry that moves b_k to b_{tk} also moves that share
around. The answer is the simplest possible one: the share is perfectly even. Every prime above 2 divides every b_k exactly p
times (for p not 7 mod 8), whatever k is and however many primes above 2 there are. So all the b_k generate the same ideal, the
ratios b_j/b_k are units, and b_k^2/2^p (p = 1 mod 4) or b_k^3/2^p (p = 3 mod 8) are units. The symmetry has nothing to move:
the prime 2 sees no difference between the pieces. The splitting of 2 in Q(j(sqrt -p)) and in Q(zeta_p)^+ only decides how many
primes there are and their sizes; it never changes the exponents. Most of this was already implicit in our own proof v5.1
(Theorem C3, stated "for every prime of Q-bar above 2"); this vector makes it explicit, adds the one missing lemma (the
ramification index of 2 in F_p, which turns a fractional statement into "exactly p"), and checks it with exact, sealed computations.
The test was sealed before any test prime was computed (checked from the file times on resume). What varies from prime to prime is
only how many primes above 2 there are and their sizes; their sizes are pinned to two possible values, set by the order of 2 mod p.

## Statement
Let p >= 5 be prime and put (c, e) = (0, 1), (4, 3), (6, 2) for p = 7 (mod 8), 3 (mod 8), 1 (mod 4) respectively, i.e. according
as 2 is split, inert or ramified in K = Q(sqrt -p). Let F_p be the field of C1 (b_1, ..., b_m in F_p, m = (p-1)/2).

**Theorem F.**
(i) For every k, every number field L containing b_k and every prime P of L above 2: v_P(b_k) = (p c/12) e(P|2).
    Equivalently, normalising v(2) = 1 on Q-bar_2, every Q-conjugate of b_1 has 2-adic valuation p c/12 (= 0, p/3, p/2).
(ii) (Lemma R) Every prime P of F_p above 2 has ramification index e(P|2) = e.
(iii) Hence, in F_p: v_P(b_k) = p for every prime P | 2 and every k when p != 7 (mod 8) (and 0 when p = 7 mod 8). Equivalently
    (b_k) O_{F_p} = r^p, where r = prod_{P | 2} P is the radical of 2 (r^e = 2 O_{F_p}). In particular (b_k) does not depend on k,
    b_j/b_k is a unit for all j, k, and b_k^e/2^p is a unit; |N_{F_p/Q}(b_k)| = 2^{p n/e}, n = [F_p:Q] = h(-4p)(p-1)/2.
(iv) Galois rule: for every sigma in Gal(Q-bar/Q), (sigma(b_k)) = sigma(r)^p = r_{sigma(F_p)}^p. The rule sigma(b_k) = b_{tk} (C2)
    is compatible with (iii) and carries no information at 2: the 2-adic divisor of b_k is the Galois-invariant ideal r^p. The
    decomposition of 2 in J = Q(j(sqrt -p)) and in Q(zeta_p)^+ affects only the number and residue degrees of the P, never v_P.

(v) (In terms of K and J.) e = e(2 in H_O) = e(2 in KJ) (H_O = K·J = J(sqrt -p)); it is the lcm of e(2|K) and the ramification
    indices of 2 in J: for p = 3 (mod 8) 2 is inert in K and totally ramified in J (every prime of J above 2 has e = 3); for
    p = 1 (mod 4) the 2 comes from K, while J may have primes above 2 with e = 1 and e = 2 side by side (17, 29, 41, 53).
(vi) [NOT PROVED - referee: the closed form below is not a proof; dropped from C9, 2026-10-28] (Residue degrees; Q(zeta_p) enters only here.) Put f_M = lcm(2, ord_p(2)). Every prime P of F_p above 2 has residue degree
    f_P = f_M or f_M/2 (f_M/2 exactly when complex conjugation fixes the prime of M = H_O(zeta_p) above P). Which of the two occurs,
    and how often, is not determined here (exploratory).

Answer to the vector's question: v_P(b_k) = p c e(P|2)/12 depends only on how 2 behaves in K (through c) and in H_O = KJ (through e),
equals p for every P | 2 in F_p, and is the same for every k. Q(zeta_p)^+ and the splitting of 2 in J beyond its ramification index
change only the number and residue degrees of the P.

## Proof

### Sources (OPENED this session unless stated; locators to the opened text)
- [Deu] M. Deuring, *Class Fields of Complex Multiplication*, English translation by C. Chin, arXiv:2006.04531v1. OPENED this session:
  PDF saved as src/deuring-2006.04531v1.pdf, text layer src/deuring.txt (pypdf). Locators (printed page numbers):
  - §22, p. 40, preliminary remark: for two primitive matrices S, S' of determinant s whose images are bases of characteristic ideals of
    R_{fs}, "the two (algebraic) numbers ϕS(α) and ϕS′(α) are associated"; proof ends p. 41: the ratio "is prime to the arbitrarily
    specified prime number p, whence a unit". So "≈" means: the two numbers generate the same ideal in any number field containing them.
  - §22, pp. 41-42: the case list "1. If p is the product of two distinct prime divisors ... 2. If p is the square of a prime divisor
    ... 3. If p is prime in Σ", with 2.3 and 3.2 on p. 42 and footnote 10 "Essentially in Hasse, Monatsh. f. Math. 38, p. 331 (1931)".
  - §13, p. 31, eq. (36): the product of ϕ_{Pν}(α) over the p+1 classes of determinant p equals p^12; eq. (37) the t = 0 value.
  - Glyph caveat (as in v5.1): the text layer drops the bars/fraktur on the prime divisors. It does not matter here (Step 2).
- [KSY25] Koo-Shin-Yoon, arXiv:2506.14139v1, text at ../../veins/v1_law/src/ksy25.txt (opened this session): §2, p. 3-4: K_{O,N} is the
  class field of I(O_K, ℓ_O N)/P_{Z,N}(O_K, ℓ_O N), and "(i) Every nonzero prime ideal of O_K that ramifies in K_{O,N} divides ℓ_O N O_K"
  (ℓ_O = conductor of O). Re-opened by the resume seat: ksy25.txt lines 140-175 (printed p. 3), eq. (3)-(4) and item (i); the text
  layer prints "divides ON OK" (the ℓ glyph is dropped), and eq. (3) defines P_{Z,N}(O_K, ℓ_O N) as the principal ideals αO_K with
  α ≡ a (mod ℓ_O N O_K) for an integer a ≡ 1 (mod N). Deuring locators re-checked in deuring.txt: preliminary remark lines 3070-3164
  (PDF pp. 40-41), case list 3174-3245 (pp. 41-42), footnote 10 line 3209, eq. (36)/(37) lines 2462/2483 (p. 31).
- Our proofs used as inputs (not re-proved): proof v4 Lemma 5 (b_k = c_k g_{a_k}(τ0)^p y^p, c_k a root of unity, g_{a_k}(τ0) a unit,
  y = 2/f(τ0)^2) and v4 C3b step 1 (|Gal(K(2)/H_K)| = 3 for p = 3 mod 8, from KSY10 4.7 as quoted there); proof v5.1 Lemma F
  (y^12 = -2^12/ϕ_{P_C}(τ0)), Lemma G (2 split / inert / ramified in K; O = O_K for p = 1 mod 4; O of conductor 2 for p = 3 mod 4),
  Theorem C3 (v_𝔓(y) = (c/12) v_𝔓(2) for every prime 𝔓 of Q-bar above 2).
- Not opened: Hasse 1931; Cox (book; the order class-number formula is replaced by the K(2) bound below); Yui-Zagier.

### Step 1 (part (i)): this is v5.1 Theorem C3 read through v4 Lemma 5
By v5.1 Theorem C3, v_𝔓(y) = (c/12) v_𝔓(2) for every prime 𝔓 of Q-bar above 2. By v4 Lemma 5, b_k = c_k g^p y^p with c_k a root of
unity and g a unit, so v_𝔓(b_k) = p v_𝔓(y) = (p c/12) v_𝔓(2). For a prime P of a number field L containing b_k, choose 𝔓 above P;
v_P = v_𝔓/e(𝔓|P), so v_P(b_k) = (p c/12) v_P(2) = (p c/12) e(P|2). The same holds for every Q-conjugate sigma(b_1), because
v_𝔓(sigma b) = v_{sigma^{-1}𝔓}(b) and the right side does not depend on 𝔓. ∎

### Step 2 (robustness of the uniformity, p != 7 mod 8): no glyph reading is needed for "uniform"
For p = 3 (mod 8) the only prime of K above 2 is 2 O_K (inert); for p = 1 (mod 4) it is 𝔭 with 𝔭^2 = 2 O_K (ramified). Deuring's cases
3.2 and 2.3 say ϕ_{P_C}(τ0) ≈ (a power of the prime divisor of K above 2) [Deu] pp. 41-42; whichever way the dropped glyph is read
(rational 2 or the prime divisor 𝔭), the right side is a power of the single prime of K over 2, hence an ideal whose extension to
any field has v_𝔓 proportional to v_𝔓(2) with one constant. So uniformity across all 𝔓 | 2 is forced by "≈" alone; only the
constant c/12 depends on the reading. The constant is then pinned by the norm: if v_𝔓(b_1) = κ v_𝔓(2) for all 𝔓, then
v_2(N b_1) = κ n, and the exact constant terms give κ = 1/3, 1/2 (v5.1 check (D) on 18 primes; here v_2(G(0)) = 666, 903, 3280, 4134
at 37, 43, 41, 53 and 55, 78, 171, 272, 1218 on training, all = p n/e). (This paragraph is a cross-check of v5.1's reading, not a new input.)

### Step 3 (part (ii), Lemma R): e(P|2) = e for every prime P of F_p above 2
Let M = H_O(zeta_p) (v5.1 notation; F_p = M ∩ R, so F_p ⊂ M). Let P | 2 in F_p and 𝔓 a prime of M above P; then e(P|2) ≤ e(𝔓|2).
1. *M/H_O is unramified above 2.* M = H_O(zeta_p) with zeta_p a root of X^p - 1, whose discriminant ±p^p is prime to 2.
2. *p = 1 (mod 4).* O = O_K (v5.1 Lemma G), so H_O = K_{O_K,1}, and by [KSY25] §2 (i) with ℓ_O N = 1 no finite prime of K ramifies in H_O.
   2 ramifies in K with index 2 (Lemma G: 𝔭^2 = 2O_K). Hence e(𝔓|2) ≤ 2 · 1 · 1 = 2.
3. *p = 3 (mod 8).* 2 is inert in K (Lemma G), so e(2 in K) = 1. H_K := K_{O_K,1} is unramified over K ([KSY25] §2 (i), ℓ = N = 1).
   H_O = K_{O,1} is the class field of I(O_K,2)/P_{Z,1}(O_K,2) ([KSY25] §2, ℓ_O = 2, N = 1); this ideal group contains the ray group
   P_{K,1}(2) (principal ideals αO_K with α ≡ 1 mod 2O_K), so H_K ⊂ H_O ⊂ K(2), the ray class field mod 2. By v4 C3b step 1,
   [K(2) : H_K] = 3. (Independent elementary check: [K(2):H_K] = |(O_K/2O_K)^*| / |image of O_K^*| = |F_4^*| / 1 = 3, since the only
   units ±1 are ≡ 1 mod 2; the exact sequence O_K^* -> (O_K/m)^* -> Cl_m -> Cl -> 1 is standard, source not opened this session.) Hence e(𝔓|2) ≤ e(H_O/H_K at 𝔓) ≤ [H_O : H_K] ≤ 3.
4. *Lower bound from integrality.* b_k ∈ F_p is an algebraic integer, so v_P(b_k) = (p c/12) e(P|2) is an integer (Step 1, L = F_p).
   p = 1 mod 4: p e(P|2)/2 ∈ Z with p odd gives 2 | e(P|2). p = 3 mod 8: p e(P|2)/3 ∈ Z with p ≠ 3 gives 3 | e(P|2).
5. With 1-3: e(P|2) = 2 resp. 3. (For p = 7 mod 8, c = 0 and e(P|2) plays no role; e = 1 was observed at p = 23 and is not claimed.) ∎
By-product: H_O/H_K is totally ramified at every prime above 2 when p = 3 (mod 8), and [H_O : H_K] = 3 there (so h(-4p) = 3h(-p),
recovered without the order class-number formula; exact reduced-form count confirms it for all 108 such p < 3000, h3_out.txt).

### Step 4 (parts (iii), (iv))
(iii) Put Step 3 into Step 1 with L = F_p: v_P(b_k) = p c e/12 = p (both cases: 6·2/12 = 4·3/12 = 1). So (b_k) = prod P^p = r^p and
r^e = prod P^e = 2O (all e_P = e). Then (b_j/b_k) = O and (b_k^e/2^p) = r^{pe}/(2)^p = O. Norm: sum_P f_P · p = p n/e.
(iv) Any sigma maps primes above 2 of F_p to primes above 2 of sigma(F_p) with the same e, so sigma(r) is the radical of 2 there and
(sigma b_k) = sigma(r)^p. When sigma(F_p) = F_p and sigma(b_k) = b_{tk} (C2), both sides are r^p. ∎
Note on (iv): the argument uses only that sigma is a field automorphism; no property of the rule sigma(b_k) = b_{tk} (C2, proved
earlier from [KSY25] Prop 4.1) is needed. That is the precise sense in which "the Galois action carries no information at 2".

### Step 5 (parts (v), (vi))
(v) Every prime of M above 2 has e(𝔓|2) = e: the upper bound is Step 3 items 1-3, the lower bound is e(𝔓|2) >= e(P|2) = e for
P = 𝔓 ∩ F_p (Step 3). M/H_O is unramified above 2 (item 1), so every prime of H_O above 2 also has index e. For p = 3 (mod 8):
e(Q|2) = e(Q|Q∩J) e(Q∩J|2) = 3 for Q | 2 in H_O, with [H_O:J] = 2, forces e(Q∩J|2) = 3. For p = 1 (mod 4) the 2 is e(2|K).
(vi) Residue degree of 2 in H_O is 2: for p = 3 (mod 8), 2O_K is prime of norm 4 and principal, so it splits completely in H_K
(Artin), and H_O/H_K is totally ramified above 2 (Step 3 by-product); for p = 1 (mod 4), O = O_K, H_O = H_K and 𝔭 (𝔭^2 = 2O_K) is
not principal (x^2 + p y^2 = 2 has no integer solution for p >= 3), so its class has order 2 and residue degree 2 in H_K/K. Then
M = H_O(zeta_p), Gal(M/H_O) embeds in (Z/p)^*, and the Frobenius of a prime of H_O of norm 4 acts as zeta_p -> zeta_p^4, so
[NOT PROVED - dropped from C9] f(M/H_O) = ord_p(4) and f_M = 2 ord_p(4) = lcm(2, ord_p(2)). Finally M/F_p has degree 2 and is unramified above 2 (both have e),
so f_P = f_M / f(𝔓|P) with f(𝔓|P) in {1, 2}, and f(𝔓|P) = 2 iff complex conjugation lies in the decomposition group of 𝔓. ∎
Check against every factorisation computed: f_M = 4, 12, 8, 28, 10, 18, 36, 14 at 5, 13, 17, 29, 11, 19, 37, 43 and the observed f_P
are 2; 6; 4, 4, 8; 14, 28; 5; 9; 18; 7, 7, 7, all in {f_M/2, f_M}. At 41, 53 (f_M = 20, 52) the f_P were not computed.

## Computations (exact unless stated; no bnfinit, no GRH)
Inputs: G = integer minimal polynomial of b_1 from the analytic conjugates (../../proof/cert/cert.gp conjs(p,1) via fastmin.gp needdig);
rounding error 10^-302 ... 10^-1068; G irreducible of degree h(-4p)(p-1)/2 at every prime below, so Q(b_1) = F_p. That G is the true
minimal polynomial rests on numerical rounding (vector 5 is the open gap that would make it a theorem); every check below is exact given G.
Instruments: (T1) 2-adic Newton polygon of G (newtonpoly; valuations of ALL roots in Q-bar_2); (T2) Graeffe certificate: the polynomial
of b^e/2^p over all roots b is in Z[x], monic, constant ±1; (T3) nfinit([S,[2]]) for S = minimal polynomial of z = b_1^e/2^p
(order maximal at 2; S irreducible of full degree so Q(z) = F_p; v_P(b_1) = (p e_P + v_P(z))/e exactly), idealprimedec, nfeltval;
(direct) nfinit([G,[2]]) where it finished; nfroots for the conjugates of b_1 inside F_p.
Controls: Newton polygon of G·(x-2) shows two slopes; 2^(p+1) in place of 2^p is not integral; the wrong exponent 5-e is not a unit;
a uniformiser of one prime has a non-uniform valuation vector [1, 0, 0] (p = 17); p = 23 (7 mod 8): b_1 a unit, v_P = 0.

Method key (all unconditional: no bnfinit, no GRH; "maximal at 2" = nfinit([pol,[2]]), Round 4 at the single prime 2):
D = direct nfinit([G,[2]]) of Q(b_1); U = unit model nfinit([S,[2]]), S = min. poly of b_1^e/2^p; M = POST HOC small model
F_p = J.Q(zeta_N)^+ (compositum factor of degree n; both fields lie in F_p, so the factor is F_p), nfinit([T,[2]]), with v_P(b_1) from
T1; N = Newton polygon (T1); C = Graeffe unit certificate (T2); H = POST HOC ramification of 2 in H_O = J(sqrt -p) (degree 2h), the
machine version of Lemma R's upper bound. The decomposition of 2 in J (polclass(-4p), maximal at 2) and the residue degree f+ of 2 in
Q(zeta_p)^+ (order of 2 in (Z/p)*/{+-1}) are listed for comparison.

| p | p mod 8 | n = [F_p:Q] | primes P of F_p above 2: [e, f] | v_P(b_1) | method | 2 in J: [e, f] | f+ (g+) | N slope | C |
|---|---|---|---|---|---|---|---|---|---|
| 5 | 5 | 4 | [2,2] | 5 | D, U | [1,2] | 2 (1) | (D) | yes |
| 13 | 5 | 12 | [2,6] | 13 | D, U | [1,2] | 6 (1) | (D) | yes |
| 17 | 1 | 32 | [2,4], [2,4], [2,8] | 17, 17, 17 | D, U, M | [2,1], [1,2] | 4 (2) | (D) | yes |
| 29 | 5 | 84 | [2,14], [2,28] | 29, 29 | M + N | [2,2], [1,2] | 14 (1) | 29/2 | yes |
| 11 | 3 | 15 | [3,5] | 11 | D, U, M | [3,1] | 5 (1) | (D) | yes |
| 19 | 3 | 27 | [3,9] | 19 | D, U | [3,1] | 9 (1) | (D) | yes |
| 23 | 7 | 33 | [1,33] | 0 (unit) | D | [1,3] | 11 (1) | (D) | b_1 unit |
| **37** (test) | 5 | 36 | [2,18] | 37 | U (T3), D (T4) | [1,2] | 18 (1) | 37/2 | yes |
| **43** (test) | 3 | 63 | [3,7], [3,7], [3,7] | 43, 43, 43 | M + N (POST HOC); U: see verdicts | [3,1] | 7 (3) | 43/3 | yes |
| **41** (test) | 1 | 160 | all e_P = 2 (count and f not computed) | 41 each | N + H (POST HOC); U: see verdicts | [2,1], [2,2], [1,2] | 10 (2) | 41/2 | yes |
| **53** (test) | 5 | 156 | all e_P = 2 (count and f not computed) | 53 each | N + H (POST HOC); U: see verdicts | [2,2], [1,2] | 26 (1) | 53/2 | yes |

At every prime: sum_P f_P v_P(b_1) = v_2(G(0)) = p n/e where the P were listed (5: 10, 13: 78, 17: 272, 29: 1218, 11: 55, 19: 171,
37: 666, 43: 903). At 37 (T4) all 36 conjugates of b_1 lie in F_37 (18 principal-form b_k and 18 values sigma_Q(b_k) at the form
(2,2,19), identified numerically to 10^-544 or better) and every one has v_P = 37. At 5-23 every conjugate of b_1 lying in F_p
(4, 12, 16, 5, 9, 11 of them) has the same valuation vector as b_1. H (POST HOC): primes of H_O above 2 have e = 2 at 17, 29, 37, 41, 53
and e = 3 at 11, 43 (all f = 2), so e_P <= e in F_p, and with T1's integrality bound e_P = e.

Exploratory (not predicted, not proved): the residue degrees vary with p and with P (17: 4, 4, 8; 29: 14, 28; 43: 7, 7, 7). At 11, 19,
43 (h = 3, J totally ramified at 2) the primes of F_p are exactly e = 3 with f = f+ and g = g+. For p = 1 mod 4 a closed formula in terms
of J and Q(zeta_p)^+ was not sought; it would come from the double cosets of Gal(M/Q) and does not affect v_P.

## Verdicts
**Sealed verdict BAR-F1: HOLDS** (scored strictly by the bar's own rule: T1 and T2 at all four primes, T3 and T4 wherever run).
| clause | 37 | 43 | 41 | 53 | method (all unconditional; no bnfinit, no GRH) |
|---|---|---|---|---|---|
| T1 Newton polygon single slope p c/12 | HOLDS (37/2 x36) | HOLDS (43/3 x63) | HOLDS (41/2 x160) | HOLDS (53/2 x156) | newtonpoly of exact G |
| T1 control G(x-2) shows extra slope | ok | ok | ok | ok | same |
| T2 b^e/2^p a unit for every conjugate | HOLDS (const 1) | HOLDS (const -1) | HOLDS (const 1) | HOLDS (const 1) | Graeffe, exact integers |
| T2 controls 2^(p+1), exponent 5-e fail | ok | ok | ok | ok | same |
| T3 unit model e_P = e, v_P(b_1) = p, sum = v_2(G(0)) | HOLDS ([2,18], 37; 666) | NOT RUN (2 GB stack) | NOT RUN (2 GB stack) | NOT RUN (30-min cap) | nfinit([S,[2]]), maximal at 2 |
| T4 direct nfinit + all conjugates in F_37 | HOLDS (36/36 conjugates, v_P = 37) | - | - | - | nfinit([G,[2]]), nfroots |
| T3 instrument control (>= 2 primes) | n/a (1 prime) | not reached | not reached | not reached | (exercised in training at 17) |
NOT RUN entries are resource failures, not verdicts. "G is the true minimal polynomial" rests on rounding of analytic conjugates
(error 10^-479 to 10^-1068); every clause is exact given G (vector 5 is the gap that would remove this).

POST HOC (after the sealed run; not part of the sealed verdict, all exact and unconditional):
- p = 43: model M (F_43 = J.Q(zeta_43)^+, nfinit maximal at 2): 3 primes [3,7] x3, all e_P = 3, v_P(b_1) = 43, sum 903 = v_2(G(0)).
- p = 41, 53: model H (H_O = J(sqrt -p), degree 2h): every prime of H_O above 2 has e = 2, so e_P <= 2 in F_p; with T1 (integrality)
  e_P = 2 and v_P(b_1) = p for every P. Number and residue degrees of the P at 41, 53 not computed.
- Re-run of the sealed T3 instrument at 43 with an 8G stack (rerun.gp, first seat): killed by the 09:20 pause, no output (not a verdict).
- Re-run 2 at 43 (rerun2.gp, resume seat, started 13:39, 8G, 60-min cap): hit the 60-minute cap at 14:42 (e_ALARM, stack grown to 8 GB): NOT RUN, a resource failure, not a verdict. It could
  only have added a T3 entry labelled "re-run after resource failure"; the sealed verdict is unchanged. No further re-run: model M settles 43.

**Theorem F verdict:** proved on the page (Steps 1-5), one seat, UNREFEREED. Inputs: v5.1 Theorem C3 and v4 Lemma 5 (our own,
AI-refereed), [Deu] §22 (opened), [KSY25] §2 (opened). Every computed case (training 5-29, test 37-53) agrees; no case disagrees.

## New vs prior art
- Part (i) is v5.1 Theorem C3 (our own, AI-refereed twice) combined with v4 Lemma 5; the underlying divisor theorem is Deuring §22
  ("Essentially in Hasse ... 1931", [Deu] p. 41 fn. 10). The lead's own test ("if their Deuring note already lists every v_P, this lead
  is TAKEN") applies: in substance the answer was already in our v5.1. Corrections are wins: this is recorded, not hidden.
- Also already in v5.1 §2.3: the norm exponents |N b_1| = 2^{p n/e} (printed for 11, 13, 17, 19, 29, 37), so column 9 of BAR-F1
  at 37 was a known number when the bar was sealed, and T1/T2 restate C3 numerically.
- New here: Lemma R (e(P|2) = e in F_p, by integrality against the class-field bound, no order class-number formula), hence the exact
  integral form v_P(b_k) = p and (b_k) = r^p; the unit corollaries b_j/b_k and b_k^e/2^p; the observation that the Galois action is
  invisible at 2; [NOT PROVED] the residue-degree constraint (vi) f_P in {f_M/2, f_M}, f_M = lcm(2, ord_p 2); sealed exact checks (Newton polygon,
  Graeffe certificate, unit-model factorisation) at 4 test primes. All of this is standard class field theory applied to our own
  objects; "new" means "not written down in our files before", not "new to the literature" (no search was made for these exact
  theta pieces beyond the lead's own).
- Not checked: Yui-Zagier and later work on factorisations of Weber-function values (not opened); a published statement of (iii) for
  these theta pieces was not searched beyond the lead's own "not found".

## Ceiling
Low. This closes vector 4 as a corollary-level lemma: the 2-adic factorisation of the pieces is uniform and carries no Galois
information. It is not a new law and not a candidate headline.

## Next strike
None at 2. Close vector 4 and move to vector 5 (proof that "analytic conjugates, then round" returns the irreducible polynomial), which is
the one gap every exact check here still rests on. Optional side note only: the residue degrees f_P (exploratory table above) follow
from the double-coset decomposition of Gal(M/Q) and were not pursued.

## Files (vectors/v4_factor/)
BAR-F1.md, SEALS.txt; f1.gp (engine), train.gp/train_out.txt, train2.gp/train2_out.txt, h3.gp/h3_out.txt, test.gp/test_out.txt;
minpoly_p*.gp (5, 11, 13, 17, 19, 23, 29, 37, 41, 43, 53); src/deuring-2006.04531v1.pdf, src/deuring.txt;
POST HOC: posthoc.gp/posthoc_out.txt (model M), hoe.gp/hoe_out.txt (model H); re-runs of sealed T3 after resource failure:
rerun.gp/rerun_out.txt (killed by the 09:20 pause), rerun2.gp/rerun2_out.txt (resume seat, p = 43 only).
Process notes: the direct nfinit at p = 29 (training) was stopped by hand twice (degree 84, ~600-digit coefficients, 1-1.7 GB), so
p = 29 has T1/T2 only. In train_out.txt the root labels at 5, 13, 17 compared only with the principal-form values (b_k), so roots that
are conjugates at the non-principal form show a wrong "b_k" label with poor agreement; the valuation vectors are unaffected; the label
search was widened to all conjugates before the bar was sealed. The certificate flag in train_out.txt tested integrality only; the
constant ±1 was printed and was ±1 in every main certificate; the flag was fixed to require ±1 before sealing.
