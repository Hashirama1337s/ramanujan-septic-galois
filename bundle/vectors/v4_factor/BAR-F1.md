# BAR-F1: vector 4, the ideal (b_k) at the primes above 2 (sealed before the test primes are computed)
2026-10-28, vector-4 seat. Internal; not for release. Hashes of this file and of the engine (f1.gp, test.gp) go to SEALS.txt and
../../LOG.md. Nothing at the test primes 37, 41, 43, 53 has been computed by this seat before sealing (no minimal polynomial,
no Newton polygon, no nfinit).

## What the training run showed (train.gp -> train_out.txt; primes 5, 13, 17, 11, 19, control 23; train2.gp -> train2_out.txt: 29)
The direct nfinit([G,[2]]) at 29 (degree 84, 577-digit coefficients) was stopped by hand after about 10 minutes at 1.7 GB; the
"unit model" (nfinit of the minimal polynomial S of z = b_1^e/2^p, exact relation e v_P(b_1) = p e_P + v_P(z)) reproduced the direct
factorisation exactly at 5, 13, 17, 11, 19 and is the T3 instrument below. At 29: Newton polygon single slope 29/2 and the unit
certificate held (the unit-model nfinit at 29 was still running when this bar was written). At every training prime, every prime P above 2 in Q(b_1) = F_p has the same ramification index e (2 for p = 1 mod 4, 3 for
p = 3 mod 8, 1 for p = 7 mod 8) and the same valuation v_P(b_1) = p (0 at 23); every conjugate of b_1 that lies in F_p has the
identical valuation vector; b^e/2^p is a unit for every conjugate b (Graeffe certificate); the residue degrees vary
(p = 17: f = 4, 4, 8), the valuations do not. So the 2-power is spread uniformly: the ideal (b_k) does not depend on k or on P.

## Formula under test (from proof v5.1 Thm C3 read prime-by-prime; to be proved on the page in RESULT-F1.md)
Let p >= 5 be prime, c = 0, 4, 6 and e = 1, 3, 2 for p = 7 mod 8, 3 mod 8, 1 mod 4 (2 split, inert, ramified in K = Q(sqrt -p)).
(F) For every k and every prime P above 2 of any number field L containing b_k:  v_P(b_k) = (p c / 12) e(P|2).
(R) In F_p every prime above 2 has e(P|2) = e. Hence in F_p:  v_P(b_k) = p for every P | 2 and every k (p != 7 mod 8), and 0 for
    p = 7 mod 8. Equivalently (b_k) = r^p with r = prod_{P|2} P the radical of 2 in F_p (r^e = 2 O_{F_p}); b_j/b_k and b_k^e/2^p are units.
The decomposition of 2 in J = Q(j(sqrt -p)) and in Q(zeta_p)^+ affects only the number and residue degrees of the P, not v_P.

## Sealed predictions (test primes)
| p | p mod 8 | h(-4p) | deg G = h(p-1)/2 | e | c | predicted 2-adic valuation of EVERY root of G (v(2) = 1) | predicted v_P(b_1), every P in F_p | v_2(G(0)) |
|---|---|---|---|---|---|---|---|---|
| 37 | 5 | 2 | 36 | 2 | 6 | 37/2 | 37 | 666 |
| 41 | 1 | 8 | 160 | 2 | 6 | 41/2 | 41 | 3280 |
| 43 | 3 | 3 | 63 | 3 | 4 | 43/3 | 43 | 903 |
| 53 | 5 | 6 | 156 | 2 | 6 | 53/2 | 53 | 4134 |

Clauses (all four primes unless stated):
- T1 (decisive, exact): the 2-adic Newton polygon of G (integer minimal polynomial of b_1 from the analytic conjugates) has a single
  slope: every root has valuation p c/12 (column 7). This is (F) for every conjugate of b_1 and every prime of Q-bar above 2 at once.
- T2 (exact): Graeffe unit certificate: b^e/2^p is an algebraic-integer unit for every conjugate b (integral monic polynomial, constant +-1).
  Controls must FAIL: 2^(p+1) in place of 2^p (not integral); wrong exponent 5 - e (not a unit).
- T3 (unit model: S = minimal polynomial of z = b_1^e/2^p must be irreducible of degree deg G, so Q(z) = Q(b_1); nfinit([S,[2]]), an
  order maximal at 2; v_P(b_1) = (p e_P + v_P(z))/e exactly): all four primes, cap 60 min at 37 and 43, 30 min at 41 and 53 (cap hit or crash = NOT RUN, not HOLDS).
  Every P | 2 has e_P = e and v_P(b_1) = p; sum_P f_P v_P(b_1) = v_2(G(0)) (column 9).
  Instrument control: a uniformiser of one P has a non-uniform valuation vector (when there are >= 2 primes).
- T4 (37 only; direct nfinit([G,[2]]), 60-minute cap): same [e, f, v_P(b_1)] as T3, and every conjugate of b_1 lying in F_p (nfroots)
  has the same valuation vector as b_1. F_37 is abelian (C4), so all 36 conjugates lie in it.
- Sanity (not scored): deg G = h(p-1)/2, G irreducible, rounding error far below 1.
- Not predicted (exploratory, recorded only): the number of primes above 2 and their residue degrees f_P.

## Scoring
HOLDS if T1 and T2 hold at all four primes, and T3, T4 hold wherever run. Any mismatch in any clause at any prime: FAILED, logged as
FAILED in ../../LOG.md with the failing clause; no clause is reworded after the run. A crash or cap hit is recorded as NOT RUN.

## Engine
f1.gp (factor1(p, rootsflag, nfflag), newt, unitcert, graeffe, umodel), test.gp (the run order below). WSL PARI/GP, -s 2G, one job.
Run order: T1/T2 at 37, 43, 41, 53; T3 unit model at 37, 43, 41, 53; T4 direct factorisation + roots at 37.
Seal note: f1.gp was edited during training (umodel, newt, nfonly added; certificate criterion fixed to require constant +-1); the
hashed versions below are the ones the test runs. No test-prime data has been computed or seen before sealing.
