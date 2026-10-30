\\ proof_u1.gp -- V9, exact computations for PROOF-U1.md (PROOF DRAFT). EXACT arithmetic except the clearly labelled numeric checks.
\\ Functions as Siegel quotients (derived in PROOF-U1 §1 from KSY10 (1.3)):  F(z) = g_{(u,0)}(k z) / g_{(v,0)}(k z)
\\   Goellnitz-Gordon Ht(z) = H(z/2):  k = 4, u = 1/8, v = 3/8, level N = 8
\\   cubic CF        Gt(z) = G(z/2):  k = 3, u = 1/6, v = 1/2, level N = 6
\\ Inputs used: KSY10 Prop 2.4(ii) (g_r o g = eps(g) g_{r g}, eps depends on g only), 2.4(iii) (g_{r+s} = (-1)^{s1 s2+s1+s2} e^{-pi i (s1 r2 - s2 r1)} g_r),
\\ 2.4(v) (ord_q g_r = B2(<r1>)/2), (1.3) => g_{(1-x,0)} = g_{(x,0)}.  Phases are stored as rationals t (meaning e^{pi i t}), mod 2.
default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
B2(x) = x^2 - x + 1/6;
\\ frac(x) = x - floor(x) is the PARI built-in (a first version redefined it: gp error, harmless, same semantics)
mod2(t) = t - 2*floor(t/2);

\\ reduce g_{(r1, r2)} with r2 an INTEGER to e^{pi i t} g_{(b, 0)}, b in [0, 1/2]; returns [t mod 2, b]
sred(r1, r2) = {
  my(b = frac(r1), s1 = r1 - b, s2 = r2, t);
  if(denominator(r2) != 1, error("sred: r2 not integral"));
  t = (s1*s2 + s1 + s2) + s2 * b;                       \\ (-1)^{..} = e^{pi i (..)};  e^{-pi i (s1*0 - s2*b)} = e^{pi i s2 b}
  if(b > 1/2, b = 1 - b);                                \\ g_{(1-x,0)} = g_{(x,0)}
  [mod2(t), b];
}
\\ action of h = [a,b;c,d] in Gamma0(k) on F: returns [phase t, sign] with F o h = e^{pi i t} F^{sign}, or 0 if not of that shape
\\ (requires k u b, k v b integral)
hact(h, k, u, v) = {
  my(a = h[1,1], b = h[1,2], c = h[2,1], d = h[2,2], hp, ru, rv, U, V);
  if(c % k != 0, error("hact: h not in Gamma0(k)"));
  hp = [a, k*b; c/k, d];
  ru = [u, 0] * hp; rv = [v, 0] * hp;
  if(denominator(ru[2]) != 1 || denominator(rv[2]) != 1, return(0));
  U = sred(ru[1], ru[2]); V = sred(rv[1], rv[2]);
  if(U[2] == u && V[2] == v, return([mod2(U[1] - V[1]), 1]));
  if(U[2] == v && V[2] == u, return([mod2(U[1] - V[1]), -1]));
  0;
}
\\ exact order at infinity (in q = e^{2 pi i z}) of F o g, any g in SL2(Z)
ordF(g, k, u, v) = {
  my(a = g[1,1], c = g[2,1], A = gcd(k*a, c), D = k / A, g11 = k*a / A);
  (A / D) * (B2(frac(u*g11)) - B2(frac(v*g11))) / 2;
}
\\ lift of a matrix mod N with det 1 mod N to SL2(Z)
liftSL(A, N) = {
  my(a = A[1,1] % N, b = A[1,2] % N, c = A[2,1] % N, d = A[2,2] % N, c1, d1, g, a0, b0, u, al);
  for(k = 0, 50, c1 = c + N*k; if(c1 == 0, next);
    for(j = 0, 50, d1 = d + N*j; if(gcd(c1, d1) == 1,
      g = gcdext(d1, c1); a0 = g[1]; b0 = -g[2]; al = gcdext(c1, d1);
      u = al[1] * (a - a0) + al[2] * (b - b0);
      my(M = [a0 + c1*u, b0 + d1*u; c1, d1]);
      if(matdet(M) != 1 || (M - [a, b; c, d]) % N != matrix(2, 2), error("lift"));
      return(M))));
  error("no lift");
}
SLmod(N) = { my(L = List()); for(a=0,N-1, for(b=0,N-1, for(c=0,N-1, for(d=0,N-1, if((a*d-b*c-1) % N == 0, listput(L, [a,b;c,d])))))); Vec(L); }
mmod(M, N) = apply(x -> x % N, M);

\\ ---------- the two families ----------
FAM = {[["GG Ht", 4, 1/8, 3/8, 8,
         [[1,0;0,1], [1,0;4,1], [1,4;0,1], [1,4;4,1], [7,0;0,7], [7,0;4,7], [7,4;0,7], [7,4;4,7]]],
       ["CF Gt", 3, 1/6, 1/2, 6,
         [[1,0;0,1], [1,0;3,1], [5,0;0,5], [5,0;3,5]]]]};

