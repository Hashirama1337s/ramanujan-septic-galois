# RESULT-R1 — Rogers-Ramanujan values R(i sqrt n): abelian over Q only at n = 1, for every n (vector 3)
2026-10-28, vector-3 seat (restart; the first seat left no files). Sealed bar: BAR-R1.md
(sha256 fe2f44cce441010f5b70acacc870f1ebe2a3d9f58397f389ccff6e3eec0b53f6, LOG.md 06:38). Internal; nothing published.
The proof below is written by one seat and is NOT yet refereed.
**v2 (referee round 1, referee-r1-seatB-reply.md: ACCEPTED WITH FIXES).** Theorem R is proved for every n (AI-refereed once).
The v1 degree/real-count supplement was NOT PROVED as written. v1 put the diamond diag(1,d) on either side, and it claimed the
diamond fixes the coefficients of R o gamma'~. v2 puts the diamond on the side forced by KSY's rule (f^a)^b = f^{ab}, deletes
that claim, and checks the side on n = 2, nu = 1 + sqrt(-2), det 3 (diamond_out.txt). The repaired supplement is not re-refereed.
Lemma 6.1 is now cited only for form isotropy; the point stabiliser is computed directly. v1 is kept as RESULT-R1-v1.md.

## In plain words
Take Ramanujan's continued fraction R and evaluate it at q = e^{-2 pi sqrt n}. For n = 1 the value is a tidy number built
from cos(pi/10) and cos(pi/5), so it lives in a "commutative" (abelian) number field. The question was whether that ever
happens again. It does not, for any n >= 2. The reason fits in one line. Mirror reflection (complex conjugation) and a
specific symmetry of the value fail to commute: reflect-then-move gives a different number from move-then-reflect. The
symmetry comes from the number nu = 1 + sqrt(-n) (or 2 + sqrt(-n)). The failure is visible because R gives each point of
the level-5 modular curve exactly one value. So two different points cannot give the same value, and the commutator
really moves the number. At n = 1 the same symmetry is the fourth root of unity i. It fixes the point i, so the
obstruction disappears. The proof needs no table and no class-number list. A sealed test on 219 values (n = 1..200 and
every idoneal n up to 1848) agreed with every prediction except one bookkeeping clause: at n = 1848 the program's
certificate search hit its cap. Degree and real-root counts matched exactly everywhere. That R(i sqrt n) generates the
ray class field mod 5 was already known (Gee-Honsbeek 1999, Lemma 4.1). The abelian-over-Q classification was not found
in anything we opened.

## 1. Normalisation (as RESULT-V1, law.gp `RR`)
R(tau) = q^{1/5} prod_{k>=0} (1-q^{5k+1})(1-q^{5k+4}) / ((1-q^{5k+2})(1-q^{5k+3})), q = e^{2 pi i tau} (KSY25 (12); Gee-Honsbeek (1.1)).
z_n := R(i sqrt n) = R(q) at q = e^{-2 pi sqrt n} (= e^{-2 pi sqrt n/5}/(1 + e^{-2pi sqrt n}/(1 + ...))). O = Z[sqrt -n], D = -4n,
K = Q(sqrt -n), tau_O = i sqrt n, h = h(-4n) = number of reduced forms of discriminant -4n. "Abelian" = Q(z_n)/Q Galois with abelian group.

## 2. Statement
**Theorem R.** For every integer n >= 1, Q(z_n) is abelian over Q iff n = 1.
**Supplement (n >= 2)** [v2: NOT PROVED as packaged in v1 (referee). The repaired argument in sec. 6 v2 is not re-refereed.
Generation itself is prior art: GH Lemma 4.1.] K(z_n) = K_{O,5} (ray class field of O mod 5) and
deg_Q z_n = |C_5(O)| = h(-4n) * e(n), e(n) = |(O/5O)^*|/2 = 8 (n = 1, 4 mod 5), 10 (5 | n), 12 (n = 2, 3 mod 5).
The number of real Q-conjugates of z_n equals |Gal(K_{O,5}/K)^c| (elements commuting with complex conjugation): PROVED.
Closed form r(n) |Cl(O)[2]| with r(n) = 4 (5 does not divide n), 2 (5 | n): the A-part is PROVED; surjectivity onto Cl(O)[2]
is a SKETCH (sec. 6.4). Verified at all 218 sealed n >= 2.
n = 1: z_1 = sqrt((5+sqrt5)/2) - (1+sqrt5)/2 = 2cos(pi/10) - 2cos(pi/5), minimal polynomial x^4 + 2x^3 - 6x^2 - 2x + 1, group Z/4.

