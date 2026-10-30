# REPAIR-GD — Theorem G part (D) at prime powers l = p^e, e >= 2 (PROOF DRAFT, unrefereed)
**v2 (after REFEREE-S1: CORRECT WITH FIXES).** v1 kept as REPAIR-GD-v1.md; changes marked [v2]: constant 8.2128 (was 8.213, an unsafe
rounding of log 3688 = 8.21284; F changes by < 2e-4); (9, 51) scored INVALID; the 150-digit (9, 27) diagnosis saved as diag_927.gp /
diag_927_out.txt; threading note.
2026-10-28, vector-6 seat. Repairs the gap flagged in RESULT-S1 §A.6 (RESULT-G1 §3 (D) cites Lemma 2 for V in K(z), but Lemma 2 covers only
k prime to l). RESULT-G1 is not edited. Check: BAR-GD.md (sha256 1d33bc07...), repair.gp, repair_out.txt.

## In plain words
The old proof multiplied ALL the pieces together, including some "lower-level" pieces that are not known to lie in the field of z.
The fix multiplies only the pieces that are conjugates of z. That product is still an exact formula in Weber's function, now with three
Weber values instead of two, and the same kind of size comparison still shows it pins down the class field. So for l = 9, 25, 27, 49, ...
dividing a non-idoneal m, the value is non-abelian, as Theorem G says.

