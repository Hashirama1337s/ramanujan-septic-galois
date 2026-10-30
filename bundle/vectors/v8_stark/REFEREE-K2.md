# REFEREE-K2 (independent AI reviewer, round 1, 2026-10-28; D5 of DICTIONARY-SKELETON section 2) - saved by the lead from the hand-back

## In plain words
D5-E, (i) and (ii) are correct. They follow from V3C Steps 2(c)-4 applied to one Galois element at a time, plus Kronecker's FIRST
limit formula. Sealed at p = 23; unsealed referee checks at p = 31 and 47 pass; an independent re-implementation passes at p = 23
and 31. The mechanism is classical. Wording needs fixes (scope, sources, one reading). New-in-kind: no; ceiling: corollary.

| Claim | Verdict |
|---|---|
| D5-E | CORRECT WITH FIXES (scope wording, source label) |
| D5-X (i) | CORRECT WITH FIXES (cite Ferrara Thm 2.8 with its misprint corrected) |
| D5-X (ii) | CORRECT; reading fix (the Euler factors are multiplied) |
| "sigma_2(b_1) is a Stark unit of M/K" is false | CORRECT WITH FIXES (Z5 fair; "for any S" needs the one-line proof below) |
| rho vs rho-bar degenerate | CORRECT (R1 can never fail, so it is not evidence) |
| Scoring BAR-K2 / AMENDMENT-K2a | HONEST, paperwork notes |

## Sources
- Wikipedia "Kronecker limit formula", OPENED: first formula E(tau,s) = sum y^s/|m tau + n|^{2s} = pi/(s-1) + 2 pi (gamma - log 2 -
  log(sqrt y |eta(tau)|^2)) + O(s-1). Matches D5. (V3C had opened this page for the second formula only.)
- Ferrara arXiv:1904.10561v2 pp.6-7, OPENED: Def 2.6 E(sigma) = theta(1, f c^{-1})^f; Thm 2.8 (chi(sigma) missing - misprint, K1).
- Siegel Tata lectures, Lang ch. 20: NOT OPENED.

