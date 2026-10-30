# RESULT-U1 — sealed test of the even-level laws (Goellnitz-Gordon level 8, cubic CF level 6) + proof route
2026-10-29, V9 seat. Bar: BAR-U1.md (sha256 b24321e4...; SEALS-U1.txt; LOG 00:37, before the run). Run: run_u1.gp -> run_u1_out.txt
(sha 1f9a05a4...), 00:37-00:38, one gp process, "nbthreads = 1" printed on line 1, exit 0, "END OF SEALED RUN" present. Internal; nothing published.

## In plain words
Both guesses survived a sealed exact test. The Goellnitz-Gordon continued fraction H(e^{-pi sqrt m}) is abelian over Q at m = 3, 7, 15 and at
no other m from 2 to 40 (nor 60); the decisive m = 15 came out abelian, degree 16, all 16 conjugates real, group Z/4 x Z/2 x Z/2. The cubic
continued fraction G(e^{-pi sqrt n}) is abelian at n = 2, 8 and at no other n from 2 to 100. Every "not abelian" verdict has an exact
certificate (a non-real conjugate, by Sturm count). One null was badly designed and failed as a null (below). Then the smarter route:
both lists are classical lists of Grube in disguise. m = 3, 7, 15 are exactly the idoneal m = 3 mod 4 (Kani Cor 8), equivalently the odd m
with 4m idoneal (Kani Cor 10), i.e. the m for which j(2 sqrt -m) is abelian (Kani Thm 32 at 4m). So the Goellnitz-Gordon law should be
"H(e^{-pi sqrt m}) is abelian iff j(2 sqrt -m) is, and m is odd" - a corollary of Weber/Grube once two steps are proved (below).

## Scores (as sealed)
| item | verdict |
|---|---|
| P1 GG verdicts, 40 items (m = 2..40, 60) | **HOLDS** 40/40: ABELIAN exactly at {3, 7, 15} (galoisisabelian, SNF [4,2], [4,2], [4,2,2]); 37 NOT, each with Sturm < degree |
| P2 GG degree = 8 h(-4m) | **HOLDS** 40/40 (degrees 8 .. 32; e.g. m = 11: 24, m = 60: 32) |
| P3 m = 15 (decisive) | **HOLDS**: ABELIAN, degree 16, Sturm 16, group Z/4 x Z/2 x Z/2 |
| P4 CF verdicts, 99 items (n = 2..100) | **HOLDS** 99/99: ABELIAN exactly at {2, 8} (SNF [2], [2,2]); 97 NOT, each with Sturm < degree |
| P5 CF degree h w3 (n odd), h w3/2 (n even) | **HOLDS** 99/99 (largest 48 at n = 61) |
| C1 B_1^{(7)}(i sqrt 7) | **HOLDS**: ABELIAN, degree 3, Z/3 |
| C2 B_1^{(7)}(i sqrt 3) | **HOLDS**: NOT, degree 18, Sturm 6 |
| C3 GG m = 7 at level 16 | **HOLDS**: degree 8, ABELIAN, SNF [4,2] (same as level 8) |
| N1 wrong level 4 at m = 15, 7 | **FAILED AS A NULL** (both): "rational polynomial found" (153 rounding digits) |
| N2 alternatives | **HOLDS**: H_Grube fails (m = 12, 28, 60 NOT; 3, 7, 15 abelian outside its list); H_idon fails (GG m = 2, CF n = 5 idoneal, NOT); H_9n fails at n = 5 |
Instrument: 0 FAULT, 0 UNDECIDED; every item clust_ok = 1; rounding >= 126 digits; root check >= 249 digits at 2W; all polynomials squarefree,
Chavan parity consistent. Denominators: GG 1 (integral), CF powers of 2 up to 4096.
New content (BAR-U1 list): GG 35 items + all 40 GG degrees; CF n = 61..100. The rest replicates the exploration (GG 2, 3, 4, 5, 7) and RESULT-V1 F2 (CF n <= 60).

