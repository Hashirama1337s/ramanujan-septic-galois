\\ presel.gp -- machinery checks BEFORE sealing (no CM values computed): theta reducer, levels of the three functions.
read("veins/v1_law/law.gp");
default(realprecision, 120);
\\ (a) theta reducer vs direct sum at points of moderate height
{
  my(pts = [0.3 + 0.05*I, -0.41 + 0.02*I, 0.123 + 0.2*I, 0.5 + 0.01*I], ch = [[1/7, 0], [3/13, 1/4], [0, 0], [2/5, 1/3]], w = 99999);
  for(i = 1, #pts, for(j = 1, #ch, my(a = ch[j][1], b = ch[j][2], e = abs(th(a, b, pts[i]) - thdirect(a, b, pts[i])) / abs(thdirect(a, b, pts[i])));
    w = min(w, dig(e))));
  print("(a) theta reducer vs direct: worst relative agreement 10^-", w);
}
\\ random gamma in Gamma(N): [1+N a, N b; N c, 1+N d] with det 1
randgam(N) = {
  for(t = 1, 10^5, my(a = random(7) - 3, b = random(7) - 3, c = random(7) - 3, A = 1 + N*a, B = N*b, C = N*c);
    \\ solve A D - B C = 1 with D = 1 mod N
    my(r = (1 + B*C)); if(r % A == 0, my(Dd = r / A); if((Dd - 1) % N == 0, return([A, B; C, Dd]))));
  error("no gamma");
}
mob(g, z) = (g[1,1]*z + g[1,2]) / (g[2,1]*z + g[2,2]);
inv(fe, N, lab) = {
  my(z = 0.137 + 0.71*I, w = 0, g, e, cnt = 0);
  for(t = 1, 12, g = randgam(N); if(g[2,1] == 0, next); my(z2 = mob(g, z)); if(imag(z2) > 0.0005, cnt++; e = abs(fe(z2) - fe(z)) / abs(fe(z)); w = max(w, e)));
  print("  ", lab, " Gamma(", N, ")-invariance: ", cnt, " elements with c != 0 tested, worst relative deviation 10^-", dig(w));
}
print("(b) levels (numerical, random Gamma(N) elements; 'invariant' = deviation ~ 10^-100):");
inv(RR, 5, "R"); inv(Gt, 6, "Gt"); inv(Gt, 12, "Gt"); inv(Gcf, 6, "G(w)");
inv(z -> Bpiece(1, 15, z), 60, "b_1 at n=15"); inv(z -> Bpiece(1, 7, z), 28, "b_1 at n=7");
\\ (c) facts: idoneal n <= 60, h(-4n), |C_N(D)| sizes
{
  my(I = []); for(n = 1, 60, if(n == 1 || iselem2(-4*n), I = concat(I, n))); print("(c) idoneal n <= 60 (Cl(-4n) elementary 2): ", I);
  my(S1 = [], S2 = []);
  for(n = 2, 60, S1 = concat(S1, #cmpoints(-4*n, 5)); S2 = concat(S2, #cmpoints(-4*n, 6)));
  print("  |C_5(-4n)| n=2..60: ", S1); print("  |C_6(-4n)| n=2..60: ", S2);
  foreach([7, 9, 11, 13, 15, 21, 25], n, print("  |C_", 4*n, "(", -4*n, ")| = ", #cmpoints(-4*n, 4*n), "  h=", #redforms(-4*n)));
}
