\\ run_g1b.gp -- run 1b: the SAME sealed lists and predictions (lists.gp, gl.gp predictions) with the repaired instrument gl2.gp
\\ (relative tolerances). Every MAIN and COMP item is re-run (not only the flagged ones), exact layer for degree <= 100 or predicted abelian.
default(parisizemax, 6000000000);
read("vectors/vG_level/gl2.gp");
read("vectors/vG_level/lists.gp");
CAP = 100;
TOT = [0, 0, 0, 0, 0];
runblk(name, blk) = {
  print("== ", name, " ==");
  foreach(blk, it, my(l = it[1], L = it[2]);
    for(i = 1, #L, my(m = L[i], r = iferr(gone(name, l, m, CAP), E, print(name, " l=", l, " m=", m, " ERROR ", E); 0));
      if(r == 0, next);
      TOT[1]++; TOT[2] += (r[1] == r[2]); TOT[3] += (r[3] == r[4]);
      if(r[6] >= 0, TOT[5]++; TOT[4] += (r[5] == r[6])));
    print("   running totals after l=", l, " [items, verdict hits, degree hits, real hits, real predicted] = ", TOT));
}
runblk("MAIN", LMAIN);
runblk("COMP", LCOMP);
print("== NULLS ==");
foreach(NULLS, it, gnull(it[1], it[2], 2); gnull(it[1], it[2], 3));
print("DONE");
