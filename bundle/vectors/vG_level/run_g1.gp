\\ run_g1.gp -- the sealed BAR-G1 run. One gp process. Output: run_g1_out.txt
default(parisizemax, 6000000000);
read("vectors/vG_level/gl.gp");
read("vectors/vG_level/lists.gp");
CAP = 150;
TOT = [0, 0, 0, 0, 0, 0]; \\ items, verdict hits, degree hits, real hits (prime l), real predicted (prime l), exact certificates
runblk(name, blk) = {
  print("== ", name, " ==");
  foreach(blk, it, my(l = it[1], L = it[2]);
    for(i = 1, #L, my(m = L[i], r = gone(name, l, m, CAP));
      TOT[1]++; TOT[2] += (r[1] == r[2]); TOT[3] += (r[3] == r[4]);
      if(r[6] >= 0, TOT[5]++; TOT[4] += (r[5] == r[6]))));
  print("   running totals [items, verdict hits, degree hits, real hits, real predicted] = ", TOT[1..5]);
}
runblk("CTRL", LCTRL);
runblk("MAIN", LMAIN);
runblk("COMP", LCOMP);
print("== NULLS (wrong Prop 4.1 convention must fail to round) ==");
foreach(NULLS, it, gnull(it[1], it[2], 2); gnull(it[1], it[2], 3));
print("DONE");
