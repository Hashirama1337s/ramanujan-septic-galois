\\ vein 3, p = 23 in L = F_23(sqrt -23) (degree 66, contains all 33 conjugates of b_1). Attempt only; capped by timeout.
read("veins/v23/v3.gp");
{
  my(t0 = getabstime(), G = read(Str(DIR, "G_p23.gp")), P = read(Str(DIR, "F23_pol.gp")), R, A, bnf, rts);
  R = rnfequation(subst(P, 'x, 'y), 'x^2 + 23);  \\ base field in y (lower priority), relative in x
  A = subst(polredbest(R), 'x, 'y);
  print("L: degree ", poldegree(A), ", real roots ", polsturm(A), "  (", (getabstime()-t0)\1000, " s)");
  bnf = bnfinit(A, 1);
  print("bnfinit(L) done ", (getabstime()-t0)\1000, " s: h = ", bnf.no, ", cyc ", bnf.cyc, ", unit rank ", #bnf.fu, ", w = ", bnf.tu[1],
        ", regulator ", Strprintf("%.10g", bnf.reg));
  rts = nfroots(bnf, G);
  print("roots of G_23 in L: ", #rts, "  (", (getabstime()-t0)\1000, " s)");
  report(bnf, rts, "L");
}
quit
