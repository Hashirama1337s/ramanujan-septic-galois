# BAR-W1 — is there a "wall" for the cubic and quintic pieces? (sealed before any non-control value is computed)
Vector 1, 2026-10-28. Written after: reading Berndt-Rebak (arXiv:2312.15513v2, HTML saved to src/br.html, text src/br.txt; OPENED),
C5-proof-v3 and RESULT-V1, and machinery checks on CONTROLS ONLY (presel.gp / presel_out.txt: m = 3, 5 for l = 3; m = 5 for l = 5).
Predicted lists were printed by predict.gp (predict_out.txt), which computes class groups only, no theta values.

## In plain words
Berndt and Rebak's cubic and quintic "pieces" are the same theta quotients as Ramanujan's septic ones, but with the level held
fixed at 3 or 5 while the special point moves. In the septic case (C5) the level and the point move together, and every prime
of n gives the pieces one sign that must agree; that is what kills composite n like 15. With the level fixed at 3 or 5 there is
only ONE such sign, so it can never disagree. Our derived rule therefore says the cubic and quintic wall is NOT the C5 wall:
the pieces are abelian when m is idoneal and the level prime divides m (any number of other primes allowed), plus one extra
"split" case for the cubic (m = 2 mod 3). We seal both rules, a degree formula and an exact count of real conjugates, and let the
numbers decide.

## Definitions (from BR, OPENED: Thm 2.1(0) and Thm 4.2(0), Lemma 3.1, 5.1, Thm 3.3, 5.3, Cor 3.4, 3.7, 3.9, 5.4)
- BR cubic piece (Thm 2.1(0)): u = 2 q^{1/3} f(q, q^5) / phi(q^3). BR quintic pieces (Thm 4.2(0)): u = 2 q^{1/5} f(q^3, q^7)/phi(q^5),
  v = 2 q^{4/5} f(q, q^9)/phi(q^5). These are exactly u_k = 2 q^{k^2/l} f(q^{l+2k}, q^{l-2k})/phi(q^l) of the C5 setting with
  p replaced by l = 3 (k = 1) and l = 5 (k = 1, 2).
- Theta form (triple product, as in C5 Lemma 1): with q = e^{pi i tau}, u_k = 2 th[k/l, 0](l tau)/th[0,0](l tau), where
  th[a,b](tau) = sum_j exp(pi i tau (j+a)^2 + 2 pi i (j+a) b). Siegel form (C5 Lemma 1 with n -> l):
  B_k := (2 th[k/l,0]/th[0,0])^l = 2^l (-i)^k (g_{a_k}/g_{a_0})^l, a_k = ((l+2k)/2l, 1/2); B_k is in F_{4l} (C5 §1, which uses only l odd).
- **B-family**: z_B(l, m) := B_1(i sqrt m) = u^l at BR's q = e^{-pi sqrt n} with n = m/l^2 (BR Lemma 3.1: u = sqrt2 G_n/G_{9n}^3;
  Lemma 5.1: uv = 2 G_n/G_{25n}^5). So BR's Thm 3.2 / 5.2 points n correspond to m = 9n / 25n; BR n = 1/3, 1/5 are m = 3, 5.
- **W-family**: z_W(l, m) := W_1(i sqrt m), W_j := (2 th[0, j/l]/th[0,0])^l = B_j o S (th[a,0](-1/w) = sqrt(-iw) th[0,-a](w)).
  W_1(i sqrt m) = u^l at q = e^{-pi/(l sqrt m)}: this is the value in BR Thm 3.3 / 5.3 (their Entry-1.1 analogue) at BR n = m.
  Pre-seal check: W_1(i sqrt 3) = B_1(i/sqrt 3) to 1e-134.
