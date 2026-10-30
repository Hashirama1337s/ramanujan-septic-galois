# Status of every released claim

Moki & Julio (AI-assisted). Public status table for the supplementary bundle of release version 1, October 2026.

## In plain words
This page lists each result of the paper, what it says, and how far it has been checked. "PROVED (AI-refereed)" means a written
proof is in this bundle and independent AI reviewers accepted it (with fixes, which were applied). **No human expert has checked any
of these proofs yet**; that reading is the real bar for calling them theorems. Nothing here depends on the generalised Riemann
hypothesis (GRH). One update is newer than the paper's text: the certified minimal polynomials at p = 47, 61 and 67 (see C10).

## Status words
- **CLASSICAL**: follows from known theory, with a reference.
- **PROVED (AI-refereed)**: written proof in this bundle, accepted (with fixes, applied) by independent AI reviewers; not checked by a human expert.
- **PROOF DRAFT**: written proof in this bundle, not yet listed as proved; the referee verdict is given where a round was run.
- **RIGOROUS (ball arithmetic)**: every analytic step enclosed in certified error balls (Arb), plus exact algebra; rests on the
  ball-arithmetic library and on the cited theorems.
- **CERTIFIED numerics**: exact algebra plus high-precision floating point with very large margins; no interval arithmetic.
- **NUMERICAL**: found and verified numerically (usually by two independent programs), not proved.
- **REFUTED**: shown false by a counterexample. **OPEN**: not settled. **NOT CLAIMED**: computed, but resting on an unproved
  hypothesis or an unfinished check. **POST HOC**: seen after the run, not pre-registered.
