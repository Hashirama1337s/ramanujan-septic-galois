# Seat B result — degree-11 analogue of lost-notebook p.206 (independent implementation)

Written BEFORE opening ../RESULT.md. Scripts: core.py, step1_control.py, step2_find.py, step3_rebuild.py,
step4_exact.py (all in this folder); raw finds in found_1600.json (and found_300.json).

## Method
- u_k = 2 q^{k^2/11} f(q^{11+2k}, q^{11-2k}) / phi(q^{11}), q = e^{-pi/sqrt 11}, computed as Jacobi triple
  PRODUCTS (f(a,b) = (-a;ab)(-b;ab)(ab;ab), phi(q) = (-q;q^2)^2 (q^2;q^2)), truncated at 2^-(prec+20).
- Cross-check vs theta series at 60 digits: all u_k agree (p=7 and p=11). Dissection
  phi(q^{1/p})/phi(q^p) = 1 + sum u_k checked to 300 digits (p=7: 300, p=11: 299).
- Working precision 1600 digits. PSLQ/findpoly always with maxsteps=10**6, maxcoeff 10**30 (10**12 for findpoly).

## Positive control (p = 7) — PASSED
u_1, u_2, u_3 match Rebak's closed forms (cos(2pi/7)/(2cos^2(3pi/7)))^{2/7} etc. to 1599 / 1599 / 1599 digits
(of 1600). u = 1.69161751985..., 1.04301784115..., 0.56676900037...

## p = 11 numbers
u = 1.835246783889583389, 1.419012118607336588, 0.929432520060115026, 0.533655140476490299, 0.322398275831881230
P = u1 u2 u3 u4 u5 = 0.4164394342758640956785692984960852816971...
b_k = u_k^11 = 795.49817655..., 46.97287569..., 0.44709159..., 0.00099969534..., 0.0000039112882...

## C1 — CONFIRMED
P^3 - 8 P^2 + 80 P - 32 = 0   (findpoly gives [-1, 8, -80, 32]; no relation of degree 1 or 2.)
Residual at 1600 digits: 5.5e-1598. Irreducible over Q, discriminant -1362944 (= -2^10 * 11^3; one real root,
two complex roots 3.79178 +- 7.90344 i). Same relation found at 300 and 1600 digits.

## C2 — CONFIRMED
Quintic X^5 - e1 X^4 + e2 X^3 - e3 X^2 + e4 X - e5 with roots b_1..b_5, where
- e1 = 1088 - 616 P + 66 P^2
- e2 = -136448 + 438592 P - 48752 P^2
- e3 = 44664832 - 114667520 P + 17898496 P^2
- e4 = 2327674880 - 5377613824 P - 508727296 P^2
- e5 = -756547584 + 1957953536 P - 339181568 P^2   (= P^11 reduced mod the cubic; verified exactly)
(PSLQ vectors on [e_j, 1, P, P^2]: e1 [1,-1088,616,-66], e2 [-1,-136448,438592,-48752],
e3 [-1,44664832,-114667520,17898496], e4 [-1,2327674880,-5377613824,-508727296],
e5 [-1,-756547584,1957953536,-339181568].) Identical at 300 and 1600 digits.
Quintic roots (from the e_j(P) above) match the b_k to 1588-1600 digits.
Caveat: "degree <= 2 in P" is automatic once P is cubic; the content of C2 is integrality, which holds.
Coefficients are large-ish (up to ~5.4e9) — "small" is fair only relative to their structure (all divisible by
high powers of 2).

## C3 — CONFIRMED
Basis order: for i = 0,1,2 and j = 0..4: P^i * c_j, c_j = cos(2 pi j/11) (c_0 = 1).
b_k = sum of coefficients below (each row: the 15 integers, in that order; PSLQ lead coefficient was +-1):

| k | i=0: c0 c1 c2 c3 c4 | i=1: c0 c1 c2 c3 c4 | i=2: c0 c1 c2 c3 c4 |
|---|---|---|---|
| 1 | 320 448 352 256 -32 | -80 136 88 -32 240 | 10 -12 -4 4 -20 |
| 2 | 336 288 32 384 480 | -200 -272 -240 -152 -104 | 20 24 20 16 8 |
| 3 | 192 -256 192 -288 96 | -64 32 168 272 120 | 8 -4 -16 -24 -8 |
| 4 | 96 -96 -480 -448 -192 | -148 -48 104 -136 -168 | 16 8 -8 12 16 |
| 5 | 144 -384 -96 96 -352 | -124 152 -120 48 -88 | 12 -16 8 -8 4 |

