\\ f1.gp -- vector 4: factorisation of the ideal (b_1) (and its conjugates) at the primes above 2.
\\ Engine for both the training run (train.gp) and the sealed test run (test.gp).
\\ Inputs: the integer minimal polynomial G of b_1 from the analytic conjugates (../../veins/v4_fast/fastmin.gp -> cert.gp conjs(p,1)).
\\ Unconditional calls only: nfinit([T, [2]]) (an order that is maximal at 2; Round 4 at the prime 2), idealprimedec, nfeltval,
\\ nfroots, polclass. No bnfinit, no GRH.
read("veins/v4_fast/fastmin.gp");
OUTD = "vectors/v4_factor/";

\\ Deuring exponent c (y^12 ~ 2^c, proof v5.1 Thm C3) and the predicted ramification index of 2 in F_p
cval(p) = if(p % 8 == 7, 0, if(p % 8 == 3, 4, 6));
epred(p) = if(p % 8 == 7, 1, if(p % 8 == 3, 3, 2));

\\ minimal polynomial of b_1 (variable x), with the fastmin self-checks
getG(p) = {
  my(W = needdig(p), V, res, G, h = qfbclassno(-4*p));
  default(realprecision, W);
  my(CL = conjs(p, 1)); V = CL[1]; LAB = CL[2]; res = intpol(V); G = res[1];
  print("  G: degree ", poldegree(G), " (want h(p-1)/2 = ", h*(p-1)/2, "), rounding error 10^-", res[2],
        ", max coeff digits ", res[3], ", monic ", pollead(G) == 1, ", irreducible ", polisirreducible(G));
  write(Str(OUTD, "minpoly_p", p, ".gp"), G);
  [G, V];
}