- Condition tags: **[unconditional]** (no unproved hypothesis, in particular no GRH); **[Euler-list]** (an explicit list uses Euler's
  65 idoneal numbers where Grube's theorem does not decide; complete except possibly for one odd squarefree idoneal number m > 1848).

## Setting
f(a,b) = sum over n in Z of a^{n(n+1)/2} b^{n(n-1)/2}; phi(q) = f(q,q). For an odd prime p let q = e^{-pi/sqrt p},
u_k = 2 q^{k^2/p} f(q^{p+2k}, q^{p-2k}) / phi(q^p) for k = 1..(p-1)/2, b_k = u_k^p, P_p = u_1 u_2 ... u_{(p-1)/2}.
K = Q(sqrt -p); N = p if p = 3 (mod 4), N = 4p if p = 1 (mod 4); h = h(-4p).

## Table
| item | statement (short) | status | conditions | where in the bundle |
|---|---|---|---|---|
| Identity I_p | phi(e^{-p pi sqrt p}) = p^{-3/4} phi(e^{-pi sqrt p}) (1 + u_1 + ... + u_{(p-1)/2}) | CLASSICAL | - | paper section 2.2 |
| A (the product) | P_p = 2^{(p-1)/2} / f_W(sqrt -p)^{p-1} (Weber's function); Q(P_p) = Q(j(sqrt -p)); deg P_p = h | CLASSICAL | - | paper section 2.3 |
| C1 field rule | each b_k lies in the real subfield F_p of K(j(sqrt -p), zeta_N); [F_p : Q] = h(p-1)/2 (p >= 5) | PROVED (AI-refereed) | unconditional | `proof/proof-C1-C3-v4.md` |
| C2 Galois rule | sigma_a(b_k) = b_{+-xk} with x^2 = eps(a) a (mod p); one row plus C2 gives every b_k | PROVED (AI-refereed) | unconditional | `proof/proof-C1-C3-v4.md` |
| C3a, C3b, C3c | each b_k is an algebraic integer with norm +-2^e; b_k is a unit iff p = 7 (mod 8) | PROVED (AI-refereed) | unconditional | `proof/proof-C1-C3-v4.md`, `proof/v5/proof-C3c-C4-v5.1.md` |
| Prop D; C4 abelian form | the product b_1...b_m generates Q(j(sqrt -p)); all b_k lie in an abelian field iff h(-4p) <= 2 | PROVED (AI-refereed) | unconditional; two cited propositions' proofs not opened | `proof/v5/` |
| C4 list form | h(-4p) <= 2 iff p in {3, 5, 7, 13, 37} | PROVED (AI-refereed) | unconditional (published class-number-1 and -2 lists) | `proof/v5/` |
| C4 strong form (sine products) | at p = 5, 7, 13, 37 each b_k is 2^a p^b times a product of 2 sin(pi j/N) | RIGOROUS (ball arithmetic) | Arb/FLINT; Theorem M | `proof/cert/`, `vectors/v5_method/stepd/` |
| R1 | "cosine forms iff n idoneal" for odd composite n | REFUTED | - | `idoneal/`, `veins/v23/` |
| C5 composite rule | for odd n >= 3 the pieces generate an abelian field iff n is idoneal and a prime power; list {3, 5, 7, 9, 13, 25, 37} (field E of all pieces, and b_1 at idoneal n) | PROVED (AI-refereed) | unconditional (Grube) | `veins/v23/C5-proof-v3.md` |
| C5 certificates | b_1 lies in no abelian field at n = 15, 21, 33, 45, 57, 85, 93, 105 (non-real roots of the integer minimal polynomial) | CERTIFIED numerics | - | `veins/v23/` |
| V3 Ramanujan units | for p = 7 (mod 8): w-units in F_p (sufficiency); the L-value identity V3C; Corollaries 1-2 | PROVED (AI-refereed) | unconditional | `veins/v3b/`, `veins/v3c/` |
| C8 unit index | for every p = 7 (mod 8): rank and index of the Galois conjugates of N(b_1) in the Hasse-unit group, [S:X] = product over even characters chi != 1 with chi(2) != 1 of p |B_{1,chi psi}| | PROVED (AI-refereed) | unconditional | `vectors/v2_index/` |
| C6 cubic and quintic | for odd m >= 3, Berndt-Rebak's cubic (l = 3) and quintic (l = 5) pieces at i sqrt m are abelian over Q iff m idoneal and (l divides m, or l = 3 and m = 2 mod 3) | PROVED (AI-refereed) | unconditional; explicit lists [Euler-list] | `vectors/v1_wall/` |
| C7 Rogers-Ramanujan | R(i sqrt n) generates an abelian extension of Q iff n = 1 | PROVED (AI-refereed) | unconditional | `vectors/v3_rr/` |
| C7 real-conjugate count | real count = r(n) times the size of Cl(O)[2] | PROOF DRAFT (one round, CORRECT) | unconditional | `vectors/v6_shape/RESULT-S1.md` |
| Theorem G | for odd l and odd m >= 3, the level-l pieces at i sqrt m are abelian over Q iff m idoneal and (l a prime power dividing m, or l = 3 and m = 2 mod 3); case (D) via the repair accepted by two referees | PROVED (AI-refereed) | criterion unconditional; explicit lists [Euler-list] | `vectors/vG_level/`, `vectors/v6_shape/REPAIR-GD.md` |
| Theorem U (frame) | a CM value of a level-N modular function with rational q-coefficients is abelian over Q iff complex conjugation commutes with the Galois group on its orbit | PROVED (AI-refereed, as part of Theorem G) | unconditional | `vectors/vG_level/RESULT-G1.md` |
| Theorem S-A (shape) | degree and real-count formulas for prime l, the all-inert composite family, and l = p^e dividing m | PROOF DRAFT (one round, CORRECT WITH FIXES / CORRECT) | unconditional | `vectors/v6_shape/RESULT-S1.md` |
| Q(b_1) = E for prime powers n >= 25 | by-product of the case-(D) repair | PROOF DRAFT (refereed with the repair) | unconditional | `vectors/v6_shape/REPAIR-GD.md` |
| C9 valuation law | for p != 7 (mod 8): v_P(b_k) = p at every prime P above 2, (b_k) = r^p, b_j/b_k is a unit | PROVED (AI-refereed) | unconditional | `vectors/v4_factor/` |
| C9 corrected residue-degree law | every prime of F_p above 2 has residue degree f_M or f_M/2, f_M = lcm(f_H, ord_p 2) | PROOF DRAFT (one round, CORRECT WITH FIXES) | unconditional | `vectors/v6_shape/RESULT-S1.md` |
| C9 residue degrees as first stated | f_M = lcm(2, ord_p 2) | REFUTED (p = 23, 31, 47) | - | `vectors/v6_shape/RESULT-S1.md` |
| C10 Theorem M | the analytic values B_k(t_Q + x_Q) hit every embedding of F_p exactly once, so prod (x - v) = G_p^l, l = [F_p : Q(b_1)]; distinct values force l = 1 | PROVED (AI-refereed) | unconditional | `vectors/v5_method/RESULT-M1-v2.md` |
| C10 certified G_p | minimal polynomial G_p of b_1 certified for every prime 5 <= p <= 97 (20 primes in RESULT-M1-v2; 47, 61, 67 in the sealed BAR-M2 run); hence Q(b_1) = F_p at every prime 5 <= p <= 97 | RIGOROUS (ball arithmetic) | Arb/FLINT; Theorem M | `vectors/v5_method/`, `vectors/v5_method/m2/RESULT-M2.md` |
| U-GG (Goellnitz-Gordon, level 8) | for m >= 2: abelian over Q iff m odd and 4m idoneal, i.e. m in {3, 7, 15} | PROOF DRAFT (one round, CORRECT WITH FIXES) | unconditional (Grube) | `vectors/v9_even/` |
| U-CF (cubic continued fraction, level 6) | for n >= 2: abelian over Q iff n even and 9n idoneal, i.e. n in {2, 8} | PROOF DRAFT (one round, CORRECT WITH FIXES) | unconditional (Grube) | `vectors/v9_even/` |
| K: Stark dictionary D1, D1', D2, D4, D5 | for p = 7 (mod 8): sigma_2(N(b_1)) is the rank-one Stark unit (up to a root of unity) of Q(zeta_p)/Q(sqrt -p); b_1 is a product of three conductor-q Robert units and a Delta-quotient from the Hilbert class field and, when h(-p) > 1, not a Stark unit of M/K for any S | PROOF DRAFT (one round each) | unconditional (Stark's theorem) | `vectors/v8_stark/` |
| Tables | cosine tables at 11, 13 (and 17-79); quintic over Q(P_11); Q(b_1) = E at other composites | NUMERICAL | - | root, `p13/`, `sweep/` |
| Unit observations | converse of the w-unit criterion; P_p = eps_J^{+-(p-1)}; mixed-index pattern | NUMERICAL | - | `veins/v3b/`, `veins/v23/` |
| Full unit indices of F_23, F_31 | computed with PARI's bnfinit | NOT CLAIMED | GRH | `veins/v23/` |
| Open | Q(b_1) = F_p for p > 97; a conceptual proof of the sine forms; S-A for composite l split or dividing m; C9 counts for p = 5 (mod 8) and for p = 1 (mod 8) with ord_p 2 even; the Stark dictionary for p != 7 (mod 8) and other families; U at m = 1, n = 1 | OPEN | - | - |

Update relative to the paper's section 7.7 (release version 1): the paper lists p = 47, 61, 67 as open for the certified G_p and for
Q(b_1) = F_p. They are now certified by the sealed run BAR-M2 (`vectors/v5_method/m2/`: degrees 115, 180, 99 as predicted before the
run; every coefficient ball holds exactly one integer; all conjugate balls pairwise disjoint; the wrong-convention control is
non-integral; the p = 53 control reproduces the stored certificate byte for byte). The certificate rests on Theorem M and the
ball-arithmetic library; no second independent implementation was run at these three primes.

## GRH audit
No result above rests on the generalised Riemann hypothesis. GRH enters only through PARI's `bnfinit`, in a superseded exploratory
search (`structure/`) and in the full unit-group indices at p = 23, 31, which are NOT CLAIMED. C8 and the unit identities use analytic
conjugates and exact integer algebra only.
