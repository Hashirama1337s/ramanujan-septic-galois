\\ idx.gp -- vector 2 (BAR-I1, sealed 408630cd...). Unit side. Unconditional: no bnfinit, no minimal polynomial.
\\ Analytic conjugates of b_1 (cert.gp conjs, KSY25 Prop 4.1) -> log|iota_a(N(b_1))| (route A); Kronecker lattice values (klf.gp) as route B.
\\ Exponent vectors in the Hasse basis xi_2..xi_m of C'bar, then exact integer lattice algebra.
read("veins/v3c/klf.gp");

sqrep(x, p) = { my(y = lift(Mod(x, p))); if(kronecker(y, p) == 1, y, p - y); }   \\ square representative of +-x
pmrep(x, p) = red(x, p);                                                           \\ representative of +-x in 1..m
dz(v) = vecmax(apply(z -> abs(z - round(z)), v));
fmt(x) = Strprintf("%.3g", x);

\\ route A: log|iota_a(N)| at squares a, from analytic conjugates; dsh = shift perturbation (0 = canonical, 1 = null N2)
lnA(p, dsh) = {
  my(m = (p - 1) / 2, V, Lab, F = redforms(-4 * p), reps2 = [], xs = [], LN = vector(p - 1));
  [V, Lab] = conjs(p, 1);
  for(i = 1, #F, if(F[i][2] > 0, reps2 = concat(reps2, [i])));
  for(i = 1, #reps2, my(Q = F[reps2[i]], aq = Q[1]); if(gcd(aq, 4 * p) > 1, aq = Q[3]);
    xs = concat(xs, [red(lift(sqrt(Mod(aq, p))), p)]));
  for(t = 1, m,
    my(Nt = log(abs(real(V[t]))) + sum(i = 1, #reps2, log(norm(V[(reps2[i] - 1) * m + red(t * (xs[i] + dsh), p)]))));
    LN[lift(Mod(t, p)^2)] = Nt);
  for(a = 1, p - 1, if(kronecker(a, p) != 1, LN[a] = LN[p - a]));
  [LN, xs];
}
\\ route B: Kronecker lattice sums (klf.gp)
lnB(p) = {
  my(m = (p - 1) / 2, h = qfbclassno(-4 * p), R, D, LN = vector(p - 1));
  [R, D] = reps(p, h, m, 0);
  for(i = 1, #R, LN[R[i][1] % p] += Fval(p, R[i][1], R[i][2]));
  for(a = 1, p - 1, if(kronecker(a, p) != 1, LN[a] = LN[p - a]));
  LN;
}

\\ group ring Z[G], G = (Z/p)*/+-1, elements = vectors indexed by reps 1..m
grmul(x, y, p) = { my(m = #x, z = vector(m)); for(i = 1, m, if(x[i], for(j = 1, m, if(y[j], z[pmrep(i * j, p)] += x[i] * y[j])))); z; }
sig(c, p) = { my(z = vector((p - 1) / 2)); z[pmrep(c, p)] = 1; z; }

\\ lattice tools (columns = generators in Z^(m-1))
satb(M) = { my(K = matkerint(M~)); if(#K == 0, matid(#M[, 1]), matkerint(K~)); }
addhnf(Hc, B) = mathnf(if(#Hc == 0, B, concat(Hc, B)));
idx2(Hb, Sb) = {   \\ two methods: coordinates determinant; Gram determinant ratio
  my(C = matinverseimage(Sb, Hb), d1 = abs(matdet(C)), g1 = matdet(Hb~ * Hb), g2 = matdet(Sb~ * Sb), q = g1 / g2, d2);
  d2 = if(type(q) == "t_INT" && issquare(q), sqrtint(q), -1);
  [d1, d2, type(C) == "t_MAT" && #select(z -> type(z) != "t_INT", concat(Vec(C))) == 0];
}

runp(p, prec) = {
  my(t0 = getabstime(), m = (p - 1) / 2, f = znorder(Mod(2, p)), r = m - m / f, E, Hm, Pinv, LN, xs, LB, sol, n1, Xm, wd = 0., wres = 0.);
  default(realprecision, prec);
  print("\n==== p = ", p, "  m = ", m, "  f = ", f, "  h(-4p) = ", qfbclassno(-4 * p), "  prec = ", prec);
  E = select(a -> kronecker(a, p) == 1, vector(p - 1, a, a));
  Hm = matrix(m, m - 1, i, j, log(abs(sin(Pi * (j + 1) * E[i] / p) / sin(Pi * E[i] / p))));
  Pinv = matsolve(Hm~ * Hm, Hm~);
  sol = (v -> my(n = Pinv * v~); [n, vecmax(apply(abs, Hm * n - v~)), dz(n)]);
  [LN, xs] = lnA(p, 0); LB = lnB(p);
  print("  label shifts x_Q (x^2 = a_Q): ", xs, ";  route A vs route B: max |diff| = ", fmt(vecmax(apply(abs, LN - LB))),
        ";  sum of log|N| over embeddings = ", fmt(sum(i = 1, m, LN[E[i]])));
  \\ conjugates sigma_c(N), c = 1..m
  my(vc = (v, c) -> vector(m, i, v[sqrep(E[i] * c, p)]), cols = vector(m), ints = vector(m));
  for(c = 1, m, my(s = sol(vc(LN, c))); wres = max(wres, s[2]); wd = max(wd, s[3]); cols[c] = round(s[1]));
  Xm = Mat(cols);
  print("  X: worst distance to Z = ", fmt(wd), ", worst residual = ", fmt(wres));
  \\ P5: Corollary 1 vector
  my(beta = vector(m), th, thv);
  for(b = 1, m, beta[pmrep(lift(Mod(b, p)^-1), p)] += kronecker(b, p) * (p - 2 * b));
  th = grmul(grmul(sig(lift(Mod(4, p)^-1), p), beta, p), sig(2, p) - sig(1, p), p);
  thv = vector(m - 1, j, th[j + 1])~;
  print("  P5 exponent vector of N = Corollary 1 vector sigma_{1/4} beta (sigma_2 - 1): ", cols[1] == thv,
        "   (max |exponent| = ", vecmax(apply(abs, thv)), ")");
  \\ rank, saturation, index of X
  my(Hx = mathnf(Xm), Sb = satb(Xm), Hs, ix, S2, snf);
  Hs = mathnf(Sb);
  ix = idx2(Hx, Hs);
  print("  P1 rank X = ", matrank(Xm), "   predicted r = m - m/f = ", r, "  -> ", if(matrank(Xm) == r, "HOLDS", "FAILED"));
  S2 = mathnf(Mat(vector(m, c, my(v = vector(m - 1)); my(a = pmrep(2 * c, p)); if(a > 1, v[a - 1] += 1); if(c > 1, v[c - 1] -= 1); v~)));
  print("  P3 saturation S = lattice of (sigma_2 - 1) sigma_c (HNF equal): ", Hs == S2, "  (rank of that lattice ", matrank(S2), ")");
  snf = iferr(vecprod(select(z -> z != 0, matsnf(Xm))), e, -1);
  print("  P2 [S : X]: coordinate det = ", factor(ix[1], 2^24), "; Gram ratio sqrt = ", if(ix[2] > 0, factor(ix[2], 2^24), "not a square"),
        "; integral coordinates: ", ix[3], "; Smith form product = ", if(snf > 0, factor(snf, 2^24), "n/a"));
  \\ W: add sigma_c N(w_k), k = 2..m
  my(Hw = Hx, wdw = 0., wrw = 0., nd3 = 0, n3min = +oo);
  for(k = 2, m,
    my(lw = (k^2 * LN - vector(p - 1, a, LN[lift(Mod(a * k^2, p))])) / p, B = vector(m));
    for(c = 1, m, my(s = sol(vc(lw, c))); wdw = max(wdw, s[3]); wrw = max(wrw, s[2]); B[c] = round(s[1]));
    Hw = addhnf(Hw, Mat(B));
    \\ N3 null: unweighted (LN - sigma_{k^2} LN)/p
    my(l3 = (LN - vector(p - 1, a, LN[lift(Mod(a * k^2, p))])) / p, s3 = sol(vc(l3, 1)));
    n3min = min(n3min, s3[3]); if(s3[3] > 1e-3, nd3++));
  my(Sw = mathnf(satb(Hw)), iw = idx2(Hw, Sw));
  print("  P4 N(w_k) vectors (all k, all conjugates): worst distance to Z = ", fmt(wdw), ", worst residual = ", fmt(wrw),
        "; rank W = ", matrank(Hw), "; saturation of W = S: ", Sw == Hs);
  print("     [S : W]: coordinate det = ", factor(iw[1], 2^24), "; Gram ratio sqrt = ", if(iw[2] > 0, factor(iw[2], 2^24), "not a square"), "; integral: ", iw[3]);
  print("  N3 unweighted w-null: non-integral (dist > 1e-3) for ", nd3, " of ", m - 1, " k; smallest distance ", fmt(n3min));
  \\ N2 null: wrong label shift
  if(qfbclassno(-4 * p) > 1,
    my(LN2 = lnA(p, 1)[1], s2 = sol(vc(LN2, 1)));
    print("  N2 shift x_Q + 1: distance to Z = ", fmt(s2[3]), ", residual = ", fmt(s2[2]), " -> ", if(s2[3] > 1e-3 || s2[2] > 1e-3, "rejected (null HOLDS)", "ACCEPTED (null FAILED)")));
  print("  (", (getabstime() - t0) \ 1000, " s)");
  [matrank(Xm), ix[1], matrank(Hw), iw[1]];
}

predPX(p) = {   \\ same formula as predict.gp (sealed): [PX, COR2, AC]
  my(m = (p - 1) / 2, g = znprimroot(p), lg = vector(p - 1), L, f = znorder(Mod(2, p)), PX = 1., hm, PXr);
  default(realprecision, 1000);
  for(i = 0, p - 2, lg[lift(g^i)] = i); L = lg[2];
  for(j = 1, m - 1, if((2 * j * L) % (p - 1) != 0, PX *= p * abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2 * j + m) / (p - 1))))));
  hm = 2 * p * prod(j = 0, m - 1, abs(B1(p, a -> exp(2 * Pi * I * lg[a] * (2 * j + m) / (p - 1)))) / 2);
  PXr = round(PX);
  [PXr, 2^(m - 1) * p^(m - 2) * round(hm) / qfbclassno(-p), PXr * f^(m / f) / 2^(m - m / f)];
}

out = Map();
foreach([[7, 150], [23, 300], [47, 300], [31, 300], [127, 450], [151, 450], [223, 500]], P, mapput(out, P[1], runp(P[1], P[2])));
print("\nSUMMARY [rank X, [S:X], rank W, [S:W]]:");
foreach([7, 23, 47, 31, 127, 151, 223], p, my(v = mapget(out, p), m = (p - 1) / 2, f = znorder(Mod(2, p)), r = m - m / f, P = predPX(p));
  print("p = ", p, ": rank X ", v[1], " (pred ", r, "), [S:X] == PX: ", v[2] == P[1], ", rank W ", v[3], ", [S:W] == PX/p^(r-1): ", v[4] == P[1] / p^(r - 1),
        ";  N1: [S:X] != COR2: ", v[2] != P[2], ", rank != m-1: ", v[1] != m - 1, ", AC/[S:X] = ", P[3] / v[2], " (pred f^(m/f)/2^r = ", f^(m / f) / 2^r, ")"));
quit
