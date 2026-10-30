\\ diamond.gp -- referee fix check (v2): side of the diamond diag(1,d) under KSY's rule (f^a)^b = f^{ab}, n = 2 (D = -8, h = 1).
\\ Left rule (forced): gamma = diag(1,d) gamma', gamma' = diag(1,d^-1) gamma in SL2(Z/5); R^gamma = (R^diag)^gamma' = R o gamma'~.
\\ Wrong side: gamma = gamma'' diag(1,d), R o gamma''~ (would need the diamond to act on R o gamma''~, whose coefficients are not rational).
read("veins/v1_law/law.gp");
read("vectors/v3_rr/rr.gp");
lift5(g) = { my(a0 = lift(g[1,1]), b0 = lift(g[1,2]), c = centerlift(g[2,1]), d = centerlift(g[2,2]), e, k);
  if(c == 0, c = 5); while(gcd(c, d) != 1, d += 5);
  e = gcdext(d, -c);
  for(k = 0, 4, my(aa = e[1] + k*c, bb = e[2] + k*d); if((aa - a0) % 5 == 0 && (bb - b0) % 5 == 0, return([aa, bb; c, d])));
  error("lift5 failed"); }
inlist(w, V) = vecmax(apply(r -> dig(abs(w - r) / abs(r)), V));
{
  default(realprecision, 400);
  my(n = 2, tau = I*sqrt(2), V, z, gm, d, gl, gr, wl, wr, okl = 0, okr = 0, cnt = 0, vals = List());
  default(realprecision, 400);
  V = cvals(-4*n, 5, RR); z = RR(tau);
  print("n = 2: ", #V, " K-conjugates from KSY25 Thm 6.2 engine");
  \\ single matrix asked by the referee: nu = 1 + sqrt(-2), gamma = g(1,1) = [1,-2;1,1], det 3
  gm = Mod([1, -2; 1, 1], 5); d = matdet(gm);
  gl = matdiagonal([1, d^-1]) * gm; gr = gm * matdiagonal([1, d^-1]);
  wl = RR(mob(lift5(gl), tau)); wr = RR(mob(lift5(gr), tau));
  print("gamma = [1,-2;1,1] mod 5, det = ", lift(d), "; gamma' (left) = ", lift(gl), " det ", lift(matdet(gl)), "; gamma'' (right) = ", lift(gr));
  print("  left : R(gamma'~ tau) = ", wl, "  in conjugate list to 1e-", inlist(wl, V), "; |w - z|/|z| = ", abs(wl - z)/abs(z));
  print("  right: R(gamma''~ tau) = ", wr, "  in conjugate list to 1e-", inlist(wr, V));
  \\ whole group W/+-1 (24/2 = 12 classes): left rule must give a bijection onto the 12 conjugates
  for(t = 0, 4, for(s = 0, 4, my(g = Mod([t, -n*s; s, t], 5));
    if(matdet(g) == 0, next); my(dd = matdet(g));
    my(a = RR(mob(lift5(matdiagonal([1, dd^-1]) * g), tau)), b = RR(mob(lift5(g * matdiagonal([1, dd^-1])), tau)));
    cnt++; okl += (inlist(a, V) > 100); okr += (inlist(b, V) > 100); listput(vals, a)));
  print("W has ", cnt, " elements; left rule lands in the conjugate list ", okl, "/", cnt, "; right rule ", okr, "/", cnt);
  print("distinct left-rule values: ", #clust(Vec(vals), 1e-100)[1], " (expected 12 = |W|/2)");
}
quit;
