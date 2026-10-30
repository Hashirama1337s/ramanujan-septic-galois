read("veins/v23/run_v3c_defs.gp");
{
  my(G = read(Str(DIR, "G_p31.gp")), S = fieldsetup(G, "F_31"), bnf = S[1], L = labelroots(S[1], S[2], 31));
  for(k = 2, 15, my(e = L[1]^(k^2) / L[k], f = factor(subst('x^31 - lift(e), 'x, 'x))); 
    print("k=", k, " k^2 mod 31=", k^2 % 31, "  nfroots: ", #nfroots(bnf, 'x^31 - lift(e)), "  degrees of factors over Q(F): ", apply(poldegree, nffactor(bnf, 'x^31 - lift(e))[,1]~)));
}
quit
