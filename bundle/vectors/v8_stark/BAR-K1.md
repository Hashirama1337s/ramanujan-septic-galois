# BAR-K1 (sealed before any run): the Stark identity for Ramanujan's p.206 unit at p = 7 and p = 23. 2026-10-28.
User-seat, boss #2 (v8_stark). Instrument: k1.gp (sha256 in SEALS.txt next to this file), WSL PARI/GP 2.17.3, one core
(default(nbthreads,1), printed in the output), realprecision 150. Output file: k1_out.txt. Score exactly as written here.
Before sealing only probe_instr.gp was run (a generic lattice, PARI conventions only; no test quantity computed).

## In plain words
We claim that a Galois twin of the norm of Ramanujan's piece b_1 is the "Stark unit" that the Stark conjecture (a theorem for this
base field) attaches to Q(zeta_p) over K = Q(sqrt -p), with one extra Euler factor at a prime above 2. The test computes both sides
of that identity to 150 digits from scratch (L-values from PARI's lfun; Ramanujan's numbers from his own series) and must agree to
50 digits. Four deliberately wrong versions (wrong twin, wrong character, wrong normalisation, wrong Euler factor) must disagree.
At p = 7 we also test the gate's "smarter route": the same unit as an explicit power-quotient of Robert's elliptic units.

## Setting and identity under test
p = 7 mod 8 prime, m = (p-1)/2, K = Q(sqrt -p), q = sqrt(-p) O_K, P = (2, (1+sqrt -p)/2), L := Q(zeta_p) (contains K), Gal(L/K) =
{sigma_s : zeta -> zeta^s, s a square mod p}. N := N_{F_p/Q(zeta_p)^+}(b_1) (veins/v3c/RESULT-V3C.md l.40), computed in each embedding
iota_s (zeta -> e^{2 pi i s/p}) as the product over the h reduced forms Q of B_t(t_Q + x_Q), t^2 = a_Q s (mod p) (Theorem M data,
vectors/v5_method/RESULT-M1-v2.md l.46-58; V3C §4 l.238-240). eps := sigma_2(N), so iota_s(eps) = iota_{2s}(N). chi = even Dirichlet
character mod p (PARI znstar/chareval), X(sigma_s) := chi(s); psi = (./p). S = {inf, q, P}, W = 2p (roots of unity in L).
  LHS(chi) := L'_S(0, X) = chi(2) log 2 L_{S0}(0) + (1 - chi(2)) L'_{S0}(0),  L_{S0}(s) := L(s, chi) L(s, chi psi)  (all four L-values by lfun).
  RHS(chi) := -(1/W) sum_{s square} chi(s) log|iota_s(eps)|^2.

## Predictions (pass = |LHS - RHS| < 1e-50; null "fails as predicted" = |diff| > 1e-3)
- P1 (p = 7, PRIMARY, chi = [2] i.e. chi(3) = e^{2 pi i/3}; also its conjugate [4]): LHS = RHS.
- P2 (p = 23, h = 3, all 10 nontrivial even chi = [2e], e = 1..10): LHS = RHS.
- P3 (p = 7, Ferrara arXiv:1904.10561 Thm 2.8 read WITH chi(sigma) in the sum, |.|_v = |.|^2, S0 = {inf, q}, f = 7, w_f = 1,
  E(sigma_d) = theta(1, q c_d^{-1})^7 with c_d = (nu_d), nu_1 = 1, nu_2 = (1+sqrt-7)/2, nu_4 = 2 (N nu_d = d, Artin(c_d) = sigma_d)):
  L'_{S0}(0, X) = -(1/84) sum_{d in {1,2,4}} chi(d) log|E(sigma_d)|^2, for chi = [2], [4].
- P4 (p = 7, Robert match, the gate's route; derived from P1-type identity + Ferrara Def 2.10/Thm 2.11: u^{84} = E(1)^{14},
  sigma_2(N) = zeta u^{1 - sigma_2^{-1}}): for s = 1, 2, 4: 6 log b_{k(2s)} = 7 (log|R(s)| - log|R(4s)|), R(d) := theta(1, q c_d^{-1}),
  k(c) := the k in 1..m with k^2 = c (mod p) (so iota_c(b_1) = b_{k(c)} by C2).

## Nulls (each must FAIL, |diff| > 1e-3, at every character / item where it is run)
- N1 wrong twin: eps := N (no sigma_2 shift).   N2 wrong character: chibar(s) on the unit side.
- N3 wrong normalisation: log|.| instead of log|.|^2.   N4 wrong S: LHS with S0 = {inf, q} (Euler factor at P not removed).
- N5 (p = 7): Ferrara Thm 2.8 exactly as printed (no chi(sigma) in the sum).   N6 (p = 7): P4 with unshifted b_{k(s)}.
(At 7 and 23, 2 has order m mod p, so chi(2) != 1 for every nontrivial even chi; the nulls are not degenerate by construction.)

## Hypotheses asserted in the script on every item (script stops with an error if one fails)
p prime, p = 7 mod 8; #reduced forms = qfbclassno(-4p); gcd(a_Q, 4p) = 1 after the Theorem-M swap; a_Q s a square mod p; chi even,
chi psi odd; psi = (./p) checked value by value; N(nu_d) = d.

## Instrument checks (must be < 1e-100; any fault = run VOID, not scored, logged as instrument fault)
Ramanujan's f-series route vs theta route for b_1..b_3 at 7 and b_1 at 23; sine control b_1 = d2^6/d1^2 at 7 (C4, l.81 of CONJECTURES);
N a unit (|sum log|iota_s N|| small) at 7 and 23; |Im iota_s(N)| small at 23; iota_s(N) = b_{k(s)} at 7 (h = 1); Robert theta:
|theta| periodic, theta homogeneous of degree 0, Delta = g2^3 - 27 g3^2 at each test lattice; nbthreads = 1 printed.

## Scoring
Headline = P1. BAR-K1 HOLDS iff P1, P2 (all 10), P3 (both), P4 (all 3) pass and every null fails as predicted. Any single miss is
reported by name as FAILED (no re-tuning of thresholds, no re-definition of conventions after the run). A crash before scoring is an
instrument fault: fix by a logged amendment that changes code only, never predictions.
