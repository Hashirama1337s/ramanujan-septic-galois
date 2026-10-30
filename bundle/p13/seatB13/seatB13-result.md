# Seat B13 result (written BEFORE opening ../table13.json or ../r13_out.txt)

Route: theta functions via Jacobi triple PRODUCT (common_b.py), mpmath at 1750 digits, PSLQ with maxsteps=10**6,
maxcoeff=10**60, relations found at 300-digit working precision and then verified at 1750 digits.
Scripts/outputs: step1_control7.py/.out, step2_compute13.py/.out, step3_pslq.py/.out, step4_checks.py/.out, negchk.py/.out,
table: tableB13.json.

## Controls
- Product vs series (60 digits): all f(q^{13+2k},q^{13-2k}), phi(q^13) for p=7 and p=13 agree to 60/60 digits;
  dissection phi(q^{1/p}) = phi(q^p)(1+sum u_k) holds (p=7: 60, p=13: 59 digits).
- POSITIVE CONTROL p=7 (700 digits): u_1, u_2, u_3 equal Rebak's closed forms to 700/700 digits each, same ordering
  (u_1=1.69161751985..., u_2=1.04301784115..., u_3=0.56676900037...); the full p=7 identity with closed forms: 700 digits.
- p=13 identity with numerical u_k: phi(e^{-13 pi sqrt13}) vs 13^{-3/4} phi(e^{-pi sqrt13})(1+sum u_k): 1749 digits.

## D1 — CONFIRMED
b_k = u_k^13 = sum_{j=0..11} N_kj cos(2 pi j/52), common denominator = 1 (all integer coefficients), max |N| = 28114944.
| k | b_k | N_k0 .. N_k11 | digits vs numeric |
|---|---|---|---|
| 1 | 3429.6065238837787873911 | 1473344, 9635968, -15869568, 275200, 15568384, -13266688, 2161536, -11814912, 13619840, 9196160, -25953408, 19463936 | 1747 |
| 2 | 252.25184815455221417448 | -11503360, 275200, 28114944, 9196160, -25953408, -19463936, 12333568, 13266688, -10083840, -9635968, 10385024, 11814912 | 1746 |
| 3 | 3.3130141021487838925882 | -11503360, -275200, 28114944, -9196160, -25953408, 19463936, 12333568, -13266688, -10083840, 9635968, 10385024, -11814912 | 1744 |
| 4 | 8.5236410930946407955e-3 | -6310848, 9196160, 1948544, -9635968, 10385024, -11814912, -301184, 19463936, -17729920, -275200, 15568384, -13266688 | 1742 |
| 5 | 7.1135207462270481556e-6 | 1473344, -9635968, -15869568, -275200, 15568384, 13266688, 2161536, 11814912, 13619840, -9196160, -25953408, -19463936 | 1738 |
| 6 | 1.8360069062543301094e-8 | -6310848, -9196160, 1948544, 9635968, 10385024, 11814912, -301184, -19463936, -17729920, 275200, 15568384, 13266688 | 1735 |
(digits = relative agreement at 1750 dps; the shortfall for small b_k is the working-precision floor.)

## D2 — CONFIRMED (exact, in Q(zeta_52) mod Phi_52, sqrt13 as Gauss sum; plus independent numeric PSLQ — both agree)
e_1 = -25584768 + 7096960 sqrt13
e_2 = -1739650004385792 + 482492099641344 sqrt13
e_3 = -13407412385575915749376 + 3718547140575764676608 sqrt13
e_4 = 4073748678240307299282321408 - 1129854595596083116067782656 sqrt13
e_5 = -291409856951108964762503293698048 + 80822552416373045699853250723840 sqrt13
e_6 = -47361305026477074845022535286784 + 13135662595834881877398488350720 sqrt13
All denominators d = 1 (algebraic integers in Z[sqrt13]); numeric agreement 1711-1747 digits.

## D3 — CONFIRMED
Rebuilt from the integer table only (+ phi(e^{-pi sqrt13}), real positive 13th roots): agrees with the direct product
for phi(e^{-13 pi sqrt13}) to 1738 digits (>= 1000). All 150 single +-1 changes (12 numerators x 6 rows x 2 signs,
plus denominator 1 -> 2; denominator -> 0 skipped) break it: best surviving agreement 5 digits.

## D4 — CONFIRMED
sigma: cos(2pi/52) -> -cos(2pi/52) acts as cos(2pi j/52) -> (-1)^j cos(2pi j/52). Exact coefficient matching:
pairs {b_1, b_5}, {b_2, b_3}, {b_4, b_6} (numerically 1735-1747 digits). (Observation: all six rows use the same
multiset of coefficient magnitudes up to permutation — consistent with the b_k being Galois conjugates.)

## Negative controls — PASSED
- b_1 vs wrong field Q(cos 2pi/13) (basis cos(2pi j/13), j=0..5) at 1750 dps: PSLQ returns None (no relation <= 1e60).
  At 300 dps PSLQ returns a spurious relation with ~1e37 coefficients; its residual at 1750 dps is 1e-222.8 (fails).
- b_1 + 1e-300 vs Q(cos 2pi/52) at 1750 dps: None. At 600 dps a spurious ~1e38-coefficient relation appears; residual at
  1750 dps is 1e-447.4 (fails). The true relations have coefficients <= 2.8e7 and residual ~1e-1740.

## Step 5 — comparison with the other seat (../table13.json, ../r13_out.txt), opened only after the above was written
- Table: all 6 rows agree EXACTLY with table13.json (all 13 integers per row), up to the overall sign of the relation
  vector (their row = [d, n_0..n_11] with d*b_k + sum n_j B_j = 0; rows 1,4,5,6 have d=-1, rows 2,3 d=+1, i.e. the same
  normalisation my raw PSLQ output had). Zero integer disagreements.
- e_1..e_6: identical integers to their T2 lines (all six).
- D3: they report 1988 digits at 2000 dps; I get 1738 at 1750 dps (precision-limited in both, both far above 1000).
  Perturbations: they test 144 single changes, I test 150 (12 numerators + denominator, x6 rows, +-1, minus 6 d->0 cases);
  both report best surviving agreement 5 digits.
- Negative controls: both seats get None for wrong field and for b_1+1e-300 at full precision.
- p=7 control: they test b_k=u_k^7 relations in cos(2pi j/7); I instead matched Rebak's closed forms for u_k to 700
  digits. Different control, both pass.
- D4 (pairing) is not in r13_out.txt; my pairs {1,5},{2,3},{4,6} cannot be compared against their file, but follow
  directly from the shared table, so their table implies the same pairing.
- No disagreements found.
