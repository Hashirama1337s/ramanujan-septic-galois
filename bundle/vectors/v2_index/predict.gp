\\ predict.gp -- vector 2 (BAR-I1): FORMULA SIDE ONLY. No units, no lattices, no conjugates.
\\ For p = 7 mod 8: m = (p-1)/2, f = order of 2 mod p (= order of sigma_2 in G+ = (Z/p)*/+-1, since -1 is a non-square and 2 a square).
\\ Even characters chi_j(g^i) = e(2 j i/(p-1)), j = 0..m-1 (g = znprimroot); chi_j psi has exponent 2j + m.
\\ Predictions (Theorem I1 in BAR-I1.md):
\\   r      = m - m/f                                     (rank of X = <conjugates of N(b_1)> in C'bar)
\\   PX     = prod_{chi even, chi(2) != 1} p |B_{1,chi psi}|   ([S : X], S = saturation of X in C'bar)
\\   PW     = PX / p^(r-1)                                ([S : W], W = Z[G+]-span of N(b_1) and the N(w_k))
\\ Nulls: COR2 = 2^(m-1) p^(m-2) h^-/h(-p) (Corollary 2 applied blindly), AC = prod_{chi(2) != 1} |A_chi/C_chi| = PX f^(m/f) / 2^r.
B1(p, phi) = sum(a = 1, p - 1, phi(a) * a) / p;
pred(p) = {
  my(m = (p - 1) / 2, g = znprimroot(p), lg = vector(p - 1), L, f = znorder(Mod(2, p)), PX = 1., PXall = 1., T = 1., nz = 0, hm, PXr, cor2, ac);
  for(i = 0, p - 2, lg[lift(g^i)] = i);
  L = lg[2];
  for(j = 1, m - 1,
    my(phi = (a -> exp(2 * Pi * I * lg[a] * (2 * j + m) / (p - 1))), v = p * abs(B1(p, phi)));
    PXall *= v;
    if((2 * j * L) % (p - 1) == 0, nz++; T *= v, PX *= v));
  hm = 2 * p * prod(j = 0, m - 1, abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2 * j + m) / (p - 1)))) / 2);
  PXr = round(PX);
  cor2 = 2^(m - 1) * p^(m - 2) * round(hm) / qfbclassno(-p);
  ac = PXr * f^(m / f) / 2^(m - m / f);
  print("p = ", p, "  m = ", m, "  f = ord(2) = ", f, "  2 generates G+: ", f == m, "  #{chi != 1: chi(2) = 1} = ", nz, " (= m/f - 1 = ", m / f - 1, ")");
  print("   r = m - m/f = ", m - m / f);
  print("   PX = ", PXr, "   (rounding error ", Strprintf("%.3g", abs(PX - PXr)), ")");
  print("   PX factored: ", factor(PXr));
  print("   PW = PX / p^(r-1) = ", PXr / p^(m - m / f - 1), "   factored: ", factor(PXr / p^(m - m / f - 1)), "   integral: ", type(PXr / p^(m - m / f - 1)) == "t_INT");
  print("   COR2 null value 2^(m-1) p^(m-2) h^-/h(-p) = ", factor(cor2), "   (h^- = ", round(hm), ", rounding ", Strprintf("%.3g", abs(hm - round(hm))), ");  check PX*T = COR2: ", round(PX * T) == cor2);
  print("   T = prod_{chi != 1, chi(2) = 1} p|B| = ", round(T), "  (rounding ", Strprintf("%.3g", abs(T - round(T))), ")");
  print("   AC null value prod |A/C| = PX f^(m/f)/2^r = ", ac);
}
default(realprecision, 1000);
foreach([7, 23, 47, 31, 127, 151, 223], p, pred(p));
quit