\\ Graeffe: polynomial whose roots are the e-th powers of the roots of G (e = 1, 2, 3), exact over Z
graeffe(G, e) = {
  my(n = poldegree(G), H, w);
  if(e == 1, return(G));
  if(e == 2, H = (-1)^n * G * subst(G, 'x, -'x); return(substpol(H, 'x^2, 'x)));
  if(e == 3, w = Mod('w, 'w^2 + 'w + 1);
    H = G * subst(G, 'x, w * 'x) * subst(G, 'x, w^2 * 'x);
    H = Pol(apply(c -> if(type(c) == "t_POLMOD", my(l = lift(c)); if(poldegree(l, 'w) > 0, error("non-rational Graeffe coefficient")); polcoef(l, 0, 'w), c), Vec(H)), 'x);
    return(substpol(H, 'x^3, 'x)));
  error("e");
}
\\ unit certificate: every root z = beta^e / 2^s (beta a root of G) is an algebraic integer unit
\\ <=> S(y) = H(2^s y) / 2^(s n) is in Z[y], monic, with S(0) = +-1.
unitcert(G, e, s) = {
  my(H = graeffe(G, e), n = poldegree(G), S, ok);
  S = subst(H, 'x, 2^s * 'x) / 2^(s * n);
  ok = (denominator(content(S)) == 1) && (pollead(S) == 1);
  if(!ok, return([0, "not integral"]));
  [abs(polcoef(S, 0)) == 1, Str("integral, constant ", if(abs(polcoef(S, 0)) == 1, polcoef(S, 0), Str("2^", valuation(polcoef(S, 0), 2), " * ", polcoef(S, 0) / 2^valuation(polcoef(S, 0), 2))))];
}

\\ the decomposition of 2 in J = Q(j(sqrt -p)) (class polynomial), and f in Q(zeta_p)^+
decJ(p) = {
  my(H = polclass(-4*p), nf, dec);
  if(poldegree(H) == 1, return("J = Q: 2 is 2 (e=1,f=1)"));
  nf = nfinit([H, [2]]); dec = idealprimedec(nf, 2);
  Str("J (deg ", poldegree(H), "): ", #dec, " primes, [e,f] = ", vector(#dec, i, [dec[i].e, dec[i].f]));
}
fplus(p) = { my(k = 1, t = Mod(2, p)); while(t != 1 && t != -1, t *= 2; k++); k; }
splitK(p) = if(p % 4 == 1, "ramified", if(p % 8 == 7, "split", "inert"));

\\ 2-adic Newton polygon of G: the multiset of 2-adic valuations (v(2) = 1) of ALL roots of G in Q2-bar (exact, combinatorial).
\\ Uniform valuation p c/12 for every root <=> a single slope.
newt(G, p) = {
  my(S = newtonpoly(G, 2), want = p * cval(p) / 12, ctrl);
  print("  Newton polygon at 2: root valuations (v(2)=1) = ", Set(S), " with multiplicities ", vector(#Set(S), i, #select(z -> z == Set(S)[i], S)),
        "; predicted single value p c/12 = ", want, " -> ", if(Set(S) == [want], "MATCH", "MISMATCH"));
  ctrl = newtonpoly(G * ('x - 2), 2);
  print("  Newton control (G * (x - 2)): ", Set(ctrl), if(#Set(ctrl) > 1 || want == 1, " (instrument sees the extra root)", " <- control did not separate"));
  Set(S) == [want];
}

\\ unit model: z = b_1^e / 2^p has integral minimal polynomial S (Graeffe, scaled). If S is irreducible of degree n = deg G then
\\ Q(z) = Q(b_1^e) = Q(b_1) (subfield of the same degree), and b_1^e = 2^p z gives the EXACT relation e v_P(b_1) = p e_P + v_P(z).
\\ nfinit([S,[2]]) is much cheaper than nfinit([G,[2]]) because the high power of 2 dividing b_1 is removed.
umodel(p) = {
  my(t0 = getabstime(), G = read(Str(OUTD, "minpoly_p", p, ".gp")), e = epred(p), n, S, nf, dec, vz, vb, ok);
  n = poldegree(G);
  S = subst(graeffe(G, e), 'x, 2^p * 'x) / 2^(p * n);
  if(denominator(content(S)) != 1, print("  p = ", p, " unit model: S not integral -> FAILED"); return(0));
  print("  p = ", p, " unit model: S integral monic of degree ", poldegree(S), ", S(0) = ", polcoef(S, 0), ", irreducible ", polisirreducible(S),
        ", max coeff digits ", vecmax(apply(z -> if(z == 0, 0, #digits(abs(z))), Vec(S))));
  if(!polisirreducible(S), print("  S reducible: Q(z) smaller than Q(b_1); unit model not used"); return(0));
  nf = nfinit([subst(S, 'x, 'y), [2]]); dec = idealprimedec(nf, 2);
  vz = vector(#dec, i, nfeltval(nf, 'y, dec[i]));
  vb = vector(#dec, i, (p * dec[i].e + vz[i]) / e);
  ok = (vb == vector(#dec, i, p * cval(p) * dec[i].e / 12));
  print("  primes P | 2 in Q(b_1) = Q(z): ", #dec, ";  [e, f, v_P(z), v_P(b_1) = (p e_P + v_P(z))/", e, "] = ",
        vector(#dec, i, [dec[i].e, dec[i].f, vz[i], vb[i]]));
  print("  formula v_P(b_1) = p c e_P/12: ", if(ok, "MATCH", "MISMATCH"), ";  e_P all = ", e, ": ", vector(#dec, i, dec[i].e) == vector(#dec, i, e),
        ";  sum f_P v_P(b_1) = ", sum(i = 1, #dec, dec[i].f * vb[i]), " vs v_2(G(0)) = ", valuation(polcoef(G, 0), 2),
        ";  residue degrees ", vecsort(vector(#dec, i, dec[i].f)), "  [", (getabstime() - t0) \ 1000, " s]");
  if(#dec > 1, my(pi1 = dec[1].gen[2]); print("  instrument control: v_P(uniformiser of P_1) = ", vector(#dec, i, nfeltval(nf, pi1, dec[i]))));
  ok;
}

\\ nfinit-only attempt from the saved minimal polynomial (used under alarm() at the large test primes)
nfonly(p) = {
  my(t0 = getabstime(), G = read(Str(OUTD, "minpoly_p", p, ".gp")), Gy, nf, dec, vals, sumf);
  Gy = subst(G, 'x, 'y); nf = nfinit([Gy, [2]]); dec = idealprimedec(nf, 2);
  vals = vector(#dec, i, nfeltval(nf, 'y, dec[i]));
  sumf = sum(i = 1, #dec, dec[i].f * vals[i]);
  print("  p = ", p, " nfinit([G,[2]]): primes P | 2: ", #dec, "; [e, f, v_P(b_1)] = ", vector(#dec, i, [dec[i].e, dec[i].f, vals[i]]));
  print("  e_P all = ", epred(p), ": ", vector(#dec, i, dec[i].e) == vector(#dec, i, epred(p)), "; v_P all = p c e_P/12: ",
        vals == vector(#dec, i, p * cval(p) * dec[i].e / 12), "; sum f v = ", sumf, " vs v_2(G(0)) = ", valuation(polcoef(G, 0), 2),
        "; residue degrees ", vecsort(vector(#dec, i, dec[i].f)), "  [", (getabstime() - t0) \ 1000, " s]");
}

\\ main factorisation report at one prime; rootsflag = 1 also lists the conjugates of b_1 that lie in F_p and their valuations;
\\ nfflag = 0 skips nfinit (Newton polygon + unit certificate only)
factor1(p, rootsflag, nfflag = 1) = {
  my(t0 = getabstime(), GV, G, V, Gy, nf, dec, n, vals, c = cval(p), ep = epred(p), pred, okv, v2c, sumf, uc, uc2, uc3, h = qfbclassno(-4*p));
  print("\n==================== p = ", p, " (p mod 8 = ", p % 8, ", h(-4p) = ", h, ", 2 in K: ", splitK(p), ", Deuring c = ", c, ")");
  GV = getG(p); G = GV[1]; V = GV[2]; n = poldegree(G);
  newt(G, p);
  if(c > 0,
    uc = unitcert(G, ep, p);
    print("  unit certificate: beta^", ep, "/2^", p, " is a unit for every conjugate beta: ", uc[1], " (", uc[2], ")");
    uc2 = unitcert(G, ep, p + 1);
    print("  control (2^", p + 1, " instead of 2^", p, "): unit? ", uc2[1], " (", uc2[2], ")", if(uc2[1], "  <- UNEXPECTED", "  (fails, as it should)"));
    uc3 = unitcert(G, 5 - ep, p);
    print("  control (wrong exponent ", 5 - ep, "): unit? ", uc3[1], " (", uc3[2], ")", if(uc3[1], "  <- UNEXPECTED", "  (fails, as it should)")));
  print("  J and Q(zeta_p)^+: ", decJ(p), ";  f in Q(zeta_p)^+ = ", fplus(p), " (g = ", (p-1)/2/fplus(p), ")");
  if(!nfflag, print("  (nfinit skipped)  [", (getabstime() - t0) \ 1000, " s]"); return(0));
  Gy = subst(G, 'x, 'y);
  nf = nfinit([Gy, [2]]);
  dec = idealprimedec(nf, 2);
  print("  nfinit([G,[2]]): order maximal at 2 (index of Z[b_1] at 2: 2^", valuation(nf.index, 2), ")");
  vals = vector(#dec, i, nfeltval(nf, 'y, dec[i]));
  print("  primes P | 2 in Q(b_1): ", #dec, ";  [e, f, v_P(b_1)] = ", vector(#dec, i, [dec[i].e, dec[i].f, vals[i]]));
  sumf = sum(i = 1, #dec, dec[i].f * vals[i]);
  v2c = valuation(polcoef(G, 0), 2);
  print("  check: sum f_P v_P(b_1) = ", sumf, " vs v_2(N b_1) = v_2(G(0)) = ", v2c, " -> ", if(sumf == v2c, "OK", "MISMATCH"));
  pred = vector(#dec, i, p * c * dec[i].e / 12);
  okv = (pred == vals);
  print("  formula v_P(b_1) = p c e_P / 12: predicted ", pred, " -> ", if(okv, "MATCH", "MISMATCH"));
  print("  all e_P equal to ", ep, ": ", vector(#dec, i, dec[i].e) == vector(#dec, i, ep));
  print("  residue degrees f_P: ", vecsort(vector(#dec, i, dec[i].f)));
  \\ instrument control: a uniformiser of one prime has NON-uniform valuations (so the instrument can see non-uniformity)
  if(#dec > 1, my(pi1 = dec[1].gen[2]); print("  instrument control: v_P(uniformiser of P_1) = ", vector(#dec, i, nfeltval(nf, pi1, dec[i])), " (non-uniform expected)"));
  if(rootsflag,
    my(R = nfroots(nf, G), iv, emb, bestk, lab);
    print("  conjugates of b_1 lying in Q(b_1): ", #R);
    \\ embedding of nf at which y = b_1: the root of Gy closest to V[1]
    for(r = 1, #R,
      my(vv = vector(#dec, i, nfeltval(nf, R[r], dec[i])), z, d = +oo, kk = 0);
      z = subst(lift(R[r]), 'y, V[1]);
      for(k = 1, #V, my(dd = abs(z - V[k])); if(dd < d, d = dd; kk = k));
      print("    root ", r, ": numerically ", LAB[kk], " (agreement 10^-", dig(d), "), v_P = ", vv, if(vv == vals, "  (= v_P(b_1))", "  <- DIFFERS")));
  );
  print("  [", (getabstime() - t0) \ 1000, " s]");
  [okv, vals, vector(#dec, i, [dec[i].e, dec[i].f])];
}
