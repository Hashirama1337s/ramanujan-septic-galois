\\ s0.gp -- BAR-S1 block S0: instrument controls for clustfix.gp (run once, single process).
read("vectors/vG_level/gl.gp");
read("vectors/v6_shape/clustfix.gp");
\\ old relative-but-fixed routine of gl2.gp / fix.gp, copied verbatim under a new name (for the negative control)
rclust_old(V, tol) = {
  my(R = List(), M = List(), hit);
  for(i = 1, #V, hit = 0;
    for(j = 1, #R, if(abs(V[i] - R[j]) < tol * abs(R[j]), M[j]++; hit = 1; break));
    if(!hit, listput(R, V[i]); listput(M, 1)));
  [Vec(R), Vec(M)];
}
s0item(l, m, P0) = {
  my(V, mn, P, c, r, t0 = getabstime(), o1, o2);
  default(realprecision, 40); V = gvals(m, l, 1); mn = vecmin(apply(v -> abs(v), V));
  P = P0 + max(0, ceil(-log(mn) / log(10)));
  default(realprecision, P); V = gvals(m, l, 1);
  c = pclust(V); r = preal(c[1]);
  print("S0 NEW  l=", l, " m=", m, " P0=", P0, " P=", P, " |C_N|=", #V, " deg=", #c[1], " real=", r[1],
        " spread=1e-", dg(c[3]), " gap=1e-", dg(c[4]), " ImReal=1e-", dg(r[2]), " ImNonreal=1e-", dg(r[3]),
        " clust_ok=", c[5], " real_ok=", r[4], " preddeg=", preddeg(l, m), " predreal=", predreal(l, m), "  (", (getabstime() - t0) \ 1000, " s)");
  o1 = clust(V, 1e-30)[1];
  print("S0 OLD law.gp clust(1e-30):  deg=", #o1, " real=", sum(i = 1, #o1, abs(imag(o1[i])) < 1e-30 * (1 + abs(o1[i]))));
  o2 = rclust_old(V, 1e-30)[1];
  print("S0 OLD gl2 rclust(1e-30):    deg=", #o2, " real=", sum(i = 1, #o2, abs(imag(o2[i])) < 1e-30 * abs(o2[i])));
}
s0item(7, 21, 120);
s0item(11, 1365, 240);
s0item(11, 1365, 80);
