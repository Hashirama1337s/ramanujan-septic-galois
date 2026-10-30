\\ check2.gp -- vein 3c: (i) N(b_1) = +- prod_b sigma_{1/(4b)}(xi)^(psi(b)(p-2b)), xi = zeta^((p+1)/2) + zeta^(-(p+1)/2) (real cyclotomic unit, xi^2 = eta_2/eta_1)
\\ checked in every embedding a (square mod p) against the lattice values of klf.gp; (ii) index corollary 2^(m-1) p^(m-2) h^-/h(-p).
read("veins/v3c/klf.gp");
chk(p, prec) = {
  my(m = (p - 1) / 2, h = qfbclassno(-4 * p), R, D, Fv, LN = vector(p - 1), e = 0.);
  default(realprecision, prec);
  [R, D] = reps(p, h, m, 0);
  Fv = vector(#R, i, Fval(p, R[i][1], R[i][2]));
  for(i = 1, #R, LN[R[i][1] % p] += Fv[i]);
  for(a = 1, p - 1, if(kronecker(a, p) == 1,
    my(rhs = sum(b = 1, m, kronecker(b, p) * (p - 2 * b) * log(abs(2 * cos(2 * Pi * lift(Mod(a, p) / (4 * b)) * (p + 1) / 2 / p)))));
    e = max(e, abs(LN[a] - rhs))));
  \\ index corollary when 2 generates (Z/p)^*/+-1: prod_{chi != 1 even} p |B_{1,chi psi}| vs 2^(m-1) p^(m-2) h^-/h
  my(gen = znprimroot(p), lg = vector(p - 1), pr = 1., hm);
  for(i = 0, p - 2, lg[lift(gen^i)] = i);
  for(j = 1, m - 1, pr *= p * abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2 * j + (p - 1) / 2) / (p - 1)))));
  hm = 2 * p * prod(j = 0, m - 1, abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2 * j + (p - 1) / 2) / (p - 1)))) / 2);
  print("p = ", p, ": unit formula, max |log diff| over ", m, " embeddings = ", Strprintf("%.3g", e),
        ";  order of 2 in (Z/p)*/+-1 = ", znorder(Mod(2, p)) / if(znorder(Mod(2, p)) % 2 == 0 && Mod(2, p)^(znorder(Mod(2, p)) / 2) == -1, 2, 1),
        ";  prod p|B| = ", Strprintf("%.10g", pr), "  vs 2^(m-1) p^(m-2) h^-/h = ", Strprintf("%.10g", 2.^(m - 1) * p^(m - 2) * round(hm) / qfbclassno(-p)), "  (h^- = ", round(hm), ")");
}
chk(7, 100); chk(23, 200); chk(31, 200); chk(47, 200); chk(71, 200); chk(127, 400);
quit
