\\ vein 3, p = 7 (positive control) and p = 23 in F_p (degree 33).
read("veins/v23/v3.gp");
{
  my(G, S, bnf, rts, P, f, c, d1, d2, C, MC, t0);
  print("==== p = 7");
  G = fastmin(7, 1);
  S = fieldsetup(G, "F_7"); [bnf, rts, P] = S;
  report(bnf, rts, "F_7");
  \\ cyclotomic units d1 = 2cos(pi/7), d2 = d1^2 - 1 in Q(2cos(2pi/7)); compare in the same bnf via an isomorphism
  f = 'x^3 + 'x^2 - 2*'x - 1; c = nfisisom(subst(f, 'x, 'y), P)[1];
  d1 = -(c^3 - 3*c); d1 = Mod(d1, P); d2 = d1^2 - 1;
  MC = expmat(bnf, [lift(d1), lift(d2)]);
  print("  cyclotomic units <-1, d1, d2>: index ", idxinfo(MC)[2], " (Sinnott/Kummer: h^+ = 1 expected)");
  print("  exponents of b_k in the basis (d1, d2): ", matsolve(MC, expmat(bnf, rts)));
  print("  bnfcertify(F_7) = ", bnfcertify(bnf));
  print("==== p = 23");
  t0 = getabstime();
  G = fastmin(23, 0);
  write(Str(DIR, "G_p23.gp"), G);
  S = fieldsetup(G, "F_23"); [bnf, rts, P] = S;
  report(bnf, rts, "F_23");
  write(Str(DIR, "F23_pol.gp"), P);
  print("  total ", (getabstime() - t0) \ 1000, " s");
}
quit
