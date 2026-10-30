# AUDIT-USE-U — user-seat audit of the gear boss 3 will lean on (even levels 2^a l, the 2-part)
2026-10-29, V9 user-seat (preparation only). Internal; not for release. Nothing sealed, nothing edited outside vectors/v9_even/.
Root for paths: the bundle root. Line numbers are as read on 2026-10-29 00:00.

## In plain words
Boss 3 wants the "one law" (Theorem G and its frame, Theorem U) at even levels: Weber's functions, the cubic continued fraction (level 6),
Goellnitz-Gordon (level 8), and theta pieces of level 2^a l. I re-read every result the fight will use and asked, for each: what does
boss 3 need it to say, what does the file actually prove, and where does the proof use that a number is odd?
Verdict: the FRAME transfers almost unchanged (Theorem U, the abelian test L2/L3, Kani's criterion, the Weber size bounds). The ENGINE
does not: the one lemma that turns Shimura's matrices into "piece k goes to piece kA" (C5 Lemma 3*) uses oddness of the level in five
places, and the parity step behind it also uses oddness of m. Everything built on that engine (Lemma 1, Lemma 2, Lemma P, Lemma S1, the
"mod-4 part acts trivially" in Theorem G) must be redone or replaced at even level. Two new facts surfaced: (1) the RESULT-G1 proof of
Theorem U cites Lemma 1, which is an odd-level lemma; for a general function the right citation is KSY25 Prop 5.1 (no parity), and with it
the frame holds at every level; (2) Theorem G itself, at odd level but EVEN m, breaks at a parity step (worked below) - this is exactly
why RESULT-W1 left m = 18, 72 "undecided". Weber's f2 has an irrational coefficient (sqrt 2), so Theorem U does not apply to f2 as stated.
No error was found in any proved odd-level statement. This is a clean audit of the odd results, with a list of where they stop.

Legend: TRANSFERS = usable at even level as written; TRANSFERS (re-cite) = true at even level but the written proof cites an odd-only
lemma; STOPS = the proof uses oddness; the even statement is open; N/A = not about what boss 3 needs.

## 1. Table
| # | Result (file, lines) | Statement boss 3 needs | Statement proved | Oddness used where | Verdict |
|---|---|---|---|---|---|
| 1 | (L1)-(L3) abelian test, veins/v1_law/RESULT-V1.md l.43-56 | Q(z) abelian iff psi(G) fixes z, any level N, D = -4m, m >= 2 | same, for f in F_N with rational coefficients, any N (only KSY25 Lemma 7.3) | none | TRANSFERS |
| 2 | Theorem U statement, vectors/vG_level/RESULT-G1.md l.59-70 | the frame at N = 2^a l | stated for any level N, O = Z[sqrt -m], O^* = {+-1}; no parity in the statement | none in the statement | TRANSFERS (statement) |
| 3 | Theorem U proof, RESULT-G1 l.255-272 | principal class x acts on f(tau_O) by f -> f^{g_x}, g_x = [t, -m s; s, t] | "By Lemma 1-type Shimura action (KSY25 Prop 4.1 ... Lemma 7.4) ... up to the diamond factor diag(1, N(x))" (l.256-257) | Lemma 1 is proved only for B_k at odd l (row 5). The general action is KSY25 Prop 5.1 (Stevenhagen), as RESULT-R1 cites it (vectors/v3_rr/RESULT-R1.md l.72, l.93) - no parity there | TRANSFERS (re-cite Prop 5.1) - flag U-1 |
| 4 | same, diamond side | which side diag(1, d) sits on | "up to the diamond factor" (side unstated) | - | Harmless for the abelian test (every element of psi(G) has norm 1, so d = 1); matters for degree/real counts with det != 1 elements. RESULT-R1 v2 (l.6-8, l.132-137) fixed the side for R. flag U-2 |
| 5 | Lemma 1 (principal classes), RESULT-G1 l.78-86 | Shimura matrix M for B_k at level 2^a l; top row; |B_k(M tau)| formula | for odd l, odd m: a = N(mu) prime to 4l, top row a'(d1, -m d3), parity (1,1)M = (1,1) mod 2 "a odd (C5 Lemma P step 3)" | (i) level 4l with gcd(4, l) = 1; (ii) parity step needs m odd - see §2 E2; the absolute-value formula itself (via KSY10 2.4(ii),(iii)) has no parity | STOPS (parity, level); |.| formula TRANSFERS |
| 6 | C5 Lemma 0, veins/v23/C5-proof-v3.md l.63-69 | B_{-k} = B_k = B_{k+L} at even L | same, any n (two substitutions) | none | TRANSFERS; at even L the piece k = L/2 is self-paired (§3) |
| 7 | C5 Lemma 1 (Siegel form), C5 l.71-79 | B_x as a Siegel quotient at even L | B_x = 2^n (-i)^x (g_{a_x}/g_{a_0})^n, a_x = ((n+2x)/2n, 1/2) | none in the identity (step 3 divides two cases) | TRANSFERS (at x = L/2, a_x = (1, 1/2), a valid Siegel index) |
| 8 | C5 §1 level (B_k in F_{4n}), C5 l.85-94 | level of B_k^{(L)} for even L | Gamma(4n)-invariance as a case of Lemma 3* Class I* | via Lemma 3* (row 9) | STOPS - the level of B_k^{(L)}, L even, is not established (likely needs 8L or a higher power; to compute) |
| 9 | C5 Lemma 3* (multiplier exactly 1 on Gamma*), C5 l.96-192 | B_k o M = B_{kA} on a Gamma*-type group at even L | for n odd only | five uses: s1 integral via gcd(2, n) = 1 (l.113); (-1)^{nX} = (-1)^X (l.125); CRT mod 4n = mod 4 x mod n (l.132, needs gcd(4, n) = 1); Class I* "n odd" (l.142, l.146); Class II* "n odd" (l.154-155, l.185) and n^2 = 1 mod 8 (l.189) | STOPS - this is THE interaction term: at L = 2^a l the mod-4 part and the 2-part of L are no longer coprime |
| 10 | C5 Lemma P (principal class acts by k -> k t(nu)), C5 l.207-230 | the same with t: O -> Z/L | t(nu) = t mod n a ring map since n | m (l.58); step 3 parity (l.221-225): "a is odd, so exactly one of d1, d3 is odd" | (i) that sentence is true only for m odd (a = d1^2 + m d3^2); (ii) Lemma 3* | STOPS - see §2 E2 (even m) and row 9 (even L) |
| 11 | Lemma 2 (unit pieces are K-conjugates of z), RESULT-G1 l.88-91 | same at even L | d3 = 4l, d1 odd, Lemma 3* at level l | Lemma 3* | STOPS at even L; at odd l and even m it survives (d3 = 4l is even, so the bad parity case of §2 E2 is avoided) |
| 12 | Lemma M, Lemma T0, RESULT-G1 l.93-96, l.224-226 | strict monotonicity / phase loss | any y > 0 | none | TRANSFERS |
| 13 | Lemma T (separation), RESULT-G1 l.98-105; Lemma S, vectors/v1_wall/RESULT-W1.md l.110-114 | separation at y = sqrt m | y >= sqrt 3 (Lam = 0.660524 > U = 0.635420 at sqrt 3) | m >= 3 (not parity) | STOPS at m = 2 (y = sqrt 2 < sqrt 3) - and m = 2 is the cubic CF's abelian point and Goellnitz-Gordon's first test point. flag U-3 |
| 14 | Lemma K, RESULT-G1 l.107-113 | combinatorics of c(x) mod L | l odd prime | uses (l-1)/2 and l prime | N/A if the odd part is handled by the odd theorem (parts lens); STOPS for direct use at even L |
| 15 | Lemma W (Weber form of the product), RESULT-G1 l.115-122 and l.174-177 | closed form of prod_k B_k at even L | prod over k = -(l-1)/2..(l-1)/2; the numbers 2lj - l + 2k are "the l consecutive odd integers" | l odd (k integral, exponents odd) | STOPS - at even L the product includes k = L/2 and other factors (f1, f2 appear); new closed form needed |
| 16 | Lemma Pi (all division points), vectors/v6_shape/RESULT-S1.md l.78-86 | same at even L | "For odd L": prod_j (1 + X zeta_L^j) = 1 + X^L (L odd) (l.82) | L odd | STOPS - for even L that product is 1 - (-X)^L... i.e. 1 - X^L; the closed form changes |
| 17 | Prop D_l (product generates H_O), RESULT-G1 l.164-207 | generation H_O in K(z) for non-idoneal m (the "only if") at even L | l >= 5 odd, m odd, l | m, m/l >= 3; Weber bounds via v5.1 Lemmas B, B', C (D = -4m) | l odd through Lemma W (row 15); the Weber bounds (v5.1 Lemmas B, B', C: proof/v5/proof-C3c-C4-v5.1.md l.124-160) use only D = -4m, a reduced form with a >= 2 | Bounds TRANSFER; the proposition STOPS (needs the even-L Lemma W) |
| 18 | REPAIR-GD (V' and the peel), vectors/v6_shape/REPAIR-GD.md l.15-42 | a peel from level 2^a to 2^{a-1} | B_{pk'}^{(l)} = (B_{k'}^{(l/p)})^p (l.23), p odd | none in the identity (it is th[pk'/l] = th[k'/(l/p)]); the size bounds use p odd | Identity TRANSFERS for p = 2: B_{2k'}^{(L)} = (B_{k'}^{(L/2)})^2 at every L. Bounds: redo |
| 19 | Prop T2 (composite torus), RESULT-G1 l.234-251 | torus obstruction at the 2-part | cases (i)-(v) for odd p (p = 3 case iv, p >= 5 case v) | p odd throughout | STOPS for p = 2 (new local cases) |
| 20 | Lemma S1 + Theorem S-A (exact stabiliser, degree, real count), RESULT-S1 l.40-75, l.120-133 | stabiliser and counts at even level | odd l, odd m | case 4 uses k = (l-1)/2; A.4 uses Hilbert 90 "by counting" with the norm (O/l)^* -> (Z/l)^* onto (l.125-126) | STOPS - at 2 the norm (O/2^a)^* -> (Z/2^a)^* is not onto in general (unit norms are restricted mod 8), so the count must be redone |
| 21 | Theorem G "(A) if" (RESULT-G1 l.125-130) and "the mod-4 part acting trivially" (l.66) | "if" at even L | l = p^e odd: u^2 = 1 in (Z/p^e)^* cyclic => u = +-1 (l.130) | (Z/p^e)^* cyclic needs p odd; (Z/2^a)^* has four square roots of 1 for a >= 3 | STOPS - at 2^a there are extra square roots of 1 (+-1 +- 2^{a-1}); a genuinely new 2-adic condition |
| 22 | C5 §5-§7 sign vector eps and the ambiguous representative, C5 l.262-270, l.291-305 | eps(a) at the 2-part, incl. the class of the prime above 2 | representative a = (pi/r^e) q for odd primes r of n, N a = r^e + 4n/r^e odd (l.297) | only odd primes r handled; the class of the prime above 2 (forms (2,2,(m+1)/2) for m = 1 mod 4; (2,0,m/2) for m even) has no representative formula | STOPS - the "2-genus" class needs its own eps; it is what kills the cubic CF at m = 5 (RESULT-V1 l.127-129) and Goellnitz-Gordon at m = 5 (§4) |
| 23 | C9 / corrected 2-adic law, vectors/v4_factor/RESULT-F1.md l.35-53 (Theorem F) and RESULT-S1 l.196-224 | the arithmetic of 2 needed for even-level Galois statements | valuations v_P(b_k) = p c e/12 and residue degrees f_P in {f_M/2, f_M}, f_M = lcm(f_H, ord_p 2), for the DIAGONAL pieces b_k at prime p >= 5 | p odd prime (it is about b_k at level p) | N/A as an input - it answers a different question (how 2 splits in F_p). Reusable facts: 2 split/inert/ramified in K by p mod 8 (v5.1 Lemma G, cited F1 l.77); "f_P = f_M/2 iff c lies in a decomposition group" is the same c-versus-Frobenius structure. Open pieces of the 2-adic picture: [3, r] branch UNVERIFIED (F_59 NOT RUN, RESULT-S1 l.216-218); exact counts for p = 5 mod 8 and p = 1 mod 8 with r even OPEN (l.222) |
| 24 | Kani's criterion: Thm 6 (vectors/vG_level/src/kani2011.txt l.260), Rem 7(b), Thm 12 (l.334-338), Cor 14 (l.354-358), Cor 23 (l.641), Thm 32 (l.981) | idoneal <=> Cl(-4m) elementary 2 for EVEN m too; finiteness of special lists | Thm 6: "An integer n >= 1 is an idoneal number iff ... each genus of forms of discriminant -4n consists of a single class" (any n); Thm 12(c): "If n is idoneal and 4||n, then n = 4, 12, 28, 60"; Cor 14: idoneal n > 288 => n not 3 mod 4 [text layer drops the relation glyph; the "Moreover" clause covers n = 1, 2, 0 mod 4, so the dropped glyph is "not congruent" - glyph reading, re-check on the PDF] | none | TRANSFERS (and Thm 12(c) / Cor 14 may make the Goellnitz-Gordon list unconditional, PLAN-U §3) |
| 25 | KSY25 Prop 3.1, 4.1, 5.1, Lemma 7.3, Thm 6.2 (as quoted in RESULT-V1 l.24-31, RESULT-R1 l.66-74) | ray class group = Galois group at any N; Galois closure = G x| <c> | any N; D = 0 mod 4 uses tau_O = sqrt D/2; Thm 6.2 needs D != -3, -4 | none | TRANSFERS (m = 1, D = -4, stays a separate unit case, as in C7) |
| 26 | C7 (R at all n), RESULT-R1 l.30, l.106-127 | template for a Hauptmodul family at any m, incl. even m | Theorem R for every n >= 1 (level 5, even n included) | none; freeness via the Gamma(5) Hauptmodul | TRANSFERS as a TEMPLATE: the cleanest proof shape for families whose invariance group has genus 0 |
| 27 | Weber f, f1, f2 as level-48 functions (v5.1 l.67-70, [Wiki-W] opened there) | Theorem U for Weber values | definitions only | - | f = q^{-1/48} prod(1 + q^{n-1/2}) and f1 have rational coefficients, so f, f1 are in F_48 and Theorem U applies at N = 48 (the 48th roots enter only through the SL2(Z/48) action, e.g. f o T = zeta_48^{-1} f1 - stated as standard, not opened here). f2 = sqrt2 q^{1/24} prod(1 + q^n) has the coefficient sqrt 2: Theorem U (rational coefficients) does NOT apply to f2; use f2^2 or f2/sqrt2, and the diamond then acts on sqrt 2 by its Galois sign. flag U-4 |

## 2. Worked flags (the places a user of the theorem would trip)
**U-1 (Theorem U's proof cites an odd-level lemma).** RESULT-G1 l.256 derives the action of a principal class from "Lemma 1-type Shimura action".
Lemma 1 (l.78-86) is about B_k at odd l with level 4l. For a general f in F_N the correct input is KSY25 Prop 5.1 (W_{O,N}/T_{O,N} =
Gal(K_{O,N}/H_O), [gamma] -> f^gamma(tau_O), W = {[t, -m s; s, t]}), which RESULT-R1 already uses (l.72, l.93) and which has no parity
hypothesis. With that citation the (if) half of Theorem U holds at every level N, and so does the reduction of (only if) to GS. Fix for the
boss-3 write-up: cite Prop 5.1, not Lemma 1. (Not an error in Theorem G: there f = B_1^{(l)} and Lemma 1 is the right lemma.)

**E2 (even m at odd level - the parity step of Lemma 1 / Lemma P).** C5 l.223: "a is odd, so exactly one of d1, d3 is odd". With
a = d1^2 + m d3^2 and m EVEN, a odd means only "d1 odd"; d3 is free. Take d1, d3 both odd (m even). Then a' is odd and
y = -a'(d1 d2 + m d3 d4) = d2 (mod 2), and the matrix M = [d4 + y d3, d2 + y d1; d3, d1] has
B + D = d2 + d2 d1 + d1 = 1 (mod 2) (fine) but A + C = d4 + d2 d3 + d3 = d4 + d2 + 1 (mod 2), while det gives d1 d4 - d2 d3 = d4 - d2 = 1 (mod 2),
so A + C = 0 (mod 2): **M is not in Gamma\***, and Lemma 3* says nothing about B_k o M. (Seat's computation, on the page above; not refereed.)
When does d3 odd occur? For torus elements xbar/x (m even, N(x) odd so t odd): xbar/x = (t - s sqrt -m)^2/N(x) = 1 (mod 2), so d3 is even -
the torus is safe. For eps(a) = lambdabar/N(a) with lambda = u + v sqrt -m, u^2 + m v^2 = N(a)^2: v can be odd, and then d3 is odd. So at even m
the classes of Cl[2] whose lambda has odd v act on B_1^{(l)} through a matrix with the WRONG parity (it swaps th[0,0]-type and th[0,1/2]-type
characteristics). This is the 2-part of the stabiliser at even m, and it is precisely the case RESULT-W1 left "UNDECIDED" (l.89-91: BR's
p-values at n = 2, 8, i.e. m = 18, 72). Theorem G's hypothesis "m odd" is therefore load-bearing, not cosmetic.

**U-3 (m = 2).** Every separation lemma (Lemma T, Lemma S) needs y = sqrt m >= sqrt 3. At m = 2 none applies. For the even-level families the
small m (2, 3, 4) are exactly the abelian or decisive points (§4), so either a y >= sqrt 2 version (re-evaluate Lam(sqrt 2) and U(sqrt 2)
first - a minutes job, NOT done here) or a direct value comparison is needed there.

**U-4 (f2).** See row 27. Any statement about Q(f2(sqrt -m)) needs a separate treatment of the constant sqrt 2 (it is not in Q, and
Q(zeta_8) contains it, so it is abelian but moves under the diamond).

**Interaction term (row 9).** At L = 2^a l the "mod-4 part" and "the 2-part of L" are the same prime. Lemma 3* hides the mod-4 part by
CRT (mod 4 x mod n) and by n odd. At even L this CRT split is gone; the 2-part of the stabiliser has to be computed, not assumed trivial.
The exploratory run (EXPLORE below, PLAN-U §4) shows that for the cubic continued fraction the stabiliser is still a CRT product
({+-1 mod 3} x {I, [1,0;1,1] mod 2}), i.e. no interaction term there; for theta pieces at even L this is unknown.

## 3. Facts derived and checked here (exploratory; explore_even.gp sha 3ce7744c, explore_even_out.txt sha cb422898; nbthreads = 1 printed)
- Half piece: th[1/2,0](tau)/th[0,0](tau) = (f2(tau)/f(tau))^2 (from the triple product and the Weber definitions; checked to >= 95 digits at
  4 points). So at even L the self-paired piece is U_{L/2} = 2 (f2/f)^2, the same for every even L - a pure "2-part" piece (Weber/lambda type).
  [Honesty note: the seat's first check compared 2 th/th with (f2/f)^2 and failed (0 digits); the slip was a missing factor 2 in the
  derivation, corrected and re-checked.]
- Parity split: th[k/2l, 0](tau) = (th[k/l, 0](tau/4) + e^{-pi i k/l} th[k/l, 1/2](tau/4))/2 (sum over even n of th[k/l] at tau/4; checked
  to >= 95 digits at 10 cases, l = 3, 5, 7, 9). So an odd-k piece of level 2l is an average of two level-l characteristics at the point tau/4.
- Peel: B_{2k'}^{(2L')} = (B_{k'}^{(L')})^2 (identity of definitions, as REPAIR-GD l.23 with p = 2).

## 4. Hypotheses check for the test items used in the exploration
All m used (2, 3, 4, 5, 7, 8) are >= 2 (O^* = {+-1}, D = -4m != -4), idoneal (reduced forms all ambiguous, law.gp iselem2 = 1), and the
values are real (rational coefficients, tau_O on the imaginary axis). Functions: cubic CF Gt(z) = G(z/2) (RESULT-V1 convention), level 6
(Gamma(6)-invariance spot check, 91 digits); Goellnitz-Gordon Ht(z) = H(z/2), H(q) = q^{1/2} (q;q^8)(q^7;q^8)/((q^3;q^8)(q^5;q^8)), written
as e^{-pi i/4} th[3/8,1/2](4z)/th[1/8,1/2](4z), level 8 (spot check 91 digits; product formula agrees to 95 digits). The level checks are
6 random elements each - a spot check, not a proof of the level.

## 5. What is clean
Kani (all n), KSY25 (all N), L1-L3, Lemma M, Lemma T0, the Weber size bounds (v5.1 Lemmas B, B', C), Lemma 0, the Siegel form, the peel
identity: all usable at even level as written. No proved odd-level statement is contradicted by anything found here.
