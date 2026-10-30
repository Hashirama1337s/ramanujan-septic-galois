# Seat B result: field rule for the Ramanujan dissection pieces, p = 17..37

Seat B, independent implementation, 2026-10-27. Spec: `SPEC-SWEEP-B.md`. Code: `libB.gp`, `runB.gp`, `runB_p*.gp`, `ctrl7.gp`, `compareB.py`.
Raw output: `outB_p{17,19,23,29,31,37}.txt`, `ctrl7.out`, `compareB.out`.

## Method
- The u_k come from the Jacobi triple PRODUCT f(a,b) = (-a;ab)(-b;ab)(ab;ab), truncated once |term| < 10^-(prec+30). No theta series is used, apart from one sanity check of the product code against a series (711 digits).
- Everything is computed at D2 = D + 400 digits. The searches (algdep/lindep) run on copies cut to D digits. A relation counts as GENUINE only if c0 (the coefficient of b_k) is nonzero AND it holds to more than D + 200 digits at D2.
- d = the smallest n for which algdep(P, n) at D digits holds beyond D + 200 digits at D2. polisirreducible was checked.
- Precision: D = 3000 (p = 17, 19, 23), 4000 (p = 31, 37), 6000 (p = 29). Verified at D2 = D + 400.
- Rebuilt identity: P_exact = the real root of the minimal polynomial nearest the numeric P (polroots at D2), with exact cosines. Then b_k = -(sum n_i basis_i)/c0, u_k = b_k^(1/p), and p^(-3/4) phi(e^{-pi sqrt p}) (1 + sum u_k) is compared with a direct product evaluation of phi(e^{-p pi sqrt p}).
- If lindep returns a genuine relation with c0 = 0 (the basis itself is dependent), the code drops one basis element and retries. This never happened in any positive search.

## Positive control (p = 7, 700 digits)
- u_1, u_2, u_3 match (cos(2pi/7)/(2cos^2(3pi/7)))^{2/7}, (cos(pi/7)/(2cos^2(2pi/7)))^{2/7} and (cos(3pi/7)/(2cos^2(pi/7)))^{2/7}, in that order, to 712.8 / 712.0 / 712.0 digits. The bar is >= 500. PASS.
- The p = 7 identity holds to 711.9 digits.

## Per-prime results

| p | p mod 4 | d (minpoly of P) | basis (I x J, conductor) | relations found | digits @D (search) | digits @D2 (verify) | coef size (digits) | rebuilt identity (digits) | NEG control | VERDICT |
|---|---|---|---|---|---|---|---|---|---|---|
| 17 | 1 | 4: x^4-5648x^3+114688x^2-1445888x+65536 | 2 x 16, N=68 (32) | 8/8 genuine, c0=1 | 3004.8-3005.9 | 3407.1-3410.6 | <= 7.6 | 3393.7 / 3400 | none (8/8 spurious) | CONFIRMED |
| 19 | 3 | 3: x^3+136x^2+28864x-512 | 3 x 9, N=19 (27) | 9/9 genuine, c0 = 53 or 106 | 3005.0-3006.2 | 3407.6-3410.5 | <= 7.0 | 3391.2 / 3400 | none (9/9 spurious) | CONFIRMED |
| 23 | 3 | 3: x^3+43x^2+486x-1 | 3 x 11, N=23 (33) | 11/11 genuine, c0=43 | 3004.8-3006.2 | 3407.5-3410.1 | <= 7.8 | 3383.5 / 3400 | none (11/11 spurious) | CONFIRMED |
| 29 | 1 | 6: x^6+373213824x^5+... -4398046511104 | 3 x 28, N=116 (84) | 14/14 genuine, c0 = 173304 or 346608 | 6009.8-6012.0 | 6414.3-6416.2 | <= 16.9 | 6373.1 / 6400 | none (14/14 spurious) | CONFIRMED |
| 31 | 3 | 3: x^3-406x^2+95545x-1 | 3 x 15, N=31 (45) | 15/15 genuine, c0=258071 | 4006.3-4008.0 | 4409.4-4412.3 | <= 13.9 | 4366.7 / 4400 | none (15/15 spurious) | CONFIRMED |
| 37 | 1 | 2: x^2+2810386962432x-262144 | 1 x 36, N=148 (36) | 18/18 genuine, c0=1 | 4006.7-4008.6 | 4411.2-4412.1 | <= 37.6 | 4324.7 / 4400 | none (18/18 spurious) | CONFIRMED |

