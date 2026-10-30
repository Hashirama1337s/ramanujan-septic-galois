\\ clustfix.gp -- vector 6 (shape theorem), task 0: shared FIXED routine for clustering / real-testing numerical conjugates.
\\ Fault being fixed (RESULT-G1 sec 4, sec 6 post hoc): law.gp clust() merges two values when |v - w| < tol (1 + |w|) with a FIXED tol
\\ (1e-25 .. 1e-30 at the call sites); gl2.gp / fix.gp rclust() made it relative but kept the fixed 1e-30. At l = 11, m = 1365 two
\\ distinct conjugates differ by a relative 2.6e-50, so BOTH versions merge them (956/156 instead of 960/160) and say nothing.
\\ Fix (this file): the tolerance is tied to the working precision P (digits):
\\   merge iff |v - w| <= 10^(-P/2) max(|v|, |w|)      (relative, half the working digits)
\\ and the routine CERTIFIES its own answer: it returns ok = 1 only if
\\   spread (largest relative distance inside a cluster) <= 10^(-3P/4)   and   gap (smallest relative distance between clusters) >= 10^(-P/4).
\\ Otherwise ok = 0 (AMBIGUOUS): the caller must raise the precision; a count is never returned silently from an unclear gap.
\\ The reality test is built the same way (|Im v| <= 10^(-P/2) |v|, certified by the same two margins).
\\ Exact layer (when an integer polynomial is formed from the representatives): integrality, issquarefree, degree = #reps,
\\ Sturm count = numerical real count, and the free parity check of Chavan (arXiv:2210.00681 sec 5): for P in Z[x] squarefree,
\\ disc(P) > 0 iff the number of non-real roots is divisible by 4.
\\ Old scripts are NOT edited. This file only adds new functions (prefix p...).

reldist(v, w) = { my(a = max(abs(v), abs(w))); if(a == 0, 0., abs(v - w) / a); }

\\ pclust(V) -> [reps, mult, spread, gap, ok]
pclust(V) = {
  my(P = default(realprecision), thr = 10.^(-(P \ 2)), R = List(), M = List(), spread = 0., hit, d, n, gap = 1e100, ok);
  for(i = 1, #V, hit = 0;
    for(j = 1, #R, d = reldist(V[i], R[j]);
      if(d <= thr, M[j]++; hit = 1; if(d > spread, spread = d); break));
    if(!hit, listput(R, V[i]); listput(M, 1)));
  R = Vec(R); n = #R;
  for(i = 1, n, for(j = i + 1, n, d = reldist(R[i], R[j]); if(d < gap, gap = d)));
  ok = (spread <= 10.^(-(3 * P \ 4))) && (gap >= 10.^(-(P \ 4)));
  [R, Vec(M), spread, gap, ok];
}

\\ preal(R) -> [nreal, maxIm_of_real, minIm_of_nonreal, ok]   (relative |Im v|/|v|)
preal(R) = {
  my(P = default(realprecision), thr = 10.^(-(P \ 2)), nr = 0, mxr = 0., mnn = 1e100, t);
  for(i = 1, #R, t = if(R[i] == 0, 0., abs(imag(R[i])) / abs(R[i]));
    if(t <= thr, nr++; if(t > mxr, mxr = t), if(t < mnn, mnn = t)));
  [nr, mxr, mnn, (mxr <= 10.^(-(3 * P \ 4))) && (mnn >= 10.^(-(P \ 4)))];
}

\\ exact-layer checks on an integer polynomial P (already rounded): [squarefree, sturm, disc sign, parity consistent with nreal]
pexact(P, nreal) = {
  my(sf = issquarefree(P), st = polsturm(P), d = poldegree(P), ds = sign(poldisc(P)));
  [sf, st, ds, (ds > 0) == ((d - nreal) % 4 == 0)];
}

dg(x) = if(x == 0, 99999, floor(-log(abs(x)) / log(10)));