## D5-E: CORRECT WITH FIXES
Re-derived: phase Im(conj(z') nu)/A(e) = -2 u-bar x/p = e(-u[nu]/p); (Ne/N nu)^s factors give E1 + E2 - 2^s E3; scaling by
lambda = p/(sqrt(-p) Ne) gives C1, C2, C3 as stated, z' not in e; pole part pi(2 - 2^s)/(s-1) -> -2 pi log 2, constants and log 2
cancel; 12 from |theta| = |g|^12, p from b = u^p, factor 2 consistent with k2.gp. Dd(b) = log|2^12 Delta(bP) Delta(bP-bar)/Delta(b)^2|
(element of H_K times 2^12). p = 7: Dd = 0. Nothing depends on h: covers every p = 7 mod 8.
Referee runs (POST HOC, unsealed): k2.gp with p and loops changed at p = 31: Q1 45/45, Q2 28/28 (incl. chi(2) = 1, rho != 1, nonzero),
Q3 2/2, all diffs <= 1e-129, all nulls fail; p = 47 (h = 5): Q1 115/115, Q2 88/88, Q3 4/4, <= 1e-129. Own code (ref_k2.gp; own lattice
reduction, Siegel product, Delta via elleisnum): worst 1.5e-91 (p = 23, 33 embeddings), 3.8e-90 (p = 31, 45), 80 digits.
Fixes: (1) scope "PROOF DRAFT for every p = 7 mod 8; sealed at 23; referee unsealed at 31, 47"; (2) cite first limit formula OPENED;
(3) label mechanism CLASSICAL (distribution/Hecke relation at 2 for Siegel functions + first limit formula).

## (i): CORRECT WITH FIXES
Art(C3) acts on zeta by N(C3) = a u-bar^2 = a' t^2/4; Dd dies since sum_t chi^2(t) = 0 (m odd). Ferrara 2.8 with chi(sigma) inserted
and |.|_v = |.|^2 gives X(sigma_4) X-bar(tau)(-12p L'); with rho(P) rho(P-bar) = 1 the bracket is chi(2)(rho P + rho P-bar) - 2 chi(4).
Fix: cite Thm 2.8 "with chi(sigma) inserted (misprint, REFEREE-K1)" and the |.|_v convention.

## (ii): CORRECT; reading fix
m = [M:H]. L'_K(0,rho) = (sqrt p/2 pi) L_K(1, rho-bar) (root number 1), L_K(1,rho) = -(pi/6 sqrt p) sum rho-bar(C) ldelta(C) (w = 2),
so L'_K(0,rho) = -(1/12) sum rho(C) ldelta(C); checked vs lfun 2.7e-94 (p = 23), 5.1e-93 (p = 31).
Reading: (rho(P) + rho(P-bar) - 2) = -(1 - rho(P))(1 - rho(P-bar)), so (ii) = -2pm L'_S(0,rho) with S = {inf, P, P-bar}. Since
N_{M/H}(b_1) = P_p^p = (2/f(sqrt -p)^2)^{pm} (CONJECTURES A), the unit 2/f(sqrt -p)^2 satisfies Stark's identity for H_K/K with
S = {inf, P, P-bar}, e = 2, up to +-1. Corollary; classical mechanism (Delta(O)/Delta(O_K)).

## Negative claim: CORRECT WITH FIXES
Z5 fair (sealed, off by >= 1e2 on 22/22; at h = 3 no other lift of sigma_2 rescues it). Stronger one-line proof: S must contain q (the
ramified prime); rho(q) = 1, so every rho-component (chi = 1) of any Stark unit of M/K vanishes; b_1's rho-components do not (Q3:
-426.86 at 23, -1066.46 at 31, -2108 and -3846 at 47). So b_1 is in no Q[G]-span of a Stark unit of M/K, up to roots of unity.
Fix: "for any S" rests on this argument; drop the stray "For rho != 1".

## rho vs rho-bar: CORRECT
X^c(sigma) = X(c sigma c); b_1 real so |c sigma c (b_1)| = |sigma(b_1)|; L(s, X^c) = L(s, X). R1 is an identity - not evidence.
Covers only the inversion ambiguity; for h >= 5 assumes KSY25's map = Artin map up to inversion (consistent at p = 47, unsealed).

## Scoring: HONEST
Hash 2408eb41 matches file and LOG; diff --strip-trailing-cr shows only the rP/rPb split; run 1 element block not scored.
Notes: (1) crash log head overwritten by stderr (use >out 2>&1); (2) the amendment says "rPb was undefined" - in fact rP(k) returns
the closure rPb (reproduced; editorial); (3) AMENDMENT-K2a edited after hashing - make hashed files immutable, corrections in a new
file; (4) nulls: Z2, Z4 test content (Z2 a strawman); Z1, Z3 only relabel Galois elements; no null perturbs exactly one constant
(e.g. weights (1,1,-1), C1 = C3 P twice). Matters little: Q1 is proved exactly and matches to 1e-130 on 33 distinct values.

## What is new
Mechanism all classical. New as far as the lab has searched (referee did not search): the explicit b_1 formula with constants; (i) for
rho != 1; the proof that b_1 is not a Stark unit of M/K. Ceiling: corollary.

## Blocks release
Nothing mathematical. Before release: scope line, first-limit-formula citation, Thm 2.8 caveat in D5-X, Euler-factor rewrite of (ii),
the "for any S" proof.

## Next strike
Prior-art gate on: "2/f(sqrt -p)^2 is the Stark unit of H_K/K for S = {inf, P, P-bar}, and b_1 = three conductor-q Robert units x that
unit's Delta-quotient" - check Stark 1980 (IV) and Kubert-Lang ch. 11 for both halves.

Referee scripts copied to referee/ in this folder (ref_k2.gp, k2_p31.gp, k2_p47.gp + outputs; headers in the p31/p47 copies still say
"p = 23" and "33").
