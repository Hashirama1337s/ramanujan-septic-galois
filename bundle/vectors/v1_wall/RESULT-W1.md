# RESULT-W1 — the cubic and quintic wall (vector 1)
2026-10-28, vector-1 seat. Sealed bar: BAR-W1.md (sha256 c70e703fdba8d39b5fa7897339fcfdeb243e6a1e9ba19b7d05bca83ada214c7c, LOG.md 05:27).
Internal; not for release; nothing published. Proofs below are written by one seat and NOT yet refereed.

## In plain words
Berndt and Rebak's cubic and quintic pieces are the same theta quotients as Ramanujan's septic ones, with the level frozen at
3 or 5 while the special point i sqrt m moves. They do NOT obey the septic (C5) wall. In C5 every prime of n carries its own
sign and two disagreeing signs kill composite n such as 15. With a frozen level there is only one sign, so it can never
disagree, and composite numbers come back: the cubic piece is abelian at m = 15, 21, 33, 45, 57, 93, 105, 165, ..., 1365, the
quintic piece at m = 15, 45, 85, 105, 165, 345, 385, 1365. What kills abelianness instead is a small "torus" of symmetries mod 3
or mod 5 that only goes away when the level prime divides m (or, for the cubic only, when m = 2 mod 3). The rule we predicted
before computing held on all 116 sealed values with zero misses, including an exact count of real conjugates. We then proved it:
the cubic law completely, the quintic law completely, for every odd m >= 3 (one seat, unrefereed). Two consequences for
Berndt-Rebak's own tables: the theta pieces u^l inside their "Entry 1.1 analogues" (not the phi-ratios themselves) are abelian only at n = 1, 5 (cubic) and
n = 1 (quintic) among odd n; their p-values at integer n are abelian at n = 1, 5 (cubic; n = 2, 8 even, undecided) and n = 1 (quintic). [v2]

## 1. Definitions (sources OPENED: Berndt-Rebak arXiv:2312.15513v2 HTML, saved src/br.html, text src/br.txt)
- BR Thm 2.1(0): u = 2 q^{1/3} f(q, q^5)/phi(q^3). BR Thm 4.2(0): u = 2 q^{1/5} f(q^3, q^7)/phi(q^5), v = 2 q^{4/5} f(q, q^9)/phi(q^5).
  Both are u_k = 2 q^{k^2/l} f(q^{l+2k}, q^{l-2k})/phi(q^l) of the septic setting with p -> l in {3, 5}.
- Theta / Siegel form (triple product; C5 Lemma 1 with n -> l): with q = e^{pi i tau}, u_k = U_k(l tau), U_k := 2 th[k/l,0]/th[0,0],
  th[a,b](tau) = sum_j exp(pi i tau (j+a)^2 + 2 pi i (j+a) b); B_k := U_k^l = 2^l (-i)^k (g_{a_k}/g_{a_0})^l in F_{4l}.
- **B-family** z_B(l, m) = B_1(i sqrt m) = (BR's u at q = e^{-pi sqrt n})^l with n = m/l^2, i.e. BR Lemma 3.1 / 5.1 values
  (u = sqrt2 G_n/G_{9n}^3 cubic; u^5 = alpha p, p = 2 G_n/G_{25n}^5 quintic). BR n = 1/3, 1/5 are m = 3, 5.
- **W-family** z_W(l, m) = W_1(i sqrt m), W_j := (2 th[0, j/l]/th[0,0])^l = B_j o S. It equals BR's u^l in Thm 3.3 / 5.3 (their
  Entry-1.1 analogue) at BR n = m. [v2: W is the l-th power of the theta piece u in Thm 3.3 / 5.3, NOT the phi-ratio; e.g. Cor 3.9
  ratio = (1 + u)/3 with u^3 = 2(sqrt3 + sqrt5); quintic Thm 5.3 is s(p) with fifth roots. Nothing here classifies the phi-ratios.] Check: W_1(i sqrt 3) = B_1(i/sqrt 3) to 1e-134; BR Cor 3.7
  (u^3 = 2/(2^{1/3}-1)) and Cor 3.9 (u^3 = 2(sqrt3+sqrt5)) and Cor 5.4 reproduced to 1e-132 (presel_out.txt).
- O = Z[sqrt -m], K = Q(sqrt -m), h = h(-4m), Cl2 = |Cl(O)[2]|, m odd >= 3 (m = 1 by algdep, post hoc).

