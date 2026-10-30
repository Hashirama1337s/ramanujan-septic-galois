\\ gl.gp -- vector G (grand-theory Galois law at every level). Engine on top of veins/v1_law/law.gp
\\ (KSY25 arXiv:2506.14139: Thm 6.2 + Lemma 7.1 + Prop 4.1 + Thm 7.5/Rem 7.6), same method as vectors/v1_wall/wall.gp.
\\ Pieces at frozen odd level l:  B_k(tau) = (2 th[k/l,0](tau) / th[0,0](tau))^l  (rational q-coefficients, level 4l),
\\ value z = B_1(i sqrt m), O = Z[sqrt -m], D = -4m, N = 4l, m odd >= 3.
\\ K-conjugates: sigma_[Q] z = B_1( x + (b + sqrt D)/(2a) ), x = -a' b/2 mod N (conv = 1, correct; KSY25 Prop 4.1, b_O = 0).
\\ Wrong conventions (negative controls): conv = 2: x = +a' b/2 ; conv = 3: x = -a b/2.

read("veins/v1_law/law.gp");

Bv(l, k, z) = (2 * th(k/l, 0, z) / th(0, 0, z))^l;

\\ CM points with a choice of convention
cmpointsc(D, N, conv) = {
  my(F = redforms(D), C = cosetcols(N), L = List());
  for(i = 1, #F, for(k = 1, #C,
    my(Q = classform(F[i], C[k], N));
    if(Q != 0, my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x);
      x = if(conv == 1, (-ap * b / 2) % N, if(conv == 2, (ap * b / 2) % N, (-a * b / 2) % N));
      listput(L, [Q, x + (b + sqrt(D)) / (2 * a)]))));
  Vec(L);
}
gvals(m, l, conv) = { my(P = cmpointsc(-4*m, 4*l, conv)); vector(#P, i, Bv(l, 1, P[i][2])); }

\\ ---------------- predictions (class groups and residues only; no theta values) ----------------
idon(m) = iselem2(-4*m);
cl2(m) = { my(F = redforms(-4*m)); sum(i = 1, #F, my(Q = F[i]); Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]); }
isppow(l) = (l > 1 && #factor(l)[, 1] == 1);
\\ Theorem G prediction: abelian <=> m idoneal and (l a prime power dividing m, or l = 3 and m = 2 mod 3)
predab(l, m) = idon(m) && ((isppow(l) && m % l == 0) || (l == 3 && m % 3 == 2));
\\ orbit of the characteristic row (1,0) mod l under x = t + s sqrt -m in (O/l)^*, acting by g_x = [t, -m s; s, t], modulo +-1
orb(l, m) = {
  my(S = Set());
  for(t = 0, l-1, for(s = 0, l-1, if(gcd(t^2 + m*s^2, l) == 1,
    my(w = [t % l, (-m*s) % l], w2 = [(-t) % l, (m*s) % l]);
    S = setunion(S, Set([vecsort([w, w2])[1]])))));
  #S;
}
preddeg(l, m) = #redforms(-4*m) * orb(l, m);
\\ real conjugates (prime l only; derived in BAR-G1): Cl2 (l-1)/2 if l | m, Cl2 (l-1) otherwise
predreal(l, m) = if(!isprime(l), -1, cl2(m) * if(m % l == 0, (l-1)/2, l-1));

\\ ---------------- one item ----------------
\\ cap: full exact certificate (integer polynomial, galoisinit) when degree <= cap or predicted abelian; otherwise numerical
\\ conjugate test only (L3: abelian <=> all K-conjugates real).
gone(lab, l, m, cap) = {
  my(t0 = getabstime(), V, cl, reps, mult, d, nre, numab, pa, pd, pr, W, res, P, err, z, chk, nreal, ab, cert, h = #redforms(-4*m));
  default(realprecision, 60);
  V = gvals(m, l, 1); cl = clust(V, 1e-30); [reps, mult] = cl; d = #reps;
  nre = sum(i = 1, d, abs(imag(reps[i])) < 1e-30 * (1 + abs(reps[i])));
  numab = (nre == d);
  pa = predab(l, m); pd = preddeg(l, m); pr = predreal(l, m);
  cert = "numerical";
  if(d <= cap || pa,
    W = max(needW(reps), 150);
    default(realprecision, W);
    V = gvals(m, l, 1); cl = clust(V, 10.^(-W \ 3)); [reps, mult] = cl;
    if(#reps != d, error("degree changed with precision at l=", l, " m=", m));
    res = intpol(reps); [P, err] = res[1..2];
    default(realprecision, 2 * W);
    z = Bv(l, 1, I * sqrt(m));
    chk = dig(abs(subst(P, 'x, z)) / (vecmax(apply(abs, Vec(P))) * max(1, abs(z))^d));
    default(realprecision, W);
    nreal = polsturm(P);
    ab = if(d <= 2, [1, "degree <= 2"], abtest(P));
    cert = Str("exact: round=1e-", err, " den=", res[3], " irred=", polisirreducible(P), " P(z)@2W=1e-", chk,
               " sturm=", nreal, " W=", W, " [", ab[2], "]");
    if(ab[1] != numab || nreal != nre, cert = Str(cert, " !!INCONSISTENT with numerical"));
    if(d <= 6, cert = Str(cert, " P=", P)));
  print(lab, " l=", l, " m=", m, " (m mod l=", m % l, ") idoneal=", idon(m), " h=", h, " cl2=", cl2(m), " |C_N|=", #V,
        " deg=", d, " preddeg=", pd, if(d == pd, " ok", " DEGMISS"), " real=", nre, "/", d, " predreal=", pr,
        if(pr < 0, "", if(pr == nre, " ok", " REALMISS")),
        " => ", if(numab, "ABELIAN", "NOT ABELIAN"), " pred=", if(pa, "ABELIAN", "NOT ABELIAN"), if(pa == numab, " HIT", " MISS"),
        "  {", cert, "}  (", (getabstime() - t0) \ 1000, " s)");
  [numab, pa, d, pd, nre, pr];
}

\\ negative control: wrong convention must fail to round to integers
gnull(l, m, conv) = {
  my(V, cl, reps, G0, err = 0.);
  default(realprecision, 200);
  V = gvals(m, l, conv); cl = clust(V, 1e-60); reps = cl[1];
  G0 = prod(i = 1, #reps, 'x - reps[i]);
  for(i = 0, poldegree(G0), my(c = polcoef(G0, i)); err = max(err, abs(c - round(real(c)))));
  print("  NULL conv=", conv, " l=", l, " m=", m, ": ", #reps, " distinct values; distance of coefficients to integers 1e-", dig(err),
        if(dig(err) < 30, "  -> fails as it should", "  -> DID NOT FAIL"));
  dig(err) < 30;
}
