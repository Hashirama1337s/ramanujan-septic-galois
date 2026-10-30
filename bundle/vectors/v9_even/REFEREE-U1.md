# REFEREE-U1 (hostile referee, round 1, on PROOF-U1; 2026-10-29) - saved by the lead from the hand-back
Referee scripts and outputs copied to referee/ in this folder (ref.gp, ref2-4.gp + outputs; nbthreads = 1, run inside WSL, < 1 min each).

## In plain words
Both theorems hold up. The referee re-derived the cusp-order formula, re-ran the pole count with its own code and estimated every cusp
order numerically: both functions have exactly one simple pole on their curve, and the numerically found stabilisers are exactly the
claimed groups. The reduction to Kani is correct, and the final lists depend only on Grube's PROVED finite lists - not on Euler's list
being complete and not on GRH. Fixes: one wrong number (denominators reach 2^21, not 2^12); a plain-words overclaim (m = 1 is abelian
numerically; the m >= 2 qualifier is missing); Lemma J is classical, not new; missing prior art (Akkarapakam-Morton 2024). Nothing blocks
moving U-GG and U-CF to PROOF DRAFT, refereed round 1, CORRECT WITH FIXES.

| Claim | Verdict |
|---|---|
| T-GG | CORRECT WITH FIXES |
| T-CF | CORRECT WITH FIXES |
| Step 1 (Siegel forms, S') | CORRECT WITH FIXES (one missing citation) |
| Step 2 (Hauptmodul) | CORRECT (independently re-derived and re-run) |
| Step 3 (Lemma J, L2, reduction to Kani) | CORRECT; Lemma J is not new |
| Unconditional lists | CORRECT |
| m = 1 / n = 1 | excluded honestly in the statements; the plain words overclaim |
| BAR-U1 scoring | honest; one false number in the write-up |

## Sources
- KSY10 arXiv:1008.0473v2 OPENED: (1.3) product formula; 2.2(iii) no zeros/poles on H; 2.4(ii) g_r o S = zeta12^9 g_{rS}, g_r o T =
  zeta12 g_{rT} (constants independent of r, so cancelling eps between numerator and denominator is valid); 2.4(iii); 2.4(v)
  ord_q g_r = 1/2 B2(<r1>). PROOF-U1 quotes them correctly.
- Kani OPENED twice (kani.txt journal pagination pp. 202-204, 214-215; vG_level/src/kani2011.pdf preprint): Thm 12(a) "9|n", (c) "4||n",
  (d) "16|n"; Cor 8 "n = 3 (mod 4)"; Cor 10(a) "n = 0 (mod 8) or ... n = 1 (mod 4) and n > 1, then 4n is not idoneal"; Rem 13(b) "if n
  is idoneal and t^2|n, then n/t^2 is also idoneal"; Thm 32. PROOF-U1 line locators correct.
- Akkarapakam-Morton, NYJM 30 (2024) 783-827, OPENED: only -d = 1 (mod 8): "[Q(v^2(w/8)):Q] = 4h(-d)", "v^2(tau) is a modular function for
  Gamma1(8)". Adjacent prior art (degree shape), does not cover D = -4m. MISSED by the lab's gate.
- Cho-Koo-Park 2009 (JNT, level 8): SNIPPET only; whether its Hauptmodul statement is in print: NOT CHECKED.

## Step 1: CORRECT WITH FIXES
Siegel forms re-derived by hand (Ht exponent 4 * 1/8 = 1/2; Gt 3(B2(1/6) - B2(1/2)) = 1/3; the (1/2,0) factor squares correctly). Lemma B
phases check; both S' are subgroups. Gap: "Gamma(N)-invariant with rational coefficients at infinity => F in F_N" has no source. Fix: cite
Shimura 1971 Prop 6.9 (standard; not opened) as (S4).

## Step 2: CORRECT (independent)
ord_q(F o g) = A^2/(2k) (B2(<u a k/A>) - B2(<v a k/A>)), A = gcd(k, c), same as the proof's form. Summed over all 384 (144) elements /|S'|.
GG: orders [0, -1/4, 1/4] counts [320, 32, 32]: one simple pole, one simple zero. CF: [0, -1/3, 1/6] counts [108, 12, 24]: same.
Numeric slopes of log|F(g(iy))| match exact orders to 1.0e-4 (GG), 1.4e-5 (CF). Only the 8 (GG) and 4 (CF) claimed elements fix F at a
test point: S' exact.

## Step 3: CORRECT; Lemma J classical
Lemma J = the classical ker(Cl(Z + nO) -> Cl(O)) = (O/nO)^*/(Z/n)^* O^*; label "classical (Cox sec. 7, not opened); proved directly here".
L2 correct (needs norm exactly 1 in O_2). Torus computations correct. Reduction via Rem 13(b) correct. Diamond side irrelevant (S'
normalised by diagonal matrices); recount |W|/|S_P| GG 8 at every m mod 8; CF [3, 8, 2, 6, 4, 4] for m mod 6, matching spcount.

## T-GG, T-CF: CORRECT WITH FIXES
Lists unconditional: GG: 4||4m + Thm 12(c) -> {4, 12, 28, 60} -> m in {1, 3, 7, 15}. CF: 3|n => 81|9n excluded by Thm 12; else Thm 12(a)
-> n in {1, 2, 5, 8}, n = 5 removed by Cor 10(a). Own enumeration: 12, 28, 60, 18, 72 idoneal, 20 not; scan to 3000 agrees. No Euler-list
completeness, no GRH (Grube Thm 6 rests on the proved Dirichlet-Schering-Weber theorem, Kani Rem 7(a)).
Fix 1: plain words need "m >= 2". POST HOC numerics: H(e^{-pi}) = sqrt(4 + 2 sqrt2) - 1 - sqrt2 (213 digits), minimal polynomial
x^4 + 4x^3 - 6x^2 - 4x + 1, Galois group C4 -> m = 1 abelian; over all m >= 1 the GG list is probably {1, 3, 7, 15} (Grube 4||n / 4).
Fix 2: G(e^{-pi}) root of 2x^4 + 8x^3 + 2x - 1, Galois group D4 -> n = 1 NOT abelian (numeric). PROOF-U1's form "9n idoneal and (n even or
4n idoneal)" would wrongly predict abelian at n = 1; state U-CF as "n even and 9n idoneal" (agrees for n >= 2).

