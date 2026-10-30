# PROOF-U1 — even-level laws U-GG and U-CF (PROOF DRAFT, one seat, unrefereed)
2026-10-29 01:xx, V9 seat. Internal; not for release. Data: BAR-U1 / RESULT-U1 (sealed run, all predictions held).
Exact computations: proof_u1.gp -> proof_u1_out.txt (sha 031d5e8c / d6e9419a), spcount.gp -> spcount_out.txt; nbthreads = 1 printed in each;
under 1 minute each, one core, output redirected inside the WSL shell.

## In plain words
Both even-level continued fractions turn out to be the simplest possible kind of modular function: each one is a single coordinate on
its own modular curve (a "Hauptmodul"), with exactly one pole and one zero. That was computed exactly, not numerically, from the product
formula of Siegel functions. With that in hand, the earlier "one law" machinery runs with no gaps, and the remaining condition at the
prime 2 (and at 3 for the cubic case) turns out to be exactly the condition that Weber's j at the point 2 sqrt -m (resp. 3 sqrt -m) be
abelian. Weber/Grube already classified those: so Goellnitz-Gordon is abelian exactly at m = 3, 7, 15 and the cubic continued fraction
exactly at n = 2, 8, unconditionally. No Cox needed: every class-group fact used is in Kani 2011 (opened) or in our own lemmas.

