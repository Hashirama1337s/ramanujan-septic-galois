\\ repair.gp -- REPAIR-GD check (BAR-GD): l = p^e (e >= 2) dividing m. V' = product of the distinct principal-coset conjugates of z
\\ (= prod over units k of B_k(tau_O)); closed form V' = 2^c (f(tau/l)/f(tau/l'))^l f(tau)^(-l phi(l)), l' = l/p;
\\ V' strictly smaller than every other coset product; observed margin >= the proved bound l F/24. One process.
read("vectors/vG_level/gl.gp");
read("vectors/v6_shape/clustfix.gp");
rel(a, b) = abs(a - b) / abs(b);
Fbound(l, m) = { my(p = factor(l)[1, 1], lp = l / p, mp = m / l, da = gcd(l, mp), db = gcd(lp, m / lp), Ya, Yb, s = sqrt(m));
  Ya = max(s / l, l / s); Yb = max(s / lp, lp / s);
  eulerphi(l) * (Pi * s / 2 - 1.5868) + min(1.019, 8.213 - 2 * Pi * s / da) - Pi * Ya - 1.04 - 1.5868 - Pi * s / db + Pi * Yb; }
gd(l, m) = {
  my(D = -4 * m, N = 4 * l, F = redforms(D), C = cosetcols(N), Nv = vector(#F), c, okmin = 1, t = I * sqrt(m), p = factor(l)[1, 1], lp, R, cexp, amb = 0, t0 = getabstime());
  lp = l / p; default(realprecision, 150);
  for(i = 1, #F, my(Lv = List());
    for(k = 1, #C, my(Q = classform(F[i], C[k], N));
      if(Q != 0, my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x = (-ap * b / 2) % N); listput(Lv, Bv(l, 1, x + (b + sqrt(D)) / (2 * a)))));
    c = pclust(Vec(Lv)); if(!c[5], amb++);
    Nv[i] = prod(j = 1, #c[1], c[1][j]));
  cexp = l * (l - 1) / 2 - p * lp * (lp - 1) / 2;
  R = 2^cexp * (real(weber(t / l)) / real(weber(t / lp)))^l * real(weber(t))^(-l * eulerphi(l));
  for(i = 2, #F, if(abs(Nv[i]) <= abs(Nv[1]), okmin = 0));
  print("GD l=", l, " m=", m, " h=", #F, " idoneal=", idon(m), " ambiguous_cosets=", amb, "  |V'| vs closed form rel.err=1e-", dg(rel(abs(Nv[1]), R)),
        "  Im/|V'|=1e-", dg(imag(Nv[1]) / abs(Nv[1])), "  V' strictly smallest: ", okmin,
        "  min log(|sigma V'|/V') = ", if(#F > 1, Strprintf("%.3f", vecmin(vector(#F - 1, i, log(abs(Nv[i + 1]) / abs(Nv[1]))))), "n/a"),
        "  proved bound l F/24 = ", Strprintf("%.3f", l * Fbound(l, m) / 24), "  (", (getabstime() - t0) \ 1000, " s)");
}
gd(9, 27); gd(9, 51); gd(9, 63); gd(27, 27); gd(25, 75);
