\\ run.gp -- BAR-V1 runner. Usage inside gp: read law.gp, read run.gp, then call fam1(), fam2(), fam3(list), controls().
\\ One line per value: family, n, degree, multiplicity, W, rounding error, check at 2W, #real conjugates, verdict, invariants.

form2pt(Q, N) = { my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x = (-ap * b / 2) % N); x + (b + sqrt(Q[2]^2 - 4*Q[1]*Q[3])) / (2 * a); }

\\ alternative (non-minimal) representative of the same class: first column v + N*(1,1) etc.
altform(Q, v0, N) = {
  my(cands = [[v0[1] + N, v0[2] + N], [v0[1] + 2*N, v0[2] - N], [v0[1] - N, v0[2] + 2*N]]);
  for(i = 1, #cands, my(v = cands[i]); if(gcd(v[1], v[2]) == 1,
    my(g = gcdext(v[1], v[2]), d1 = v[1], d3 = v[2], d4 = g[1], d2 = -g[2], a, b, c);
    a = qv(Q, [d1, d3]); b = 2*Q[1]*d1*d2 + Q[2]*(d1*d4 + d2*d3) + 2*Q[3]*d3*d4; c = (b^2 - (Q[2]^2 - 4*Q[1]*Q[3])) / (4*a);
    return([a, b, c])));
  0;
}
spotcheck(D, N, fe, lab) = {
  my(F = redforms(D), C = cosetcols(N), worst = 99999, cnt = 0);
  for(i = 1, #F, for(k = 1, #C, if(cnt >= 12, break);
    my(Q1 = classform(F[i], C[k], N)); if(Q1 == 0, next);
    my(Q2 = altform(F[i], C[k], N)); if(Q2 == 0, next);
    my(v1 = fe(form2pt(Q1, N)), v2 = fe(form2pt(Q2, N)));
    cnt++; worst = min(worst, dig(abs(v1 - v2) / abs(v1)))));
  print("  [P5iv] ", lab, ": ", cnt, " classes, two representatives agree to 10^-", worst);
}

runone(lab, n, N, fe, extra) = {
  my(t0 = getabstime(), D = -4*n, V, cl, d, W, reps, mult, res, P, err, z, chk, nreal, ab, npr, maxim);
  default(realprecision, 60);
  V = cvals(D, N, fe); cl = clust(V, 1e-25); reps = cl[1];
  W = max(needW(reps), 150) + extra;
  default(realprecision, W);
  V = cvals(D, N, fe); cl = clust(V, 10.^(-W \ 3)); [reps, mult] = cl; d = #reps;
  res = intpol(reps); [P, err] = res[1..2];
  maxim = vecmax(apply(v -> abs(imag(v)), reps));
  npr = sum(i = 1, d, abs(imag(reps[i])) > 10.^(-W \ 2));
  default(realprecision, 2 * W);
  z = fe(I * sqrt(n));
  chk = dig(abs(subst(P, 'x, z)) / (vecmax(apply(abs, Vec(P))) * max(1, abs(z))^d));
  default(realprecision, W);
  nreal = polsturm(P);  \\ invariant under positive root scaling
  ab = abtest(P);
  print(lab, " n=", n, " idoneal=", iselem2(D), " h=", #redforms(D), " |C_N|=", #V, " deg=", d, " mult=", Set(mult),
        " W=", W, " round=1e-", err, " den=", res[3], " irred=", polisirreducible(P), " P(z)@2W=1e-", chk, " Im(z)=", dig(imag(z)),
        " realroots=", nreal, "/", d, " nonreal_conj=", npr,
        " => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]",
        " L3:", if(ab[1] == (nreal == d), "ok", "MISMATCH"), "  (", (getabstime() - t0) \ 1000, " s)");
  P;
}

\\ n = 1 (D = -4, excluded from KSY25 Thm 7.5): algdep
runalg(lab, n, fe) = {
  my(z, P = 0, chk, ab);
  default(realprecision, 800); z = real(fe(I * sqrt(n)));
  for(d = 1, 48, my(Q = algdep(z, d)); if(poldegree(Q) == d && polisirreducible(Q) && dig(subst(Q, 'x, z)) > 600, P = Q; break));
  if(P == 0, print(lab, " n=", n, ": no algdep relation of degree <= 48 at 800 digits"); return(0));
  default(realprecision, 1600); z = real(fe(I * sqrt(n)));
  chk = dig(abs(subst(P, 'x, z)) / vecmax(apply(abs, Vec(P))));
  default(realprecision, 800);
  ab = abtest(P);
  print(lab, " n=", n, " (algdep) deg=", poldegree(P), " P=", P, " check@1600=1e-", chk, " realroots=", polsturm(P), "/", poldegree(P),
        " => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "] L3:", if(ab[1] == (polsturm(P) == poldegree(P)), "ok", "MISMATCH"));
  P;
}

fam1() = { my(P13); print("=== F1: Rogers-Ramanujan R(e^{-2 pi sqrt n}), N = 5"); runalg("F1", 1, RR);
  for(n = 2, 60, my(P = runone("F1", n, 5, RR, 0)); if(n == 13, P13 = P));
  my(K = x^24 + 82*x^23 - 996*x^22 + 968*x^21 + 1051*x^20 + 1422*x^19 - 96*x^18 - 24912*x^17 + 7896*x^16 + 16722*x^15 + 28844*x^14
       + 13658*x^13 - 114024*x^12 - 13658*x^11 + 28844*x^10 - 16722*x^9 + 7896*x^8 + 24912*x^7 - 96*x^6 - 1422*x^5 + 1051*x^4
       - 968*x^3 - 996*x^2 - 82*x + 1);
  print("  [P5i] F1 n=13 equals KSY25 Example 8.1 polynomial: ", P13 == K);
  default(realprecision, 200); spotcheck(-52, 5, RR, "F1 n=13");
}
fam2() = { print("=== F2: cubic continued fraction G(e^{-pi sqrt n}), N = 6"); runalg("F2", 1, Gt);
  for(n = 2, 60, runone("F2", n, 6, Gt, 0));
  default(realprecision, 200); spotcheck(-4*14, 6, Gt, "F2 n=14");
}
fam3(L) = { print("=== F3: p.206 piece b_1 at n, N = 4n");
  for(i = 1, #L, my(n = L[i]); runone("F3", n, 4*n, z -> Bpiece(1, n, z), 0));
}
nulls() = {
  my(P, ab);
  print("=== P6 nulls");
  setrand(20261027);
  until(polisirreducible(P), P = x^24 + sum(i = 0, 23, (random(21) - 10) * x^i));
  ab = abtest(P); print("  [P6i] random degree-24 polynomial: ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "] realroots=", polsturm(P), "/24");
  P = x^3 - 4*x - 1; ab = abtest(P);
  print("  [P6ii] x^3-4x-1: disc=", poldisc(P), " realroots=", polsturm(P), "/3 => ", if(ab[1], "ABELIAN", "NOT ABELIAN"), " [", ab[2], "]");
}
