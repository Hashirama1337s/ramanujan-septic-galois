\\ posthoc.gp -- POST HOC (not sealed). Exact group-ring check of a clause of BAR-I1 (b) that the sealed run did not test:
\\ is S = phi((sigma_2 - 1) Z[G]) equal to {sigma_2(u)/u : u in C'bar} = phi((sigma_2 - 1) I_G)? On paper: no, the index is f.
\\ Vectors in the basis xi_2..xi_m (coefficient of sigma_a, a = 2..m; sigma_1 coefficient dropped since aug = 0).
red(k, p) = { my(r = lift(Mod(k, p))); if(r > p / 2, p - r, r); }
vecof(x) = vector(#x - 1, j, x[j + 1])~;
sig(c, p) = { my(z = vector((p - 1) / 2)); z[red(c, p)] = 1; z; }
grmul(x, y, p) = { my(m = #x, z = vector(m)); for(i = 1, m, if(x[i], for(j = 1, m, if(y[j], z[red(i * j, p)] += x[i] * y[j])))); z; }
chk(p) = {
  my(m = (p - 1) / 2, f = znorder(Mod(2, p)), d2 = sig(2, p) - sig(1, p), L, LI, i);
  L = mathnf(Mat(vector(m, c, vecof(grmul(d2, sig(c, p), p)))));
  LI = mathnf(Mat(vector(m - 1, a, vecof(grmul(d2, sig(a + 1, p) - sig(1, p), p)))));
  i = abs(matdet(matinverseimage(L, LI)));
  print("p = ", p, "  f = ", f, ":  [(sigma_2 - 1)Z[G] : (sigma_2 - 1)I_G] = ", i, "  (= f: ", i == f, ")");
}
foreach([7, 23, 47, 31, 127, 151, 223], p, chk(p));
quit