## Statements
**Theorem U-GG.** For m >= 2, z = H(e^{-pi sqrt m}) (Goellnitz-Gordon) generates an abelian extension of Q iff m is odd and 4m is idoneal,
i.e. iff m in {3, 7, 15}. Moreover [Q(z):Q] = 8 h(-4m) for every m >= 2.
**Theorem U-CF.** For n >= 2, z = G(e^{-pi sqrt n}) (Ramanujan's cubic continued fraction) generates an abelian extension of Q iff 9n is idoneal
and (n is even or 4n is idoneal), i.e. iff n in {2, 8}. Moreover [Q(z):Q] = h(-4n) w3(n) (n odd), h(-4n) w3(n)/2 (n even), w3 = |(O/3O)^*|.

## Sources
- [KSY10] Koo-Shin-Yoon arXiv:1008.0473, OPENED (quotes in veins/v23/C5-proof-v3.md l.43-49): (1.3) product formula of g_r;
  Prop 2.2(iii) (g_r holomorphic, no zeros or poles on H); 2.4(ii) g_r o g = eps(g) g_{rg}, eps depending on g only; 2.4(iii)
  g_{r+s} = (-1)^{s1 s2 + s1 + s2} e^{-pi i (s1 r2 - s2 r1)} g_r (s integral); 2.4(v) ord_q g_r = B2(<r1>)/2.
- [KSY25] arXiv:2506.14139, OPENED (lab): Prop 3.1; §4 (f^gamma = f o gamma~ on SL2(Z/N); diag(1,d) acts on coefficients;
  K_{O,N} = K(f(tau_O) : f in F_N)); Prop 5.1 (Stevenhagen: Gal(K_{O,N}/H_O) = W_{O,N}/T_{O,N}, W = {[t, -m s; s, t]}); Lemma 7.3.
- [Kani] Kani 2011, OPENED (vectors/vG_level/src/kani2011.txt): Thm 6 (l.260), Cor 10 (l.314-323), Thm 12 (l.334-338),
  Rem 13(b) (l.345-350: n idoneal, t^2 | n => n/t^2 idoneal), Thm 32 (l.981: Q(j(sqrt -n)) Galois iff n idoneal, any n >= 1).
- Lab: RESULT-V1 (L1), (L2) (veins/v1_law/RESULT-V1.md l.49-55); RESULT-R1 diamond rule (l.132-137) and Stab_{SL2(Z)}(i sqrt m) = {+-I}
  for m >= 2 (l.109-111); C5-proof-v3 §5 (eps(a), l.262-270; representatives prime to N, any m).
- STANDARD, not opened: (S1) j(tau) = j(tau') iff tau' in SL2(Z) tau; (S2) a meromorphic function of degree 1 on a compact Riemann
  surface is an isomorphism onto P^1 (so it is injective and generates the function field); (S3) for a finite-index Gamma containing -I,
  sum of cusp widths = index (each cusp c is hit by exactly w_c right cosets).
- Not used / not needed: Cox §7. Cho-Koo-Park 2010 Thm 13 (as quoted by the gate seat, external-even-gate-reply.md, OPENED by that seat):
  "K(C(tau)) is the ray class field modulo 6 over K if (6, a) = 1" for tau a root of a x^2 + b x + c with discriminant d_K. It does NOT apply to
  our points: our value is C(tau_O/2), tau_O/2 = i sqrt n/2 is a root of 4x^2 + n (a = 4, not prime to 6), and -4n need not be fundamental;
  and for even n our value does NOT generate the ray class field mod 6 (stabiliser of order 2, §3). Cho-Koo-Park 2009 (level 8): ABSTRACT only
  (gate seat). Duke 2005 is the template for R (via RESULT-R1). None of these is an input to the proof below.

## §1 Siegel forms (on the page)
From (1.3) with r = (x, 0): g_{(x,0)}(tau) = -q^{B2(x)/2} prod_{n>=0} (1 - q^{n+x}) prod_{n>=1} (1 - q^{n-x}) (q = e^{2 pi i tau}); hence
g_{(1-x,0)} = g_{(x,0)} (same factor multiset; B2(1-x) = B2(x)). At tau = 8w: g_{(1/8,0)}(8w) = -q^{4 B2(1/8)} prod_{n>=0}(1-q^{8n+1})(1-q^{8n+7}),
q = e^{2 pi i w}; with B2(1/8) - B2(3/8) = 1/8:
  H(w) = q^{1/2} (q;q^8)(q^7;q^8)/((q^3;q^8)(q^5;q^8)) = g_{(1/8,0)}(8w)/g_{(3/8,0)}(8w), so **Ht(z) := H(z/2) = g_{(1/8,0)}(4z)/g_{(3/8,0)}(4z)**.
For the cubic CF G(w) = q^{1/3}(q;q^2)/(q^3;q^6)^3 = q^{1/3} prod(1-q^{6n+1})(1-q^{6n+5})/prod(1-q^{6n+3})^2, and B2(1/6) = 1/36, B2(1/2) = -1/12
(exponent 1/3 - 3/36 - 3/12 = 0): **Gt(z) := G(z/2) = g_{(1/6,0)}(3z)/g_{(1/2,0)}(3z)**. Numeric checks 75-76 digits (proof_u1_out N0).
Write F = g_{(u,0)}(k z)/g_{(v,0)}(k z): (k, u, v) = (4, 1/8, 3/8) for Ht, (3, 1/6, 1/2) for Gt. By 2.2(iii), F is holomorphic and
non-vanishing on H; its q-coefficients are rational (product formula).

## §2 Exact stabilisers
**Lemma A (action of Gamma0(k)).** For h = [a, b; c, d] in SL2(Z) with k | c: F(hz) = (g_{(u,0)h'}/g_{(v,0)h'})(kz), h' = [a, kb; c/k, d]
(since k h z = h'(kz)), by 2.4(ii) with eps(h') cancelling. If u k b, v k b are integers, 2.4(iii) and g_{(1-x,0)} = g_{(x,0)} turn this into
e^{pi i t(h)} F^{+-1} with an explicit rational t(h) (proof_u1.gp `hact`, exact rational arithmetic; numeric control on 339 + 237 random
elements, agreement 1e-74, proof_u1_out N1).
**Lemma B (level).** F o h = F for every h in Gamma(N) (N = 8 for Ht, 6 for Gt). By hand for Ht: a = 1+8al, b = 8be: numerator index (a/8, b/2)
= (1/8, 0) + (al, 4be): factor (-1)^{4 al be + al + 4 be} e^{pi i 4be/8} = (-1)^al i^be; denominator (3a/8, 3b/2) = (3/8, 0) + (3al, 12be): factor
(-1)^{36 al be + 3 al + 12 be} e^{pi i 12be 3/8} = (-1)^al i^{9 be} = (-1)^al i^be; ratio 1. For Gt: a = 1+6al, b = 6be: (a/6, b/2) = (1/6,0) + (al, 3be):
(-1)^{al be + al + be} i^be; (a/2, 3b/2) = (1/2,0) + (3al, 9be): (-1)^{al be + al + be} i^{9be}; ratio 1. (Also 200 random elements each, exact.)
So F is in F_N with rational coefficients.
**Lemma C (stabiliser).** Let S'_GG = {+-1} x {I, [1,0;4,1], [1,4;0,1], [1,4;4,1]} in SL2(Z/8) and S'_CF = {+-I mod 3} x {I, [1,0;1,1] mod 2}
= {I, [1,0;3,1], 5I, [5,0;3,5]} in SL2(Z/6) (both subgroups, closure checked by hand). One lift of each element fixes F exactly (proof_u1_out (2):
t = 0, sign +1 for all 8 + 4 lifts); with Lemma B the preimage Gamma* of S' fixes F.
**Lemma D (Hauptmodul; exact).** For any g in SL2(Z), with A = gcd(k a, c), D = k/A, g'_11 = k a/A (from the Hermite form [k,0;0,1] g = g'[A, *; 0, D]):
  ord_q(F o g) = (A/D) (B2(<u g'_11>) - B2(<v g'_11>))/2   (2.4(ii) and 2.4(v); q^x at (A z + *)/D becomes q_z^{x A/D}).
Summing max(0, -ord) over the right cosets of Gamma* (48 for Ht, 36 for Gt; ord constant on cosets, checked): **F has exactly one simple
pole and one simple zero on X(Gamma*)** (Ht: orders -1/4 x 4 and +1/4 x 4, i.e. cusps of width 4; Gt: -1/3 x 3 and +1/6 x 6), sum of orders 0
(proof_u1_out (3)). By (S2) F: X(Gamma*) -> P^1 is an isomorphism. Consequences: (i) the full stabiliser of F is Gamma* (a larger group would
make the degree on X(Gamma*) a multiple >= 2), so S' is EXACT - the numerical S' of explore_even is now proved; (ii) F is injective on
Gamma*\H; (iii) C(X(Gamma*)) = C(F), so j = R(F) with R in Q(X) (R is unique and both q-expansions are rational, so R is fixed by Aut(C)).

## §3 The value: generation and the generic stabiliser
Setting: m >= 2, O = Z[sqrt -m], tau_O = i sqrt m, z = F(tau_O) (real, finite), G = Gal(K_{O,N}/K), P = Gal(K_{O,N}/H_O) = W/{+-1}.
**Prop E.** (a) H_O is in K(z). (b) A principal class x in W acts by z -> F(g~ tau_O), g = diag(1, N(x))^{-1} g_x (RESULT-R1 diamond rule), and it
fixes z iff g is in S'. (c) Stab_G(z) = S_P := {x : diag(1, N(x))^{-1} g_x in S'}; [Q(z):Q] = h |W|/|S_P|.
*Proof.* (a) j(tau_O) = R(z) (Lemma D(iii); z is not a pole of R since j is finite at tau_O), so K(j(tau_O)) = H_O is in K(z).
(b) KSY25 Prop 5.1 and §4. If F(g~ tau_O) = F(tau_O), then by Lemma D(ii) g~ tau_O = beta tau_O with beta in Gamma*, and beta^{-1} g~ fixes tau_O, so
it is +-I (RESULT-R1 l.109-111), so g~ is in Gamma* (-I in Gamma*), g in S'. Conversely S' fixes F.
(c) By (a) any sigma fixing z fixes H_O, so is principal; then (b). z real, so [Q(z):Q] = [K(z):K] = |G/Stab| = h |P/S_P|; spcount_out.txt gives
|W|/|S_P| = 8 for Ht at every m (mod 16), and for Gt: w3 (m odd), w3/2 (m even). This proves the degree statements, and matches BAR-U1 P2 (40/40),
P5 (99/99). ∎
**Prop F (the abelian criterion, exact).** Q(z) is abelian iff m is idoneal and every norm-one y in {xbar/x : x in (O/NO)^*} and
{eps(a) : [a] in Cl(O)} has g_y in S' (g_y = [t, -m s; s, t], y = t + s sqrt -m; no diamond since N(y) = 1).
*Proof.* (L2): abelian iff psi(G) fixes z, psi(sigma_[a]) = sigma_[abar/a]. If Cl(O) != Cl(O)[2], some psi(sigma) is non-trivial on H_O, which is in K(z):
it moves z. If Cl = Cl[2], psi(G) consists of the principal classes eps(a0) xbar/x (C5 §5; a = a0 x), all of norm one; Prop E(b). ∎

