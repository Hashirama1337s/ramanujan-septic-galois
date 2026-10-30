# BAR-D1 (sealed before stepd.py is run at any prime)

## In plain words
CERT-C4-STRONG proved its sine-product identities at p = 5, 7, 13, 37 with "certified numerics": exact algebra plus trusted
floating point. Here every analytic step is redone inside guaranteed error balls (Theorem M + Arb, RESULT-M1.md). If every step
is enclosed, the identities become rigorous (resting on Arb's correctness, the cited theorems, and FLINT exact arithmetic).

## Instrument
- stepd/stepd.py (sha256 in SEALS.txt) using ../certmin.py v1.2 (conjugate balls at 2x the certified W) and python-flint exact
  fmpz/fmpq polynomial arithmetic. Candidate c_1 (only a candidate) exported from PARI by stepd/expc1.gp (c1_p<p>.txt, same
  construction as CERT Step C); its origin is irrelevant, every claim about it is verified below.
- Command: `py -3.11 -I stepd.py 7 5 13 37` -> stepd_out.txt. No stepd.py run before this seal (API smoke test on toy inputs only).

## Predictions (each p in {5, 7, 13, 37}); all must hold for "RIGOROUS"
- X1: P_N (minimal polynomial of 2cos(2 pi/N)) passes the exact identity x^deg P_N(x + 1/x) = Phi_N(x).
- B0: G_p re-certified at 2W, identical to certG_p<p>.txt; conjugate balls pairwise disjoint; d = phi(N)/2.
- X2: G_p(c_1) = 0 exactly in Q(theta).
- X3: c_1^E = 2^A p^B prod S_j^(C_j/2) exactly (the CERT e_mult form; E = 1, 2, 6, 4 at 7, 5, 13, 37).
- X4: c_1^2 = 4^a p^(2b) prod S_j^(n_j) exactly (the E = 1 forms of CERT §3 / minexp_out.txt).
- B1: the ball of iota(c_1) meets the ball of b_1 and no other conjugate ball (so iota(c_1) = b_1).
- B2: iota(c_1) > 0 and 2^a p^b prod (2 sin(pi j/N))^(n_j) > 0, balls overlap.
- B3: for every a in (Z/N)*/{+-1}, iota(sigma_a(c_1)) meets exactly one conjugate ball, bijectively; every principal b_k is hit
  with a positive value; the a_k agree with CERT §3 (p = 13: 1, 17, 9, 23, 25, 3; p = 7: b_2 <- 3, b_3 <- 2).
- X5 (p = 7 only): b_2^2 = S_1^-2 S_2^6 S_3^-4 and b_3^2 = S_1^6 S_2^-4 S_3^-2 exactly (Rebak forms d_1^6/d_2^4, d_1^-4 d_2^-2).
- Time: whole run under 5 minutes.

## Scoring
RIGOROUS at a prime iff every item holds there. CERT-C4-STRONG.md status is changed to "rigorous (ball arithmetic)" only for
primes that are RIGOROUS; any failure stays "certified numerics" there and is logged as FAILED (instrument crashes logged, fixed,
re-run, and said so).
