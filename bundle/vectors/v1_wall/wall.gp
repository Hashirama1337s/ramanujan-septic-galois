\\ wall.gp -- vector 1 (cubic / quintic wall). Engine on top of veins/v1_law/law.gp (KSY25 Thm 6.2 + Prop 4.1 + Thm 7.5/Rem 7.6).
\\ Level l in {3, 5}. Two families of values at tau_O = i sqrt m, O = Z[sqrt -m], D = -4m, N = 4l:
\\   B-family:  B_k(tau) = (2 th[k/l, 0](tau) / th[0,0](tau))^l      (rational q-coefficients; = C5 normalisation with level l)
\\              B_1(i sqrt m) = u(q)^l for Berndt-Rebak's u (cubic, Thm 2.1) / u(q)^5 (quintic, Thm 4.2) at q = e^{-pi sqrt m}/l... i.e.
\\              BR's q = e^{-pi sqrt n} with n = m / l^2  (BR Lemma 3.1 / 5.1 values p).
\\   W-family:  W_j(tau) = (2 th[0, j/l](tau) / th[0,0](tau))^l = B_j o S  (coefficients in Q(zeta_l)^+)
\\              W_1(i sqrt m) = BR's u^l at q = e^{-pi/(l sqrt m)}, i.e. the value in BR Thm 3.3 / 5.3 (the Entry-1.1 analogue) at BR n = m.
\\ K-conjugates of f(tau_O): sigma_[Q] f(tau_O) = f^{[1,y;0,a']}(t_Q + y) = (f^{diag(1,a')})(t_Q + y), t_Q = (b + sqrt D)/(2a),
\\ y = -a' b / 2 mod N (law.gp cmpoints). diag(1,d) acts on q-coefficients by zeta_N -> zeta_N^d:
\\   trivial on B_k (rational coefficients);  W_j -> W_{j d} (coefficients 2 cos(2 pi j r / l)).

read("veins/v1_law/law.gp");

Bv(l, k, z) = (2 * th(k/l, 0, z) / th(0, 0, z))^l;
Wv(l, j, z) = (2 * th(0, (j % l)/l, z) / th(0, 0, z))^l;

\\ all K-conjugate values (one per class of C_N(D)); fam = "B" or "W"; wrongW = 1 drops the diag action (null)
wvals(m, l, fam, wrongW) = {
  my(D = -4*m, N = 4*l, P = cmpoints(D, N));
  vector(#P, i, my(Q = P[i][1], z = P[i][2], ap = lift(Mod(Q[1], N)^-1));
    if(fam == "B", Bv(l, 1, z), Wv(l, if(wrongW, 1, ap), z)));
}
direct(m, l, fam) = if(fam == "B", Bv(l, 1, I*sqrt(m)), Wv(l, 1, I*sqrt(m)));

\\ ---- predictions (sealed in BAR-W1) ----
\\ orbit size of the characteristic under (O/lO)^* acting on row vectors through g = [t, -m s; s, t], modulo the stabiliser
orbitsize(m, l, fam) = {
  my(v0 = if(fam == "B", [1, 0], [0, 1]), S = Set());
  for(t = 0, l-1, for(s = 0, l-1, if((t^2 + m*s^2) % l != 0,
    my(w = [(v0[1]*t + v0[2]*s) % l, (v0[1]*(-m*s) + v0[2]*t) % l], w2 = [(-w[1]) % l, (-w[2]) % l]);
    S = setunion(S, Set([vecsort([w, w2])[1]])))));
  #S;
}
idon(m) = iselem2(-4*m);
isppow(m) = (m > 1 && #factor(m)[, 1] == 1);
\\ H_alt (derived in BAR-W1): B and W at l not dividing m: abelian <=> idoneal and the norm-one torus acts by +-1 mod l
\\   (l = 3: m = 0 or 2 mod 3; l = 5: 5 | m); W at l | m: never.
predalt(m, l, fam) = {
  if(!idon(m), return(0));
  if(m % l == 0, return(fam == "B"));
  if(l == 3, return(m % 3 == 2));
  0;
}
predsame(m) = idon(m) && isppow(m);
preddeg(m, l, fam) = #redforms(-4*m) * orbitsize(m, l, fam);
\\ |Cl(O)[2]| = number of ambiguous reduced forms of discriminant -4m
cl2(m) = { my(F = redforms(-4*m)); sum(i = 1, #F, my(Q = F[i]); Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]); }
\\ sealed real-root formula: |Cl[2]| * ((l-1)/2 if l | m, l-1 otherwise), both families
predreal(m, l) = cl2(m) * if(m % l == 0, (l-1)/2, l-1);

\\ ---- one value ----
wone(lab, m, l, fam, extra) = {
  my(t0 = getabstime(), D = -4*m, N = 4*l, V, cl, reps, mult, W, d, res, P, err, z, chk, nreal, ab, npr, pa, ps, pd);
  default(realprecision, 60);
  V = wvals(m, l, fam, 0); cl = clust(V, 1e-25); reps = cl[1];
  W = max(needW(reps), 150) + extra;
  default(realprecision, W);
  V = wvals(m, l, fam, 0); cl = clust(V, 10.^(-W \ 3)); [reps, mult] = cl; d = #reps;
  res = intpol(reps); [P, err] = res[1..2];
  npr = sum(i = 1, d, abs(imag(reps[i])) > 10.^(-W \ 2));
  default(realprecision, 2 * W);
  z = direct(m, l, fam);
  chk = dig(abs(subst(P, 'x, z)) / (vecmax(apply(abs, Vec(P))) * max(1, abs(z))^d));
  default(realprecision, W);
  nreal = polsturm(P);
  ab = if(d <= 2, [1, "degree <= 2"], abtest(P));
  pa = predalt(m, l, fam); ps = predsame(m); pd = preddeg(m, l, fam);
  print(lab, " l=", l, " fam=", fam, " m=", m, " (m mod l=", m % l, ") idoneal=", idon(m), " ppow=", isppow(m), " h=", #redforms(D),
        " |C_N|=", #V, " deg=", d, " preddeg=", pd, " mult=", Set(mult), " W=", W, " round=1e-", err, " den=", res[3],
        " irred=", polisirreducible(P), " P(z)@2W=1e-", chk, " realroots=", nreal, "/", d, " predreal=", predreal(m, l),
        " => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]",
        " Halt:", if(pa == ab[1], "ok", "MISS"), " Hsame:", if(ps == ab[1], "ok", "MISS"),
        " L3:", if(ab[1] == (nreal == d), "ok", "MISMATCH"), "  (", (getabstime() - t0) \ 1000, " s)");
  if(d <= 8, print("    P = ", P));
  [P, ab[1], d, nreal];
}

\\ null: W-family without the diag(1,a') action -> rounding should fail where a' matters
wnull(m, l) = {
  my(V, cl, reps, res);
  default(realprecision, 200);
  V = wvals(m, l, "W", 1); cl = clust(V, 1e-60); reps = cl[1];
  \\ (fixed after run 1: bestappr returns [] when no approximant exists, which crashed intpol; use distance to nearest integer)
  my(G0 = prod(i = 1, #reps, 'x - reps[i]), err = 0.);
  for(i = 0, poldegree(G0), my(c = polcoef(G0, i)); err = max(err, abs(c - round(real(c)))));
  print("  NULL wrong-action W l=", l, " m=", m, ": ", #reps, " values, distance of coefficients to integers 1e-", dig(err),
        if(dig(err) < 50, "  -> fails as it should", "  -> DID NOT FAIL"));
}
