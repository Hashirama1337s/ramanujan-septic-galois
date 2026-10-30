\\ sB.gp -- BAR-S1 block B: Rogers-Ramanujan R(i sqrt n), n = 2..40: degree h e(n), real count r(n) |Cl[2]|, with the fixed instrument,
\\ Sturm count and the Chavan disc-sign parity check on the exact integer polynomial. One process.
read("veins/v1_law/law.gp");
read("vectors/v6_shape/clustfix.gp");
cl2n(n) = { my(F = redforms(-4*n)); sum(i = 1, #F, my(Q = F[i]); Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]); }
en(n) = if(n % 5 == 0, 10, if(n % 5 == 1 || n % 5 == 4, 8, 12));
rn(n) = if(n % 5 == 0, 2, 4);
sb(n) = {
  my(D = -4 * n, V, c, r, W, res, P, ex, h = #redforms(D), pd, pr, P0 = 60, mn);
  pd = h * en(n); pr = rn(n) * cl2n(n);
  default(realprecision, 40); V = cvals(D, 5, RR); mn = vecmin(apply(v -> abs(v), V));
  while(1, default(realprecision, P0 + max(0, ceil(-log(mn)/log(10)))); V = cvals(D, 5, RR); c = pclust(V); r = preal(c[1]);
    if(c[5] && r[4], break); P0 *= 2; if(P0 > 1000, break));
  W = max(needW(c[1]), 150); default(realprecision, W); V = cvals(D, 5, RR); c = pclust(V);
  res = intpol(c[1]); P = res[1]; ex = pexact(P, r[1]);
  print("B n=", n, " h=", h, " cl2=", cl2n(n), " deg=", #c[1], " pred=", pd, if(#c[1] == pd, " ok", " DEGMISS"), " real=", r[1], " pred=", pr,
        if(r[1] == pr, " ok", " REALMISS"), " sturm=", ex[2], if(ex[2] == pr, " ok", " STURMMISS"), " sign(disc)=", ex[3], " parity_ok=", ex[4],
        " squarefree=", ex[1], " round=1e-", res[2], " den=", res[3], " certified=", c[5] && r[4]);
}
for(n = 2, 40, sb(n));