(i.e. b_1 = 320 + 448 c1 + 352 c2 + 256 c3 - 32 c4 + P(-80 + 136 c1 + 88 c2 - 32 c3 + 240 c4)
 + P^2(10 - 12 c1 - 4 c2 + 4 c3 - 20 c4), etc. Signs converted from PSLQ vectors: b_k = -(rest)/lead.)
Max |coefficient| = 480. Same table at 300 and 1600 digits.
Exact algebra (sympy, reduction mod the cubic and mod the minimal polynomial y^5+y^4-4y^3-3y^2+3y+1 of
y = 2cos(2pi/11)): prod_k (X - b_k) == the C2 quintic, remainder exactly 0. So the table and the quintic are
mutually consistent as exact algebraic statements (the table's five numbers are Galois-consistent roots).

## C4 — CONFIRMED
Rebuild uses only: the cubic (real root P), the 5x15 integer table, cos(2pi j/11), and phi(e^{-pi sqrt 11}):
  phi(e^{-11 pi sqrt 11}) = 11^{-3/4} phi(e^{-pi sqrt 11}) (1 + sum_k b_k^{1/11}).
Direct phi(e^{-11 pi sqrt 11}) (series; also product, agreeing to 1599 digits).
- Agreement: 1595 digits (relative, of 1600). Stricter: on the nontrivial part phi - 1 (= 3.347e-50),
  1545 digits. Both >= 1000.
- Same rebuild via the C2 quintic route (roots of quintic instead of table): 1590 digits.
- Negative control: 168 single-integer perturbations (+1 and -1 of each of the 4 cubic coefficients and each of the
  5 x 16 table entries incl. the PSLQ lead +-1). For degenerate cases (leading coeff -> 0) the rebuild fails outright;
  where a perturbed cubic has several real roots, the root nearest the true P was used (the most favourable choice
  for a false match). Max agreement after any perturbation: 6 digits. Zero perturbations agree to >= 20 digits.
  -> every single +-1 change breaks the match.

## Verdict
C1 CONFIRMED, C2 CONFIRMED, C3 CONFIRMED, C4 CONFIRMED. Positive control p=7 passed (1599 digits).
Not a proof: C1-C3 are high-precision integer relations (1600 digits, stable between 300 and 1600 digits) plus an
exact algebraic consistency check between C2 and C3; the identity for P itself is not proved here.

## Comparison with ../RESULT.md (opened only after everything above was written)
Also read ../cyclo_out.txt and ../verify_out.txt, because RESULT.md points to them for the full table and the
negative control.
- Cubic: SAME (P^3 - 8P^2 + 80P - 32).
- e1..e5: SAME. All 15 integers agree exactly.
- Table: SAME. All 5 PSLQ vectors in cyclo_out.txt match mine entry for entry, with the same basis order
  (P^i c_j, i outer) and the same sign of the lead coefficient (+1, -1, -1, +1, -1). No reordering of k is needed.
  The b_1 example in RESULT.md matches my b_1 row.
- C4: both agree. Seat A: 1e-1294 absolute at lower working precision. Seat B: 1595 digits relative, or 1545 digits
  on phi - 1. The difference comes from precision, not a disagreement.
- Negative control: verify_out.txt shows Seat A tested ONE perturbation ("one coefficient +1" -> 1e-1). RESULT.md
  item 4 words it as "changing one coefficient by 1 breaks it". That holds, but Seat A did not show that
  EVERY single change breaks it. Seat B covers this: all 168 changes by +-1 fail, with at most 6 digits of agreement.
  This is the only gap in Seat A's evidence. No number disagrees.
- RESULT.md also says P = 32 q^5 chi(q)/chi^11(q^11), with chi(x) = (-x;x^2)_inf. Seat B checked this as an extra:
  it agrees to 1600 digits.
- Seat B has not checked RESULT.md's other remarks: the sealed-test history, prior art, and the shape note.