## 3. Table (outA.txt, outB.txt; one line per n in all_n.txt)
| range | values | abelian | degree = h e(n) | real roots = r(n) a2(n) | commutator moves z_n | certificate |
|---|---|---|---|---|---|---|
| n = 1 | 1 | ABELIAN (Z/4) | 4 | 4/4 | no: delta = S, fixes i | galoisinit + galoisisabelian |
| n = 2..200 | 199 | none | 199/199 | 199/199 | 199/199 | 199 non-Galois primes |
| idoneal 210..1848 | 19 | none | 19/19 | 19/19 | 19/19 | 18 primes; n = 1848: none within cap (see P1) |
Selected lines: n = 13: deg 24 = KSY25 Example 8.1 polynomial exactly; n = 200: h 12, deg 120, real 8; n = 840, 1320, 1365: h 16,
deg 160, real 32; n = 1848: h 16, deg 192, real 64. Largest degree 192. Minimum rounding margin 10^-133 (n = 163), minimum
|P(z)| at 2W 10^-310 (n = 7), witness value w matches a computed K-conjugate to >= 10^-152 (>= W/3 + 102 digits everywhere),
smallest relative move |w - z_n|/|z_n| = 5.6 (n = 2). Wall time: whole run < 3 min (largest single n: 9 s).

## 4. Verdicts as sealed (BAR-R1)
| item | verdict |
|---|---|
| P1 abelian only at n = 1; NOT ABELIAN **with a non-Galois prime certificate** at all 218 n >= 2 | **FAILED (clause)** at 1/218. Abelian only at n = 1: holds at all 219 values. 217/218 have a prime certificate. At n = 1848 the engine's search (300 good primes, inherited from law.gp `nongalois`) found none, and the verdict came from galoisinit refusing, which is not a certificate. POST HOC (posthoc_out.txt): unequal factor degrees are rare here. 15 of 2097 good primes below 20000 show the set {1,2}, and the first at or above 20000 is 22679. Also polsturm = 64 is neither 0 nor 192, which already rules out a Galois polynomial. Theorem R covers this case anyway. |
| P2 degree = |C_5(O)| = h e(n), all values distinct | **HOLDS** 218/218 |
| P3 real roots = r(n) a2(n) | **HOLDS** 218/218 |
| P4 commutator moves z_n; w equals a computed conjugate; two lifts agree | **HOLDS** 218/218 (in 15 cases the second lift differs from the first only by a translation by 5, so that sub-check is trivial there) |
| P5 positive control n = 1 | **HOLDS** (closed form to 10^-1117; algdep polynomial; Z/4; witness delta = [0,1;-1,0] = S fixes i, |w - z| = 0) |
| P6 KSY25 Ex 8.1; rounding >= 50 digits; |P(z)| at 2W <= 10^-100 | **HOLDS** (exact match; min 133; min 310) |
| N1 detector on j (level 1) must say "not moved" | **HOLDS** 5/5 (~10^-305) |
| N2 x^3 - 4x - 1 | **HOLDS** (NOT ABELIAN) |
| N3 z_13 perturbed by 10^-40 must fail the P(z) bar | **HOLDS** (10^-45 vs bar 10^-100) |
Run notes (no prediction changed): (i) a 4-value smoke run (smoke_out.txt) showed the sealed "second lift" could coincide with the first;
before the main run the second lift was changed to M1 * [1,0;5,1] (rr.gp; hash of the run version in run_hashes.txt). (ii) n <= 60 repeats
RESULT-V1 with the same engine (reproduction, not new evidence).

