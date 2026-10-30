\\ vein 3: p = 31 in F_31 (degree 45), and POST HOC p-th-root test at p = 7, 23, 31:
\\ is prod b_k^{a_k} a p-th power in F_p when sum a_k k^2 = 0 mod p (Kubert-Lang quadratic relation for u_k = b_k^{1/p})?
read("veins/v23/v3.gp");

\\ label the roots of G in nf (variable y) as b_1..b_m via a real embedding
labelroots(bnf, rts, p) = {
  my(m = (p-1)/2, P = bnf.pol, R = real(polroots(P)), bnum, L = vector(m));
  default(realprecision, 200);
  bnum = vector(m, k, Bm(k, p, I * sqrt(p)));
  R = select(z -> abs(imag(z)) < 1e-50, polroots(P)); R = real(R);
  for(i = 1, #R,
    my(vals = vector(#rts, j, subst(lift(rts[j]), 'y, R[i])), ok = 1);
    for(k = 1, m, my(jb = 0); for(j = 1, #rts, if(abs(vals[j] / real(bnum[k]) - 1) < 1e-30, jb = j)); if(jb == 0, ok = 0; break); L[k] = rts[jb]);
    if(ok, return(L)));
  error("no labelling embedding");
}
proottest(bnf, rts, p) = {
  my(m = (p-1)/2, L = labelroots(bnf, rts, p), yes = 0, ctl);
  for(k = 2, m, my(e = L[1]^(k^2) / L[k]); if(#nfroots(bnf, 'x^p - lift(e)) > 0, yes++));
  ctl = #nfroots(bnf, 'x^p - lift(L[1] / L[2]));
  print("  p=", p, ": b_1^(k^2)/b_k is a p-th power in F_p for ", yes, " of ", m - 1, " k; control b_1/b_2 (sum = -3): ",
        if(ctl > 0, "p-th power (UNEXPECTED)", "not a p-th power (as expected)"));
}
