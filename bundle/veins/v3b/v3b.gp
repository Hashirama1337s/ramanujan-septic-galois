\\ v3b.gp -- vein 3b (BAR-V3B sealed f81ad5c2...): w_k = u_1^(k^2)/u_k, rank gap, index of larger unit families.
\\ GRH: every bnfinit-derived index is GRH-conditional unless bnfcertify returns 1 for that field (done separately, cert*.gp).
read("veins/v23/v3.gp");
V3B = "veins/v3b/";

uval(k, p) = 2 * thsum(k / p, I * sqrt(p)) / thsum(0, I * sqrt(p));
digs(z) = if(z == 0, 9999, floor(-log(abs(z)) / log(10)));

\\ real embedding of nf (variable y) under which rts[] equal b_1..b_m; returns [labelled b's, real root of P]
labelemb(bnf, rts, p) = {
  my(m = (p-1)/2, P = bnf.pol, R, bnum = vector(m, k, real(uval(k, p))^p));
  R = real(select(z -> abs(imag(z)) < 10.^(-default(realprecision) + 20), polroots(P)));
  for(i = 1, #R,
    my(L = vector(m), ok = 1);
    for(k = 1, m, my(jb = 0); for(j = 1, #rts, if(abs(subst(lift(rts[j]), 'y, R[i]) / bnum[k] - 1) < 1e-60, jb = j));
      if(jb == 0, ok = 0; break); L[k] = rts[jb]);
    if(ok, return([L, R[i]])));
  error("no labelling embedding");
}
ev(el, r) = subst(lift(el), 'y, r);

\\ index report for a list of units (columns); prints rank, index in saturation (or in E_F if full), elementary divisors
grp(bnf, els, name) = {
  my(M = expmat(bnf, els), I1 = idxinfo(M), I2 = idxinfo(2 * M), r = #bnf.fu);
  print("  [", name, "] ", #els, " generators: rank ", I1[1], " of ", r, if(I1[1] == r, " FULL; index in E_F = ", " not full; index in saturation = "),
        I1[2], " = ", if(I1[2] == 1, 1, factor(I1[2])), "; el.div. ", select(x -> x != 1, I1[3]), "; squares null ratio ", I2[2] / I1[2], " (want 2^", I1[1], ")");
  I1;
}

run(p, Gfile) = {
  my(t0 = getabstime(), m = (p-1)/2, G, P, bnf, rts, L, r0, w, okw = 0, nullok = 0, mind = 9999, Pc, cr, Cp, Jp, emb, EJ, fac, Nu, K0, h = qfbclassno(-4*p));
  print("\n==================== p = ", p, "  m = ", m, "  h(-4p) = ", h);
  default(realprecision, 400);
  G = if(Gfile == "", fastmin(p, 0), read(Gfile));
  [bnf, rts, P] = fieldsetup(G, Str("F_", p));
  [L, r0] = labelemb(bnf, rts, p);
  \\ ---- P1: w_k
  w = vector(m); w[1] = 0;
  for(k = 2, m,
    my(e = L[1]^(k^2) / L[k], R = nfroots(bnf, 'x^p - lift(e)), R2 = nfroots(bnf, 'x^p - lift(L[1] * e)), d);
    if(#R2 == 0, nullok++);
    if(#R == 1, w[k] = Mod(R[1], P); d = digs(ev(w[k], r0) / (real(uval(1, p))^(k^2) / real(uval(k, p))) - 1); mind = min(mind, d); if(d >= 100, okw++),
       print("   k = ", k, ": ", #R, " p-th roots in F_p"));
  );
  print("  P1: w_k = u_1^(k^2)/u_k in F_p (root of x^p - b_1^(k^2)/b_k matching to >= 100 digits) for ", okw, " of ", m - 1, " k; worst agreement 10^-", mind);
  print("  P1-null: b_1^(k^2+1)/b_k has no p-th root in F_p for ", nullok, " of ", m - 1, " k");
  \\ ---- indices
  my(Eb = L, Ew = concat([L[1]], vector(m - 1, k, w[k + 1])));
  grp(bnf, Eb, "E_b = <-1, b_1..b_m>");
  grp(bnf, Ew, "E_w = <-1, b_1, w_2..w_m>");
  \\ ---- cyclotomic units of Q(zeta_p)^+ : xi_a = sin(a th)/sin(th), th = pi/p, as U_{a-1}(cos th)
  Pc = subst(minpoly(Mod('x + 'x^-1, polcyclo(2 * p))), 'x, 'x);
  cr = nfroots(bnf, Pc);
  print("  roots of minpoly(2cos(pi/p)) in F_p: ", #cr);
  Cp = vector(m - 1, i, my(a = i + 1); Mod(subst(polchebyshev(a - 1, 2, 'z), 'z, cr[1] / 2), P));
  \\ ---- units of J = Q(j(sqrt -p))
  EJ = [];
  if(h > 1, my(PJ = polredabs(polclass(-4 * p)), bJ = bnfinit(PJ, 1), ii = nfisincl(PJ, P));
    print("  J: ", PJ, "  unit rank ", #bJ.fu, ", h(J) = ", bJ.no, " (degree ", poldegree(PJ), "), embeddings into F_p: ", #ii);
    EJ = vector(#bJ.fu, i, Mod(subst(lift(bJ.fu[i]), 'x, ii[1]), P)));
  \\ ---- norm units: constant terms of the quadratic factors of G over F_p
  fac = nffactor(bnf, subst(G, 'x, 'x))[, 1];
  print("  G_p over F_p: factor degrees ", vecsort(apply(poldegree, fac~)));
  Nu = [];
  for(i = 1, #fac, if(poldegree(fac[i]) == 2, Nu = concat(Nu, [Mod(lift(polcoef(fac[i], 0)), P)])));
  \\ ---- P3 groups
  grp(bnf, concat(Eb, EJ), "E_b + J-units");
  grp(bnf, concat(Eb, Cp), "E_b + C+");
  if(#Nu, grp(bnf, concat(Eb, Nu), "E_b + norm units"));
  grp(bnf, Cp, "C+ alone");
  if(#Nu, grp(bnf, Nu, "norm units alone"));
  if(#Nu, grp(bnf, concat(Cp, Nu), "C+ + norm units"));
  grp(bnf, concat([Ew, Cp, EJ]), "E_w + C+ + J");
  if(#Nu, grp(bnf, concat([Ew, Cp, EJ, Nu]), "E_all = E_w + C+ + J + norm units"));
  if(#Nu, grp(bnf, concat([Eb, Cp, EJ, Nu]), "E_b + C+ + J + norm units"));
  \\ ---- Q(zeta_p)^+ on its own: PC2
  K0 = bnfinit(subst(polredabs(Pc), 'x, 'y), 1);
  my(cK = nfroots(K0, Pc), CK = vector(m - 1, i, my(a = i + 1); Mod(subst(polchebyshev(a - 1, 2, 'z), 'z, cK[1] / 2), K0.pol)));
  print("  Q(zeta_p)^+: h+ = ", K0.no, " (GRH), unit rank ", #K0.fu);
  grp(K0, CK, "C+ in Q(zeta_p)^+  [PC: index h+ = 1]");
  \\ relative norm of b_1 to Q(zeta_p)^+ : factor G over K0, constant terms of the degree-h factors
  my(fK = nffactor(K0, subst(G, 'x, 'x))[, 1], nb);
  print("  G_p over Q(zeta_p)^+: factor degrees ", vecsort(apply(poldegree, fK~)));
  nb = vector(#fK, i, Mod(lift(polcoef(fK[i], 0)) * (-1)^poldegree(fK[i]), K0.pol));
  my(MC = expmat(K0, CK), Mn = expmat(K0, [nb[1]]));
  print("  P4: N(b_1) to Q(zeta_p)^+ in the basis xi_2..xi_m (exponents): ", matsolve(MC, Mn)~);
  print("  total ", (getabstime() - t0) \ 1000, " s");
  [bnf, L, w, Cp, EJ, Nu, K0, fK];
}
