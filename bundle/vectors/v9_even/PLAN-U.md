# PLAN-U — attack plan for boss 3 (one law at EVEN levels 2^a l; the 2-part)
2026-10-29, V9 user-seat. Internal; not for release. Companion: AUDIT-USE-U.md (what transfers, what stops, with lines).
Exploratory numbers: explore_even.gp (sha 3ce7744c...), explore_even_out.txt (sha cb422898...), nbthreads = 1 printed, under 1 minute, NOT sealed.

## In plain words
At odd levels we know exactly when Ramanujan-type values are "sine-and-cosine numbers" (abelian): the class group must be all order-2
(m idoneal) and a small group of symmetries mod the level must act invisibly. At even levels one new prime enters: 2. The frame of the
rule still works (it never used oddness), but the machine that computed "how the symmetries act" was built for odd levels only, so the
2-part must be worked out family by family.
A short exploratory run already shows the shape of the answer in two classical families:
- Ramanujan's cubic continued fraction G(e^{-pi sqrt n}) (level 6): abelian at n = 2 and 8 only (known from our earlier run for n <= 60).
  The rule behind it splits into an odd part ("3 splits in Q(sqrt -n)", i.e. n = 2 mod 3) AND a 2-part (which kills n = 5).
- The Goellnitz-Gordon continued fraction H(e^{-pi sqrt m}) (level 8): abelian at m = 3, 7; not at 2, 4, 5. The seat's derivation predicts
  the full list {3, 7, 15}, which is exactly Grube's classical list of idoneal numbers n with 4 || n (n = 12, 28, 60), divided by 4.
So the working guess is "odd law on the odd part AND a small 2-adic condition", where the 2-adic condition is about the class of the
prime above 2. These are CONJECTURES from small evidence; the decisive tests are listed below, none run yet.

## 1. What the fight is (precisely)
Objects (all with rational q-coefficients, evaluated at tau_O = i sqrt m, O = Z[sqrt -m], m >= 2; m = 1 is a separate unit case as in C7):
- (F1) Theta pieces at even level L = 2^a l: B_k^{(L)} = (2 th[k/L,0]/th[0,0])^L. Level NOT established (AUDIT row 8).
- (F2) Cubic continued fraction Gt(z) = G(z/2) (RESULT-V1 convention: Gt(i sqrt n) = G(e^{-pi sqrt n})), level 6 (spot check).
- (F3) Goellnitz-Gordon Ht(z) = H(z/2), H = q^{1/2}(q;q^8)(q^7;q^8)/((q^3;q^8)(q^5;q^8)) = e^{-pi i/4} th[3/8,1/2](8z)/th[1/8,1/2](8z), level 8 (spot check).
- (F4) Weber f, f1 (level 48); f2 only after removing sqrt 2 (AUDIT flag U-4).
- (F5) Theorem G at odd level l but EVEN m (AUDIT §2 E2: the parity step breaks; RESULT-W1 left m = 18, 72 undecided).
Goal: for each family, "Q(z) abelian over Q iff ..." for all m >= 2, with the 2-part explained; plus the open 2-adic items of C9 (T3b F_59).

## 2. The key simplification (smarter first)
For IDONEAL m no generic-stabiliser (GS) hypothesis is needed. By (L2) (RESULT-V1 l.53-55), Q(z) is abelian iff psi(G) fixes z. If
Cl = Cl[2], every psi(sigma_[a]) is a principal class, the class of eps(a0) xbar/x (a = a0 x), and acts through KSY25 Prop 5.1 by
z -> f(g~ tau_O), g = [t, -m s; s, t] of norm 1. So among idoneal m the question is a FINITE check: the torus image {xbar/x} in (O/NO)^* and
one eps per class, each tested at the CM point. That is what explore_even.gp does (calibrated: it reproduces RESULT-V1's cubic verdicts at
n = 2, 5, 8). GS (or generation, Prop-D style) is needed only for (a) proving "moves z" for an infinite family of m, and (b) non-idoneal m.
For Hauptmodul families both follow from one fact (C7 template, RESULT-R1 l.106-119: freeness + stabiliser of i sqrt m is {+-I}).

