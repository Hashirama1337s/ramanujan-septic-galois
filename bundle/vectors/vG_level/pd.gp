\\ pd.gp -- checks for Prop D_l (RESULT-G1 v2, "Open case"): V = prod_k B_k(i sqrt m), l a proper divisor of m.
\\ (1) the K-conjugates of V (KSY25 Prop 4.1 points, all ray classes) take exactly h distinct values (V in H_O, K(V) = H_O);
\\ (2) V is strictly the smallest in modulus; (3) the proved lower bound (1/24) log(|sigma V|/V) >= l (7.172 - 7.330 sqrt m) + l^2 (1.5708 sqrt m - 1.5868)
\\     is below the observed minimum, and positive.
default(parisizemax, 2000000000);
read("vectors/vG_level/gl2.gp");
Pv(l, z) = prod(k = 1, (l-1)/2, Bv(l, k, z));
pdchk(l, m) = {
  my(P, V, reps, h = #redforms(-4*m), v0, mn, bnd, pr);
  default(realprecision, 40); P = cmpointsc(-4*m, 4*l, 1);
  pr = 60 + ceil(abs(log(abs(Pv(l, I*sqrt(m))))/log(10)));
  default(realprecision, pr);
  P = cmpointsc(-4*m, 4*l, 1); V = vector(#P, i, Pv(l, P[i][2]));
  reps = clust(V, 1e-30)[1]; v0 = Pv(l, I*sqrt(m));
  mn = vecmin(vector(#reps, i, if(abs(reps[i]/v0 - 1) < 1e-30, 1e9, log(abs(reps[i])/abs(v0)))));
  bnd = 24 * 0 + (l * (7.172 - 7.330*sqrt(m)) + l^2 * (1.5708*sqrt(m) - 1.5868));
  print("l=", l, " m=", m, " h=", h, " distinct conjugates of V = ", #reps, if(#reps == h, " (= h)", " (!= h)"),
        "  min log(|sigma V|/V) over sigma != 1 = ", if(h == 1, "n/a", Strprintf("%.2f", mn)),
        "  proved lower bound (24 x log ratio >= ", Strprintf("%.2f", bnd), ", i.e. log ratio >= ", Strprintf("%.2f", bnd/24), ")",
        if(h == 1 || (mn > bnd/24 && bnd > 0), "  consistent", "  CHECK"));
}
{ foreach([[7, 21], [7, 35], [7, 49], [7, 63], [7, 77], [7, 91], [11, 33], [11, 55], [11, 99], [13, 39], [13, 65], [9, 27], [9, 63], [25, 75], [5, 35], [5, 55]], it, pdchk(it[1], it[2])); }