## 5. Sources (all OPENED this session or by the V1 seat from the saved file; locators)
- [KSY25] Koo-Shin-Yoon, arXiv:2506.14139v1 (veins/v1_law/src/ksy25.pdf / .txt). Used: intro eq. (1) (icosahedral equation
  A(x)^3 + j x^5 B(x)^5 = 0, A = x^20 - 228x^15 + 494x^10 + 228x^5 + 1, B = x^10 + 11x^5 - 1, quoting Duke Thm 1) and the sentence
  "a Hauptmodul for the principal congruence subgroup Gamma(5)" (p. 1); §2 (C_N(O), K_{O,N}, (ii) Artin iso, p. 3-4); §4 (F_N; actions:
  f^gamma = f o gamma~ for gamma in SL2(Z/N); diag(1,d) acts on coefficients by zeta_N -> zeta_N^d; the display
  K_{O,N} = K(f(tau_O) | f in F_N finite at tau_O); tau_O = sqrt D/2 for D = 0 mod 4; p. 5-6); **Prop 5.1** (Stevenhagen: W_{O,N}/T_{O,N}
  = Gal(K_{O,N}/H_O), [gamma] -> (f(tau_O) -> f^gamma(tau_O)), W_{O,N} = {[t - b_O s, -c_O s; s, t]}, T_{O,N} = image of O^*; p. 6-7);
  Rem 5.2(i) (|O^*| = 2 for D != -3, -4); Lemma 6.1 (isotropy {+-I} for D != -3, -4; p. 8); **Lemma 7.3** (K_{O,N}/Q Galois,
  Gal = Gal(K_{O,N}/K) x| <c>, c complex conjugation; p. 9); Example 8.1 (D = -52 polynomial).
- [GH] A. Gee, M. Honsbeek, "Singular values of the Rogers-Ramanujan continued fraction", KdVI preprint 1999 (UvA DARE
  hdl 11245/1.418851; src/gh/RogRam.ps, text RogRam_a.txt). Used: p. 3 (X(5) genus 0, "R is such a generator" of its function field);
  Thm 2.4 p. 6 (R generates F_5 over Q(zeta_5)); (3.1)-(3.4) p. 7 (1 -> O^* -> (O/NO)^* -> Gal(H_N/H_1) -> 1; Shimura reciprocity
  h(tau)^{x^-1} = h^{g_tau(x)}(tau)); **Lemma 4.1 p. 9 ("The class field H_5 is generated by R(tau) over K")**; Table 1 (minimal
  polynomials of R(sqrt -n), n = 1..16).
- Cais-Conrad, "Modular curves and Ramanujan's continued fraction" — abstract page only (archive.math.arizona.edu/cais/Papers/Preprints/
  J5_abstract.html): singular values "generate specific abelian extensions of imaginary quadratic fields"; real radical towers. Not over Q.
- arXiv API abstracts checked (not full text): 2610.18910 (Jha, Oct 2026: alternating RR singular values, D = -5n fundamental;
  degrees over Q, no abelian-over-Q classification), 2005.10377 and 2210.00659 (Morton; Akkarapakam-Morton: periodic points, values
  r(w_d/5)), 1506.08313 (Larson). Duke 2005 Bull. AMS itself NOT opened (AMS PDF returned 403); its two statements used here are taken
  from KSY25's quotation and from GH p. 3 / Thm 2.4.
- [v2] Opened by the referee (referee-r1-seatB-reply.md): Duke 2005 author text. Quotes: "r(tau) is analytic in H and has no zeros
  there"; "r one [Hauptmodul] for Gamma(5)", where a Hauptmodul is defined as having exactly one simple pole. Also Honsbeek thesis ch. 5,
  Lemma 129 = GH Lemma 4.1.
- STANDARD, not opened: F_1 = Q(j) (so H_O = K_{O,1} = K(j(tau_O)) by the KSY25 display with N = 1) — used only in the degree supplement.

## 6. Proof (one seat; unrefereed)
Notation: N = 5, W = W_{O,5}. For n >= 2, b_O = 0, c_O = n, so W = {g(t,s) := [t, -ns; s, t]} with t^2 + ns^2 != 0 mod 5, and
t + s tau_O -> g(t,s) is a ring isomorphism (O/5O)^* -> W (it is the matrix of multiplication by t + s tau_O on the basis (tau_O, 1):
(t + s tau)tau = t tau - ns, (t + s tau) 1 = s tau + t). T = {+-I} (Rem 5.2(i)). sigma_gamma := the image of [gamma] under KSY25 Prop 5.1.
R is in F_5: Gamma(5)-invariant (KSY25 p. 1; GH p. 3), expansion in q^{1/5} with integer coefficients. R has no poles in H, so
z = R(tau_O) is finite, and z is in K_{O,5} by the KSY25 §4 display. z is real (real coefficients, tau_O on the imaginary axis).

