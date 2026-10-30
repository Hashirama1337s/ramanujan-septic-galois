# INSTRUMENT-FIX — clustering / matching of numerical conjugates (vector 6, task 0)
2026-10-28, vector-6 seat. Old scripts are NOT edited. Sealed controls: BAR-S1 block S0 (sha256 4e767a69..., LOG 20:22); output s0_out.txt.

## In plain words
To count how many different conjugates a number has, our programs compute all of them numerically and merge values that agree
"closely enough". Every old script used a fixed cut-off (1e-25 to 1e-60). At large m two genuinely different conjugates can agree
to 50 digits, so a fixed cut-off merges them and the count comes out too small, with no warning. The new routine ties the cut-off to
the working precision and checks its own answer: it reports a count only when the values inside each cluster agree far better
than the closest two clusters do. If not, it says AMBIGUOUS and the caller must raise the precision.

## The fixed shared routine
vectors/v6_shape/clustfix.gp (sha256 e5cb5f88...):
- pclust(V): merge iff |v - w| <= 10^(-P/2) max(|v|, |w|) (P = working digits). Certified (ok = 1) iff the largest within-cluster
  relative spread is <= 10^(-3P/4) and the smallest between-cluster relative gap is >= 10^(-P/4).
- preal(R): real iff |Im v| <= 10^(-P/2) |v|, certified by the same two margins.
- pexact(P, nreal): exact layer on the rounded integer polynomial: issquarefree, Sturm count, sign(disc), and Chavan's parity check
  (arXiv:2210.00681 sec 5: disc > 0 iff the number of non-real roots is divisible by 4).
Fixed copies of the old per-item drivers (new names, same engine): sA.gp a5() replaces gl2.gp gone() (auto-precision doubling until
certified); sB.gp sb() replaces rr.gp's item driver for R(i sqrt n); s0.gp s0item() is the control harness.

## Controls (BAR-S1 S0, scored as sealed)
| check | sealed expectation | observed | verdict |
|---|---|---|---|
| S0.1 (11, 1365), P0 = 240 (P = 352) | 960 / 160, certified | 960 / 160, spread 1e-354, gap 1e-49, certified | HOLDS |
| S0.2 old routines on the same values | both 956 / 156 | gl2 rclust(1e-30): 956 / 156; law.gp clust(1e-30): **913 / 153** | **FAILED as sealed** (see note) |
| S0.3 null, P0 = 80 (P = 192) | certified = 0 | count 960 but clust_ok = 0 (gap 1e-49 < 10^-48): refused | HOLDS |
| S0.4 benign (7, 21) | 12 / 12, old = new | 12 / 12 both, certified | HOLDS |
Note (POST HOC) on S0.2: the sealed "956" for law.gp was taken from pchk_out.txt, but pchk.gp loads gl2.gp, whose clust() is the
relative version; the true law.gp clust (tol (1 + |R|), absolute for small values) is worse: it also merges the conjugates below 1e-30
(913 distinct, 153 real). The control's purpose (old routine fails silently at (11, 1365)) holds more strongly than sealed; the number did not.

## Every script in deg11 that clusters / matches conjugates with a fixed tolerance (audit list)
| script | routine / call | tolerance | exposure |
|---|---|---|---|
| veins/v1_law/law.gp | clust(V, tol): |v - w| < tol (1 + |w|) | absolute for |w| < 1 | the shared old routine |
| veins/v1_law/run.gp | clust(V, 1e-25), exact layer clust(V, 10^(-W/3)) | fixed / W-tied absolute | numerical counts exposed; exact layer guarded by integrality |
| vectors/v3_rr/rr.gp | same pattern (1e-25; 10^(-W/3)) | as run.gp | C7 counts: all 218 had exact polynomials (integrality guard) |
| vectors/v1_wall/wall.gp | clust 1e-25, 10^(-W/3), null 1e-60 | fixed | C6 counts; exact layer guarded |
| vectors/v1_wall/nulldiag.gp | clust 1e-50 | fixed | diagnostic |
| vectors/v3_rr/diamond.gp | clust 1e-100 | fixed | 400-digit check; safe at its size |
| vectors/vG_level/gl.gp | clust 1e-30 + reality |Im| < 1e-30 (1 + |v|) | fixed, absolute | run 1 DEGMISS/REALMISS (RESULT-G1 sec 4) |
| vectors/vG_level/gl2.gp, fix.gp | rclust relative, but fixed 1e-30 | fixed relative | (11, 1365) miss (956/156) |
| vectors/vG_level/pd.gp | clust 1e-30 | fixed | Prop D_l post hoc check |
| vectors/vG_level/pchk.gp | clust 1e-40; diagnostic 1e-30/1e-100/1e-200 (gl2 version) | fixed | diagnostic |
| veins/v23/run_v3c.gp, run_v3c_defs.gp | real roots |Im| < 1e-50 (absolute); match |v/w - 1| < 1e-30 | fixed | matching, not counting; lower risk |
Not affected (tolerances used in bound checks or reduction loops, not in clustering): proof/v5/g_c4c3c.gp, veins/v3c/klf.gp.
Recommendation: any count that rests on the numerical layer only (no integer polynomial) and was produced by a script above should be
re-run through pclust before being quoted; counts certified by an integral polynomial are protected by the integrality self-check
(a wrong merge leaves a non-Galois-stable product that does not round).

## v2 note (after REFEREE-S1)
- 'Certified' / 'certifies' above means a FLOAT SEPARATION TEST (within-cluster spread vs between-cluster gap at working precision),
  not a ball-arithmetic or exact certificate. Exact status comes only from an integer polynomial (integrality, irreducibility, Sturm).
- All v1 runs here (s0.gp etc.) ran with gp's default nbthreads = 12 (not set to 1); see RESULT-S1 v2 run notes. Drivers now start with
  default(nbthreads, 1).