## BAR-U1
7 seal hashes match; BAR-U1 stamped 00:37:42 before output 00:38:09. P1-P5, C1-C3 scored as sealed; N1 correctly FAILED AS A NULL; N2
matches. WRONG number: RESULT-U1 l.28 ("powers of 2 up to 4096"), l.36 ("<= 2^12"), INSTRUMENT-U1 l.12 - run_u1_out.txt has denominators
up to 2^21 (n = 96). Conclusion unaffected (2^21 << 10^12; rounding >= 126 digits). Wording: "exact certificate" -> "exact given the
249-digit numerical root identity". PROOF-U1 header: add "N1 failed as a null".

## Classical vs new
Classical / likely in print: mechanism (Shimura reciprocity, Kani/Grube), Lemma J, Gamma1(8)-modularity of v^2 (AM24); Hauptmodul property
of H, G may be in Cho-Koo-Park (unverified). Not found in print: the abelian-over-Q classifications U-GG, U-CF; the degree formulas
8h(-4m) and h w3 (or h w3/2) at D = -4m. Corollary-level; ceiling fair.

## Release (not now)
Second independent referee round; prior-art pass on Cho-Koo-Park 2009/2010 full text and Akkarapakam-Morton papers on v(tau); decide m = 1.
Next strike: open Cho-Koo-Park 2009 (JNT 129) and 2010 (Tohoku 62) full text.