## §4 The local conditions and Weber's j at 2 sqrt -m, 3 sqrt -m
**Lemma J (on the page).** Let n in {2, 3} and y a norm-one principal class. Then y fixes j(n tau_O) iff s(y) = 0 mod n.
*Proof.* j o diag(n, 1) is in F_n with rational coefficients, fixed exactly by Gamma0(n); for norm one, y acts by j(n g~ tau_O), g = g_y, and g_y is in
Gamma0(n) mod n iff s = 0 mod n. If g is not in Gamma0(n) mod n, n g~ tau_O is SL2(Z)-equivalent to (tau_O + k)/n for some k, a root of
(n^2, -2nk, k^2 + m). If j((tau_O + k)/n) = j(n tau_O), then by (S1) the primitive forms agree up to equivalence, so (n^2, -2nk, k^2+m) is primitive of
discriminant -4 n^2 m and equivalent to the principal form (1, 0, n^2 m); then it represents 1. But n^2 x^2 - 2nk xy + (k^2+m) y^2 = (n x - k y)^2 + m y^2 = 1
forces y = 0 (m >= 2) and n^2 x^2 = 1: impossible. ∎
**Lemma L2 (2-adic, on the page).** For m odd and y norm-one: g_y in S'_GG iff s(y) is even. (S'_GG on the torus is {t = +-1 mod 8, s = 0 mod 4}; if s = 2s',
t odd gives t^2 = 1 mod 8, so 4 m s'^2 = 0 mod 8, s' even (m odd); then t^2 = 1 - m s^2 = 1 mod 16, t = +-1 mod 8.) For S'_CF: mod 3, g_y = +-I iff s = 0 mod 3
(norm one then gives t = +-1); mod 2, g_y in {I, [1,0;1,1]} iff t odd and m s even, i.e. iff s even when m is odd, and always when m is even (t^2 + m s^2 = 1 forces t odd).
**Torus.** s(xbar/x) = -2ts/N(x). Mod 2 (m odd): always even. Mod 8 (GG, m even): x = 1 + sqrt -m gives s = -2/(1+m) = 2 mod 4, outside S'_GG. Mod 3:
s = 0 for every unit x iff no unit has t s != 0 mod 3 iff m = 2 mod 3 (3 | m: x = 1 + sqrt -m; m = 1 mod 3: x = 1 + sqrt -m has norm 2).
**Proof of Theorem U-GG.** m even: the torus element above moves z (Prop E(b)): not abelian. m odd: by Prop F, Lemma L2 and the torus line, Q(z) is
abelian iff m idoneal and every eps(a) has s even, iff (Lemma J, n = 2, and the torus, whose s is even) psi(G) fixes j(2 tau_O) - when m is idoneal;
when m is not idoneal both sides fail (4m is then not idoneal by Kani Rem 13(b)). By (L2) applied to j o diag(2,1) at tau_O and Kani Thm 32 at n = 4m:
iff 4m is idoneal. For odd m, 4 || 4m, so Kani Thm 12(c) gives 4m in {4, 12, 28, 60}; 12, 28, 60 are idoneal (exact check, proof_u1_out (E));
m >= 2 leaves {3, 7, 15}. ∎
**Proof of Theorem U-CF.** S'_CF is a product (Lemma C), so the condition of Prop F splits. 3-part: torus iff m = 2 mod 3, and all eps(a) with s = 0 mod 3;
together (Lemma J, n = 3; same idoneal remark) iff psi(G) fixes j(3 tau_O) iff 9n idoneal (Kani Thm 32 at 9n). 2-part: automatic for n even; for n odd iff all
eps(a) have even s iff 4n idoneal (as above). By Kani Thm 12(a), 9n idoneal gives n in {1, 2, 5, 8}; n = 5 needs 20 idoneal, false by Kani Cor 10(a)
(n = 1 mod 4, n > 1); n = 1 excluded; 18 and 72 are idoneal (proof_u1_out (E)). So {2, 8}. ∎

