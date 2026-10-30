# BAR-V1 — one law for "abelian over Q" at CM values of Ramanujan-type functions (sealed before any CM value is computed)
Vein 1, 2026-10-27. Written after reading KSY25 (arXiv:2506.14139v1, PDF text extracted to src/ksy25.txt) and after
machinery-only checks (presel_out.txt, presel_out2.txt: theta reducer, levels R in F_5, Gt in F_6, idoneal list, class sizes).
No value f(tau_O) or conjugate of one has been computed yet.

## In plain words
Every value here lives in one big number field whose symmetry group is "abelian part + one mirror (complex conjugation)".
Group theory says: a REAL value of this kind is abelian over Q exactly when all of its conjugates are real.
We test that law on three families, and test two rival rules: the naive one in the brief ("its symmetry group over K is
made of order-2 moves only") and "n is idoneal".

## The criterion (derived before the run; full derivation in RESULT-V1.md)
Setting: f in F_N with rational q-coefficients, O of discriminant D = -4n (n >= 2), tau_O = sqrt(D)/2 = i sqrt n, z = f(tau_O),
which is real. G = Gal(K_{O,N}/K) = C_N(D) (KSY25 Prop 3.1/4.1), Gamma = Gal(K_{O,N}/Q) = G x| <c> (KSY25 Lemma 7.3).
c g c = kappa(g), kappa([a]) = [conj a] = [a]^{-1} [N(a) O].
(L1) [Gamma, Gamma] = { kappa(g) g^{-1} } = { [conj(a)/a] }.
(L2) Q(z) abelian <=> [Gamma,Gamma] fixes z <=> sigma_{[conj a]}(z) = sigma_{[a]}(z) for all [a]
     <=> conj(sigma(z)) = sigma(conj z) for all sigma in G.
(L3) For real z: Q(z) abelian <=> every conjugate of z is real (Q(z) totally real).
(L4) The subgroup that must be 2-torsion is NOT Gal(K(z)/K) but Gal(K^+_N(z)/K^+_N), K^+_N = K(cos 2 pi/N)
     (on ker(norm map) = Gal(K_{O,N}/K^+_N), kappa is inversion). This is necessary, not sufficient in general.

## Families and ranges
F1  R(q) Rogers-Ramanujan, q = e^{-2 pi sqrt n}: z = R(i sqrt n), N = 5, n = 1..60 (n = 1 by algdep; D = -4 excluded in KSY25).
F2  cubic CF G(q) at q = e^{-pi sqrt n}: z = Gt(i sqrt n), Gt(z) = G(z/2), N = 6 (level checked numerically), n = 1..60.
F3  p.206 piece b_1 at n: z = (2 th[1/n](i sqrt n)/th[0](i sqrt n))^n, N = 4n; n = 7, 11, 13 (controls), 9, 15, 21, 25.
Each z: K-conjugates by KSY25 Thm 6.2/7.5 + Rem 7.6, distinct values -> integer minimal polynomial P (rounding error
>= 50 digits), check P(z) = 0 with z recomputed directly at 2W digits. Verdicts: ABELIAN = galoisinit(P) succeeds and
galoisisabelian; NOT ABELIAN = a prime with unequal factor degrees (rigorous non-Galois) or galoisinit refuses or non-abelian group.
REAL-CONJ = polsturm(P) = deg P.

## Predictions
P1 (law L3, all families): ABELIAN <=> REAL-CONJ for every value computed. Bar: zero mismatches. Prior 97% (a theorem; a
   mismatch means a bug or a wrong derivation).
P2 (naive (H): ABELIAN <=> Gal(K(z)/K) elementary 2-group): predicted to FAIL. Specific predicted failures: F3 at n = 7
   (Gal cyclic of order 3) and n = 13 (invariants contain 6). Scored on abelian cases via SNF of galoisisabelian; on non-abelian
   cases (H) is consistent when deg P is not a power of 2, undecided otherwise.
P3a (F1): abelian exactly at n = 1 among n = 1..60. (Reason guessed: the "torus" (O/5O)*/(Z/5)* of order 4, 5 or 6 is cyclic and
   kappa inverts it; R(tau_O) should see it.) 'n idoneal' rule therefore predicted to FAIL at every idoneal n >= 2. Prior 65%.
P3b (F2): abelian exactly at n in {1, 2, 5, 8} (idoneal AND torus (O/6O)*/((Z/6)* O*) elementary 2, i.e. n = 2 mod 3; n = 1 via
   extra units). Prior 40%.
P3c (F3): abelian exactly at {7, 9, 13, 25} among {7, 9, 11, 13, 15, 21, 25} (confirmatory of BAR-IDONEAL by an independent
   method); 'n idoneal' FAILS at 15, 21. Prior 85%.
P4 (cross-family): the 'n idoneal' rule is not the law for F1, F2 (fails somewhere in each). Prior 75%.
P5 positive/machinery controls: (i) F1 at n = 13 reproduces KSY25 Example 8.1 exactly (degree 24, x^24 + 82 x^23 - 996 x^22 ...
   + 1); (ii) F3 controls: n = 7 ABELIAN deg 3, n = 13 ABELIAN deg 12, n = 11 NOT ABELIAN deg 15 (C1 degrees h(p-1)/2);
   (iii) every P: rounding error >= 50 digits and |P(z)| ~ 0 at 2W; (iv) two different class representatives give the same value
   (spot check).
P6 null: (i) a random monic integer polynomial of degree 24 -> NOT ABELIAN; (ii) x^3 - 4x - 1 (totally real, S3, not a CM value)
   -> NOT ABELIAN: shows L3 needs the ray-class-field hypothesis (REAL-CONJ alone does not imply abelian).

## Scoring
Each P scored HOLDS / FAILED as written; nothing re-scored after the run. Anything added later is labelled POST HOC.
Resource rule: one gp at a time, -s 2G, each run < 20 min; a family that does not finish is reported as NOT RUN for the missing n.