## 2. Method
K-conjugates by KSY25 (arXiv:2506.14139) Thm 6.2 + Prop 4.1 + Thm 7.5/Rem 7.6 via veins/v1_law/law.gp; for W the diag(1,a')
action W_j -> W_{j a'} on the coefficients is applied (wall.gp). Distinct values -> integer polynomial (rounding error <= 1e-119
over all sealed items, all denominators 1), irreducible, P(z) ~ 0 at 2W digits with z recomputed directly (>= 1e-307).
ABELIAN = galoisinit + galoisisabelian (degree <= 2 counted abelian); NOT ABELIAN = a prime with unequal factor degrees (a
rigorous non-Galois certificate). Engine: WSL PARI/GP, -s 2G, one process, each item <= 5 s. Floating point, no interval arithmetic.
Files: wall.gp, predict.gp/predict_out.txt (sealed predictions), run_w1.gp/run_w1_out.txt, run_w1b.gp/run_w1b_out.txt, presel*,
posthoc.gp/posthoc_out.txt, hm.gp/hm_out.txt, hm2.gp/hm2_out.txt, sep.gp/sep_out.txt, nulldiag.gp/nulldiag_out.txt.
Run notes (no prediction changed): run 1 skipped the extra BR points on a parenthesis typo and crashed in the null routine
(bestappr returned an empty vector); run_w1b ran the skipped items and a repaired null routine. wall.gp was edited after sealing
only inside wnull (null routine); SEALS.txt holds the pre-edit hash.

## 3. Table (sealed items; full lines in run_w1_out.txt, run_w1b_out.txt). A = abelian, - = not abelian.
Degree = predicted degree and #real = predicted real count at every item (116/116).

| l | family | m (odd), sealed | abelian at | not abelian at |
|---|---|---|---|---|
| 3 | B | 3..49, 63, 81, 99, 117, 153, 225, 243, 333, 441, 729, 765 (35) | **3, 5, 9, 15, 21, 33, 45** | the other 28 |
| 3 | W | 3..49, 81, 85 (26) | **5** | the other 25 |
| 5 | B | 3..49, 75, 125, 175, 225, 325, 625, 1225 (31) | **5, 15, 25, 45** | the other 27 |
| 5 | W | 3..49 (24) | none | all 24 |

Degree rule (116/116): B, l | m: h(l-1)/2; W, l | m: h l(l-1)/2; l not dividing m (both families, identical polynomials):
h(l-1)^2/2 if -m is a square mod l, h(l^2-1)/2 otherwise. Real count (116/116): Cl2 (l-1)/2 if l | m, Cl2 (l-1) otherwise.
Examples of exact minimal polynomials (every one is in the out files): cubic B m=3: x - 2 (BR Cor 3.4); m=9: x^2 + 20x - 8
(z = 6 sqrt3 - 10 = 8/(1+sqrt3)^3, agrees with BR (3.3)); m=15: x^2 - 7x + 1 (z = (7 - 3 sqrt5)/2); m=45: x^4 + 1120x^3 - 1344x^2 - 8960x + 64;
m=7: x^4 - 8x^3 + x + 1 (2 real roots, not abelian although 7 is an idoneal prime); m=27: x^3 - 6x^2 + 228x - 8 (1 real root);
cubic W m=5: x^4 - 64x^2 + 64 (= BR Cor 3.9, u^3 = 2(sqrt3 + sqrt5)).

## 4. Verdicts as sealed
| item | verdict |
|---|---|
| P1 H_alt (derived wall), 116 items | **HOLDS** (0 mismatches) |
| P2 H_same (C5 wall: idoneal prime powers) predicted to fail | **HOLDS** (fails at cubic B 7, 13, 25, 37, 15, 21, 33, 45; quintic B 3, 7, 9, 13, 37, 15, 45) |
| P3 degree formula | **HOLDS** (116/116) |
| P4 real-root formula | **HOLDS** (116/116) |
| P5 law L3 (abelian <=> all conjugates real) | **HOLDS** (116/116) |
| P6 W and B polynomials identical when l does not divide m | **HOLDS** (35/35) |
| Positive controls (cubic B 3 -> x-2; cubic W 5 -> x^4-64x^2+64; quintic B 5 abelian deg 4; cubic W 3 deg 3, 1 real) | **HOLD** |
| Null (i) wrong coefficient action must fail to round | **FAILED** (did not fail at (3,3), (3,9), (5,5); crashed at (5,15) in run 1, repaired in run 1b). Diagnosis (nulldiag_out.txt, POST HOC): dropping the action only permutes the conjugate set over all classes, so the null was not discriminating. A design error in the null, not in the engine; the W engine is instead checked by P6 and by BR's closed forms. |
| Null (ii) non-modular numbers (x^4-4x^2-x+1 totally real; random degree 8) | **HOLDS** (both NOT ABELIAN) |

POST HOC (posthoc_out.txt): m = 1 (algdep, 1616 digits): cubic x^2 - 4x - 8 (= 2(1+sqrt3), BR Cor 3.6), quintic
x^4 - 24x^3 - 224x^2 + 5376x - 1024, both ABELIAN (units +-i make the torus trivial). Larger idoneal m, all as the law says:
cubic B abelian at 57, 93, 105, 165, 177, 273, 345, 357, 1365, not at 85, 133, 253, 385 (= 1 mod 3); quintic B abelian at 85, 105,
165, 345, 385, 1365, not at 57, 93, 133. Degrees and real counts again all as predicted (22/22).

## 5. The law
**Theorem W (cubic and quintic wall).** Let l in {3, 5} and let m >= 3 be odd. Then B_1^{(l)}(i sqrt m) is abelian over Q iff
m is idoneal and either l | m, or l = 3 and m = 2 (mod 3). For l | m the same holds for all pieces B_k (k <= (l-1)/2) together.
The W piece (BR's Entry-1.1 analogue at n = m) is abelian iff l does not divide m and the B condition holds; i.e. cubic: n idoneal,
n = 2 mod 3; quintic: never (odd n >= 3).

Explicit lists. Among Euler's 65 idoneal numbers: cubic B {3, 5, 9, 15, 21, 33, 45, 57, 93, 105, 165, 177, 273, 345, 357, 1365};
quintic B {5, 15, 25, 45, 85, 105, 165, 345, 385, 1365}; cubic W {5}; quintic W {}. Completeness of these explicit lists rests on
[v2] the odd idoneal numbers. Our scan (idon_out.txt) gives exactly 24 odd idoneal m in [3, 1847], Euler's odd ones. Above 1848:
Kani 2011 Cor 23 (OPENED by referee): at most one squarefree idoneal n > 1848; odd non-squarefree idoneal numbers are only
9, 25, 45 (Grube, Kani Thm 12). So the odd lists are complete except possibly one odd squarefree m > 1848 (Kani Rem 24(a): the
often-repeated 'at most one idoneal n > 1848' is not established). The criterion itself is unconditional. Two corollaries need no list:
BR's p-values at q = e^{-pi sqrt n}, n a positive integer, are abelian iff 9n (cubic) / 25n (quintic) is idoneal [v2: for odd n; Theorem W assumes m odd]. Grube gives 9n idoneal iff
n in {1, 2, 5, 8}: n = 1, 5 abelian; n = 2, 8 (m = 18, 72 even) UNDECIDED here. Quintic: 25n idoneal iff n = 1. By Grube's theorem as quoted in Kani 2011 Thm 12 (opened by the C5 seat): 9 | idoneal => n in
{9, 18, 45, 72}; 25 | idoneal => n = 25.

## 6. Proof (one seat; unrefereed)
Notation: N = 4l, G = Gal(K_{O,N}/K) = C_N(O) (KSY25 Prop 3.1), c = complex conjugation, psi(sigma) = c sigma c^{-1} sigma^{-1},
psi(sigma_[a]) = sigma_[abar a^{-1}]. **(L2)** (RESULT-V1, from KSY25 Lemma 7.3): Q(z) abelian <=> psi(G) fixes z.
z is real (rational q-coefficients, -conj(i sqrt m) = i sqrt m).

**Step 1 (action of a principal class).** For primitive mu = d1 - d3 sqrt -m with a := N(mu) prime to 4l, C5 §3 steps 1-2 (which use
only tau_O = i sqrt m and rational coefficients) give rho([mu^{-1} O])(B_1(tau_O)) = B_1(M tau_O), M = [d4 + y d3, d2 + y d1; d3, d1],
y = -a'(d1 d2 + m d3 d4), a a' = 1 mod 4l. Direct computation mod l: top row of M = a'(d1 (d1 d4 - d2 d3), -m d3 (d1 d4 - d2 d3))
= a'(d1, -m d3) = (1, 0) g_x, where x := mu^{-1} mod l = t_x + s_x sqrt -m and g_x := [t_x, -m s_x; s_x, t_x]. Parity: a odd forces
(1,1) M = (1,1) mod 2 (C5 Lemma P step 3; uses only a odd).

**Step 2 (absolute values).** For real a, b: th[a,b]/th[0,0] = (constant of modulus 1) g_{(a+1/2, b+1/2)}/g_{(1/2,1/2)} (triple product
with y^2 = e^{2 pi i b} q^a against KSY10 (1.3); the case b = 0 is C5 Lemma 1). With KSY10 2.4(ii) (epsilon cancels) and 2.4(iii)
(integer shifts change g by modulus-1 factors): for M in SL2(Z) with (1,1)M = (1,1) mod 2 and top row (A, B),
|B_1(M tau)| = 2^l |th[A/l, B/l](tau)/th[0,0](tau)|^l. Also th[a+1, b] = th[a, b] and th[-a,-b] = th[a,b], so only c~ := the
representative of +-A mod l in [0, (l-1)/2] and B matter.

**Lemma S (separation; sep_out.txt).** For y >= sqrt3 and every real b: |th[0,b](iy)| >= L0 > U_{1/l} >= |th[1/l, b](iy)| (l = 3, 5),
and th[1/5,0](iy) >= L1 > U_{2/5} >= |th[2/5, b](iy)|, where U_a = sum_n e^{-pi y (n+a)^2}, L0 = 1 - 2 sum_{n>=1} e^{-pi y n^2},
L1 = e^{-pi y/25} - sum_{n != 0} e^{-pi y (n+1/5)^2}. At y = sqrt3: L0 = 0.99133, U_{1/3} = 0.63542, U_{1/5} = 0.83553, U_{2/5} = 0.55973,
L1 = 0.77328. For larger y: U_a decreases, L0 increases, and U_{2/5}/L1 decreases (argument in sep.gp comments; proof in v2 below).
Hence |B with c~ = 0| > |B with c~ = 1| for l = 3, 5 and |B with c~ = 1, b = 0| > |B with c~ = 2| for l = 5, at the same point i sqrt m.

**Step 3 (torus obstruction; proves "only if" when l does not divide m).** Let T1 = {x in (O/lO)^* : N(x) = 1}. If x in T1 and x != +-1 then
t_x != +-1 (else m s_x^2 = 0, so s_x = 0). T1 = {+-1} only for l = 3 with -m a square mod 3 (split, m = 2 mod 3); otherwise |T1| = l+1 >= 4
or l-1 = 4. Pick x in T1 \ {+-1}; by Hilbert 90 in the finite ring, x = nubar/nu mod l for some nu prime to 4l; pick primitive mu with
mu = nu/nubar mod 4l. Then rho([mu^{-1}O]) = psi(rho([nu O])) and by Steps 1-2 it sends z to a number of absolute value
2^l|th[t_x/l, *]/th0|^l with c~ in {0} (l = 3) or {0, 2} (l = 5), while z itself has c~ = 1, b = 0. Lemma S: different absolute values,
so psi(G) moves z, and z is not abelian (L2). This covers B for (l = 5, 5 not dividing m) and (l = 3, m = 1 mod 3), and W there too
(W_1(i sqrt m) = B_1 at the form (m, 0, 1), a K-conjugate since gcd(m, 4l) = 1).

**Step 4 (W never abelian when l | m).** For W (irrational coefficients) Prop 4.1 gives rho([mu^{-1}O])(W_1(tau_O)) = W_{a'}(M tau_O) =
B_{a'}(S M tau_O); the top row of (a', 0) S M is -a'(d3, d1). Take nu = 1 + sqrt -m (norm 1 + m prime to l), x = nubar/nu = 1 - 2 sqrt -m mod l
(since (sqrt -m)^2 = 0 mod l), mu^{-1} = x: a' d3 = -2, so c~ = |2 mod l| != 0, while W_1 has c~ = 0. Lemma S separates; not abelian.

**Step 5 ("if").** (a) l | m, m idoneal: Cl(O) = Cl(O)[2] (Kani Thm 6 / Rem 7(b), as used in C5). For a prime to 4l, a^2 = lambda O,
abar a^{-1} = (N a) lambda^{-1} O, principal. C5 Lemma P transfers verbatim with level l (its steps use n | (the CM number) only
through a = d1^2 mod l and b = 2 d1 d2 mod l, both true for l | m): rho([nu O]) sends B_k to B_{k t(nu)}, t(nu) = t mod l. Since
t(lambda)^2 = N(lambda) = (N a)^2 mod l, psi(sigma_a) acts by k -> +-k, and B_{-k} = B_k (C5 Lemma 0). So psi(G) fixes every B_k(tau_O).
(Contrast with C5: there the level is n and the ratio N a/t(lambda) is a sign vector over all primes of n; here it is one sign.)
(b) l = 3, m = 2 mod 3, m idoneal: O/3 = F_3 x F_3 with conjugation swapping the factors, so both nubar/nu and (N a)/lambda are +-1 mod 3.
By Step 1 the corresponding M has top row = +-(1, 0) mod 3, so M is in Gamma* (3 | B, parity) with A = +-1, and C5 Lemma 3* gives
B_1 o M = B_1 exactly (no phase). So psi(G) fixes z.

**Step 6 (generation; proves "only if" for non-idoneal m in the remaining cases).**
- Cubic: B_1^{(3)} is invariant exactly under Gamma_B = Gamma* cap {A = +-1 mod 3} (C5 Lemma 3*), index 12, and has divisor of degree 1
  (hm_out.txt: 12 cosets, one simple zero (at infinity), one simple pole; orders derived on the page in v2 item 2, exact rational arithmetic).
  So B_1^{(3)} is a Hauptmodul, j = R(B_1^{(3)}) with R in Q(X) (rational q-expansions), and j(tau_O) = R(z) (finite), so
  H_O = K(j(tau_O)) is inside K(z).
- Quintic, 5 | m: BR's p = U_1 U_2 is invariant under Gamma*_5 (numerically 1.5e-93 over 40 random elements, controls 0.96 and 0.81:
  hm2_out.txt; v1 said a proof was not yet written; v2 item 1 now proves it) and has divisor of degree 1
  on X(Gamma*_5) (18 cosets, one simple zero, one simple pole): a Hauptmodul, j = R(p). By BR Thm 4.2 (iv)-(v) (OPENED):
  B_1 + B_2 = p((p-1)^2 + 7), B_1 B_2 = p^5. At tau_O, p(tau_O) > 0 is the only common root of X^3 - 2X^2 + 8X - (z + z') and
  X^5 - z z' (another common root would be zeta p, zeta^5 = 1, zeta != 1, forcing the cubic's roots to be {p, zeta p, zetabar p}, hence
  p^2 = (p-1)^2 + 7, p = 4, and then the root sum 4(1 + 2 cos(2 pi k/5)) != 2: contradiction). z' = B_2(tau_O) is a conjugate of z inside the
  abelian extension K(z)/K. So p(tau_O) is in K(z) and H_O is inside K(z).
- Then for [a]^2 != 1, psi(sigma_a) restricted to H_O is the Artin symbol of [a]^{-2} != 1, so it moves z (z generates K(z) over K): not abelian.
  This finishes the cubic (m = 0, 2 mod 3, non-idoneal) and the quintic (5 | m, non-idoneal).

**Status (v1; superseded by v5 item 4: cubic and quintic laws PROVED (AI-refereed)).** Theorem W: cubic PROVED on the page; quintic PROVED on the page except one written step (Gamma*_5-invariance of p, checked
numerically to 1e-93; proof = the C5 Lemma 3* phase computation for the product g_{a_1} g_{a_2}/g_{a_0}^2). Inherited citations: KSY25
Props 3.1/4.1, Lemma 7.3; KSY10 2.4(ii), (iii), (v); C5 Lemmas 0, 1, 3*, P (AI-refereed in C5); Kani Thms 6, 12; BR Thm 4.2. Real-count
formula (P4): proof sketch only (same three ingredients: psi(sigma) fixes z iff [a] in Cl[2] and the torus/sign part acts by +-1;
counting x in T1 against a/lambda gives Cl2 (l-1) or Cl2 (l-1)/2); not written line by line.

## 7. What is new vs Berndt-Rebak (and prior art)
- BR (OPENED, whole text read for definitions) evaluate many values but never discuss fields, Galois groups or abelianness; their
  final section names higher orders as the open direction. Everything in §§4-6 is outside their paper.
- A prior-art search (one web search, SNIPPET level: BR, Rebak 2023 arXiv:2112.11884, Kim-Rebak arXiv:2506.01181 abstracts) found no
  Galois classification of these pieces. Not a full literature check (no scout seat yet).
- Classical inputs used, not claimed: Weber/Kani idoneal criterion for j; ray class fields and Shimura reciprocity (KSY25).
- New here (one seat, unrefereed): the wall itself (idoneal + "l | m or l = 3 split"), the explanation of why it differs from C5
  (one sign instead of a sign vector), the torus obstruction with an explicit separation lemma, the Hauptmodul generation steps,
  the real-conjugate count, and the corollaries for BR's tables (their Entry-1.1 analogues abelian only at n = 1, 5 cubic / n = 1 quintic
  among odd n, for the theta pieces u^l; their p-values at odd n only at n = 1/3, 1, 5 cubic / 1/5, 1 quintic). [v2]
- Echo: RESULT-V1 found the cubic continued fraction (level 6) abelian exactly at n in {1, 2, 5, 8}, "idoneal and n = 2 mod 3" — the same
  split-torus condition. That is a pattern across families, worth one line in the guide.
  **CORRECTION (2026-10-28, vector G, vectors/vG_level/RESULT-G1.md §3):** the bullet above misquotes RESULT-V1. {1, 2, 5, 8} was RESULT-V1's
  SEALED PREDICTION P3b, and it FAILED (RESULT-V1 §4 verdict table, line 122: "observed {2, 8}; 1 and 5 are not abelian"). The observed
  list among n <= 60 is **{2, 8}**: G(e^{-pi sqrt 2}) = (sqrt 6 - 2)/2 (degree 2, group Z/2) and n = 8 (8x^4 - 16x^3 - 12x^2 + 20x - 1, Z/2 x Z/2);
  at n = 1 the minimal polynomial 2x^4 + 8x^3 + 2x - 1 has only 2 of 4 real roots, and at n = 5 not all conjugates are real, so by (L3) neither
  is abelian (RESULT-V1 F2 table). {2, 8} is right because it is the computed result with exact real-root counts; {1, 2, 5, 8} was the guess.
  So the cubic continued fraction does NOT follow the split-torus pattern alone; its 2-part (and the unit group at n = 1) must also act.

## 8. Ceiling and next strike
Ceiling: the Galois half of Ramanujan's cubic/quintic/septic theories in one statement: septic (level = point) has a sign-vector wall
(prime powers); fixed level l has a torus wall (l | m, or split with trivial norm-one torus). The natural general form for any odd
prime level l: abelian iff m idoneal and the norm-one torus of (O/lO)^* acts by +-1 on the characteristic, i.e. l | m (or l = 3 split);
for l >= 7 the split torus has order l - 1 >= 6, so only l | m should survive. That is a prediction for the ninth-degree (Kim-Rebak)
and septic-at-other-points pieces, not tested.
Next strike: (1) write the Gamma*_5 invariance of p on the page (C5 Lemma 3* style) and send §6 to a independent AI reviewer; (2) open Weinberger
1973 (or Kani's statement of it) for the list-completeness sentence; (3) sealed test of the general-l prediction at l = 7 (B and W at
odd m <= 49), which needs only wall.gp with l = 7; (4) a prior-art scout on "abelian" + class-invariant quotients G_n/G_{l^2 n}.

## v2 — referee fixes (referee-w1-seatB-reply.md: cubic ACCEPTED WITH FIXES, quintic NOT A PROOF). Superseding where they conflict.
v1 kept as RESULT-W1-v1.md.
1. **Quintic invariance of p, proved without a multiplier computation.** S := B_1 + B_2 and V := B_1 B_2 are Gamma*_5-invariant
   (C5 Lemma 3*: B_k o M = B_{kA}, and {A, 2A} = {+-1, +-2} mod 5). BR Thm 4.2(iv)-(v) (OPENED): p is a common root of
   F = X^3 - 2X^2 + 8X - S and X^5 - V. Over the function field C(S, V): a second common root would be zeta p, zeta^5 = 1, zeta != 1, and
   F(zeta p) = F(p) gives (zeta^3 - 1)p^2 - 2(zeta^2 - 1)p + 8(zeta - 1) = 0, a nonzero polynomial equation over C, so p would be constant;
   false (p = 4 q^{1/10} + ...). p is a simple root of X^5 - V (5p^4 != 0). So gcd(F, X^5 - V) in C(S,V)[X] is X - p, hence p is in
   C(S, V) and is Gamma*_5-invariant. (The float check 1.5e-93 in hm2_out.txt is now only a confirmation.)
2. **Orders at cusps, on the page (replaces "KSY10 2.4(v)", not found in the opened text).** From KSY10 (1.3), for 0 <= r1 < 1, r not in Z^2:
   every factor (1 - q^n q_z), (1 - q^n/q_z), n >= 1, and (1 - q_z) (r1 > 0, or r1 = 0 with r2 not in Z) is 1 + o(1) or a nonzero constant,
   so ord_q g_r = B2(r1)/2. Hence ord_q(B_1 o g) = (l/2)(B2<x1> - B2<x0>) and ord_q(p o g) = (B2<x1> + B2<x2> - 2 B2<x0>)/2, x_k = first
   coordinate of a_k g. Divisors (div3_out.txt, div5_out.txt; exact rationals; cosets = Gamma\SL2(Z) via the characteristic pairs):
   - B_1^{(3)} on X(Gamma_B), index 12: cusp infinity = 6 cosets T^k, ord 1/6 each -> zero of order 1; cusp 1 = 3 cosets [1,k;1,k+1],
     ord -1/3 each -> pole of order 1; all other cosets ord 0. Degree 1.
   - p on X(Gamma*_5), index 18: cusp infinity = 10 cosets, ord 1/10 each -> +1; cusp 1 = 5 cosets, ord -1/5 each -> -1. Degree 1.
   A degree-1 function on a compact Riemann surface makes it genus 0 and generates its function field; j lies in it, with a rational
   function R over Q (rational q-expansions). So H_O is inside K(z) in both cases (§6 Step 6, rest unchanged). **Quintic: closed on the page.**
3. **Lemma S, rigorous form.** Each quantity is a sum of positive terms; at y = sqrt3, 100-digit evaluation, |n| <= 40, truncation
   error < 1e-3000; margins L0 - U_{1/3} = 0.356, L0 - U_{1/5} = 0.156, L0 - U_{2/5} = 0.432, L1 - U_{2/5} = 0.214, far above any
   rounding. Monotonicity for y >= sqrt3: U_a (a in (0, 1/2]) decreases termwise; L0 increases; U_{2/5} e^{pi y/25} = sum e^{-pi y((n+2/5)^2 - 1/25)}
   decreases (all exponents >= 3/25 > 0) and L1 e^{pi y/25} = 1 - sum_{n != 0} e^{-pi y((n+1/5)^2 - 1/25)} increases (exponents > 0), so
   U_{2/5}/L1 decreases. No spot check needed.
4. **Step 1 precision.** The top-row congruence holds mod 4l because det M = 1 (each entry differs by a factor 1 - a a'). Ray classes: if
   mu = nu/nubar mod 4l O then mu nubar nu^{-1} = 1 mod 4l, so (mu)^{-1} and (nubar)(nu)^{-1} are the same class in C_{4l}(O). A primitive mu
   with prescribed residues (d1, d3) mod 4l exists because N(mu) prime to 4l makes (d1, d3) primitive mod 4l, and primitive vectors mod N
   lift to coprime pairs (standard; SL2(Z) -> SL2(Z/N) onto, as used in C5 §2).
5. **Inherited, stated as such.** (L2) and psi(sigma_[a]) = sigma_[abar a^{-1}] are RESULT-V1 (L1, L2, S1), built on KSY25 Lemma 7.3; not in
   Lemma 7.3 itself. C5 Lemmas 0, 1, 3*, P are cited from C5-proof-v3 (AI-refereed there). Idoneal <=> Cl(-4n) elementary 2: Kani Rem 7(b)
   via Thm 32's proof (referee's reading).
6. **Status v2.** Theorem W (odd m >= 3): cubic PROVED (fixes applied); quintic PROVED on the page (item 1-2), awaiting a second referee
   round. Real-count formula: still a sketch. Explicit lists: complete except possibly one odd squarefree m > 1848.

## v3 — referee round 2 (referee-w1b-seatB-reply.md: cubic ACCEPTED WITH FIXES, quintic NOT A PROOF). v2 kept above; v3 supersedes v2 items 1-2.
1. **The multiplier is 1 (C5 Lemma 3* quoted verbatim).** C5-proof-v3.md line 102: "**Lemma 3\*.** For M in Gamma* and 1 <= k <= m:
   **B_k ∘ M = B_{kA}** (index mod n, read up to sign by Lemma 0)." Gamma* (C5 §2): "M = [A, B; C, D] in SL2(Z) with **n | B** and
   **A + C, B + D both odd**". Its proof (C5 §2, Steps 1-2) writes, for every such M and every k, "**B_k∘M = i^E B_{k′}**" (line ~126,
   k′ = kA mod n) with the exact integer E of line 128, and proves "E ≡ 0 (mod 4)" for Class I* and Class II* and their products
   (lines 136-192: "So **B_k∘M = B_{kA}**. ∎"). Lemma 3* is a statement about functions on H with n odd only; the CM point never enters.
   With n = 5 (C5's own p = 5 case), Gamma*_5 is exactly our group, and the multiplier of B_k o M is i^E = 1 for every M in Gamma*_5
   and k = 1, 2. Since {A, 2A} = {+-1, +-2} mod 5 and B_{-k} = B_k, B_{k+5} = B_k (C5 Lemma 0), M permutes {B_1, B_2}:
   **S = B_1 + B_2 and V = B_1 B_2 are Gamma*_5-invariant.**
2. **p is in C(S, V)** (referee's repair, written). V = p^5 and p is non-constant, so [C(p) : C(V)] = 5. S = p((p-1)^2 + 7) is in C(p).
   If S were in C(V), it would be fixed by p -> zeta p (zeta^5 = 1, zeta != 1), which fixes C(V); but
   S(zeta p) - S(p) = (zeta - 1) p [(zeta^2 + zeta + 1) p^2 - 2(zeta + 1) p + 8], and zeta^2 + zeta + 1 != 0, so this is not the zero function.
   Hence C(V) < C(S, V) <= C(p); degree 5 is prime, so C(S, V) = C(p). **p is Gamma*_5-invariant.** (Float check hm2_out.txt: confirmation only.)
3. **B_2(i sqrt m) is a K-conjugate of B_1(i sqrt m) for every odd m (in particular 5 | m).** Take the rational ideal 7O (N = 49, prime to 20).
   C5 Lemma P step 5 with level 5 and tau_O = i sqrt m: mu = m' - 20 sqrt -m, 7 m' = 1 mod 20, is primitive with N(mu) = m'^2 + 400 m prime
   to 20 and mu = m' mod 20, so [7O] = [mu^{-1} O]. For mu = d1 - d3 sqrt -m with d3 = 20, Step 1 (v1 §6) gives M with top row
   a'(d1, -m d3) = (A, 0) mod 5, A = d1^{-1} = 7 = 2 mod 5; M is in Gamma*_5 (5 | B since 5 | d3; parity from N(mu) odd). Lemma 3*:
   rho([7O])(B_1(tau_O)) = B_1(M tau_O) = B_2(tau_O). This uses only 5 | d3, not 5 | m. K(z) is inside K_{O,20}, abelian over K, so K(z)/K is
   Galois and z' = B_2(tau_O) lies in K(z). Then v1 §6 Step 6 (pointwise gcd: p(tau_O) is the only common root) puts p(tau_O) in K(z).
4. **Divisor rows on the page** (div3_out.txt, div5_out.txt; ord_q per coset representative g, all others 0):
   - B_1^{(3)}, 12 cosets: g = [1,k;0,1], k = 0..5: ord 1/6 each (cusp infinity, width 6: zero of order 1); g = [1,k;1,k+1], k = 0..2:
     ord -1/3 each (cusp 1, width 3: pole of order 1); the other 3 cosets: 0. Degree 1.
   - p on X(Gamma*_5), 18 cosets: g = [1,k;0,1], k = 0..9: ord 1/10 each (cusp infinity, width 10: +1); g = [1,k;1,k+1], k = 0..4: ord -1/5 each
     (cusp 1, width 5: -1); the other 3 cosets: 0. Degree 1.
   Check of the identity row (cubic): a_1 = (5/6, 1/2), a_0 = (1/2, 1/2): (3/2)(B2(5/6) - B2(1/2)) = (3/2)((25/36 - 5/6) - (1/4 - 1/2)) = (3/2)(1/9) = 1/6.
   Quintic identity row: x1 = 7/10, x2 = 9/10, x0 = 1/2: (B2(7/10) + B2(9/10) - 2 B2(1/2))/2 = (-21/100 - 9/100 + 1/2)/2 = 1/10.
5. **Status v3.** Quintic chain now on the page: invariance (1-2) -> Hauptmodul p (4) -> j = R(p) -> p(tau_O) in K(z) (3) -> H_O in K(z) ->
   non-idoneal 5 | m not abelian. Awaiting referee round 3. Cubic: fixes applied (divisor rows now on page).

## v4 — referee round 3 (referee-w1c-seatB-reply.md: cubic ACCEPTED WITH FIXES, quintic NOT A PROOF). v3 kept; v4 supersedes v3 items 1 and 3.
1. **Conjugation B_1 -> B_2 for every odd m with 5 | m, with no ideal 7O.** Choose d1 = 13 (mod 20) and d1 = 1 modulo every prime of m other
   than 5 (CRT). Set d3 = 20, d4 = d1^{-1} mod 80 (a positive lift), d2 = (d1 d4 - 1)/20 (an integer, = 0 mod 4), mu = d1 - d3 sqrt -m,
   a = N(mu) = d1^2 + 400 m, b = 2(d1 d2 + 20 m d4), a' = a^{-1} mod 20, y = -a' b/2 mod 20 (KSY25 Prop 4.1), and
   **M = [A, B; C, D] = [d4 + 20y, d2 + y d1; 20, d1]**, det M = d1 d4 - 20 d2 = 1.
   - a = d1^2 (mod 20) and a = d1^2 (mod each prime of m), so gcd(a, 20m) = 1; the conductor f of Z[sqrt -m] divides 2m, so a is prime to 20f.
     The form Q = (x^2 + m y^2) o [d1, d2; d3, d4] is primitive of discriminant -4m with first coefficient a, so its class lies in
     C_20(D) (KSY25 §3), and by Prop 4.1 its action sends B_1(tau_O) to B_1(M tau_O) (v1 §6 Step 1; rational coefficients).
   - **M = I (mod 4):** d1 = 1, d4 = d1^{-1} = 1, d2 = 0 (mod 4); b/2 = d1 d2 + 20 m d4 = 0 (mod 4), so y = 0 (mod 4); hence A = 1, B = 0,
     C = 0, D = 1 (mod 4). **5 | B:** mod 5, a = d1^2, a' = d1^{-2}, y = -d1^{-2} d1 d2 = -d2/d1, so B = d2 - d2 = 0. **A = d4 = d1^{-1} = 2 (mod 5).**
   - So M is in Class I* of C5 Lemma 3* with n = 5 (quoted in full in the Appendix below). With k = 1, k' = 2 (k' = kA mod 5) the exponent is
     E = -(k-k') + 2(s1 s2 + s1 + s2) - n s1 + (n+2k') s2 - 2(c1 c2 + c1 + c2) + n(c1 - c2),
     s1 = ((n+2k)A + nC - n - 2k')/2n, s2 = ((n+2k)B + nD - n)/2n, c1 = (A+C-1)/2, c2 = (B+D-1)/2,
     and B_1 o M = i^E B_2. Writing A = 1 + 4alpha, C = 4kappa, D = 1 + 4delta, B = 20beta (4 | B and 5 | B), the Class I* computation gives
     **E ≡ 4(beta + delta) ≡ 0 (mod 4)** (a congruence, not an equality; e.g. E = 96440 below), so B_1(M tau_O) = B_2(tau_O) exactly. Hence z' = B_2(tau_O) is a K-conjugate of z, and lies in K(z)
     (K(z) is inside K_{O,20}, abelian over K). Uniform in m; 7 | m causes no problem.
   - **Numerical confirmation** (v4.gp / v4_out.txt, 120 digits): m = 245 and m = 35 (d1 = 113, M = [177, 1000; 20, 113], E = 96440),
     m = 1225 (same M), m = 5, 15 (d1 = 13, M = [277, 180; 20, 13], E = 25792), m = 105 (d1 = 253, M = [117, 1480; 20, 253], E = 100360):
     every M has det 1, M = I mod 4, A = 2 and B = 0 mod 5, E = 0 mod 4, gcd(a, 20m) = 1, and |B_1(M i sqrt m) - B_2(i sqrt m)|/|B_2| <= 1e-128.
2. **Permutation of {B_1, B_2}, corrected wording.** For M in Gamma*_5 (Lemma 3*, multiplier 1): A = +-1 gives (B_1, B_2) -> (B_1, B_2) since
   B_{-1} = B_1, B_{-2} = B_2; A = +-2 gives (B_1, B_2) -> (B_2, B_4) = (B_2, B_1) since B_4 = B_{-1} = B_1 (C5 Lemma 0, quoted in the Appendix).
   v3's "{A, 2A} = {+-1, +-2}" was wrong as a set identity; the statement meant is this one. S and V are invariant.
3. **Notation clash.** In the quoted C5 text, "m" is C5's (n-1)/2 (the number of pieces), not our m; there n = 5 means "1 <= k <= 2".
4. **Zero-order cosets named** (div3all_out.txt, div5all_out.txt; matrices mod 2l). Cubic B_1^{(3)}: [0,1;5,0], [0,1;5,1], [3,1;5,0] (ord 0).
   Quintic p: [0,1;9,0], [0,1;9,1], [5,1;9,0] (ord 0). Hand check of [0,1;5,0] (cubic): a_1 g = (5/2, 5/6), a_0 g = (5/2, 1/2), both first
   coordinates have fractional part 1/2, so ord = 0. Index 12 resp. 18 is the coset count from the characteristic pairs (rows 12 + 18 listed).
5. **Status v4.** Quintic chain: Lemma 3* (quoted, n = 5) -> S, V invariant -> p in C(S, V) (v3 item 2) -> p a Hauptmodul of Gamma*_5 (divisor
   rows complete) -> j = R(p) -> p(tau_O) in Q(z, z') with z' in K(z) (item 1) -> H_O in K(z). Awaiting referee round 4.

### Appendix — C5 Lemmas 0, 1, Gamma*, Lemma 3* quoted verbatim (veins/v23/C5-proof-v3.md lines 43-192; there "n" is the level, "m" = (n-1)/2)
> - **[KSY10]** Koo-Shin-Yoon, arXiv:1008.0473. **OPENED this session** (ar5iv HTML), short quotes:
>   - (1.3): "g_{(r_1,r_2)}(τ) = −q^{½B₂(r₁)} e^{πir₂(r₁−1)}(1−q_z) ∏ (1−q^n q_z)(1−q^n q_z^{-1})", with q_z = e^{2πiz}, z = r₁τ + r₂,
>     and B₂(x) = x² − x + 1/6.
>   - Prop 2.4(ii): g_r∘γ = ε g_{rγ}, with "ε a 12th root of unity (depending on γ)", i.e. on γ only, not on r.
>   - Prop 2.4(iii): for s in Z², g_{r+s} = (−1)^{s₁s₂+s₁+s₂} e^{−πi(s₁r₂−s₂r₁)} g_r.
>   - Prop 2.4(v): ord_q g_r = ½B₂(⟨r₁⟩).
>   - Prop 2.2(iii): g_r holomorphic, no zeros or poles on H.
> - **[JTP]** Jacobi triple product (Wikipedia, opened by the v5.1 seat): Π_{m>=1}(1−x^{2m})(1+x^{2m−1}y²)(1+x^{2m−1}y^{−2}) = Σ x^{n²}y^{2n}.
> - **[Kani]** Ann. Sci. Math. Québec 35 (2011). **OPENED** (RESULT-V23): Thm 6 / Rem 7(b), Thm 12, Thm 32.
> - Lab lemmas, with the "only n odd is used" audit stated where used: v4 Lemma 4′; v5.1 Lemmas A, B, B′, C, Prop D, E/E′, the
>   C4 list form.
> 
> Notation:
> - n odd >= 3; D = -4n; O = Z[sqrt -n]; tau_O = i sqrt n (b_O = 0, c_O = n); K = Q(sqrt -n); H_O = K(j(tau_O)) = K_{O,1}.
> - N := 4n; L := K_{O,4n}; G := Gal(L/K).
> - For nu = t + s sqrt -n in O, **t(nu) := t mod n**. This is a ring homomorphism O -> Z/n, because (sqrt -n)^2 = -n = 0 mod n.
>   It extends multiplicatively to elements of norm prime to n. Also t(nu bar) = t(nu).
> - theta[a](τ) = Σ_{j in Z} e^{πiτ(j+a)²}, and B_x := (2 theta[x/n]/theta[0])^n for any integer x with n ∤ x.
> - a_x := ((n+2x)/2n, 1/2), and a_0 := (1/2, 1/2).
> 
> **Lemma 0 (on the page).** theta[a+1] = theta[a] and theta[-a] = theta[a]. Hence **B_{x+n} = B_x and B_{-x} = B_x**, so B_x
> depends only on ±x mod n.
> 
> *Proof.*
> - Substituting j -> j - 1 in the sum gives theta[a+1](τ) = Σ e^{πiτ(j+1+a)²} = Σ e^{πiτ(j+a)²}.
> - theta[-a](τ) = Σ_j e^{πiτ(j-a)²}. Substituting j -> -j turns this into Σ_j e^{πiτ(-j-a)²} = Σ_j e^{πiτ(j+a)²} = theta[a](τ).
> - Both sums converge absolutely for Im τ > 0. ∎
> 
> **Lemma 1 (Siegel form, on the page).** For an integer x with n ∤ x: **B_x = 2^n (−i)^x (g_{a_x}/g_{a_0})^n.**
> 
> *Proof.*
> 1. [JTP] with x_J = q^{1/2} and y² = q^a (q = e^{2πiτ}) gives theta[a] = q^{a²/2} Π_{j>=1}(1−q^j)(1+q^{j−1/2+a})(1+q^{j−1/2−a}).
> 2. In (1.3) take r = (a+½, ½). Then q_z = e^{2πi((a+½)τ+½)} = −q^{a+½}, and ½B₂(a+½) = ½(a² − 1/12). Hence
>    g_{(a+½,½)} = −e^{πi(a/2 − 1/4)} q^{a²/2 − 1/24} Π_{j>=1}(1+q^{j−1/2+a})(1+q^{j−1/2−a}).
>    (The factor (1−q_z) = (1+q^{a+½}) together with the product gives the two products shown, after re-indexing.)
> 3. Dividing the case a = x/n by the case a = 0 gives theta[x/n]/theta[0] = e^{−πix/2n} g_{a_x}/g_{a_0}.
> 4. Raise to the n-th power and multiply by 2^n. ∎
> 
> (This is v4 Lemma 1 with p -> n. v4 checked it analytically to >= 269 digits.)
> 
> ---
> 
> ## 1. Level (referee step 1): B_k in F_{4n}
> 1. *q-expansion.* By [JTP], B_k = 2^n q^{k²/2n} Π_{j>=1}(1+q^{j−1/2+k/n})^n (1+q^{j−1/2−k/n})^n (1+q^{j−1/2})^{−2n}.
>    All exponents lie in (1/2n)Z, all are positive since k < n/2, and the coefficients are integers.
> 2. *Meromorphy.* B_k is holomorphic on H, because g_{a_0} has no zeros there (KSY10 2.2(iii)).
>    At a cusp γ∞: by **2.4(ii)** (the move), B_k∘γ = 2^n (−i)^k (g_{a_kγ}/g_{a_0γ})^n, the ε(γ) cancelling in the ratio.
>    Each g_r has a q-expansion of finite order ((1.3), and 2.4(v)), so B_k is meromorphic at every cusp.
> 3. *Γ(4n)-invariance.* This is the special case M ≡ I (mod 4n) of Lemma 3* Class I* below (A ≡ 1 mod n, so k′ = k).
>    The phase computation there uses **2.4(iii)**.
> 
> **Hence B_k is in F_{4n}** for 1 <= k <= m. Its coefficients are rational, so diag(1, d) acts trivially on it ([KSY25] §4).
> 
> ## 2. Transformation lemma (referee step 2): the multiplier is exactly 1
> Let **Gamma\*** be the set of M = [A, B; C, D] in SL2(Z) with **n | B** and **A + C, B + D both odd**, i.e. (1,1)M = (1,1) mod 2.
> Gamma* is a group. Both conditions are preserved under products and inverses:
> - n | B is the subgroup Γ^0(n);
> - the second condition is the stabiliser of the row vector (1,1) mod 2.
> 
> **Lemma 3\*.** For M in Gamma* and 1 <= k <= m: **B_k ∘ M = B_{kA}** (index mod n, read up to sign by Lemma 0).
> Note that A is invertible mod n (AD ≡ 1 mod n, because n | B), so n ∤ kA.
> 
> **Step 1: the exponent E, on the page.** Let k′ in [1, n) with k′ ≡ kA (mod n). Define
> - s1 := ((n+2k)A + nC − n − 2k′)/2n,
> - s2 := ((n+2k)B + nD − n)/2n,
> - c1 := (A+C−1)/2,
> - c2 := (B+D−1)/2.
> 
> These are integers:
> - c1 and c2: A+C and B+D are odd.
> - s1: the numerator is ≡ A + C − 1 ≡ 0 (mod 2), and ≡ 2(kA − k′) ≡ 0 (mod n); gcd(2, n) = 1.
> - s2: the numerator is ≡ B + D − 1 ≡ 0 (mod 2), and ≡ 2kB ≡ 0 (mod n).
> 
> By direct multiplication, a_k M = a_{k′} + (s1, s2) and a_0 M = a_0 + (c1, c2).
> 
> By Lemma 1 and **2.4(ii)** (ε depends only on M, so it cancels):
> - B_k∘M = 2^n (−i)^k (g_{a_{k′}+(s1,s2)} / g_{a_0+(c1,c2)})^n.
> 
> By **2.4(iii)**, with r = a_{k′} = ((n+2k′)/2n, ½) and r = a_0 = (½, ½):
> - g_{a_{k′}+s} = (−1)^{s1s2+s1+s2} e^{−πi(s1/2 − s2(n+2k′)/2n)} g_{a_{k′}};
> - g_{a_0+c} = (−1)^{c1c2+c1+c2} e^{−πi(c1/2 − c2/2)} g_{a_0}.
> 
> Raise to the n-th power, using n odd so that (−1)^{nX} = (−1)^X = i^{2X}. Then use (−i)^k = (−i)^{k′} i^{−(k−k′)} and Lemma 1 for
> B_{k′}. This gives **B_k∘M = i^E B_{k′}**, with
> 
> E = −(k−k′) + 2(s1s2+s1+s2) − n s1 + (n+2k′) s2 − 2(c1c2+c1+c2) + n(c1 − c2).
> 
> **Step 2: reduction to two classes.**
> - SL2(Z) → SL2(Z/4n) is onto ([KSY25] §4 uses "any lift").
> - By CRT write M ≡ M_a M_b (mod 4n), where M_a ≡ M (mod 4), M_a ≡ I (mod n), and M_b ≡ I (mod 4), M_b ≡ M (mod n). Lift both
>   to SL2(Z); then M = M_a M_b γ with γ ≡ I (mod 4n).
> - All three factors lie in Gamma*. M_a, M_b and γ each satisfy n | B; mod 2 they are M, I and I respectively.
> - (f∘XY)(τ) = (f∘X)(Yτ), so B_k∘M = ((B_k∘M_a)∘M_b)∘γ.
> - So it suffices to prove E ≡ 0 (mod 4) for **Class II\*** (M ≡ I mod n) and **Class I\*** (M ≡ I mod 4). γ is in Class I*.
> 
> **Class I\* (M ≡ I mod 4, n | B, so B = 4nβ).**
> - Write A = 1+4α, C = 4κ, D = 1+4δ; k′ ≡ kA (mod n). Then exactly:
>   - c1 = 2(α+κ) and c2 = 2(nβ+δ);
>   - s2 = 2((n+2k)β + δ);
>   - n s1 = (k−k′) + 2(n+2k)α + 2nκ, so s1 ≡ k − k′ (mod 2) since n is odd.
> - Mod 4, term by term:
>   - −(k−k′);
>   - 2(s1s2+s1+s2) ≡ 2s1 ≡ 2(k−k′), since s2 is even;
>   - −n s1 ≡ −(k−k′) − 2α − 2κ, using −n s1 = −(k−k′) − 2(n+2k)α − 2nκ and n odd;
>   - (n+2k′)s2 ≡ 2(β+δ);
>   - −2(c1c2+c1+c2) ≡ 0;
>   - n(c1−c2) = 2n(α+κ−nβ−δ) ≡ 2(α+κ+β+δ).
> - **Sum ≡ 4(β+δ) ≡ 0.** ∎
> 
> **Class II\* (M = I + nM′, M′ integral).**
> - Then k′ = k, s1 = c1 + kM′11, s2 = c2 + kM′12, c1 = nu, c2 = nv, with u := (M′11+M′21)/2 and v := (M′12+M′22)/2.
>   u and v are integers, because A+C = 1 + n(M′11+M′21) (n odd) is odd exactly when M′11+M′21 is even, and likewise for
>   M′12+M′22. (Referee round 3 fix: v3 first wrote "2 + n(...)", which was false.)
> - Substituting, the n c terms cancel exactly in −n s1 + (n+2k)s2 + n(c1−c2), leaving nk(M′12 − M′11) + 2k s2. Writing
>   Δ := (s1+1)(s2+1) − (c1+1)(c2+1):
> 
>   **E = 2Δ + nk(M′12 − M′11) + 2k s2**, an exact integer identity.
> - E mod 4 involves u and v only through their parities: 2Δ mod 4 needs Δ mod 2, and 2k s2 mod 4 needs k s2 mod 2.
>   The denominator 2 is gone: u and v are integers.
> 
> *Parity of M′.*
> - From Gamma*: M′11 ≡ M′21 and M′12 ≡ M′22 (mod 2).
> - From det M = 1: (1+nM′11)(1+nM′22) = 1 + n²M′12M′21, i.e. **M′11 + M′22 + n(M′11M′22 − M′12M′21) = 0** (♦).
> - Mod 2, (♦) gives M′11 + M′22 ≡ 0, because M′11M′22 − M′12M′21 ≡ M′11M′12 − M′12M′11 = 0.
> - So **all four M′ij have the same parity e**.
> 
> *Case e = 0 (all even).*
> - s1 ≡ c1 ≡ u and s2 ≡ c2 ≡ v (mod 2), so Δ ≡ 0 and 2Δ ≡ 0 (mod 4).
> - 2k s2 = 2knv + 2k²M′12 ≡ kn(M′12 + M′22) (mod 4), since M′12 is even and 2v = M′12 + M′22.
> - So E ≡ kn(2M′12 + M′22 − M′11) (mod 4).
> - 2M′12 ≡ 0 (mod 4).
> - By (♦), M′11 + M′22 = −n(M′11M′22 − M′12M′21) ≡ 0 (mod 4) (products of even numbers). So M′22 − M′11 ≡ −2M′11 ≡ 0 (mod 4).
> - **Hence E ≡ 0.**
> 
> *Case e = 1 (all odd).*
> - The case occurs (referee round 3 witness): M′ = [1, 1; -1, -1] gives M = I + nM′ = [1+n, n; -n, 1-n], det M = 1, A+C = B+D = 1,
>   so M ∈ Gamma*. (det M′ is even; det M is not, since M = I + nM′.) At n = 3 the same pattern gives M = [4, 3; 21, 16].
> - Mod 2: c1 ≡ u, c2 ≡ v, s1 ≡ u + k, s2 ≡ v + k.
>   - If k is even, Δ ≡ 0.
>   - If k is odd, (s1+1)(s2+1) ≡ uv and (c1+1)(c2+1) ≡ uv + u + v + 1, so Δ ≡ u + v + 1.
>   - In both cases **2Δ ≡ 2k(u+v+1) (mod 4)**.
> - 2k s2 ≡ 2k(v + k) (mod 4), since k s2 = k(nv + kM′12) ≡ k(v + k) (mod 2).
> - nk(M′12 − M′11) ≡ 2k·(M′12 − M′11)/2 (mod 4). The difference is even, and n(·)/2 ≡ (·)/2 mod 2 for n odd.
> - Sum: E ≡ 2k(u + v + 1) + 2k(v + k) + 2k(M′12 − M′11)/2 ≡ 2k(1 + k) + 2k[u + (M′12 − M′11)/2] (mod 4), using 4kv ≡ 0.
> - 2k(1+k) ≡ 0, because k(k+1) is even. And u + (M′12 − M′11)/2 = (M′12 + M′21)/2. So **E ≡ k(M′12 + M′21) (mod 4)**.
> - Now use det M = 1 itself, not (♦) mod 2. In this case A = 1 + nM′11 and D = 1 + nM′22 are both even, so AD ≡ 0 (mod 4).
>   Since AD = 1 + n²M′12M′21, this gives n²M′12M′21 ≡ −1 (mod 4). As n² ≡ 1 (mod 8), M′12M′21 ≡ 3 (mod 4).
> - Two odd numbers with product ≡ 3 (mod 4) are ≡ 1 and 3 in some order. So **M′12 + M′21 ≡ 0 (mod 4)**, and **E ≡ 0**. ∎
> 
> Combining: B_k∘M_a = B_k, (B_k)∘M_b = B_{kA_b}, and B_{kA_b}∘γ = B_{kA_b}. Also A_b ≡ A (mod n). So **B_k∘M = B_{kA}**. ∎

## v5 — referee round 4 (referee-w1d-seatB-reply.md: quintic ACCEPTED WITH FIXES). Final fixes; v4 kept.
1. **From Prop 4.1 to B_1(M tau_O), on the page.** KSY25 (src/ksy25.pdf, OPENED): for gamma = [d1, d2; d3, d4] in SL2(Z), "we denote by
   gamma-hat = [d4, d2; d3, d1]", and **Lemma 7.4**: if Q in Q(D, 1) and gamma in SL2(Z), then -conj(omega_{Q^gamma}) = gamma-hat(-conj(omega_Q)).
   Here Q0 = x^2 + m y^2, -conj(omega_{Q0}) = tau_O = i sqrt m, gamma = [d1, d2; 20, d4], so **gamma-hat = [d4, d2; 20, d1]** and
   -conj(omega_Q) = gamma-hat(tau_O) for Q = Q0^gamma. Prop 4.1 sends B_1(tau_O) to B_1^{[1, y; 0, a']}(gamma-hat(tau_O)), y = -a'(b/2).
   As in **Example 8.1** ("Observe that r has rational Fourier coefficients"; r modular for Gamma(5)): B_1 has rational Fourier
   coefficients, so the diagonal factor [1, 0; 0, a'] acts trivially, and B_1 is in F_20, so the matrix may be replaced by any SL2(Z) lift
   modulo 20. The conjugate is therefore B_1(T^y gamma-hat tau_O) with **M = [1, y; 0, 1] gamma-hat = [d4 + 20y, d2 + y d1; 20, d1]**,
   the matrix of v4 item 1. Hence rho([Q])(B_1(tau_O)) = B_1(M tau_O) = B_2(tau_O).
2. **A-congruence modulus stated.** A = d4 + 20y = 1 (mod 4) and A = 2 (mod 5), i.e. **A = 17 (mod 20)**; the B_1 -> B_2 index uses A mod 5 only,
   the Class I* hypothesis uses M = I mod 4. Both hold (examples: 177, 277, 117 are all 17 mod 20).
3. **Cubic fixes: DONE** (Grube/Kani lists v2; Lemma S rigorous v2; cusp orders on page v2; divisor rows with zero cosets named v3-v4).
4. **Status: cubic and quintic laws PROVED (AI-refereed)** — Theorem W for odd m >= 3, both l = 3 and l = 5 (referee rounds 1-4).
   Still outside the theorem: the real-count formula (sketch); explicit lists complete except possibly one odd squarefree idoneal m > 1848
   (Kani Cor 23, Rem 24); even m (e.g. BR cubic n = 2, 8) undecided. Not read by an expert human.
