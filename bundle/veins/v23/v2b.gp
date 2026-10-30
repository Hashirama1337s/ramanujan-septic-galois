\\ v2b.gp -- relation of Q(b_1) to Q(j(sqrt -n)) and to K(j(sqrt -n), zeta_n); reads the G_n files written by v2.gp.
DIR = "veins/v23/";
rel(n) = {
  my(t0 = getabstime(), G = read(Str(DIR, "G_n", n, "_k1.gp")), P, J = polclass(-4*n), inc, HK, HZ, dz, cyc, inc2);
  P = polredbest(G);
  inc = nfisincl(J, P);
  HK = polcompositum(J, 'x^2 + n)[1];
  HZ = polcompositum(HK, polcyclo(n))[1]; dz = poldegree(HZ);
  cyc = subst(minpoly(Mod('x + 'x^-1, polcyclo(n))), 'x, 'x);
  inc2 = nfisincl(cyc, P);
  print("n=", n, ": deg Q(b_1) = ", poldegree(G), "; Q(j(sqrt -", n, ")) (deg ", poldegree(J), ") inside Q(b_1): ",
        if(inc === 0, "NO", "YES"), "; Q(zeta_", n, ")^+ inside Q(b_1): ", if(inc2 === 0, "NO", "YES"),
        "; [K(j, zeta_n):Q]/2 = ", dz / 2, " => [Q(b_1) : K(j,zeta_n)^+] = ", poldegree(G) / (dz / 2),
        "   (", (getabstime() - t0) \ 1000, " s)");
}
foreach([7, 9, 15, 21, 25, 27, 33], n, rel(n));
quit
