# REFEREE-S1 - hostile referee, round 1, on RESULT-S1.md (sha256 aef3ac73...) and REPAIR-GD.md (sha256 edfb0704...)
2026-10-28, independent AI reviewer (one seat; read-only on lab files except this one). Own checks: PARI/GP 2.17.3 in WSL, nbthreads=1, scratch
scripts ref1.gp / ref2.gp in the private working folder, not shipped (not lab files). No external source was opened by this seat; every external citation
below is "as quoted by the lab (PRIOR-ART-S1 OPENED)" or "NOT re-opened".

## In plain words
The mathematics in RESULT-S1 holds up: I re-derived every step of the stabiliser lemma, the theta-product identity, the size bounds,
the real-conjugate counts, the Rogers-Ramanujan count and the residue-degree law, and found no wrong step. The literal old claim about
the prime 2 is false, as reported: I rebuilt the fields at p = 23 and 31 with my own script and got f = 33 and 15, outside the old law.
The gap the seat found in RESULT-G1 (D) is real as written, and REPAIR-GD closes it: I re-did its size bound (6.95 > 0 at the worst
l = 9 case; >= 62 for l >= 25) and its closed form at (9, 27) to 1e-209. The bookkeeping needs fixes: the block A headline hides a
failed null, A.6 and BAR-GD use (9, 51) although 9 does not divide 51, and the run notes say "single-threaded build". That is false:
this gp starts with nbthreads = 12, and no script set it to 1.

## Verdicts
**A1 (exact stabiliser; degree and real count for every odd prime l): CORRECT WITH FIXES.**
- Lemma S1 cases 1-4 checked line by line. Case 2 uses T0 with b = -ms/l not in Z. Case 3 uses th[a,0] even and 1-periodic plus Lemma M.
  Case 4: t = 0 forces ms to be a unit; k = (l-1)/2 is a unit with k/l in [1/3, 1/2); Lemma T applies at y = sqrt m >= sqrt 3. Cases 2-4
  cover all rows. |P/S_P| = orb: S_P contains -1 and the mod-4 part.
- Lemma Pi checked by hand. prod_j (1 + X zeta^j) = 1 + X^L (L odd); Lemma W at L tau; the q-powers cancel; Moebius gives f^{-2 J2(l)}
  (J2 = Jordan totient).
- S2(i) is exact. S2(ii): the line identity (delta even), the forms (l, -+2 delta, (delta^2+m)/l) and F(l, m) are re-derived, and F is
  monotone for l >= 5. My gp values: F(5,9) = 0.46158, F(7,3) = 19.156.
- A.4 count re-derived: phi(l) solutions mod +-1 per Cl[2] class (l not dividing m); every x works when l | m (t(eps) = +-1).
- Fixes. (1) RESULT-S1 line 106, A.5 and runA print F(5,9) = 0.4617, which rounds up the true 0.46158; write 0.4615. (2) Lemma Pi
  "Kubert-Lang type" is UNVERIFIED; keep that label, or open the source before calling S2 new. (3) "certified" means a float
  separation test, not a certificate. Say so wherever counts are "certified = 1" without an integer polynomial (9 of 14 A5 items).
