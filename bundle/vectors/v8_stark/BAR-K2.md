# BAR-K2 (sealed before any run): D5, Ramanujan's b_1 itself on M = K(q), p = 23 (h = 3), character by character. 2026-10-28.
User-seat, boss #2. Instrument: k2.gp (sha256 in SEALS.txt), WSL PARI/GP 2.17.3, one core (default(nbthreads,1), printed),
realprecision 120. Output: k2_out.txt. Before sealing only probe2.gp was run (generic lattice; PARI syntax; L'(0, rho) of one class
character printed as a syntax check, it is not a scored quantity since the scored items compare it with b_1 data never computed).

## In plain words
BAR-K1 only tested the NORM of b_1 (one third of its information at p = 23). Here we test b_1 itself, in all 33 mirror images, and
in all 33 characters. The prediction comes from re-reading the lab's V3C proof one level deeper: each mirror image of b_1 is an exact
combination of (a) three of Robert's elliptic units of conductor sqrt(-23) and (b) a Hilbert-class-field factor (Dedekind eta /
Delta values). Two new predictions follow: b_1 is NOT simply a Stark unit of M (our earlier guess D5 is predicted to FAIL), but a
fixed "two-Euler-factor" twist of one, plus a class-field piece weighted by (rho(P) + rho(Pbar) - 2).

## PROOF DRAFT D5 (unrefereed; written out in DICTIONARY-SKELETON §2, D5)
Notation: sigma = sigma_Q sigma_t in Gal(M/K) (RESULT-V3C Step 2a), b = b_Q = c_Q O_K (V3C l.159), a = N b, u = a' t mod p,
ubar = u/2 mod p, C3 = ubar·bbar, C1 = C3·Pbar, C2 = C3·P, G(C) := 12 log|g(1; q C^{-1})| = log|theta(1; q C^{-1})| (Siegel g of
V3C l.95; Robert theta of Ferrara §2.1), ldelta(L) := log(A(L)^6 |Delta(L)|) (A = covolume), Dd(b) := ldelta(bP) + ldelta(bPbar) - 2 ldelta(b).
- **D5-E (element level).** 12 log|sigma(b_1)| = p [G(C1) + G(C2) - 2 G(C3)] - p Dd(b).
  Source: V3C Step 2(c) value V(c, u) (l.160), Step 4 decomposition f = 1_P + 1_Pbar - 1 (l.186-190) applied to each sigma (not summed);
  each Phi_u(e, s) is Kronecker's E(z', e; s) at z' = ubar sqrt(-p) Ne/p (second limit formula, V3C Step 3); the w-term is the
  same decomposition at u = 0 with Kronecker's FIRST limit formula (poles cancel: 1 + 1 - 2^s), and log 2 cancels.
- **D5-X (i), chi != 1, any rho:** sum_{sigma in G} X(sigma) log|sigma(b_1)|^2 = -p [chi(2)(rho(P) + rho(Pbar)) - 2 chi(4)] L'(0, X),
  i.e. -p [X(Fr_P)(1 - X(Fr_Pbar)) + X(Fr_Pbar)(1 - X(Fr_P))] L'(0, X). (From D5-E + Ferrara Thm 2.8 with chi(sigma); the Dd term is
  killed by sum_u chi^2(u) = 0.) For rho = 1 this is D1 (V3C).
- **D5-X (ii), chi = 1, rho != 1:** sum_sigma rho(sigma) log|sigma(b_1)|^2 = 2 p m (rho(P) + rho(Pbar) - 2) L'_K(0, rho), L_K unramified
  (S = {inf}). (Robert part vanishes: L'_{S0}(0, rho) = 0 because rho(q) = 1; the Dd part by the first limit formula
  L'_K(0, rho) = -(1/12) sum_C rho(C) ldelta(C) and the Hecke functional equation.)
- **Artin direction (AUDIT A4):** all of D5 is independent of it. sum_sigma X(sigma) log|sigma b_1| = sum_sigma X^c(sigma) log|sigma b_1|
  with X^c = rhobar (x) chi, because b_1 is real and c sigma c^{-1} inverts the class part and fixes the cyclotomic part; L(s, X) = L(s, X^c);
  and rho(P) + rho(Pbar) is symmetric. So the requested rho vs rho-bar control is PREDICTED DEGENERATE (R1 below), and the content
  controls are Z1-Z5.

## Predictions (pass = |diff| < 1e-50; null "fails as predicted" = |diff| > 1e-3 at EVERY item it is run on)
- Q1: D5-E holds at all 33 embeddings (Siegel g form). Q1': same with Robert theta, embeddings of the principal form (11).
- X0: trivial character, sum log|sigma b_1|^2 = 0. Calibration (V3C-implied, not new): rho = 1, chi != 1, 10 characters, (i).
- **Q2 (new): (i) for the 20 characters rho != 1, chi != 1.**   **Q3 (new): (ii) for the 2 characters chi = 1, rho != 1.**
- R1: labelling sigma_Q by [b_Q] or by [bbar_Q] gives the same LHS for all 33 characters (|diff| < 1e-50): predicted DEGENERATE.
- Nulls (content): Z1 wrong ideal class (b -> bP in D5-E); Z2 wrong level (a single conductor-q Robert value p G(C3), no 2-structure,
  no Delta term); Z3 ubar = u (missing the 1/2 from O_K/q); Z4 Delta term dropped; Z5 the old GUESS "sigma_2(b_1) = Stark unit of M/K,
  S = {inf, q, P}", i.e. -2p chi(2)(1 - rho(P) chi(2)) L'_{S0}(0, X) (and 0 for chi = 1), on the 22 rho != 1 characters.
Item counts: Q1 (33), Q1' (11), X0 (1), calibration (10), Q2 (20), Q3 (2), R1 (33), Z1-Z4 (33 each), Z5 (22). Each line is one verdict.

## Hypotheses asserted in the script
p prime, p = 7 mod 8; h = bnf.no = qfbclassno(-4p) = #reduced forms, bnfcertify = 1 printed (no GRH); gcd(a_Q, 4p) = 1 after swap;
N b_Q = a_Q; P = (2, (1+sqrt-23)/2) identified by valuation; ray class group mod q has order h m = 33; every X = rho (x) chi matches
exactly one ray class character by values on all prime ideals of norm < 400 (Hecke L-function by lfun on that character).

## Instrument checks (< 1e-80; a fault makes the run VOID, logged; code-only amendment allowed, predictions never)
nbthreads = 1; b_1 Theorem-M vs Ramanujan's series; b_1 unit (sum of 33 logs); principal-form values real; |theta| = |g|^12 on a test
lattice; ray-class invariance (ubar vs ubar + p); delta homothety invariance.

## Scoring
Headline = Q2 and Q3 (content beyond V3C). BAR-K2 HOLDS iff Q1, Q1', X0, calibration, Q2, Q3, R1 pass and Z1-Z5 fail as predicted.
Any miss is reported by name as FAILED. No threshold or convention changes after the run.