**Lemma 1 (conjugation).** For h in F_5 finite at tau_O, conj(h(tau_O)) = h^eps(tau_O), eps = diag(1,-1). Hence on K_{O,5}:
c sigma_gamma c = sigma_{eps gamma eps}, and eps g(t,s) eps = g(t,-s) <-> conj(t + s tau_O).
Proof. h = sum c_m q^{m/5}: conj h(tau_O) = sum conj(c_m) e^{2 pi i (-conj tau_O) m/5} = h^eps(-conj tau_O) = h^eps(tau_O), since diag(1,-1)
conjugates the coefficients (KSY25 §4, d = -1) and -conj(i sqrt n) = i sqrt n. Then c sigma_gamma c (f(tau_O)) = c((f^eps)^gamma(tau_O)) =
f^{eps gamma eps}(tau_O) (eps gamma eps is the same for a left or a right action). Both sides fix K. They agree on the f(tau_O), which
generate K_{O,5} over K. []

**Lemma 2 (freeness).** If n >= 2, gamma~ in SL2(Z) and R(gamma~ tau_O) = R(tau_O), then gamma~ is in +-Gamma(5).
Proof. R generates the function field of X(5), which has genus 0 (GH p. 3, Thm 2.4; KSY25 p. 1 "Hauptmodul for Gamma(5)"). So R has
degree 1 on X(5) and is injective on Gamma(5)\H. Hence gamma~ tau_O = beta tau_O for some beta in Gamma(5), and beta^{-1} gamma~ fixes tau_O.
The stabiliser of i sqrt n in SL2(Z) is {+-I} for n >= 2 [v2: computed directly here; KSY25 Lemma 6.1 is about the isotropy of
a form, not of the point]: [a,b;c,d] fixes i sqrt n iff d = a, b = -cn,
and a^2 + c^2 n = 1, so c = 0 and a = +-1. []

**Proof of Theorem R, n >= 2.** Take x = 1, or x = 2 if 5 | 1 + n, so N(nu) = x^2 + n is prime to 5. Put nu = x + tau_O and gamma = g(x, 1).
By Lemma 1 and Prop 5.1 (a homomorphism; W is abelian), the commutator c sigma_gamma c^{-1} sigma_gamma^{-1} = sigma_delta with
delta = eps gamma eps gamma^{-1} <-> nubar/nu. det delta = N(nubar)/N(nu) = 1, so delta is in SL2(Z/5), and R^delta = R o delta~ for any lift
delta~ (KSY25 §4). Hence sigma_delta(z) = R(delta~ tau_O). Suppose this equals z. Then delta = +-I by Lemma 2, so nubar = +-nu in O/5O.
But nubar - nu = -2 tau_O and nubar + nu = 2x, and neither is in 5O. So sigma_delta(z) != z. K_{O,5}/Q is Galois (Lemma 7.3) and contains z.
If Q(z)/Q were abelian, restriction Gal(K_{O,5}/Q) -> Gal(Q(z)/Q) would kill every commutator, and sigma_delta would fix z.
Contradiction: Q(z_n) is not abelian over Q. []

**n = 1** (D = -4, O = Z[i], h = 1, T = {+-1, +-i}). G := Gal(K_{O,5}/K) = W/T (Prop 5.1, H_O = K). For every sigma_gamma, gamma <-> nu,
Lemma 1 gives [c, sigma_gamma] = sigma_delta with delta <-> nubar/nu, which has norm 1. Since 5 = (2+i)(2-i) splits, (O/5O)^* = F_5^* x F_5^*
and its norm-one subgroup {(u, u^{-1})} has order 4. It contains the 4 distinct classes of {+-1, +-i}, so it equals T, and sigma_delta = 1.
Gal(K_{O,5}/Q) = G x| <c> with G abelian and all [c, g] trivial, so it is abelian, and so is every subfield, in particular Q(z_1). []
(Control, not needed for the proof: z_1 = 2cos(pi/10) - 2cos(pi/5), in Q(zeta_20)^+, matches to 10^-1117.)
Where the mechanism lives: the obstruction group is the norm-one torus of (O/5O)^* modulo the global units. It has order 4, 5 or 6
(5 | n: {+-1 + u eps}/+-1; split; inert) for n >= 2, and order 1 at n = 1.
This is the RESULT-W1 torus with the level frozen at 5. Unlike the theta pieces there, R has trivial stabiliser in SL2(Z/5)/+-1
(Hauptmodul), so no n >= 2 escapes. RESULT-V1 L5 had already derived the step "generation => non-abelian" (POST HOC, conditional).
Lemmas 1-2 make it unconditional: they need only freeness of the Gamma(5)-action, not generation.

