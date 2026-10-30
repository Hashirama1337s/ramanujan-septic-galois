\\ post.gp -- POST HOC (not in BAR-V3B): norm of the Ramanujan unit to Q(zeta_p)^+ versus cyclotomic units and B_{1,chi}.
\\ nffactor / nfinit / numerics are unconditional; the bnf of Q(zeta_p)^+ is used only for the index ratio and is certified.
read("veins/v23/v3.gp");

B1(p, chi) = sum(a = 1, p - 1, chi(a) * a) / p;

post(p, G) = {
  my(t0 = getabstime(), m = (p-1)/2, h = qfbclassno(-4*p), Px, K0, fK, nb, gc, conjs, xi, MC, MN, i1, i2, f, g, gen, r, res = []);
  print("\n==== p = ", p, "  h = ", h);
  default(realprecision, 200);
  Px = subst(minpoly(Mod('x + 'x^-1, polcyclo(p))), 'x, 'y);     \\ y = 2cos(2 pi/p); embedding a: y -> 2cos(2 pi a/p)
  K0 = bnfinit(Px, 1);
  print("  Q(zeta_p)^+: h+ = ", K0.no, "  bnfcertify = ", bnfcertify(K0));
  fK = nffactor(K0, G)[, 1];
  print("  G_p over Q(zeta_p)^+: ", #fK, " factors of degree ", poldegree(fK[1]));
  nb = Mod((-1)^poldegree(fK[1]) * lift(polcoef(fK[1], 0)), Px);
  gc = nfgaloisconj(K0);
  conjs = vector(#gc, i, Mod(subst(lift(nb), 'y, gc[i]), Px));
  \\ cyclotomic units xi_a = (1 - zeta^a)(1 - zeta^-a)/((1 - zeta)(1 - zeta^-1)) = (2 - y_a)/(2 - y), y_a = 2cos(2 pi a/p) = T_a
  \\ NOTE: xi_a below = (sin(pi a/p)/sin(pi/p))^2, squares of the standard cyclotomic units, so [C+ : <xi>] = 2^(m-1).
  xi = vector(m - 1, i, my(a = i + 1, ya = 2 * subst(polchebyshev(a, 1, 'z), 'z, 'y / 2)); Mod((2 - ya) / (2 - 'y), Px));
  MC = expmat(K0, xi); MN = expmat(K0, conjs);
  i1 = idxinfo(MC); i2 = idxinfo(MN);
  print("  [E : C+] = ", i1[2], ";  [E : <Galois conjugates of N(b)>] = ", i2[2], " (rank ", i2[1], ");  ratio [C+ : <N(b)^G>] = ", i2[2] / i1[2], " = ", factor(i2[2] / i1[2]));
  print("  N(b) exponents in xi_2..xi_m: ", matsolve(MC, expmat(K0, [nb]))~);
  \\ characters: chi_j(gen^i) = exp(2 pi I i j/(p-1)); even iff j even
  gen = znprimroot(p);
  my(lg = vector(p - 1), prodr = 1., prodB = 1.);
  for(i = 0, p - 2, lg[lift(gen^i)] = i);
  f = vector(m, a, log(abs(subst(lift(nb), 'y, 2 * cos(2 * Pi * a / p)))));
  g = vector(m, a, log(abs(2 - 2 * cos(2 * Pi * a / p))));
  for(j = 1, m - 1, my(jj = 2 * j, ch, cho, A, Bc, B, rat);
    ch = (a -> exp(2 * Pi * I * lg[a] * jj / (p - 1)));
    cho = (a -> exp(2 * Pi * I * lg[a] * (jj + (p-1)/2) / (p - 1)));
    A = sum(a = 1, m, ch(a) * f[a]); Bc = sum(a = 1, m, ch(a) * g[a]); B = B1(p, cho);
    rat = abs(A / Bc) / abs(B);
    prodr *= abs(A / Bc); prodB *= abs(B);
    res = concat(res, [rat]);
    my(c2 = ch(2));
    print("    chi^", jj, ": |A/C| = ", Strprintf("%.10g", abs(A / Bc)), "  |B_{1,chi psi}| = ", Strprintf("%.10g", abs(B)), "  ratio ", Strprintf("%.10g", rat),
          "  ratio/|1-chi(2)| = ", if(abs(1 - c2) > 1e-20, Strprintf("%.10g", rat / abs(1 - c2)), "chi(2)=1"), "  ratio/|2-chi(2)| = ", Strprintf("%.10g", rat / abs(2 - c2))));
  print("  product over chi != 1 of |chi ratio| = ", Strprintf("%.12g", prodr), " ; product of |B_{1, chi psi}| = ", Strprintf("%.12g", prodB),
        " ; h^-(Q(zeta_p)) via B: ", Strprintf("%.8g", 2 * p * prod(j = 0, m - 1, abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2*j + (p-1)/2) / (p - 1)))) / 2)));
  print("  total ", (getabstime() - t0) \ 1000, " s");
  res;
}
