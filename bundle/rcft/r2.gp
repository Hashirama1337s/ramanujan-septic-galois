\\ BAR-RCFT R2: SU(2)_3 character ratios at the CM point tau0 = i, plus a non-CM negative control.
\\ chi_j(tau) ~ sum_n (10n+j+1) q^{(10n+j+1)^2/20} / eta^3, q = exp(2 pi i tau); ratios cancel eta^3.

numer(j, t, W) = {
  my(q = exp(-2*Pi*t), s = 0., n = 0, m, term, eps = 10.^(-W-30));
  for(n = -400, 400, m = 10*n + j + 1; term = m * q^(m^2/20); s += term);
  s;
}
dig(x) = if(x == 0, 99999, floor(-log(abs(x)) / log(10)));

test(t, W, label) = {
  my(N, r, pol, rts, d, hits = 0, Whi = W + 500);
  default(realprecision, Whi);
  N = vector(4, j, numer(j - 1, t, Whi));
  r = vector(4, j, N[j] / N[1]);
  print(label, ": r_j = ", vector(4, j, precision(r[j], 12)));
  default(realprecision, W);
  d = 0;
  for(dd = 1, 16, pol = algdep(precision(r[2], W), dd);
    default(realprecision, Whi);
    if(dig(subst(pol, x, r[2])) >= Whi - 50 && poldegree(pol) == dd, d = dd; break);
    default(realprecision, W));
  default(realprecision, Whi);
  if(!d, print(label, ": r_1 has NO algebraic relation of degree <= 16"); return(0));
  print(label, ": r_1 minimal polynomial degree ", d, ": ", pol, "  (holds ", dig(subst(pol, x, r[2])), " digits at ", Whi, ")");
  rts = polroots(pol);
  for(i = 1, #rts, if(abs(rts[i] - r[2]) < 10.^(-100), print("   root ", i, " is r_1 itself"); next);
    for(a = 1, 4, for(b = 1, 4, if(a == b, next);
      for(sg = -1, 1, if(sg == 0, next);
        if(dig(rts[i] - sg * N[a] / N[b]) >= Whi - 200,
          hits++; print("   conjugate ", i, " = ", if(sg < 0, "-", ""), "chi_", a-1, "/chi_", b-1, "  (", dig(rts[i] - sg*N[a]/N[b]), " digits)")))));
    if(!hits, print("   conjugate ", i, " = ", precision(rts[i], 15), " : not a character ratio at tau0")));
  print(label, ": conjugates matched to character ratios: ", hits);
  hits;
}

test(1, 1500, "CM tau0 = i");
test(12345/10000, 1500, "non-CM tau = 1.2345 i");
quit
