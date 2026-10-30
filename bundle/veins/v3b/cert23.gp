\\ cert23.gp -- goal 3: remove GRH at p = 23. Same session: compute the indices, then bnfcertify every field used.
\\ An index below is unconditional iff bnfcertify of its field printed 1.
read("veins/v3b/v3b.gp");
{
  my(R = run(23, Str(DIR, "G_p23.gp")), t, c, PJ, bJ);
  PJ = polredabs(polclass(-4 * 23)); bJ = bnfinit(PJ, 1);
  t = getabstime(); c = bnfcertify(bJ); print("CERT J = ", PJ, ": bnfcertify = ", c, "  (", (getabstime() - t) \ 1000, " s)");
  t = getabstime(); c = bnfcertify(R[7]); print("CERT Q(zeta_23)^+: bnfcertify = ", c, "  (", (getabstime() - t) \ 1000, " s)");
  t = getabstime(); c = bnfcertify(R[1]); print("CERT F_23 (degree 33): bnfcertify = ", c, "  (", (getabstime() - t) \ 1000, " s)");
}
quit
