\\ pchk.gp -- proof-side checks for RESULT-G1 (not predictions): Lemma T numbers, Lemma K exhaustive check, m = 1 post hoc.
default(parisizemax, 2000000000);
read("vectors/vG_level/gl.gp");
default(realprecision, 60);
\\ ---- Lemma T: for y >= sqrt 3:  e^{-pi y/16} > Lam*(y) > U(1/3)(y), where
\\      U(a)(y) = sum_n e^{-pi y (n+a)^2},  Lam*(y) = e^{-pi y/16} - sum_{n>=1} (e^{-pi y (n-1/4)^2} + e^{-pi y n^2})
U(a, y) = sum(n = -60, 60, exp(-Pi*y*(n+a)^2));
Lam(y) = exp(-Pi*y/16) - sum(n = 1, 60, exp(-Pi*y*(n-1/4)^2) + exp(-Pi*y*n^2));
{ my(y = sqrt(3)); print("Lemma T at y = sqrt3: e^{-pi y/16} = ", exp(-Pi*y/16), "  Lam* = ", Lam(y), "  U(1/3) = ", U(1/3, y),
    "  margin Lam* - U(1/3) = ", Lam(y) - U(1/3, y)); }
{ my(bad = 0); forstep(y = sqrt(3), 60, 0.01, if(!(Lam(y) > U(1/3, y)), bad++));
  print("Lemma T grid y in [sqrt3, 60] step 0.01: violations = ", bad); }
\\ monotonicity of U(a) in a on [0, 1/2] (Poisson product), grid check
{ my(bad = 0); foreach([sqrt(3), 2, 3, 5], y, for(i = 0, 99, if(!(U(i/200, y) > U((i+1)/200, y)), bad++)));
  print("U(a) strictly decreasing on [0,1/2] (grid, 4 values of y): violations = ", bad); }
\\ ---- Lemma K: for odd prime l >= 5 and t in (Z/l), t != 0, +-1: some unit k with
\\      (ct(k) <= l/4 and ct(kt) >= l/3) or (ct(k) >= l/3 and ct(kt) <= l/4);  t = 0: some k with ct(k) >= l/3.
ct(x, l) = { my(r = x % l); min(r, l - r); }
okK(l, t) = { for(k = 1, l-1, my(a = ct(k, l), b = ct(k*t, l)); if((4*a <= l && 3*b >= l) || (3*a >= l && 4*b <= l), return(k))); 0; }
{ my(fail = List(), cnt = 0, j0bad = 0);
  forprime(l = 3, 1000, for(t = 0, l-1, if(t == 1 || t == l-1, next); cnt++;
      if(okK(l, t) == 0, listput(fail, [l, t]));
      \\ explicit witness used in the proof for l >= 12: k = 1 if ct(t) >= l/3, else k = ceil(l/(3 ct(t)))
      if(l >= 12 && t != 0, my(c = ct(t, l), k = if(3*c >= l, 1, ceil(l/(3*c))));
        if(!(4*ct(k, l) <= l && 3*ct(k*t, l) >= l), j0bad++))));
  print("Lemma K: primes 3..1000, ", cnt, " pairs (l, t); failures = ", Vec(fail), "; explicit-witness failures (12 <= l <= 1000) = ", j0bad); }
\\ ---- m = 1 post hoc (D = -4 excluded from the KSY25 engine): algdep of z = B_1^{(7)}(i)
\\      prediction from the torus count: degree |(O/7)^*/<i>| = 12, not abelian, real conjugates 6
{ default(realprecision, 1500); my(z = Bv(7, 1, I), P);
  z = real(z); P = algdep(z, 12);
  print("m=1, l=7: algdep degree 12 -> P = ", P);
  print("   |P(z)| = 1e-", dig(subst(P, 'x, z)), "  irreducible=", polisirreducible(P), "  real roots=", polsturm(P), "  abtest: ", abtest(P));
  my(P11 = algdep(z, 11)); print("   control: best degree-11 relation has |coeff| max ~ 1e", floor(log(vecmax(apply(abs, Vec(P11))))/log(10)), " (should be huge: no relation)"); }
\\ ---- POST HOC null diagnosis: the sealed null used an absolute distance at 200 digits, meaningless for coefficients > 1e170.
\\      Here: precision = 100 + digits of the largest coefficient, relative clustering, relative rounding error, for conv 1 (correct), 2, 3.
read("vectors/vG_level/gl2.gp");
nd(l, m, conv) = {
  my(V, reps, G0, big, pr, err = 0.);
  default(realprecision, 80); V = gvals(m, l, conv); reps = clust(V, 1e-40)[1];
  G0 = prod(i = 1, #reps, 'x - reps[i]); big = vecmax(apply(c -> abs(c), Vec(G0)));
  pr = 120 + ceil(log(big + 1)/log(10)) + ceil(-log(vecmin(apply(v -> abs(v), V)))/log(10));
  default(realprecision, pr); V = gvals(m, l, conv); reps = clust(V, 1e-40)[1];
  G0 = prod(i = 1, #reps, 'x - reps[i]);
  for(i = 0, poldegree(G0), my(c = polcoef(G0, i)); err = max(err, abs(c - round(real(c)))));
  print("  nulldiag conv=", conv, " l=", l, " m=", m, ": ", #reps, " distinct values, prec ", pr, ", max coeff ~1e", floor(log(big+1)/log(10)),
        ", max |c - round(c)| = 1e-", dig(err), if(dig(err) > 60, "  (integral)", "  (NOT integral)"));
}
{ foreach([[7, 21], [11, 15], [13, 13]], it, for(cv = 1, 3, nd(it[1], it[2], cv))); }
\\ ---- m = 1 positive controls l = 3, 5 (RESULT-W1 post hoc: abelian)
{ default(realprecision, 600); foreach([3, 5], l, my(z = real(Bv(l, 1, I)), P = algdep(z, 4));
  print("m=1, l=", l, ": P = ", P, "  |P(z)| = 1e-", dig(subst(P, 'x, z)), "  abtest: ", abtest(P))); }
\\ ---- POST HOC diagnosis of the one degree/real miss (l = 11, m = 1365): closest pairs among the conjugates at higher precision
{ my(V, reps, d, best = List(), pr = 400);
  default(realprecision, pr); V = gvals(1365, 11, 1);
  foreach([1e-30, 1e-100, 1e-200], tl, reps = clust(V, tl)[1];
    print("l=11 m=1365 prec ", pr, ": tolerance ", tl, " -> ", #reps, " distinct, real ", sum(i = 1, #reps, abs(imag(reps[i])) < tl * abs(reps[i]))));
  reps = clust(V, 1e-200)[1]; d = #reps;
  my(rel = vector(d, i, 1.), part = vector(d));
  for(i = 1, d, for(j = 1, d, if(i != j, my(r = abs(reps[i] - reps[j]) / abs(reps[i])); if(r < rel[i], rel[i] = r; part[i] = j))));
  my(ix = vecsort(rel, , 1));
  for(u = 1, 10, my(i = ix[u]); print("   closest: |v| = ", Strprintf("%.3e", abs(reps[i])), " rel.gap = ", Strprintf("%.3e", rel[i]), " Im/|v| = ", Strprintf("%.2e", abs(imag(reps[i]))/abs(reps[i])))); }
