# BAR-S1 — shape theorem (vector 6): sealed predictions, controls, nulls
2026-10-28, vector-6 proof seat. Written before any non-control value of the items below was computed. Allowed before sealing:
code smoke tests on CONTROL items only (sC at p = 11, 17 = RESULT-F1 table; a5 at (3, 7), (5, 21) = RESULT-W1 controls), and
predict_out.txt (class numbers, orders and residues only; no theta value, no field factorisation of a test item).
Scripts (hashes in SEALS.txt, written at sealing): clustfix.gp, s0.gp, sA.gp, runA.gp, sB.gp, sC.gp, runC.gp.
Engine: vectors/vG_level/gl.gp + veins/v1_law/law.gp (unchanged). WSL PARI/GP 2.17.3, ONE process at a time (1 core).

## In plain words
Three claims about the "shape" of number fields from Ramanujan-type values get tested here, each predicted before computing:
how many conjugates a value has and how many of them are real (Theorem G pieces, and the Rogers-Ramanujan values), and how the
prime 2 breaks up in the field of the p.206 pieces. First we fix the tool that counts conjugates: the old one merged two
different numbers that agree to 50 digits. The new one ties its matching rule to the working precision and refuses to answer when
the gap is unclear.

## Block S0 — instrument (task 0)
Fixed routine: clustfix.gp pclust/preal (merge iff relative distance <= 10^(-P/2); certified iff within-cluster spread
<= 10^(-3P/4) and between-cluster gap >= 10^(-P/4); same for reality).
- S0.1 positive control: (l, m) = (11, 1365) at P0 = 240 (P = P0 + digits of the smallest conjugate): **deg 960, real 160, certified = 1**.
- S0.2 negative control (old routines on the SAME values): law.gp clust(V, 1e-30) and gl2 rclust(V, 1e-30) both give **956 / 156**.
- S0.3 null (precision too low, P0 = 80): the new routine must return **certified = 0** (clust_ok = 0) — it must not report a count as certain.
- S0.4 benign control (7, 21): new = old = deg 12, real 12, certified.
Pass: all four as stated. Any deviation = S0 FAILED (reported, routine revised under an amendment, never silently).

## Block A — Theorem G degree / real count (Target A)
Proof-side identity checks (relative error bar 1e-50 at 120 digits; nulls must be >= 1e-5 off):
- A1: prod over r in (Z/l)^2 with gcd(r, l) = 1 of |th[r/l](iy)|/th0(iy) = f(iy)^(-2 J2(l)) (J2 = Jordan totient; f = Weber f) at
  (l, y^2) = (3,7), (5,11), (7,3), (11,13), (13,5), (9,13), (15,7). Null: exponent shifted by one.
- A2: split line product prod_{a=1}^{l-1} |th[a/l, delta a/l](tau)|/|th0|^(l-1) = |f((tau+delta)/l)|^2/f(tau)^(2l), delta even, delta^2 = -m
  mod l, at (5,9), (7,3), (11,7), (13,3). Null: delta + 2.
- A3: the product N of the distinct principal-coset conjugates of z equals the closed form (inert: 2^{l J2/2} f^{-l J2}; split prime:
  2^{l(l-1)^2/2} f^{-l(l^2-2l-1)} |f(P+)f(P-)|^{-l}; l | m prime: Lemma W) to 1e-50; Im(N)/|N| <= 1e-50; and |N| is strictly smaller
  than the product over every other coset, at (5,3), (5,9), (7,3), (11,3), (7,21), (15,7), (9,13), (5,39).