{
for(f = 1, #FAM, my(nm = FAM[f][1], k = FAM[f][2], u = FAM[f][3], v = FAM[f][4], N = FAM[f][5], S = FAM[f][6], ok, all, cos, deg, tot, ords, SL, seen);
  print("================ ", nm, ": F(z) = g_(", u, ",0)(", k, "z) / g_(", v, ",0)(", k, "z), level ", N, " ================");
  \\ (1) Gamma(N)-invariance: exact phase for random elements of Gamma(N) (symbolic proof in PROOF-U1 §2)
  ok = 1;
  for(i = 1, 200, my(h = liftSL(matid(2), N) * [1, N*(random(7)-3); 0, 1] * [1, 0; N*(random(7)-3), 1] * [1, N*(random(7)-3); 0, 1], r = hact(h, k, u, v));
    if(r == 0 || r != [0, 1], ok = 0; print("  Gamma(N) element NOT invariant: ", h, " -> ", r)));
  print("(1) 200 random Gamma(", N, ") elements: F o h = F exactly: ", ok);
  \\ (2) each claimed stabiliser element (one lift each): exact phase
  all = 1;
  for(i = 1, #S, my(h = liftSL(S[i], N), r = hact(h, k, u, v));
    print("(2) S' element ", S[i], " lift ", h, ": F o h = e^{pi i ", if(r, r[1], "?"), "} F^", if(r, r[2], "?"));
    if(r != [0, 1], all = 0));
  print("(2) all claimed elements fix F exactly: ", all);
  \\ (3) exact degree of F on X(Gamma*), Gamma* = preimage of S' (contains -I): sum over right cosets S' g of max(0, -ord)
  SL = SLmod(N); seen = Map(); cos = List();
  for(i = 1, #SL, my(g = SL[i], key = vecsort(apply(s -> mmod(s * g, N), S)));
    if(!mapisdefined(seen, key), mapput(seen, key, 1); listput(cos, g)));
  ords = vector(#cos, i, ordF(liftSL(cos[i], N), k, u, v));
  deg = sum(i = 1, #ords, max(0, -ords[i])); tot = vecsum(ords);
  print("(3) |SL2(Z/", N, ")| = ", #SL, ", |S'| = ", #S, ", cosets = ", #cos, "; sum of orders = ", tot, " (must be 0); poles (degree) = ", deg,
        "; zeros = ", sum(i = 1, #ords, max(0, ords[i])));
  print("    multiset of orders: ", vecsort(ords));
  \\ (3b) independence of the lift: same coset, other representatives (s*g) give the same order
  my(indep = 1); for(i = 1, #cos, for(j = 1, #S, if(ordF(liftSL(mmod(S[j] * cos[i], N), N), k, u, v) != ords[i], indep = 0)));
  print("(3b) order is constant on cosets: ", indep);
);
}

\\ ---------- numeric control of hact (not part of the proof): random h in Gamma0(k) with k u b, k v b integral ----------
read("veins/v1_law/law.gp");
default(realprecision, 60);
Ht(z) = exp(-Pi*I/4) * th(3/8, 1/2, 4*z) / th(1/8, 1/2, 4*z);
Gt(z) = my(w = z/2); eta(w, 1) * eta(6*w, 1)^3 / (eta(2*w, 1) * eta(3*w, 1)^3);
\\ identity check of the Siegel forms: F = g_u(kz)/g_v(kz) via KSY10 (1.3) product
gsieg(r1, z) = { my(q = exp(2*Pi*I*z), qz = exp(2*Pi*I*r1*z), p = -q^(B2(r1)/2) * (1 - qz), n = 1, t); while(1, t = (1 - q^n*qz) * (1 - q^n/qz); p *= t; if(abs(t - 1) < 1e-70, break); n++); p; }
{
  my(z0 = 0.11 + 1.07*I);
  print("(N0) Ht = g_(1/8,0)(4z)/g_(3/8,0)(4z): ", dig(abs(Ht(z0) - gsieg(1/8, 4*z0)/gsieg(3/8, 4*z0))/abs(Ht(z0))), " digits");
  print("(N0) Gt = g_(1/6,0)(3z)/g_(1/2,0)(3z): ", dig(abs(Gt(z0) - gsieg(1/6, 3*z0)/gsieg(1/2, 3*z0))/abs(Gt(z0))), " digits");
  my(mob(M, z) = (M[1,1]*z + M[1,2]) / (M[2,1]*z + M[2,2]), cnt = 0, worst = 0);
  foreach([[Ht, 4, 1/8, 3/8], [Gt, 3, 1/6, 1/2]], fam, my(F = fam[1], k = fam[2], u = fam[3], v = fam[4]); cnt = 0; worst = 0;
    for(i = 1, 400, my(c = k * (random(9) - 4), d = 1 + 2*random(6), g = gcdext(d, c));   \\ want a d - b c = 1
      if(gcd(c, d) != 1, next);
      my(a = g[1], b = -g[2], h, r, pred, obs);
      for(t = -3, 3, h = [a + t*c, b + t*d; c, d]; r = hact(h, k, u, v); if(r != 0, break));
      if(r == 0, next); cnt++;
      pred = exp(Pi*I*r[1]) * F(z0)^r[2]; obs = F(mob(h, z0));
      worst = max(worst, abs(pred - obs) / abs(obs)));
    print("(N1) numeric control of the exact action formula: ", cnt, " random elements of Gamma0(", k, "), worst rel. error 1e", if(worst == 0, -99, round(log(worst)/log(10)))));
}
\\ idoneality of the numbers used (exact: every reduced form ambiguous)
print("(E) idoneal 4m for m = 3, 7, 15: ", vector(3, i, iselem2(-16 * [3, 7, 15][i])), "; 9n for n = 2, 8: ", [iselem2(-72), iselem2(-288)]);
