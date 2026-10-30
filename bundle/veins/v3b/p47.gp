\\ p47.gp -- goal 4 (subfield only, POST HOC identity from post.gp tested at a new prime; unconditional: nfinit/nffactor + numerics).
\\ Identity under test (found POST HOC at 7, 23, 31): for every even character chi != 1 of (Z/p)^*,
\\   |chi(log|N_{F_p/Q(zeta_p)^+}(b)|)| = (p/2) |1 - chi(2)| |B_{1,chi psi}| |chi(log|1 - zeta|^2)|,  psi = (./p).
read("veins/v23/v3.gp");
B1(p, chi) = sum(a = 1, p - 1, chi(a) * a) / p;
light(p, G) = {
  my(t0 = getabstime(), m = (p-1)/2, Px, nf, fK, nb, gen, lg = vector(p - 1), f, g, worst = 0., zeros = 0);
  default(realprecision, 200);
  Px = subst(minpoly(Mod('x + 'x^-1, polcyclo(p))), 'x, 'y);
  nf = nfinit(Px);
  fK = nffactor(nf, G)[, 1];
  print("p = ", p, ": G over Q(zeta_p)^+ = ", #fK, " factors of degree ", poldegree(fK[1]), "  (", (getabstime() - t0) \ 1000, " s)");
  nb = Mod((-1)^poldegree(fK[1]) * lift(polcoef(fK[1], 0)), Px);
  print("  N(b) is a unit: ", abs(norm(nb)) == 1);
  gen = znprimroot(p); for(i = 0, p - 2, lg[lift(gen^i)] = i);
  f = vector(m, a, log(abs(subst(lift(nb), 'y, 2 * cos(2 * Pi * a / p)))));
  g = vector(m, a, log(abs(2 - 2 * cos(2 * Pi * a / p))));
  for(j = 1, m - 1, my(jj = 2 * j, ch, cho, A, C, B, c2, pred);
    ch = (a -> exp(2 * Pi * I * lg[a] * jj / (p - 1)));
    cho = (a -> exp(2 * Pi * I * lg[a] * (jj + (p-1)/2) / (p - 1)));
    A = abs(sum(a = 1, m, ch(a) * f[a])); C = abs(sum(a = 1, m, ch(a) * g[a])); B = abs(B1(p, cho)); c2 = ch(2);
    pred = (p / 2) * abs(1 - c2) * B * C;
    if(pred < 1e-100, zeros++; print("    chi^", jj, ": chi(2) = 1, predicted 0, observed |A| = ", Strprintf("%.3g", A)),
       worst = max(worst, abs(A / pred - 1)); print("    chi^", jj, ": observed/predicted = ", Strprintf("%.15g", A / pred))));
  print("  worst relative deviation over chi with chi(2) != 1: ", Strprintf("%.3g", worst), "; characters with chi(2) = 1: ", zeros, "  (", (getabstime() - t0) \ 1000, " s)");
}
light(47, fastmin(47, 1));
quit