**Degree supplement (n >= 2), v2.** (a) If sigma_gamma (gamma in W) fixes z, then sigma_gamma = 1. Let d = det gamma and
gamma' := diag(1,d)^{-1} gamma, which is in SL2(Z/5). Then gamma = diag(1,d) gamma', and by KSY's rule (f^a)^b = f^{ab}:
R^gamma = (R^{diag(1,d)})^{gamma'} = R^{gamma'} = R o gamma'~.
This uses only that the diamond acts on R itself: R has rational coefficients, so R^{diag(1,d)} = R. The diamond is never applied to
R o gamma'~, whose coefficients need not be rational. [v1 claim deleted: v1 allowed gamma = gamma' diag(1,d), which would need the
diamond to fix the coefficients of R o gamma'~.] Lemma 2 then gives gamma' = +-I, so gamma = +-diag(1,d). In W this forces s = 0 and
t = +-1, so gamma = +-I.
Check (diamond.gp / diamond_out.txt, n = 2, h = 1, 400 digits; nu = 1 + sqrt(-2), gamma = [1,-2;1,1], det 3):
- Forced side: gamma' = diag(1,2)gamma = [1,3;2,2] mod 5. R(gamma'~ tau_O) is one of the 12 KSY25 K-conjugates of z_2 to 10^-403, and
  it is not z_2 (relative difference 9.92).
- Wrong side: gamma diag(1,2) = [1,1;1,2] gives a value that is no conjugate (agreement 10^0).
- Over all 24 elements of W: the forced side lands in the conjugate list 24/24, with exactly 12 = |W|/2 distinct values, a bijection
  onto Gal(K_{O,5}/K) since h = 1. The wrong side lands only 16/24.
(b) sigma in Gal(K_{O,5}/K) fixes z => sigma fixes j(tau_O) = -A(z)^3/(z^5 B(z)^5) (icosahedral equation). This is legitimate:
Res(A, xB) = 5^50 != 0 (icosa_out.txt; relation checked numerically to 10^-214), and z != 0 is a unit, so z^5 B(z)^5 != 0. So sigma lies in
Gal(K_{O,5}/H_O) (H_O = K(j(tau_O)), STANDARD) and sigma = 1 by (a). Hence K(z) = K_{O,5}. |Gal(K_{O,5}/K)| = h * |W|/2 by Prop 5.1 and
Gal(H_O/K) = C_1(O) (KSY25 Prop 3.1, Rem 3.2(i)). |W| = |(O/5O)^*| = 20 (5 | n: F_5[e]/e^2), 16 (-n a nonzero square mod 5: n = 1, 4),
24 (n = 2, 3: F_25). z is real and K is not, so [Q(z):Q] = [K(z):K]. This agrees with GH Lemma 4.1 (generation) and their (3.1).

**6.4 Real conjugates.** Stab_{Gal(K_{O,5}/Q)}(z) has order 2|G|/|G| = 2 and contains c, so it is {1, c}. The Q-conjugates of z are the
|G| distinct sigma(z), sigma in G, and sigma(z) is real iff sigma^{-1} c sigma = c iff sigma is in G^c. So #real = |G^c| (PROVED).
1 -> A -> G -> Cl(O) -> 1 with A = W/+-1, c-equivariant, and c acts on A by nu -> nubar. Fixed points in A are nubar = +-nu, i.e. s = 0
or t = 0. That gives 8 elements of W (4 if 5 | n, when s tau_O is not a unit), so |A^c| = 4 or 2 (PROVED). c inverts Cl(O), so
G^c -> Cl(O)[2] has kernel A^c.
SKETCH (not checked for non-maximal orders at primes dividing the conductor): this map is onto. Each class of order <= 2 contains
an ambiguous ideal b = bbar (Hilbert 90 for a norm-one ratio). One can take b prime to 5: if b contains the ramified prime above 5,
replace it by [m, sqrt -n], n = 5m. Then [b] is in G^c. This gives #real = |A^c| |Cl(O)[2]| = r(n) a2(n). It matched 218/218 sealed values.