## Post hoc (no score changed)
- **N1 diagnosis** (diag_n1.gp -> diag_n1_out.txt, 200 digits): told level 4, the pipeline returns HALF of the true conjugates (8 of 16 at m = 15,
  4 of 8 at m = 7), z among them. The "rational polynomial" is not rational: intpol's bestappr allows denominators up to 10^(W/4), so ANY real
  number is approximated to about W/2 digits; the printed P4 has ~400-digit coefficients and does not divide the true polynomial. So the null's
  pass criterion (rounding >= 30 digits) cannot detect non-rationality - a design error of the null (lesson 11), not evidence about Ht.
  Consequence for the main items, checked: their soundness does not rest on that criterion alone - denominators are 1 (GG) or <= 2^12 (CF)
  with rounding errors <= 10^-126, and z (recomputed directly at 2W) is a root to >= 249 digits. A better null for the next bar: require the
  rounded polynomial's denominator to be small (say <= 10^10) AND the polynomial to be irreducible with z as a root.
- Locator fix to BAR-U1 (immutable, so noted here): the law.gp hash 1f6ac6a8... is recorded in vectors/v3_rr/SEALS.txt and run_hashes.txt, not
  in veins/v1_law/SEALS.txt as the bar says. Same hash.
- Seen in passing, not sealed: every NOT item at GG has exactly half its conjugates real (e.g. 8 of 16, 16 of 32); no formula derived.