- For the quintic we test the first piece (u, k = 1); v is its conjugate whenever 5 | m (B family) by C5-type Lemma P.
- O = Z[sqrt -m], D = -4m, K = Q(sqrt -m), h = h(D), Cl2 = |Cl(O)[2]| (number of ambiguous reduced forms). Only odd m >= 3
  (m = 1 has D = -4, excluded by KSY25 Thm 6.2; BR's n = 1 cases are reported from BR only).

## Derivation (done before the run; the proof attempt goes in RESULT-W1)
Galois action (KSY25 Prop 3.1/4.1, Shimura reciprocity as in C5 §3): a principal ideal nu O, nu = t + s sqrt -m prime to 4l,
acts on characteristic row vectors through g_nu = [t, -m s; s, t] mod l; the mod-4 part acts trivially on these functions
(C5 Lemma 3* Class II*, m odd). By RESULT-V1 (L2), z is abelian iff every sigma_{[abar/a]} fixes z. Three ingredients:
1. Non-principal part: if [a]^2 != 1 and z generates the ring class field over the torus part, sigma_{[abar/a]} moves z.
2. Torus part: sigma_{(nubar/nu)} acts by g_{nubar/nu}. If l | m, O/l = F_l[e], e^2 = 0, nubar/nu = 1 - 2(s/t)e: it fixes the
   characteristic (1,0) up to sign (B family) but moves (0,1) to (s',1), s' != 0 (W family). If l does not divide m, nubar/nu runs
   over the norm-one torus (order l+1 inert, l-1 split); it fixes (1,0) up to sign only if that torus is {+-1}: l = 3, m = 2 mod 3.
3. Ambiguous classes (sign vector): a^2 = lambda O, sigma_{abar/a} acts by a/lambda mod l. With level l there is ONE component
   eps_l = +-1 (C5 §5 with n -> l), so "eps constant" holds automatically; for l = 3 split, a/lambda = +-1 as well.
Real conjugates (same bookkeeping, C5 §6 step 6): #real = Cl2 * ((l-1)/2 if l | m, l-1 otherwise), both families.
Degree: [Q(z):Q] = h * (orbit of the characteristic under (O/lO)^* mod +-1): B, l | m: h(l-1)/2; l not dividing m: h(l-1)^2/2 (split)
or h(l^2-1)/2 (inert); W, l | m: h l(l-1)/2; W = conjugate of B when l does not divide m.

## Sealed list
- l = 3, B: odd m = 3..49 (24 values) + BR Thm 3.2 points m = 63, 81, 99, 117, 153, 225, 243, 333, 441, 729, 765.
- l = 3, W: odd m = 3..49 + 81, 85 (BR Thm 3.3 points n = 3, 5, 7, 9, 11, 13, 17, 25, 27, 37, 49, 81, 85 are all included).
- l = 5, B: odd m = 3..49 + BR Thm 5.2 points m = 75, 125, 175, 225, 325, 625, 1225.
- l = 5, W: odd m = 3..49 (BR Thm 5.3 points n = 3, 5, 7, 9, 13, 25, 49 included).
Per m: predicted degree and real count as printed in predict_out.txt (part of this bar).

## Predictions
- **P1 (H_alt, the derived wall).** Abelian exactly at:
  - cubic B: m in {3, 5, 9, 15, 21, 33, 45} (= idoneal and m != 1 mod 3);
  - cubic W: m = 5 only;
  - quintic B: m in {5, 15, 25, 45} (= idoneal and 5 | m);
  - quintic W: none.
  Bar: zero mismatches over the whole sealed list.
- **P2 (H_same, C5 transplanted: abelian iff m is an idoneal prime power, i.e. m in {3, 5, 7, 9, 13, 25, 37}).** Predicted to FAIL,
  at least at cubic B m = 15, 21, 33, 45, 7, 13, 25, 37 and quintic B m = 15, 45, 3, 7, 9, 13, 37. (Known before the seal from BR
  Cor 3.7 and presel: cubic W m = 3 already fails it.)
- **P3 (degree).** [Q(z):Q] equals preddeg at every sealed (l, family, m). Bar: zero mismatches.
- **P4 (real conjugates).** #real roots of the minimal polynomial = Cl2 * ((l-1)/2 if l | m, else l-1) at every sealed item.
  Bar: zero mismatches.
- **P5 (law L3 of RESULT-V1).** ABELIAN <=> all conjugates real, every item.
- **P6 (consistency).** For l not dividing m, the W and B minimal polynomials at the same m are identical (W is a K-conjugate of B).
- **Positive controls (known, not blind):** cubic B m = 3 -> x - 2 (BR Cor 3.4); cubic W m = 5 -> x^4 - 64x^2 + 64 (BR Cor 3.9,
  u^3 = 2(sqrt3 + sqrt5)), ABELIAN; quintic B m = 5 -> ABELIAN, degree 4 (BR Cor 5.4 trigonometric; C5 at p = 5);
  cubic W m = 3 -> degree 3, 1 real root, NOT ABELIAN (BR Cor 3.7, u^3 = 2/(2^{1/3} - 1)). BR closed forms also exist for cubic
  B at m = 9, 45, 63, ... and W at 7, 9, ...; those items are labelled "BR form exists" in the result, not counted as blind.
- **Nulls:** (i) W family with the diag(1, a') coefficient action deliberately dropped, at (l, m) = (3, 3), (3, 9), (5, 5), (5, 15):
  rounding must FAIL (error < 50 digits or huge denominator). (ii) Non-modular algebraic numbers of the degrees of predicted
  abelian items: x^4 - 4x^2 - x + 1 and a fixed random monic degree-8 polynomial (seed 20261028): NOT ABELIAN expected
  (shows the abelian test is not trivially passing).
- **Method bar per item:** K-conjugates from KSY25 Thm 6.2 + Prop 4.1 (law.gp cmpoints), distinct values, coefficient rounding
  error <= 1e-50, |P(z)| ~ 0 at 2W digits with z recomputed directly (>= 0.9 W digits), P irreducible. ABELIAN = galoisinit +
  galoisisabelian on the monic rescaling (degree <= 2 counted abelian); NOT ABELIAN = a prime with unequal factor degrees or
  galoisinit refuses or non-abelian group. Items failing the method bar are reported as NOT SCORED (not as passes).

## Scoring
Each P scored HOLDS / FAILED as written, nothing re-scored after the run; anything added later is labelled POST HOC.
Resource rule: one gp at a time, -s 2G; an item not finishing in 20 min is NOT RUN.