## 3. Conjectured laws (stated as CONJECTURES; evidence as it stands)
**Conj CF6 (cubic continued fraction).** For n >= 2: G(e^{-pi sqrt n}) is abelian over Q iff n is idoneal, n = 2 (mod 3), and [2-adic
condition] every class of Cl(-4n) has eps(a) = 1 (mod 2 O) up to sign (automatic for n even). Equivalently, n in {2, 8} (for Euler's
idoneal numbers: idoneal n = 2 mod 3 are exactly 2, 5, 8; n = 5 fails the 2-adic condition).
- Evidence: RESULT-V1 F2 (l.93-101): all n <= 60, exact real-root counts, abelian exactly at {2, 8}. Here: calibration 3/3; stabiliser in
  SL2(Z/6) at a generic point = {[1,0;0,1], [1,0;3,1], [5,0;0,5], [5,0;3,5]} = {+-I mod 3} x {I, [1,0;1,1] mod 2} (a CRT product). Seat's
  derivation from that stabiliser: the torus mod 3 is {+-1} iff 3 splits (n = 2 mod 3); the torus mod 2 always lies in the 2-part of S'
  ((O/2)^* = {1, sqrt -n} gives xbar/x = 1 for n odd; for n even every unit mod 2 maps into {I, [1,0;1,1]}); so only eps(a) can fail at 2, and
  it fails at n = 5 (eps = (2 + 3 sqrt -5)/7, odd s; RESULT-V1 l.127-129). V1's degree pattern (|C_6| for odd n, |C_6|/2 for even n, l.101) is
  exactly what this stabiliser predicts (trivial vs order-2 stabiliser in W/+-1) - independent support for GS.
- Unconditional list: only up to Kani Cor 23's possible extra squarefree idoneal number > 1848. LEAD (unproved): if "n idoneal and n = 2 mod 3
  => 9n idoneal" holds, Grube (Kani Thm 12(a): 9 | idoneal => n in {9, 18, 45, 72}) makes {2, 5, 8} (hence {2, 8}) unconditional. Note
  RESULT-W1 l.89-91 met the same Grube list {1, 2, 5, 8} for Berndt-Rebak's cubic p-values - possibly the same field; to check, not claimed.

**Conj GG8 (Goellnitz-Gordon).** For m >= 2: H(e^{-pi sqrt m}) is abelian over Q iff m is idoneal and m = 3 (mod 4), i.e. m in {3, 7, 15}.
- Evidence (EXPLORATORY, 5 values): YES at 3, 7; NO at 2, 4 (a torus element moves z), 5 (the class of (2,2,3) moves z). Stabiliser in SL2(Z/8):
  {+-1} x {I, [1,0;4,1], [1,4;0,1], [1,4;4,1]} (8 elements).
- Seat's derivation (unrefereed, from that numerically found stabiliser): S' meets the torus W in {t = +-1 mod 8, s = 0 mod 4}. For m odd every
  xbar/x lands there (one of t, s even; if s even then t(y) = 1 mod 8, if t even then t(y) = -1 mod 8, and s(y) = -2ts/N = 0 mod 4). For m even,
  x = 1 + sqrt -m gives s(y) = -2/(1+m) = 2 mod 4: the torus fails at every even m. The odd-prime ambiguous classes (r^e, 0, m/r^e) have
  eps = lambdabar/N(a) with lambda = r^e - 4m/r^e + 4 sqrt -m (C5 l.299): t(eps) = 1 mod 8, s(eps) = 4 mod 8: inside S'. For m = 3 mod 4, a
  primitive form (2a', 2a', c) of discriminant -4m would need a'(2c - a') = m with c odd, impossible mod 4; so no 2-genus class arises, and
  (STANDARD genus count, Cox, NOT opened here) Cl[2] is generated by the odd-prime ambiguous classes. For m = 1 mod 4 the class of
  (2, 2, (m+1)/2) is non-trivial and (seen at m = 5 only) its eps leaves S'.