## Statement
**Proposition D'_l.** Let l = p^e (p odd prime, e >= 2), m odd with l | m, m' := m/l, and (l, m) != (9, 9). Put
V' := prod over k in [1, (l-1)/2], gcd(k, p) = 1, of B_k(tau_O). Then V' lies in K(z) and K(V') = H_O. Hence H_O ⊂ K(z), and (D) holds at l:
if m is not idoneal, Q(z) is not abelian. ((9, 9): m = 9 is idoneal, so (D) has nothing to prove there.)

## Proof
1. *V' is in K(z) ∩ H_O and real positive.* Each B_k(tau_O) with gcd(k, l) = 1 is a K-conjugate of z (RESULT-G1 Lemma 2), and K(z)/K is
   abelian, so V' is in K(z). Principal classes act by B_k -> B_{kt}, t a unit mod l (C5 Lemma P at level l; needs only l | m), permuting the
   unit pieces up to B_{-k} = B_k; so V' is fixed by Gal(L/H_O) and lies in H_O. Each B_k(tau_O) > 0.
2. *Closed form.* The non-unit k in [1, (l-1)/2] are k = p k', 1 <= k' <= (l'-1)/2 (l' := l/p), and B_{pk'}^{(l)} = (B_{k'}^{(l')})^p. With Lemma W
   (RESULT-G1, valid for every odd level) V^{(L)} = 2^{L(L-1)/2} (f(tau/L)/f(tau)^L)^L:
   V' = V^{(l)} / (V^{(l')})^p = 2^c (f(tau_O/l)/f(tau_O/l'))^l f(tau_O)^{-l phi(l)}, c = l(l-1)/2 - p l'(l'-1)/2.
   With w1 = f(tau_O)^24, wa = f(tau_O/l)^24, wb = f(tau_O/l')^24 (all > 0): V'^24 = 2^{24c} wa^l wb^{-l} w1^{-l phi(l)}.
3. *Conjugates.* tau_O/l and tau_O/l' are roots of (l, 0, m') and (l', 0, p m'), of contents da = gcd(l, m') and db = gcd(l', p m') >= p (e >= 2), so they are
   CM points of discriminants -4m/da^2, -4m/db^2, whose j-values lie in H_O (RESULT-G1 §3b step 4). For sigma in Gal(H_O/K), sigma != 1, and an
   extension sigma~: sigma~(w1), sigma~(wa), sigma~(wb) are roots of Weber cubics (X-16)^3 - j(t')X at reduced t' of those discriminants, Im t' <= sqrt m,
   sqrt m/da, sqrt m/db respectively. Bounds used (all from RESULT-G1 §3b and v5.1 Lemmas B, B', C): |sigma~ w1| <= 4.888 e^{pi sqrt m/2} (sigma != 1),
   w1 > e^{pi sqrt m}; every root at Im t' = y' satisfies |root| >= min(2.77, 3688 e^{-2 pi y'}) and |root| <= 4.888 e^{pi y'};
   for real Y >= 1, e^{pi Y} <= f(iY)^24 <= e^{pi Y + 1.04}, and f(iY) = f(i/Y). Write Ya = max(sqrt m/l, l/sqrt m), Yb = max(sqrt m/l', l'/sqrt m).
4. *Comparison.* log(|sigma V'|^24/V'^24) = l [ phi(l)(log w1 - log|sigma~ w1|) + (log|sigma~ wa| - log wa) - (log|sigma~ wb| - log wb) ] >= l F, with
   F := phi(l)(pi sqrt m/2 - 1.5868) + min(1.018, 8.2128 - 2 pi sqrt m/da) [v2: 8.2128 < log 3688] - pi Ya - 1.04 - 1.5868 - pi sqrt m/db + pi Yb
   (1.018 < log 2.77 = 1.01885; all other roundings safe as in §3b. repair.gp printed the bound with 1.019, but at every valid item the
   min is the other term, so the printed numbers are unaffected.)
   - l >= 25 (phi(l) >= 18, sqrt m >= sqrt l >= 5): da >= 1, db >= p >= 3, Ya <= sqrt m (since l <= m), Yb >= 0 give
     F >= pi sqrt m (phi/2 - 3 - 1/3) - 1.5868 phi - 1.61 >= 5 pi (phi/2 - 3.34) - 1.5868 phi - 1.61 = 6.27 phi - 54.1 > 0 (using min(1.018, X) >= 1.018 - 2 pi sqrt m), increasing in sqrt m.
   - l = 9 (phi = 6, db = 3, m = 9 m', sqrt m = 3 sqrt m', Yb = sqrt m', Ya = max(sqrt m'/3, 3/sqrt m'), worst da = 1):
     F >= 2 pi sqrt m' - 3.935 + pi (sqrt m' - max(sqrt m'/3, 3/sqrt m')). At m' = 3: 10.8828 - 3.935 + 0 = 6.9478 > 0 [v2 lead: print 6.948, not 6.95 (both referees)], and the right side increases in m'
     for m' >= 3. (m' = 1 gives a negative bound; excluded, m = 9 idoneal.)
   So |sigma V'| > V' for every sigma != 1: K(V') = H_O. With step 1, H_O ⊂ K(z). The rest of (D) is unchanged (RESULT-G1 §3 (D)). ∎
**By-products (same proof).** (i) With RESULT-S1 Lemma S1: for l = p^e | m (all m != 9 at l = 9), [Q(z):Q] = h phi(l)/2 and the real count is
Cl2 phi(l)/2 (A.4 with Sbar = {t = +-1}, unchanged argument). (ii) At l = m = p^e (m' = 1, covered when l >= 25; l = 27, 49, 81, 121, 125, ...): K(b_1) = KE,
i.e. C5 item (e) "Q(b_1) = E" is proved for prime powers n = p^e >= 25 (not refereed). Composite l with two primes dividing m does not need this
(RESULT-G1 (C) is generation-free); its degree formula stays OPEN.

## Check (BAR-GD, sealed; repair_out.txt), scored as sealed
| item | G1 closed form (bar 1e-50) | G2 V' strictly smallest | G3 margin >= l F/24 > 0 | certified |
|---|---|---|---|---|
| (9, 27) | **FAILED** 1e-37 (see note) | yes | 36.38 >= 10.77 | yes |
| (9, 51) | INVALID item [v2] (9 does not divide 51; v1 scored it FAILED) | (yes) | (bound not applicable) | yes |
| (9, 63) | 1e-152 | yes | 50.67 >= 6.54 | yes |
| (27, 27) | 1e-151 | yes | 309.2 >= 84.3 | yes |
| (25, 75) | 1e-151 | yes | 396.7 >= 190.0 | yes |
Verdict: FAILED as sealed (two items) [v2: one item, (9, 51), was invalid by design and is excluded; (9, 27) G1 remains FAILED as sealed]. Diagnoses (POST HOC, no score changed):
- (9, 51) was a design error of the bar: 9 does not divide 51 (only 3 does), so neither the closed form nor the bound applies there.
- (9, 27): repair.gp evaluated tau = I*sqrt(m) inside my() BEFORE raising the precision, i.e. at 38 digits. Recomputed at 150 digits (scratch diag):
  B_1 B_2 B_4 at i sqrt 27 equals the closed form to 7.8e-153, and the 216 principal-coset values match B_1, B_2, B_4 to 6.3e-152.
  [v2] Scripts and output saved as diag_927.gp, diag_927_out.txt. Referee's own check: 2.7e-209 at (9, 27), 1.0e-208 at (9, 63).
- [v2 integrity] repair.gp and the diagnosis ran without default(nbthreads, 1) (gp default 12): possibly multi-threaded; see RESULT-S1 v2 run notes.
On the valid items the three proof claims hold with large margins (observed margin 3-4 times the proved bound).
