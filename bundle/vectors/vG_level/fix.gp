\\ fix.gp -- POST HOC instrument diagnosis for items flagged DEGMISS in the sealed run (no prediction changed).
\\ Suspected cause: gl.gp clusters with tolerance tol*(1 + |R|) (absolute for tiny values), so conjugates of size < 1e-30 merge.
\\ Repair: working precision raised above the size of the smallest conjugate, relative tolerance, relative reality test.
default(parisizemax, 4000000000);
read("vectors/vG_level/gl.gp");
rclust(V, tol) = {
  my(R = List(), M = List(), hit);
  for(i = 1, #V, hit = 0;
    for(j = 1, #R, if(abs(V[i] - R[j]) < tol * abs(R[j]), M[j]++; hit = 1; break));
    if(!hit, listput(R, V[i]); listput(M, 1)));
  [Vec(R), Vec(M)];
}
gfix(l, m) = {
  my(V, mn, pr, cl, reps, d, nre, pd = preddeg(l, m), prr = predreal(l, m), pa = predab(l, m));
  default(realprecision, 40); V = gvals(m, l, 1);
  mn = vecmin(apply(v -> abs(v), V)); pr = 60 + ceil(-log(mn)/log(10)) + 20;
  default(realprecision, pr); V = gvals(m, l, 1);
  cl = rclust(V, 1e-30); reps = cl[1]; d = #reps;
  nre = sum(i = 1, d, abs(imag(reps[i])) < 1e-30 * abs(reps[i]));
  print("FIX l=", l, " m=", m, " prec=", pr, " smallest |conj| = 1e", floor(log(mn)/log(10)), " deg=", d, " preddeg=", pd,
        if(d == pd, " ok", " DEGMISS"), " real=", nre, "/", d, " predreal=", prr, if(prr < 0, "", if(prr == nre, " ok", " REALMISS")),
        " => ", if(nre == d, "ABELIAN", "NOT ABELIAN"), " pred=", if(pa, "ABELIAN", "NOT ABELIAN"), if(pa == (nre == d), " HIT", " MISS"));
}