- Unconditional list: Kani Cor 14 (kani2011.txt l.354-358; glyph reading "n not 3 mod 4", re-check on the PDF) says every idoneal n > 288 is
  NOT 3 mod 4, so idoneal m = 3 mod 4 are <= 288 and the finite scan (RESULT-W1 idon_out.txt to 1847) gives exactly {3, 7, 15}. The same
  three numbers are Grube's 4||n list (Kani Thm 12(c), l.336: n = 4, 12, 28, 60) divided by 4, minus m = 1. "Wait, nobody's done that?" line,
  if it survives: the Goellnitz-Gordon continued fraction is a cyclotomic number at e^{-pi sqrt m} exactly for Grube's list.
- m = 1 (units +-i; Grube's list contains n = 4): not covered; predict nothing until the unit case is computed (C7 template).

**Even-level theta pieces (F1): NO conjecture.** Facts only: the self-paired piece is U_{L/2} = 2 (f2/f)^2 (checked); even-k pieces are squares
of level-L/2 pieces (peel); odd-k pieces at L = 2l are averages th[k/2l,0](tau) = (th[k/l,0](tau/4) + e^{-pi i k/l} th[k/l,1/2](tau/4))/2 (checked).
A GUESS (not a conjecture): abelian iff m idoneal, the Theorem G odd condition at l, and a 2-adic condition. Zero evidence at even L yet.

**Theorem G at even m (F5): unknown.** Theorem G as written predicts the idoneal list for l | m or (l = 3, m = 2 mod 3); AUDIT §2 E2 shows
the eps(a) with odd v act through a matrix outside Gamma*, so that prediction is not supported by the proof. Both outcomes are live.

## 4. Smallest decisive test cases (hypotheses checked: m >= 2, D = -4m != -4; idoneal = every reduced form ambiguous; values real)
| family | item | idoneal? (classes) | prediction | why decisive |
|---|---|---|---|---|
| GG8 | m = 15 | yes, h(-60) = 2: (1,0,15), (3,0,5) | ABELIAN | the only positive item left in the conjectured list |
| GG8 | m = 9 | yes: (1,0,9), (2,2,5) | NOT (2-genus class) | tests the m = 1 mod 4 mechanism beyond m = 5 |
| GG8 | m = 13 | yes: (1,0,13), (2,2,7) | NOT (2-genus class) | same, prime m |
| GG8 | m = 6, 10 | yes (Euler's list) | NOT (torus, m even) | even m beyond 2, 4 |
| GG8 | m = 11 | no, h(-44) = 3 | NOT | needs GS / generation, not the finite check |
| CF6 | n = 72, 88 | yes (Euler's list) | NOT (72: 3 | n; 88: n = 1 mod 3) | mechanism beyond n <= 60 |
| CF6 | scan n <= 1848 | - | "idoneal and n = 2 mod 3 => 9n idoneal" | decides whether Grube makes {2, 8} unconditional |
| F5 | (l, m) = (3, 18), (3, 72), (3, 6), (5, 10) | yes, l | m | open (Theorem G says YES) | first even-m items; 18, 72 are RESULT-W1's undecided BR points |
| F5 | (3, 2), (3, 8) | yes, m = 2 mod 3 | open | the split accident at even m |
| F1 | B_1^{(6)}, B_1^{(10)}, B_1^{(12)}: compute S' in SL2(Z/N) first | - | none | decides product vs interaction (parts lens) |
Rule: seal each block (BAR) before running; generators assert idoneal/divisibility before an item is sealed (lesson 4); nulls test content
(a wrong eps class, a wrong level), not relabellings (lesson 11); every gp driver prints nbthreads = 1.

## 5. What is free (classical or already proved)
- Frame: KSY25 Prop 3.1/5.1, Lemma 7.3 (any N); (L1)-(L3) (RESULT-V1). Re-cite Prop 5.1 in Theorem U's proof (AUDIT flag U-1).
- Lists: Kani Thm 6 (any n), Thm 12(a)-(d), Cor 14, Cor 23 - all opened in kani2011.txt.
- Generation/GS: for Hauptmodul families, C7's freeness argument (RESULT-R1 l.106-119) and W1 Step 6 (j = R(f)) verbatim, once the
  Hauptmodul property is known. Whether Gt, Ht are Hauptmoduln of their invariance groups: compute the genus of X(Gamma_f) from index, cusps,
  elliptic points (a minutes computation; index of +-Gamma_G in PSL2(Z) is 72/2 = 36 from the stabiliser above), and ask the prior-art seat
  for the classical statements (Cho-Koo-Park etc. are on its list; this seat did not hunt).
- Size bounds: v5.1 Lemmas B, B', C (any D = -4m) for Prop-D-type generation of theta pieces.
- Identities: Lemma 0, Siegel form, peel, half piece, parity split (AUDIT §3).

## 6. Order of attack (what transfers unchanged first)
1. Words only: re-cite Prop 5.1 in Theorem U (U-1); state the diamond side (U-2). Theorem U then holds at every level as a frame.
2. Exact stabilisers S_f for Gt and Ht (prove what the run found): from the eta-quotient / theta transformation formulas (finite, exact).
3. The finite idoneal check, now exact: torus image and eps per class, at the 2-part and odd part separately (§7). This proves the "if"
   halves of CF6 and GG8 and the NOT verdicts at the listed idoneal m.
4. Hauptmodul property (genus computation) => GS => "only if" for all m, including non-idoneal (C7 template). If not genus 0: Prop-D size route.
5. Seal and run §4 (one core, minutes).
6. F5 (Theorem G at even m): redo Lemma 3* for M with (1,1)M != (1,1) mod 2 (where th[0,0] goes to th[0,1/2]); then the even-m law at odd l.
7. F1 (theta pieces at even L): compute S' first; if it is a CRT product, the odd factor reuses the odd proof and the 2-factor is local;
   if not, write the interaction term explicitly. Needs an even-L Lemma 3*, Lemma W and Lemma Pi (AUDIT rows 9, 15, 16).
8. 2-adic picture (C9): T3b F_59 [3, r] branch (queued, tool seat, morning; local method, not a bigger stack); p = 5 mod 8 counts. Adjacent to
   boss 3, not an input to it.
9. Separation at m = 2 (U-3): evaluate Lemma T's Lam and U at sqrt 2 before relying on any separation there.

## 7. Parts lens (lab owner's addition; mereology: split the whole into its simplest parts)
Setting: N = 2^a l, l odd. By CRT, (O/NO)^* = (O/2^a O)^* x (O/l O)^*, SL2(Z/N) = SL2(Z/2^a) x SL2(Z/l), the torus image {xbar/x} and every
eps(a) split componentwise, and F_N is generated by F_{2^a} and F_l over Q(zeta_N) (standard; not re-opened).
**(1) When does the 2-part decouple?** Exactly when the family's stabiliser is a product, S_f = S_2 x S_l. Then Theorem U's conditions (idoneal m)
split into an AND: [torus_2 and eps_2 inside S_2] AND [torus_l and eps_l inside S_l]. The 2-factor is a finite local computation in (O/2^a O)^*,
depending on m modulo a power of 2 and on the class of the prime above 2. Status per family:
- Cubic CF: product (found numerically: {+-I mod 3} x {I, [1,0;1,1] mod 2}). Decoupled. But note: the ODD factor is NOT Theorem G's l = 3 law.
  Its S_3 is {+-I} (Hauptmodul type), so the odd condition is "3 splits" (C7-type), not "3 | m or split" (Theorem G's B_1^{(3)}). "Odd law on the
  odd part" means Theorem U at level l with the family's OWN S_l; the odd-level PROOF (Lemma 3*) is reusable only where the odd factor is a
  theta piece.
- Goellnitz-Gordon: level 8 = pure 2-part; nothing to decouple; the whole law is the 2-adic condition.
- Weber f at 48 = 16 x 3 (expected, NOT computed): f o gamma = (48th root) x (f, f1 or f2). A 48th root of unity is a 16th times a cube root, so the
  multiplier is a product of a 2-part and a 3-part character, but the stabiliser of f is the kernel of the PRODUCT, a fibre product that can
  strictly contain ker(2-part) x ker(3-part). That is the interaction term: an element can fix f while neither part does alone.
- Theta pieces at even L: unknown. The parity split shows the 2-part entering in two ways at once: as the characteristic b = 1/2 and as the point
  tau/4 (tau_O/4 = i sqrt m/4, a root of (16, 0, m), discriminant -64m): the 2-part changes the ORDER, not only the torus - an interaction with
  the class group of a smaller order (compare REPAIR-GD's points tau_O/l). This is where decoupling may fail.
**(2) Is there a peel from 2^a to 2^{a-1}?** Yes, at the level of identities: B_{2k'}^{(L)} = (B_{k'}^{(L/2)})^2 (REPAIR-GD l.23 with p = 2); the
parity split takes an odd-k piece of level 2l to level-l characteristics at tau/4; and for Weber, f1(2 tau) f2(tau) = sqrt 2 (from the eta
definitions f1 = eta(tau/2)/eta(tau), f2 = sqrt2 eta(2 tau)/eta(tau), v5.1 l.69-70). Honest limit: REPAIR-GD used its peel to put a
Weber closed form inside K(z) and bound its conjugates; the 2-analogue of that closed form (an even-L Lemma W / Lemma Pi) is NOT derived.
So the peel exists; whether it does the same job at 2 is open.
**(3) Odd law AND a small 2-adic condition?** In both computed families, yes (CF6: split at 3 AND no bad 2-genus eps, automatic for n even;
GG8: m odd AND m = 3 mod 4). In both, the 2-adic condition is about the class of the prime above 2 in Cl(-4m) - the 2-part of genus theory -
plus the torus at 2. Known 2-adic facts that feed it: v5.1 Lemma G (2 split / inert / ramified in K by m mod 8; conductor 2 when m = 3 mod 4);
Kani Thm 12(c), (d) and Cor 14 (idoneal numbers with 4 | n: the lists GG8 seems to reproduce); Weber's f2 is the Weber function attached to
the 2-isogenous point (f1(2 tau) f2(tau) = sqrt 2), so the class of the prime above 2 is where f2-values should appear (expected, not
checked). The corrected C9 law is the same structural question (does c lie in the decomposition group at 2?) asked about splitting, not
about abelianness: an ANALOGY, not an input. For theta pieces at even L, "odd law AND 2-adic condition" is only a guess (§3).

## 8. Ceiling
One law at every level, odd and even, for Ramanujan's theta pieces and continued fractions (cubic, quintic, septic, Rogers-Ramanujan,
cubic CF, Goellnitz-Gordon): a classification theorem in explicit class field theory with classical mechanisms (Shimura reciprocity,
genus theory at 2, Grube's lists). New as a whole if the prior-art gate allows; corollary-level in mechanism; not revolutionary. The
plain line, if GG8 holds: "Goellnitz-Gordon's continued fraction is a cyclotomic number at e^{-pi sqrt m} exactly at m = 3, 7, 15 -
Grube's list of idoneal numbers with 4 || n (Kani Thm 12(c)), divided by 4".