**A2 (composite l, all primes inert, prime to m: deg h J2(l)/2, real Cl2 phi(l)): CORRECT.** Inert at every p | l makes O/l -> rows a
bijection and Sbar = {+-1}. The norm is onto (unramified), so xbar/x maps onto N1. Sealed items (9,13) [exact], (15,13), (21,25) and
(25,7) all match the prediction.
**B (C7 real count r(n)|Cl(O)[2]|): CORRECT.** The 5 | n case uses O/5 = F5[e]/(e^2): xbar/x = 1 - 2(s/t)e, and eps(1 - ue) = +-1 is
right. The conductor issue of the R1 sketch is avoided. The locators Cox Cor 7.17 and Lemma 7.14 were NOT re-opened by me. The facts
used are standard: every class has an ideal prime to M, and a abar = N(a)O for invertible ideals. sB_out: 39/39.
**C(i) (literal (vi) fails at 23, 31, 47): CORRECT.** RESULT-F1 line 49 states (vi) for all p >= 5 (Statement, line 32). Its table row
p = 23 is [1,33] (line 159), and its check line 130 omits 23. Independent rebuild (polcompositum(polclass(-4p), polsubcyclo(p,(p-1)/2)),
nfinit maximal at 2): p = 11 [3,5]; 23 [1,33]; 31 [1,15]x3. The old law allows {11,22} and {5,10}. p = 47 [1,115] rests on runC3 only.
**C(ii) (f_M = lcm(f_H, ord_p 2); exact lists): CORRECT WITH FIXES.** Tower and local residue-field argument checked. f_H: 2 for
p != 7 mod 8, order of [p_2] for p = 7 mod 8 (h(O) = h_K). p = 3 mod 8: D = S_3, |C(c)| = 2, so exactly one prime of J is [3,1]. The
tensor step with U_{r+} and r+ = r/2 are right. p = 7 mod 8 and p = 1 mod 8 with r odd: -1 is not in <2>. Fixes: (1) The [3, r] branch at
the F_p level (p = 3 mod 8 with h(-p) > 1) was sealed only at p = 59, which was NOT RUN. 11 and 43 have h(-p) = 1, so that branch is
untested at F_p; it is tested only at J (18/18). Say so. (2) "the old closed form was right for p != 7 mod 8" refers to the dichotomy
only; the old (vi) gave no lists.
**D (scoring): CORRECT WITH FIXES.** Seals verified: all 14 SEALS.txt hashes match; BAR-S1 mtime 20:22:31 < s0 start 20:22:50. S0.2
is reported FAILED as sealed, with the POST HOC note labelled. Fixes: (1) A.5 headline "block A HOLDS" must read "A5 HOLDS (14/14,
12/12); A1, A3, A4 hold; A2 null FAILED at (5,9) (design error)". (2) Block C: "3 of 6 new F_p items run, all hold; 59, 71, 41 NOT
RUN". The MISS -> NOT RUN relabel at 47/73 is acceptable: the printed string itself says NOT RUN/e_STACKTHREAD, and the amendment
came before the reruns. (3) Integrity: RESULT-S1 line 238 and LOG 21:18 ("build is single-threaded", "false alarm") are false.
`gp -q` here reports default(nbthreads) = 12, no script sets it, and runC3/runC4 show interleaved concurrent _ZM_*_worker output. The
runs broke the 1-core rule while the overnight job ran. Correct the note; set default(nbthreads,1) in every driver. (4) A.6 cites
(9, 51) as an l = p^e | m instance; 9 does not divide 51.
**RESULT-G1 (D) gap: REAL (as written).** RESULT-G1 line 149 needs V in K(z) via Lemma 2. Lemma 2 (line 87) covers only k prime to l,
and for e >= 2, V contains B_{pk'} = (B_{k'}^{(l/p)})^p. Its membership in K(z) is equivalent to the generation being proved, so the
argument is circular. A.6's extra claim "crude bounds fail at l = 9" applies only to bounds without the content db >= p. REPAIR-GD shows
the bound does close.
**E (REPAIR-GD, Prop D'_l): CORRECT WITH FIXES.** Re-derived: V' is in K(z) ∩ H_O; V' = 2^c (f(tau/l)/f(tau/l'))^l f^{-l phi(l)}
(B_{pk'} = (B_{k'}^{(l')})^p, l - l' = phi(l)); contents da = gcd(l, m') and db = gcd(l', p m') >= p; the F expression term by term.
My gp: the closed form at (9,27) matches theta sums to 2.7e-209, and at (9,63) to 1.0e-208. l = 9: F >= 3 pi sqrt m' - 3.935 - pi Ya,
which is 6.948 at m' = 3 (da = 1 worst case). The actual da = 3 at (9,27) gives 28.71 = 24 x 10.768/9, the printed bound. The minimum
over odd m' up to 2001 is 6.948, and m' = 1 gives -3.93 (excluded). l >= 25: the bound is 62.3 at (phi 18, sqrt 27) and 71.4 at
(20, 5), increasing. The by-products follow: deg h phi(l)/2 and real Cl2 phi(l)/2 for p^e | m; C5 (e) for n = p^e >= 25, since
Stab(b_1) = S_P fixes the B_{pk'}. Fixes: (1) 8.213 > log 3688 = 8.21284 is an unsafe rounding; use 8.2128 (F changes by < 2e-4).
(2) Save the 150-digit (9,27) diagnosis as a lab file. Scoring is honest: FAILED as sealed on 2 items, both diagnoses labelled POST
HOC, and the tau-at-38-digits bug is visible in repair.gp (t = I*sqrt(m) is computed in my() before realprecision is raised).

## What blocks release
No mathematical block. Before anything leaves the lab, fix: the A5/A2 headline, the false single-thread note (and nbthreads = 1 in
every driver), (9, 51) in A.6, F(5,9) rounding, 8.213, and the explicit "untested at F_p" for the [3, r] branch.
## Single next strike
Re-run the sealed F_59 item alone with default(nbthreads,1), under its sealed prediction [3,29],[3,58]. It is the only test of the
[3, r] branch at the F_p level.