## Proof route (step 3 of the lead's order; smarter first; PROOF PLAN, nothing proved yet beyond the lines marked "on the page")
**Classical inputs, opened in vectors/vG_level/src/kani2011.txt:** Cor 8 (l.294): "If n [= 3 mod 4] is idoneal, then n = 3, 7 or 15" (relation glyph
dropped by the text layer; context: Grube's c(-4n) = 1 and n = 3 mod 4). Cor 10 (l.314-323): (a) n = 1 mod 4, n > 1 => 4n not idoneal; (b) n = 2, 3 mod 4
=> n idoneal iff 4n idoneal. Thm 12(a) (l.334): 9 | idoneal n => n in {9, 18, 45, 72}. Thm 32 (l.981): Q(j(sqrt -n)) Galois iff n idoneal. Eq. (1)
(l.169-177): h(p^2 Delta) = (1/u)(p - (Delta/p)) h(Delta), valid for p = 2 (citing Cox p.148).

**Theorem GG (target).** For m >= 2: Q(H(e^{-pi sqrt m})) is abelian over Q iff m is odd and 4m is idoneal, i.e. (Kani Cor 10, Cor 8) iff
m in {3, 7, 15}. Unconditional (no Euler-list completeness needed).
Route, with what each step needs:
1. Frame: Theorem U with KSY25 Prop 5.1 (re-cited, RESULT-G1 l.256 annotation). Stabiliser S' of Ht in SL2(Z/8): {+-1} x {I, [1,0;4,1], [1,4;0,1], [1,4;4,1]}
   - currently NUMERICAL (explore_even_out.txt). To prove from the theta transformation laws (finite: generators T, S of SL2(Z) acting on th[a,b]).
2. Local lemma at 2 (on the page in PLAN-U §3, to be written cleanly): for m odd every xbar/x lies in S'; for a 2-adic unit eps = t + s sqrt -m of norm 1,
   s even => s = 0 mod 4 and t = +-1 mod 8 (t^2 + 4m s'^2 = 1 with t^2 = 1 mod 8 forces s' even, then t^2 = 1 mod 16). So for m odd and idoneal:
   eps(a) in S' iff s(eps(a)) even.
3. Ring class identification: for a prime to 2, a^2 = lambda O, s(lambda) even iff lambda is in O' = Z[2 sqrt -m] (O^* = {+-1}) iff the lift a cap O' has
   principal square in Cl(O'). With the exact sequence Cl(O') -> Cl(O) (kernel of order 2 for m odd, from Kani eq. (1) with p = 2: h(-16m) = 2h(-4m)
   when (-4m/2) = 0), this gives: Cl(O') elementary 2 iff Cl(O) elementary 2 and every eps(a) has even s. So, for odd m:
   "psi(G) inside S'" iff 4m idoneal (Kani Thm 6). Equivalently psi(sigma) fixes z iff it fixes j(2 sqrt -m). The exact-sequence description of the
   kernel ((O/2O)^*/(Z/2)^*) is STANDARD (Cox §7), NOT opened here - open it or derive on the page.
4. m even: x = 1 + sqrt -m gives s(xbar/x) = -2/(1+m) = 2 mod 4, outside S'.
5. "if" (4m idoneal, m odd => abelian) follows from 1-3 with S' proved. "only if" needs elements outside S' to MOVE z: GS. Cheapest route (C7 template,
   RESULT-R1 l.106-119): show Ht is a Hauptmodul of its invariance group (genus 0, one simple pole; orders at cusps from KSY10 2.4(v) ord_q g_r = B2(<r1>)/2,
   since Ht(z) = g_{(1/8,0)}(4z)/g_{(3/8,0)}(4z) - to be checked on the page), then freeness + Stab(i sqrt m) = {+-I}. P2 (degree 8h at all 40 items)
   is the numerical shadow of GS. Fallback: a Prop-D size argument putting j(2i sqrt m) in K(z).
6. m = 1 (units +-i; 4 is idoneal): separate unit computation, as C7.
**Theorem CF6 (target).** For n >= 2: Q(G(e^{-pi sqrt n})) is abelian iff n is even and 9n is idoneal, i.e. (Kani Thm 12(a)) n in {2, 8}. Same route:
S' = {+-I mod 3} x {I, [1,0;1,1] mod 2} (numerical); the 3-part needs 3 split and, by the same lift argument at p = 3 (kernel (O/3O)^*/(Z/3)^* of order 2 when 3
splits, cyclic of order 4 when inert, order 3 when 3 | n), is equivalent to 9n idoneal; the 2-part is automatic for n even and for n odd requires 4n idoneal,
and 4n, 9n both idoneal forces n = 1 (Cor 8 x Thm 12(a)). Needs the same three missing pieces: S' exact, GS (Hauptmodul of Gt), the exact sequence.
**Ceiling line (if it holds):** Ramanujan's two even-level continued fractions are cyclotomic at e^{-pi sqrt n} exactly where Weber's j(2 sqrt -n)
(Goellnitz-Gordon) resp. j(3 sqrt -n) with n even (cubic) is - so their abelian lists are Grube's lists. Corollary-level mechanism; the
classification is OPEN in print per the prior-art gate (external-even-gate-reply.md).
**Next strikes, in order:** (a) prove S' for Ht and Gt from transformation laws; (b) Hauptmodul/genus computation for Ht, Gt (minutes, exact);
(c) write steps 2-3 cleanly with the exact sequence opened; (d) independent AI reviewer on the result; (e) seal a cleaner null (small-denominator rule).

[Lead 2026-10-29, REFEREE-U1 fixes: (1) denominators in run_u1_out.txt reach 2^21 (n = 96), not 2^12/4096 - any "<= 2^12" or "up to 4096" above is wrong; conclusion unaffected. (2) Plain words: the classification is for m >= 2 (GG) and n >= 2 (CF); POST HOC numerics: m = 1 GG is abelian (C4), n = 1 CF is not (D4). (3) State U-CF as "n even and 9n idoneal" (the form "9n idoneal and (n even or 4n idoneal)" fails at n = 1). (4) Lemma J is CLASSICAL (ker(Cl(Z + nO) -> Cl(O)), Cox sec. 7), proved directly here - not new. (5) Add (S4): Shimura 1971 Prop 6.9 for "Gamma(N)-invariant, rational q-coefficients => in F_N". (6) N1 failed as a null. (7) "exact certificate" for NOT verdicts = exact given the 249-digit numerical root identity. (8) Prior art missed: Akkarapakam-Morton NYJM 30 (2024).]
