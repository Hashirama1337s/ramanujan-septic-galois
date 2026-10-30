# BAR-G2 — the torus half for composite levels (Proposition T2), sealed before any new value is computed
Vector G, 2026-10-28, after referee round 2. Predictions: g2_predict_out.txt (class groups and residues only; printed by g2.gp predict mode).
Instrument: gl2.gp (the repaired run-1b instrument, relative tolerances), unchanged. No new value at the levels below was computed before sealing.

## In plain words
Theorem G says that at a composite level the pieces are abelian only when the level is a prime power dividing m. The missing half of the proof is
"if some prime-power part of the level does not divide m, the value is not abelian". We now have a proof for almost all such cases: a symmetry
built from that part either sends the piece to a different piece exactly, or keeps the first index and changes only the phase, which makes the
value strictly smaller in size. One family still needs a separate argument. We seal 22 predictions, each tagged with the case that is supposed to
prove it, and let the numbers decide.

## Proposition T2 (statement, proof in RESULT-G1 §3c)
Let l >= 9 be odd and composite (prime powers included), m >= 3 odd, and let p^e || l with p^e not dividing m, v := v_p(m) < e, l' := l/p^e.
Then Q(B_1^{(l)}(i sqrt m)) is not abelian in each of these cases:
- (i) p does not divide m and l' > 1: y = (-1 at p^e, +1 at l') is in the psi-image; it sends z to B_u(tau_O) exactly, u = -1 mod p^e, u = 1 mod l'.
- (ii) p does not divide m and l = p^e (e >= 2): y = 1 + p^{e-1} s sqrt -m in N1 = psi-image; t(y) = 1 mod l, m s(y) != 0: the conjugate keeps the
  first index and gets a non-zero phase, so it is strictly smaller in modulus (strict triangle inequality, Lemma T0).
- (iii) p | m and v <= e - 2: y = xbar/x with x = 1 + s sqrt -m, v_p(s) = e - v - 1: again t(y) = 1 mod l, m s(y) != 0 mod l: Lemma T0.
- (iv) p = 3 and v = e - 1 >= 1: t(y) = 1 + (l/3) j, j in {1, 2}; k = j works in Lemma T.
- (v) l = p^e, p >= 5, v = e - 1 >= 1: t(y) = 1 + p^{e-1} j, j != 0 mod p; k = (p-1)/2 j^{-1} mod p works in Lemma T.
- GAP: l not a prime power, and every part p^e not dividing m has p >= 5 and v_p(m) = e - 1 (smallest example l = 75, m = 15).
Together with (A)-(D) and §3b, this would make Theorem G proved for every odd l except the GAP family.

## Sealed items (g2.gp G2LIST; tags from t2case)
l = 27: m = 3 (iii), 5 (ii), 7 (ii), 9 (iv), 45 (iv); l = 45: m = 5 (i), 7 (i), 15 (iv), 45 ((C), l | m with two primes);
l = 49: m = 3 (ii), 7 (v), 13 (ii), 21 (v); l = 63: m = 5 (i), 7 (i), 21 (iv); l = 75: m = 3 (i), 7 (i), 15 (GAP);
controls (abelian, already observed in BAR-G1 COMP): (9, 9), (9, 45), (25, 25).
Predictions: every item NOT abelian except the three controls; degree = preddeg (g2_predict_out.txt). All m here are idoneal, so no item can be
explained by the class group: a NOT ABELIAN verdict is the torus at work.

## Bar
- P1: verdict matches at all 22 items (one miss = FAILED).
- P2: degree = preddeg at all 22 items (scored, but the degree formula is not part of T2).
- P3: the GAP item (75, 15) is scored like the others; its verdict says nothing about the proof.
Method as RESULT-G1 §4 (gl2.gp gone, exact layer for degree <= 60 or predicted abelian). One gp process.