Notes:
- **Minimal polynomials.** polredabs gives x^4-x^3-2x^2-x+1 (disc 2^2 17^2), x^3-2x-2 (2^2 19), x^3-x^2+1 (23), x^6-3x^5+5x^3+2x^2-5x+1 (2^4 29^3), x^3+x-1 (31) and x^2-x-9 (37). Every degree was verified at D2 to 3407-6413 digits. Every smaller degree tried gave only spurious relations, holding to about 0.8 D at D2.
- **Whether d is even.** For p = 1 mod 4, d is even (4, 6, 2), so the d/2 rule is well defined.
- **Rebuilt-identity digits.** These sit 6-75 digits below D2. This is expected, not a failure. The smallest b_k = u_k^p are tiny: for example u_18 at p = 37 makes b_k about 10^-60. So rebuilding them as a sum of O(1)-to-O(10^37) terms cancels many leading digits. The rebuilt u_k still match the direct u_k to 3381-6370 digits, which is far above D.
- **Verification margin.** Every positive relation holds about 400 digits deeper at D2 than at D. In other words, it holds to the full verification precision, not only to the precision it was found at.

## Negative control and how it was judged
- **What was swapped.** For p = 3 mod 4 the basis is P^i cos(2 pi j/(4p)), with the same ranges (i < d, j < (p-1)/2). For p = 1 mod 4 it is P^i cos(2 pi j/p), with i < d/2 and j < (p-1)/2. I used phi(p)/2 = (p-1)/2 distinct cosines rather than the literal j < phi(4p)/2. The literal range repeats cos(2pi j/p) = cos(2pi (p-j)/p), which gives trivial basis relations with c0 = 0 that test nothing.
- **Judging rule.** A control relation is "none" when lindep returns coefficients of about 60-170 digits that hold at D2 only to the same depth as at D, with no gain. The depth was 2404 at D = 3000, 3205 at D = 4000 and 4808 at D = 6000. This is the pigeonhole/chance level: (number of terms) x (coefficient digits) is about what the search precision allows. For example, p = 17 has 17 terms x 141 digits, about 2400. A genuine relation would gain the extra 400 digits at D2. None did, for any k at any p: 75/75 controls gave no genuine relation.
- **Extra control (p = 1 mod 4).** I also ran conductor p with all d powers of P. In every case the basis was exactly dependent: 16 elements were dropped at p = 17 and 18 at p = 37. The reason is that Q(P) contains Q(sqrt p) (nfsubfields gives a quadratic subfield of disc 17, 29 and 37), and Q(sqrt p) lies inside Q(zeta_p)^+. After the drops this control is identical to the main control and again gave none. At p = 29 this redundant extra run was cut off by the WSL restart, and I did not rerun it because it is mathematically identical to the main p = 29 control, which finished.

## Process note: WSL restarts
- **First launch lost.** My first background launch of p = 17/19/23 started around 04:14 and was lost when the WSL VM restarted. All three were rerun from scratch, and every number above comes from the reruns.
- **p = 29 and p = 37.** p = 37 completed (output ends "time 274.7 s"). The p = 29 job completed every positive search, the rebuild and the main negative control before it was killed, during the redundant NEG2 extra only.
- **Not caused by seat B.** Seat B never ran `wsl --shutdown`, `wsl -t`, or any kill of gp processes. The only processes I inspected were my own, by their stdin/stdout. At peak, seat B ran 3 gp jobs at once (within the 3 allowed); after the coordinator's message it ran at most one.

## Step 5: comparison with the other seat (`../sweep_p*.txt`, TABLE lines)
Each relation is compared as [c0, n_1..n_m], i outer and j inner, up to overall sign. Full listing: `compareB.out`.

| p | relations (mine / other) | vector length | identical | identical after sign flip | different |
|---|---|---|---|---|---|
| 17 | 8 / 8 | 33 / 33 | k=1,3,4,6,7 | k=2,5,8 | none |
| 19 | 9 / 9 | 28 / 28 | k=2,3,6,7,9 | k=1,4,5,8 | none |
| 23 | 11 / 11 | 34 / 34 | k=5,7,9,10,11 | k=1,2,3,4,6,8 | none |
| 29 | 14 / 14 | 85 / 85 | k=1-11,14 | k=12,13 | none |
| 31 | 15 / 15 | 46 / 46 | k=4,5,13,15 | k=1-3,6-12,14 | none |
| 37 | 18 / 18 | 37 / 37 | k=1,2,4,5,7,9,14,15,16 | k=3,6,8,10-13,17,18 | none |

**Disagreements: none.** All 75 relations agree entry by entry up to overall sign. The sign differences come only from the normalisation: seat B forces c0 > 0, while the other seat keeps lindep's sign. Because the two vector lengths match at every p, both seats also found the same d at every p.

## Overall
The FIELD RULE is CONFIRMED for p = 17, 19, 23, 29, 31 and 37. No prime was REFUTED or NOT REACHED.
