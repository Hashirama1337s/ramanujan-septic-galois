\\ run_w1.gp -- BAR-W1 sealed run. Usage: gp -q -s 2G run_w1.gp  (args via the global list L below)
read("vectors/v1_wall/wall.gp");
odd = vector(24, i, 2*i + 1);
items = List();
for(i = 1, #odd, listput(items, [3, "B", odd[i]]));
for(i = 1, #odd, listput(items, [3, "W", odd[i]]));
for(i = 1, #odd, listput(items, [5, "B", odd[i]]));
for(i = 1, #odd, listput(items, [5, "W", odd[i]]));
{ my(e = [[3, "B", [63, 81, 99, 117, 153, 225, 243, 333, 441, 729, 765]], [3, "W", [81, 85]], [5, "B", [75, 125, 175, 225, 325, 625, 1225]]]);
  for(j = 1, #e, for(i = 1, #e[j][3], listput(items, [e[j][1], e[j][2], e[j][3][i]])))); }
res = Map();
{ for(i = 1, #items, my(it = items[i], r);
    r = iferr(wone("W1", it[3], it[1], it[2], 0), E, print("W1 l=", it[1], " fam=", it[2], " m=", it[3], " ERROR ", E); 0);
    if(r != 0, mapput(res, it, r[1])));
}
print("=== P6 consistency (l does not divide m): W polynomial == B polynomial");
{ for(l = 3, 5, if(l == 4, next); for(i = 1, #odd, my(m = odd[i], pb, pw);
    if(m % l == 0, next);
    if(mapisdefined(res, [l, "B", m], &pb) && mapisdefined(res, [l, "W", m], &pw),
      print("  l=", l, " m=", m, ": ", if(pb == pw, "same", "DIFFERENT"))))); }
print("=== nulls");
wnull(3, 3); wnull(3, 9); wnull(5, 5); wnull(5, 15);
{ my(P = x^4 - 4*x^2 - x + 1, ab = abtest(P));
  print("  NULL x^4-4x^2-x+1: irred=", polisirreducible(P), " realroots=", polsturm(P), "/4 => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]"); }
{ my(P); setrand(20261028); until(polisirreducible(P), P = x^8 + sum(i = 0, 7, (random(21) - 10) * x^i));
  my(ab = abtest(P)); print("  NULL random deg 8 ", P, ": realroots=", polsturm(P), "/8 => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]"); }
quit;
