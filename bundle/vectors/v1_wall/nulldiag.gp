\\ nulldiag.gp -- POST HOC diagnosis of the wrong-action null (BAR-W1 null (i)): is the multiset of values unchanged?
read("vectors/v1_wall/wall.gp");
default(realprecision, 120);
cmpw(m, l) = {
  my(V1 = wvals(m, l, "W", 0), V2 = wvals(m, l, "W", 1), c1 = clust(V1, 1e-50)[1], c2 = clust(V2, 1e-50)[1], miss = 0,
     D = -4*m, N = 4*l, P = cmpoints(D, N), na = 0);
  for(i = 1, #c2, if(vecmin(apply(v -> abs(v - c2[i]), c1)) > 1e-50, miss++));
  for(i = 1, #P, if(abs(centerlift(Mod(lift(Mod(P[i][1][1], N)^-1), l))) != 1, na++));
  print("l=", l, " m=", m, ": right-action distinct values ", #c1, ", wrong-action distinct ", #c2,
        ", wrong values not in right set: ", miss, ", classes with a' != +-1 mod l: ", na, " of ", #P);
}
cmpw(3, 3); cmpw(9, 3); cmpw(5, 5); cmpw(15, 5); cmpw(7, 5);
quit;
