\\ sC.gp -- BAR-S1 block C: decomposition of 2 in J = Q(j(sqrt -p)) and in F_p (C1 field), exact (nfinit maximal at 2; no bnfinit, no GRH).
\\ F_p model: p = 3 mod 4: F_p = J . Q(zeta_p)^+ (linearly disjoint, degree h(p-1)/2); p = 1 mod 4: F_p = J . Q(zeta_4p)^+ (meet in Q(sqrt p)),
\\ the compositum factor singled out numerically by the real root theta = beta + k alpha (alpha = j(i sqrt p), beta = 2 cos(2 pi/N)).
default(realprecision, 300);
read("vectors/v6_shape/clustfix.gp");
cospoly(N) = { my(G = polresultant(polcyclo(N, 'y), 'y^2 - 'x * 'y + 1, 'y), F = factor(G)[, 1]); F[1]; }
ef(nf) = { my(D = idealprimedec(nf, 2)); vecsort(vector(#D, i, [D[i].e, D[i].f])); }
ordq(p) = znorder(Mod(2, p));
\\ order of the class of a prime above 2 in Cl(-p), p = 7 mod 8 (form (2, 1, (p+1)/8) of discriminant -p)
fH7(p) = { my(q = Qfb(2, 1, (p + 1) / 8), u = qfbred(q), k = 1, one = qfbred(Qfb(1, 1, (p + 1) / 4)));
  while(qfbred(qfbpow(q, k)) != one, k++); k; }
jdata(p) = {
  my(J0 = polclass(-4 * p), al = real(ellj(I * sqrt(p))), J, am, al2, nf);
  J = polredbest(J0); al2 = select(z -> abs(imag(z)) < 1e-100, polroots(J)); al2 = real(al2);
  [J, al2];
}
\\ predictions (sealed law; see BAR-S1 block C)
predJ(p) = { my(h = qfbclassno(-4 * p), hp = if(p % 4 == 3, qfbclassno(-p), 0), f);
  if(p % 8 == 3, return(vecsort(concat([[3, 1]], vector((hp - 1) / 2, i, [3, 2])))));
  if(p % 8 == 7, f = fH7(p); return(vector(h / f, i, [1, f])));
  -1; }
predF(p) = { my(h = qfbclassno(-4 * p), hp = if(p % 4 == 3, qfbclassno(-p), 0), r = ordq(p), n = h * (p - 1) / 2, gp_, f, L);
  if(p % 8 == 3, gp_ = (p - 1) / r; return(vecsort(concat(vector(gp_, i, [3, r / 2]), vector(gp_ * (hp - 1) / 2, i, [3, r])))));
  if(p % 8 == 7, f = lcm(fH7(p), r); return(vector(n / f, i, [1, f])));
  if(p % 8 == 1 && r % 2 == 1, return(vector(n / (4 * r), i, [2, 2 * r])));
  -1; }
fM(p) = { my(fh = if(p % 8 == 7, fH7(p), 2)); lcm(fh, ordq(p)); }
fMold(p) = lcm(2, ordq(p));
sc(p, cap) = {
  my(t0 = getabstime(), J, al, nfJ, eJ, N, g, be, L, R = 0, k, n = qfbclassno(-4 * p) * (p - 1) / 2, eF = "NOT RUN", pj = predJ(p), pf = predF(p), dich, dold);
  [J, al] = jdata(p); nfJ = nfinit([J, [2]]); eJ = ef(nfJ);
  N = if(p % 4 == 3, p, 4 * p); g = cospoly(N); be = 2 * cos(2 * Pi / N);
  L = polcompositum(J, g, 1);
  my(scr = vector(#L), best = 0);
  for(i = 1, #L, my(Ri = L[i][1], ki = L[i][4], c = Vec(Ri)); scr[i] = 1.;
    if(poldegree(Ri) == n, for(ia = 1, #al, foreach([be + ki * al[ia], al[ia] + ki * be], th0, my(s = 0.);
      for(u = 1, #c, s += abs(c[u]) * abs(th0)^(#c - u)); scr[i] = min(scr[i], abs(subst(Ri, 'x, th0)) / s))));
    if(best == 0 || scr[i] < scr[best], best = i));
  if(scr[best] > 1e-50, print("C p=", p, " !! no compositum factor vanishes at a real theta: scores 1e-", apply(x -> dg(x), scr)); return);
  R = L[best][1];
  eF = iferr(alarm(cap, ef(nfinit([R, [2]]))), E, Str("NOT RUN (cap ", cap, " s or error: ", errname(E), ")"));
  dich = if(type(eF) == "t_VEC", prod(i = 1, #eF, eF[i][2] == fM(p) || 2 * eF[i][2] == fM(p)), -1);
  dold = if(type(eF) == "t_VEC", prod(i = 1, #eF, eF[i][2] == fMold(p) || 2 * eF[i][2] == fMold(p)), -1);
  print("C p=", p, " (p mod 8 = ", p % 8, ") h(-4p)=", qfbclassno(-4*p), " h(-p)=", if(p % 4 == 3, qfbclassno(-p), "n/a"), " ord_p 2=", ordq(p), " n=", n,
        "\n   J: ", eJ, "  predJ: ", pj, if(pj == -1, "", if(pj == eJ, "  ok", "  MISS")),
        "\n   F_p: ", eF, "  predF: ", pf, if(pf == -1, "", if(pf == eF, "  ok", "  MISS")),
        "\n   dichotomy f in {fM/2, fM}, fM = lcm(fH, ord_p 2) = ", fM(p), ": ", dich, "   literal old (vi) with lcm(2, ord) = ", fMold(p), ": ", dold,
        "   (", (getabstime() - t0) \ 1000, " s)");
}