## §5 What is proved, what is not, honest limits
- Proved on the page (one seat, not refereed): everything above, given the opened KSY10/KSY25/Kani statements and (S1)-(S3).
- Exact computer steps (proof_u1.gp): the phase bookkeeping of Lemma C for 12 lifts, and the order table of Lemma D (rational arithmetic; one
  formula, 84 cosets). A referee should re-derive Lemma D's order formula and re-run the coset sum independently.
- Not covered: m = 1 / n = 1 (units +-i; outside KSY25 Thm 6.2 and Prop F). Grube's list contains 4 (m = 1) - a unit computation as in C7.
- Real-conjugate counts: not derived (observed in RESULT-U1: exactly half real at every GG NOT item).
- Relation to CONJECTURES U-GG / U-CF: these theorems would move them to PROOF DRAFT. The novelty gate (external-even-gate-reply.md) found no
  published abelian-over-Q classification at level 6 or 8; the mechanism (Shimura reciprocity, Hauptmodul, Weber/Grube) is classical.
- Ceiling: corollary-level, clean: "Ramanujan's even-level continued fractions are abelian exactly where Weber's j(2 sqrt -m), j(3 sqrt -n) are
  (Grube's lists)". Not revolutionary.

[Lead 2026-10-29, REFEREE-U1 fixes: (1) denominators in run_u1_out.txt reach 2^21 (n = 96), not 2^12/4096 - any "<= 2^12" or "up to 4096" above is wrong; conclusion unaffected. (2) Plain words: the classification is for m >= 2 (GG) and n >= 2 (CF); POST HOC numerics: m = 1 GG is abelian (C4), n = 1 CF is not (D4). (3) State U-CF as "n even and 9n idoneal" (the form "9n idoneal and (n even or 4n idoneal)" fails at n = 1). (4) Lemma J is CLASSICAL (ker(Cl(Z + nO) -> Cl(O)), Cox sec. 7), proved directly here - not new. (5) Add (S4): Shimura 1971 Prop 6.9 for "Gamma(N)-invariant, rational q-coefficients => in F_N". (6) N1 failed as a null. (7) "exact certificate" for NOT verdicts = exact given the 249-digit numerical root identity. (8) Prior art missed: Akkarapakam-Morton NYJM 30 (2024).]
