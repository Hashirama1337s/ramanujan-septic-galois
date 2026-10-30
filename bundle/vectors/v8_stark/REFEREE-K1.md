# REFEREE-K1 (independent AI reviewer, round 1, 2026-10-28) - saved by the lead from the seat's hand-back (the seat had no write tool)

## In plain words
The maths in D1, D1', D2 and D4 holds up. Each is a short, correct corollary of the lab's V3C theorem plus Stark's theorem as
Ferrara prints it. The one formula that rested on an unopened source (Lerch) is now sourced from a standard reference and agrees
numerically. What is wrong is the framing: the wording says "Ramanujan's numbers are Stark units", but what is shown is about the
NORM of b_1. That norm equals b_1 only at p = 7 (the only prime = 7 mod 8 with class number 1). The sealed 70/70 is real, but only
10 of its items test anything V3C had not already settled.

| Claim | Verdict | What fails or needs fixing |
|---|---|---|
| D1 | CORRECT WITH FIXES | every step checks; Lerch now sourced; wording overclaims |
| D1' | CORRECT WITH FIXES | logic sound; the |.|_v = |.|^2 convention is not defined in Ferrara; only the numerics pin it |
| D2 | CORRECT WITH FIXES | exponent 6 and zeta in mu_{2p} right; sealed test only at p = 7 (J trivial); referee's unsealed p = 23 check (h = 3) holds |
| D4 | CORRECT WITH FIXES | rests on Ferrara Thm 2.11 as stated (Stark 1980 not opened); "p-part" reading valid since c(sigma_{k^2}) = k^2 mod p |

## Lerch source (OPENED)
DLMF 25.11.18: "zeta'(0,a) = ln Gamma(a) - 1/2 ln(2 pi)", a > 0. DLMF 25.15.3: L(s,chi) = k^{-s} sum_{r=1}^{k-1} chi(r) zeta(s, r/k).
DLMF 5.5.3: Gamma(z) Gamma(1-z) = pi / sin(pi z). Together: L'(0,chi) = -C_chi/2 in V3C's normalisation. Numerically checked against
lfun for every even chi != 1 at p = 7, 23: error <= 1.5e-76.

## Ferrara Thm 2.8 misprint: CONFIRMED (OPENED)
arXiv:1904.10561v2 p.7: Thm 2.8 sums log|E(sigma)|_v with no chi(sigma); Conj 2.1 and Thm 2.11 both have chi(sigma).

## D1 detail
Re-derived: squares meet each +-class once (sum = 2A_chi); V3C in L' form gives -2p chi(2)(1-chi(2)) L'_{S0}; Euler factor at P is
(1 - chi(2) 2^{-s}), Frob_P = sigma_2 since NP = 2 and psi(2) = 1, so P and P-bar account for the full factor at 2; the sigma_2 shift
contributes chi-bar(2); for X = 1 the order of vanishing is |S| - 1 = 2 and the norm of epsilon is +-1. For chi(2) != 1, r = 1; for
chi(2) = 1, r = 2 and both sides are 0 (unsealed check p = 31, chi = [10], [20]: |RHS| <= 4.3e-74).
Fixes: (1) replace "Lerch, NOT OPENED" by DLMF 25.11.18, 25.15.3, 5.5.3 (V3C l.214-216, AUDIT A2, DICTIONARY section 2);
(2) say "Stark unit up to a root of unity" in CONJECTURES K and plain words.

## D1' detail
Uniqueness sound: Ferrara Rem 2.2(3) (OPENED): "If |S| >= 3 ... u ... is determined up to multiplication by a root of unity."
u^{1 - sigma_2^{-1}} gives (1 - chi(2)); q totally ramified so u' is a unit. Fix: Ferrara never defines |.|_v (l.160: "a particular
absolute value"); cite Tate 1984 for |x|_w = |x|^2 at a complex place, or say "pinned numerically by P3/N3".

## D2 detail
u^{12p} = E(J)^{2p} gives u^6 = zeta E(J), zeta in mu_{2p}, so epsilon^6 = zeta'' E(J) / sigma_2^{-1} E(J). Sealed P4 at p = 7 only
(J = 1). Unsealed referee check at p = 23 (h = 3, J nontrivial; ray classes as (ideal class, N c mod p)): 6 log|iota_s epsilon|
matches the Robert side to 3.9e-73; sigma_2 in place of sigma_2^{-1} fails (min diff 7.6); omitting the sigma_2 shift fails (46);
swapping the representative ideal changes nothing (1.3e-74). At p = 7 the sigma_2 null fails (1.77) and Thm 2.8 with chi-bar fails
(0.91), confirming Artin(c_d) = sigma_d. Fix: "matched at p = 7 (sealed) and p = 23 (referee, POST HOC)".

## D4 detail
The compositum L(u^{1/2p}, zeta_{4p^2}) is abelian over K. Witness epsilon^{k^2 - sigma_{k^2}} = sigma_2(N(w_k))^p follows from
RESULT-I1 l.89. Fix: note sigma_{k^2} acts on mu_{2p} by c = k^2 mod p, c odd; keep A14 "interpretive".

## BAR-K1
Hashes recomputed, match SEALS.txt; diff shows only the 10 brace edits. VOID output has no P or N value. Caveats: SEALS.txt last
written 22:38:16, after run 2 (22:37:54), so the pre-run seal rests on BAR-K1's own timestamp (22:37:11) and the LOG line; the
amendment's "line by line" explanation does not match the VOID log (editorial only). All 6 nulls differ from the truth by a known
nonzero factor (chi(2), 2, (1 - chi(2)), complex conjugation, missing chi): they fail for the right reason but test conventions, not
content. P1, P2 (60 items) follow from proved V3C; the risky items are P3, P4, N5, N6 (10 items). Report it that way.

## Scope (A3-A5) and prior art
Nothing is claimed at the level of b_1 itself except the plain-words line "Ramanujan's own numbers are these units"; fix to "the
sigma_2-twin of the norm of b_1 (= b_1 at p = 7)". Kubert-Lang Thm 4.2 + V3C Cor 1 already nearly gives D1: credit novelty to V3C.

Blocks release: only the wording and citation fixes above. Next strike: sealed D5 test at p = 23 (rho (x) chi characters, rho vs
rho-bar control), DICTIONARY section 4 item 2. Referee's unsealed script: private working folder ref_k1.gp (private working folder, not shipped).
