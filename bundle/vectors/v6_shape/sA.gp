\\ sA.gp -- BAR-S1 block A: identities used in the proof (A1-A3) and sealed degree / real-count items (A5). One process.
read("vectors/vG_level/gl.gp");
read("vectors/v6_shape/clustfix.gp");

J2(l) = { my(f = factor(l)[, 1]); l^2 * prod(i = 1, #f, 1 - 1 / f[i]^2); }
rel(a, b) = abs(a - b) / abs(b);

\\ A1: prod over r in (Z/l)^2 with gcd(r1, r2, l) = 1 of |th[r/l](iy)| / th0(iy)  ==  f(iy)^(-2 J2(l))   (prime l: all r != 0)
a1(l, y) = {
  my(t = I * y, t0 = abs(th(0, 0, t)), L = 1., R, Rbad, c = 0);
  for(r1 = 0, l - 1, for(r2 = 0, l - 1, if(gcd([r1, r2, l]) == 1, L *= abs(th(r1 / l, r2 / l, t)) / t0; c++)));
  R = real(weber(t))^(-2 * J2(l)); Rbad = R * real(weber(t));
  print("A1 l=", l, " y^2=", y^2, " rows=", c, " (J2=", J2(l), ")  rel.err=1e-", dg(rel(L, R)), "   null (exponent+1): rel.err=1e-", dg(rel(L, Rbad)));
}
\\ A2: line product, delta even with delta^2 = -m mod l:  prod_{a=1}^{l-1} |th[a/l, delta a/l](tau)| / |th0|^(l-1) == |f((tau+delta)/l)|^2 / f(tau)^(2l)
a2(l, m) = {
  my(t = I * sqrt(m), dl = -1, L = 1., R, t0 = abs(th(0, 0, t)));
  for(d = 0, 2 * l, if(d % 2 == 0 && (d^2 + m) % l == 0, dl = d; break));
  if(dl < 0, print("A2 l=", l, " m=", m, ": -m not a square mod l (skipped)"); return);
  for(a = 1, l - 1, L *= abs(th(a / l, dl * a / l, t)) / t0);
  R = abs(weber((t + dl) / l))^2 / real(weber(t))^(2 * l);
  print("A2 l=", l, " m=", m, " delta=", dl, "  rel.err=1e-", dg(rel(L, R)), "   null (delta -> delta+2, not a root): rel.err=1e-",
        dg(rel(L, abs(weber((t + dl + 2) / l))^2 / real(weber(t))^(2 * l))));
}
\\ A3: orbit norm N = product of the distinct principal-coset conjugates of z; compare |N| with the closed form and with the other cosets
a3(l, m) = {
  my(D = -4 * m, N = 4 * l, F = redforms(D), C = cosetcols(N), P, Nv = vector(#F), c, kind, form, okmin = 1, R, t = I * sqrt(m), sp, dl);
  default(realprecision, 120);
  for(i = 1, #F, my(Lv = List());
    for(k = 1, #C, my(Q = classform(F[i], C[k], N));
      if(Q != 0, my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x = (-ap * b / 2) % N); listput(Lv, Bv(l, 1, x + (b + sqrt(D)) / (2 * a)))));
    c = pclust(Vec(Lv)); if(!c[5], print("A3 l=", l, " m=", m, " coset ", i, " AMBIGUOUS"));
    Nv[i] = prod(j = 1, #c[1], c[1][j]));
  if(gcd(l, m) == 1 && l % 2 == 1,
    sp = 0; if(isprime(l), sp = issquare(Mod(-m, l)));
    if(isprime(l) && sp,
      kind = "split";
      dl = -1; for(d = 0, 2 * l, if(d % 2 == 0 && (d^2 + m) % l == 0, dl = d; break));
      R = 2^(l * (l - 1)^2 / 2) * real(weber(t))^(-l * (l^2 - 2 * l - 1)) * (abs(weber((t + dl) / l)) * abs(weber((t - dl) / l)))^(-l),
      kind = "inert (all primes of l)";
      R = 2^(l * J2(l) / 2) * real(weber(t))^(-l * J2(l))),
    kind = "l | m (Lemma W)"; R = 2^(l * (l - 1) / 2) * abs(weber(t / l) / weber(t)^l)^l);
  for(i = 2, #F, if(abs(Nv[i]) <= abs(Nv[1]), okmin = 0));
  print("A3 l=", l, " m=", m, " [", kind, "] h=", #F, "  |N| vs closed form rel.err=1e-", dg(rel(abs(Nv[1]), R)),
        "  Im(N)/|N|=1e-", dg(imag(Nv[1]) / abs(Nv[1])), "  N strictly smallest of the h coset products: ", okmin,
        "  min log(|sigma N|/N) = ", if(#F > 1, Strprintf("%.3f", vecmin(vector(#F - 1, i, log(abs(Nv[i + 1]) / abs(Nv[1]))))), "n/a"));
}
\\ A4: proof-side constants (split-case margin; inert case needs none)
a4() = {
  my(c1 = log(3688), c2 = log(4.888));
  print("A4 constants: log 3688 = ", Strprintf("%.5f", c1), "  log 4.888 = ", Strprintf("%.5f", c2), "  2 log3688 - 2 log4.888 = ", Strprintf("%.5f", 2*c1 - 2*c2));
  foreach([[5, 9], [5, 11], [5, 19], [7, 3], [7, 5], [11, 3]], it, my(l = it[1], m = it[2], e1 = l^2 - 2*l - 1, F);
    F = e1 * (Pi/2 * sqrt(m) - 1.5868) + (2*c1 - 2*c2) - 6 * Pi * sqrt(m);
    print("A4 split margin l=", l, " m=", m, ": (l^2-2l-1)(pi sqrt m/2 - 1.5868) + 13.252 - 6 pi sqrt m = ", Strprintf("%.4f", F)));
  my(l = 3, m = 5); print("A4 split l=3 (bound not used; cubic Hauptmodul instead): ", Strprintf("%.4f", 2 * (Pi/2*sqrt(m) - 1.5868) + 2*c1 - 2*c2 - 6*Pi*sqrt(m)));
}

\\ A5: sealed items, fixed instrument (auto precision doubling until certified), exact layer if deg <= cap
predreal2(l, m) = { if(isprime(l), return(predreal(l, m)));
  my(f = factor(l)[, 1]); if(gcd(l, m) == 1 && prod(i = 1, #f, !issquare(Mod(-m, f[i]))), cl2(m) * eulerphi(l), -1); }
a5(lab, l, m, cap) = {
  my(t0 = getabstime(), P0 = 80, V, mn, P, c, r, d, pd = preddeg(l, m), pr = predreal2(l, m), cert = "numerical", W, res, Pz, ex);
  default(realprecision, 40); V = gvals(m, l, 1); mn = vecmin(apply(v -> abs(v), V));
  while(1, P = P0 + max(0, ceil(-log(mn) / log(10)));
    default(realprecision, P); V = gvals(m, l, 1); c = pclust(V); r = preal(c[1]);
    if(c[5] && r[4], break); P0 *= 2; if(P0 > 1300, break));
  d = #c[1];
  if(d <= cap,
    W = max(needW(c[1]), 150) + max(0, ceil(-log(mn) / log(10))); default(realprecision, W);
    V = gvals(m, l, 1); c = pclust(V); res = intpol(c[1]); Pz = res[1];
    ex = pexact(Pz, r[1]);
    cert = Str("exact: round=1e-", res[2], " den=", res[3], " deg(P)=", poldegree(Pz), " irred=", polisirreducible(Pz), " squarefree=", ex[1],
               " sturm=", ex[2], " sign(disc)=", ex[3], " parity_ok=", ex[4], " clust_ok(W)=", c[5]));
  print(lab, " l=", l, " m=", m, " h=", #redforms(-4*m), " cl2=", cl2(m), " |C_N|=", #V, " P=", P, " certified=", (c[5] && r[4]),
        " deg=", d, " preddeg=", pd, if(d == pd, " ok", " DEGMISS"), " real=", r[1], " predreal=", pr, if(pr < 0, " (none)", if(pr == r[1], " ok", " REALMISS")),
        "  {", cert, "}  (", (getabstime() - t0) \ 1000, " s)");
}
