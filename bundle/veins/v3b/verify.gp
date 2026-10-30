\\ verify.gp -- POST HOC exact checks: P = u_1...u_m equals eps_J^-(p-1) exactly in F_p (eps_J = fundamental unit of J, J certified);
\\ and the saturation of <E_w, eps_J>. Ring identities are unconditional; indices are GRH-conditional unless F_p is certified.
read("veins/v3b/v3b.gp");
chk(p, Gfile) = {
  my(m = (p-1)/2, R = run(p, Gfile), bnf = R[1], L = R[2], w = R[3], P, PJ, bJ, ii, eps, Ew);
  P = L[1]^((p^2 - 1) / 24) / prod(k = 2, m, w[k]);
  PJ = polredabs(polclass(-4 * p)); bJ = bnfinit(PJ, 1); ii = nfisincl(PJ, bnf.pol);
  eps = Mod(subst(lift(bJ.fu[1]), 'x, ii[1]), bnf.pol);
  print("  bnfcertify(J) = ", bnfcertify(bJ), ";  P^p = prod b_k exactly: ", P^p == prod(k = 1, m, L[k]));
  for(e = -(p-1), p - 1, if(P == eps^e, print("  EXACT: P = eps_J^", e)); if(P == -eps^e, print("  EXACT: P = -eps_J^", e)));
  Ew = concat([L[1]], vector(m - 1, k, w[k + 1]));
  grp(bnf, concat(Ew, [eps]), "E_w + eps_J");
}
chk(23, Str(DIR, "G_p23.gp"));
chk(31, Str(DIR, "G_p31.gp"));
quit