## 7. Prior art and what is new
- NOT new: R(tau_O) generates the ray class field mod 5 of O over K (GH 1999 Lemma 4.1 p. 9; our degree supplement re-derives it).
  The mechanism tools are standard: Shimura reciprocity (Stevenhagen via KSY25 Prop 5.1), the generalised-dihedral shape (KSY25 Lemma 7.3)
  and the Hauptmodul property (Duke 2005, via KSY25/GH). Minimal polynomials of R(sqrt -n) for n <= 16 (GH Table 1).
  The classical value at n = 1 is Ramanujan's.
- Not found in anything opened (floor: GH full text, KSY25 full text, Cais-Conrad abstract, 5 arXiv abstracts, 2 web searches):
  the statement "R(e^{-2 pi sqrt n}) is abelian over Q only for n = 1". Also not found: the closed real-conjugate count r(n)|Cl(O)[2]|.
  Duke 2005 full text and the Cais-Conrad and Cho-Koo full texts NOT opened. Those are the places a referee should check first.
- Plausibly folklore to specialists: given GH Lemma 4.1 and Lemma 7.3, the theorem is a few lines. Its value is the clean all-n statement,
  plus the n = 1 / n >= 2 split explained by the units of Z[i].

## 8. Ceiling
A short, complete, all-n classification (a remark-sized note, or a section in a paper on the Galois half of Ramanujan's
"grand theory" alongside RESULT-W1). It is not revolutionary, and it does not open a new road. The same three-line argument
covers any f in F_N with rational coefficients that takes distinct values on the SL2(Z/N)/+-1-orbit of tau_O (its own invariance
group meets the torus only in +-1), at tau_O = i sqrt n, n >= 2, taking nu = x + tau_O with N not dividing 2x. Examples are R at other
CM points (including D = 1 mod 4) and the Hauptmoduln of Gamma(3) and Gamma(4); Gamma(N) has genus 0 only for N <= 5. For a function
with a larger invariance group (e.g. the cubic continued fraction, abelian at n = 2, 8 in RESULT-V1) the torus can die, and the RESULT-W1
analysis applies instead. "Abelian over Q only where extra units kill the torus" is the real "where else". Check whether it is stated
anywhere before claiming it.

## 9. Next strike
Independent AI reviewer on sec. 6. Close the 6.4 sketch for orders with 5 | conductor. Then the general Hauptmodul corollary (level N >= 3, all
CM points tau_Q of discriminant D != -3, -4, including D = 1 mod 4). It needs one sealed test, for example the cubic continued fraction
G at level 6, where RESULT-V1 found abelian values at n = 2, 8. That case should show where "Hauptmodul of Gamma(N)" fails, because G
has a larger invariance group.

## 10. Files
BAR-R1.md, SEALS.txt (BAR + law.gp hashes), rr.gp (runner), go_smoke.gp/smoke_out.txt, go_A.gp/outA.txt (controls, nulls, n = 2..200),
go_B.gp/outB.txt (idoneal 210..1848), all_n.txt (218 lines), run_hashes.txt, posthoc.gp/posthoc_out.txt (n = 1848 certificate diagnostic,
POST HOC), icosa_out.txt (resultant 5^50; relation check), diamond.gp/diamond_out.txt (v2 diamond-side check), src/gh/ (GH preprint .ps + text).
Engine: veins/v1_law/law.gp (unchanged, hash in SEALS.txt) + run.gp (runalg, abtest). WSL PARI/GP, -s 2G, one process. Floating point,
not interval arithmetic.
Install (logged): micromamba env 'gs' (conda-forge ghostscript), used only to convert the GH PostScript preprint to text.