- A4: split-case margin (l^2-2l-1)(pi sqrt m/2 - 1.5868) + 13.252 - 6 pi sqrt m > 0 at every printed split item with l >= 5.
Sealed predictions (A5; fixed instrument, auto-precision until certified; exact layer if deg <= 150 with squarefree, Sturm = real count,
Chavan parity sign(disc) > 0 iff (deg - real) = 0 mod 4). Degree = h * orb(l, m) (gl.gp preddeg); real count: prime l: Cl2 (l-1) (l not | m),
Cl2 (l-1)/2 (l | m); composite l prime to m with every prime of l inert in K: Cl2 phi(l).
| item | h | Cl2 | deg | real | class |
|---|---|---|---|---|---|
| (5, 9) | 2 | 2 | 16 | 8 | prime, split (tight bound item) |
| (17, 3) | 1 | 1 | 144 | 16 | prime, inert |
| (17, 13) | 2 | 2 | 256 | 32 | prime, split |
| (19, 7) | 1 | 1 | 180 | 18 | prime, inert |
| (19, 5) | 2 | 2 | 360 | 36 | prime, inert |
| (23, 5) | 2 | 2 | 484 | 44 | prime, split |
| (29, 3) | 1 | 1 | 420 | 28 | prime, inert |
| (23, 69) | 8 | 4 | 88 | 44 | prime, l | m, non-idoneal |
| (9, 13) | 2 | 2 | 72 | 12 | prime power, inert |
| (15, 13) | 2 | 2 | 192 | 16 | composite, all inert |
| (21, 25) | 2 | 2 | 384 | 24 | composite, all inert |
| (25, 7) | 1 | 1 | 300 | 20 | prime power, inert |
| (35, 3) | 1 | 1 | 432 | none | OPEN class (7 split) — degree only, evidence |
| (9, 51) | 6 | 2 | 54 | none | OPEN class (3 | m, prime power, non-idoneal) — degree only, evidence |
Pass: every degree and every predicted real count exactly; every certified flag 1; every exact-layer check consistent. One miss = FAILED.

## Block B — Rogers-Ramanujan R(i sqrt n), n = 2..40 (Target B)
Prediction: deg = h(-4n) e(n) (e = 8, 10, 12 for n = 1,4 / 0 / 2,3 mod 5), real = r(n) |Cl[2]| (r = 4, or 2 if 5 | n), Sturm = real,
Chavan parity consistent, certified. These n were in BAR-R1 (sealed, held); the NEW item is the disc-sign parity and the fixed routine.
Pass: 39/39 on every column. One miss = FAILED.

## Block C — residue degrees above 2 (Target C)
Law under test (derived before computing; RESULT-S1 §C): f_M := lcm(f_H, ord_p 2), f_H = residue degree of 2 in H_O (= 2 if p != 7 mod 8,
= order of the class of a prime above 2 in Cl(-p) if p = 7 mod 8); every prime of F_p above 2 has f in {f_M/2, f_M}; exact counts:
p = 3 mod 8: J has one [e,f] = [3,1] and (h(-p)-1)/2 primes [3,2]; F_p has (p-1)/r primes [3, r/2] and (p-1)(h(-p)-1)/(2r) primes [3, r] (r = ord_p 2);
p = 7 mod 8: J all [1, f_H]; F_p all [1, lcm(f_H, r)]; p = 1 mod 8 with r odd: F_p all [2, 2r].
Controls (RESULT-F1 table must be reproduced): 11: [3,5]; 17: [2,4],[2,4],[2,8]; 23: [1,33]; 43: [3,7] x3.
| p | predicted J | predicted F_p | dichotomy fM | literal old (vi) lcm(2, ord) |
|---|---|---|---|---|
| 31 | [1,3] | [1,15] x3 | 15 | 10 (predicted to FAIL) |
| 47 | [1,5] | [1,115] | 115 | 46 (predicted to FAIL) |
| 71 | [1,7] | [1,35] x7 | 35 | 70 (predicted to FAIL: 35 = fM/2 of 70 would pass; see note) |
| 59 | [3,1],[3,2] | [3,29],[3,58] | 58 | 58 |
| 73 | (no J law) | [2,18] x4 | 18 | 18 |
| 41 | (none) | (dichotomy only) f in {10, 20} | 20 | 20 |
Note on 71: the old literal law allows {35, 70}, so 71 does NOT discriminate; the discriminating nulls are 31 and 47 (and 23 in the table).
J-only predictions (cheap, predict_out.txt): p in {79, 83, 103, 107, 127, 131, 139, 151, 163, 167, 179, 191, 199, 211, 223, 227, 239, 251}.
Pass: every computed item matches; NOT RUN (time cap) is reported as NOT RUN, not as a pass. Null: the literal old (vi) must FAIL at 31 and 47.

## Scoring rules
Score exactly as sealed. Anything looked at after the run is labelled POST HOC. A changed script after sealing = amendment with its own hash.
