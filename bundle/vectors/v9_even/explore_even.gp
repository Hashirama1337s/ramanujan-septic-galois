\\ explore_even.gp -- V9 user-seat, EXPLORATORY (not sealed). Boss-3 prep.
\\ Question: at even level, which idoneal m have psi(G) fixing z = F(i sqrt m)?  (RESULT-V1 (L2): Q(z) abelian <=> psi(G) fixes z.)
\\ For idoneal m every psi(sigma_[a]) is the principal class of eps(a0) * xbar/x (a = a0 x), so it acts through KSY25 Prop 5.1
\\ by z -> F(g~ tau_O), g = [t, -m s; s, t] (norm 1, so g in SL2(Z/N)); we test the generators directly at the CM point.
\\ No GS hypothesis is needed for idoneal m; non-idoneal m are not tested here.
default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 80);
read("veins/v1_law/law.gp");

\\ ---- functions ----
Geta(w) = eta(w, 1) * eta(6*w, 1)^3 / (eta(2*w, 1) * eta(3*w, 1)^3);   \\ cubic CF G(q), q = e^{2 pi i w}
Gt6(z) = Geta(z / 2);                                                    \\ Gt(i sqrt n) = G(e^{-pi sqrt n}); RESULT-V1 F2 object
H8(z) = exp(-Pi*I/4) * th(3/8, 1/2, 8*z) / th(1/8, 1/2, 8*z);            \\ Goellnitz-Gordon H(q), q = e^{2 pi i z}
Hdirect(z) = { my(q = exp(2*Pi*I*z)); exp(Pi*I*z) * rf(-q, -q^7) / rf(-q^3, -q^5); }
Ht(z) = H8(z / 2);                                                       \\ Ht(i sqrt n) = H(e^{-pi sqrt n})

\\ ---- lift a matrix mod N with det = 1 mod N to SL2(Z) ----
liftSL(A, N) = {
  my(a = A[1,1] % N, b = A[1,2] % N, c = A[2,1] % N, d = A[2,2] % N, c1, d1, g, a0, b0, u, al, be);
  if((a*d - b*c - 1) % N != 0, error("det not 1 mod N"));
  for(k = 0, 50, c1 = c + N*k; if(c1 == 0, next);
    for(j = 0, 50, d1 = d + N*j; if(gcd(c1, d1) == 1,
      g = gcdext(d1, c1);              \\ g[1] d1 + g[2] c1 = 1 -> a0 = g[1], b0 = -g[2]
      a0 = g[1]; b0 = -g[2];
      al = gcdext(c1, d1);             \\ al[1] c1 + al[2] d1 = 1
      u = (al[1] * (a - a0) + al[2] * (b - b0));
      my(M = [a0 + c1*u, b0 + d1*u; c1, d1]);
      if(matdet(M) != 1, error("lift det"));
      if((M - [a, b; c, d]) % N != matrix(2, 2), error("lift residue"));
      return(M))));
  error("no lift");
}
mob(M, z) = (M[1,1]*z + M[1,2]) / (M[2,1]*z + M[2,2]);
reld(x, y) = if(y == 0, abs(x), abs(x - y) / abs(y));

\\ ---- level check: F invariant under random elements of Gamma(N)? ----
levelcheck(F, N, name) = {
  my(z0 = 0.1234 + 0.9876*I, f0 = F(z0), worst = 0., A, M);
  for(i = 1, 6, A = [1 + N*random(5), N*random(5); N*random(5), 1 + N*random(5)];
    \\ make det 1 mod N^2 is not needed; use liftSL on identity-mod-N matrices
    M = liftSL(matid(2), N);
    M = [1, N; 0, 1] * M * [1, 0; N, 1]^(1 + random(3)) * [1, N*random(3); 0, 1];
    worst = max(worst, reld(F(mob(M, z0)), f0)));
  print(name, ": Gamma(", N, ")-check worst rel. diff = ", dig(worst), " digits agree");
  worst;
}

\\ ---- torus image {xbar/x} mod N as (t, s) pairs ----
torus(m, N) = {
  my(L = List(), nx, inv, yt, ys);
  for(t = 0, N - 1, for(s = 0, N - 1, nx = t^2 + m*s^2;
    if(gcd(nx, N) == 1, inv = lift(Mod(nx, N)^-1);
      yt = ((t^2 - m*s^2) * inv) % N; ys = ((-2*t*s) * inv) % N;
      listput(L, [yt, ys]))));
  vecsort(Vec(L), , 8);
}
\\ ---- eps(a) for each reduced form (idoneal m: all of Cl = Cl[2]) ----
epslist(m, N) = {
  my(F = redforms(-4*m), E = List(), Q, p, inv);
  for(i = 1, #F, Q = F[i]; p = 0;
    for(x = -30, 30, for(y = 0, 30, if(gcd(x, y) == 1, my(v = qv(Q, [x, y]));
      if(v > 2 && isprime(v) && gcd(v, 2*m*N) == 1, p = v; break(2)))));
    if(p == 0, error("no prime for form"));
    inv = lift(Mod(p, N)^-1);
    for(v = 1, sqrtint(p^2 \ m), my(u2 = p^2 - m*v^2); if(issquare(u2),
      my(u = sqrtint(u2));
      listput(E, [Q, p, [(u*inv) % N, (-v*inv) % N]]); listput(E, [Q, p, [(u*inv) % N, (v*inv) % N]]);
      listput(E, [Q, p, [(-u*inv) % N, (-v*inv) % N]]))));
  Vec(E);
}
gmat(ts, m) = [ts[1], -m*ts[2]; ts[2], ts[1]];

\\ ---- the test at one (F, N, m) ----
utest(F, N, m, name) = {
  my(tO = I*sqrt(m), z = F(tO), T = torus(m, N), E = epslist(m, N), mvT = 0, mvE = 0, nT = 0, wit = 0, d, M);
  for(i = 1, #T, my(ts = T[i]); if(ts == [1, 0] || ts == [N - 1, 0], next); nT++;
    M = liftSL(gmat(ts, m), N); d = reld(F(mob(M, tO)), z);
    if(d > 1e-40, mvT++; if(wit == 0, wit = ts)));
  for(i = 1, #E, my(ts = E[i][3]); M = liftSL(gmat(ts, m), N); d = reld(F(mob(M, tO)), z);
    if(d > 1e-40, mvE++));
  print(name, " m = ", m, ": idoneal ", iselem2(-4*m), ", h = ", #redforms(-4*m), ", z = ", precision(z, 20),
        " | torus elements != +-1: ", nT, ", moving z: ", mvT, (if(wit, Str(" (e.g. y = ", wit, ")"), "")),
        " | eps elements tested: ", #E, ", moving z: ", mvE,
        " | psi(G) fixes z (=> abelian, idoneal m): ", if(iselem2(-4*m), if(mvT + mvE == 0, "YES", "NO"), "n/a (not idoneal)"));
}

\\ ---- sanity: evaluators ----
{
  my(z = 0.05 + 1.3*I);
  print("check Geta vs law.gp Gcf: ", dig(reld(Geta(z), Gcf(z))), " digits");
  print("check H8 vs product formula: ", dig(reld(H8(z), Hdirect(z))), " digits");
}
levelcheck(Gt6, 6, "Gt (cubic CF, w = z/2)");
levelcheck(H8, 8, "H (Goellnitz-Gordon at q = e^{2 pi i z})");
levelcheck(Ht, 8, "Ht (Goellnitz-Gordon at q = e^{pi i z})");
levelcheck(Ht, 16, "Ht (Goellnitz-Gordon at q = e^{pi i z})");

print("--- calibration: cubic CF at level 6 (RESULT-V1 F2 observed abelian n in {2, 8}, not 5) ---");
foreach([2, 5, 8], m, utest(Gt6, 6, m, "Gt"));

print("--- stabilisers in SL2(Z/N) at a generic point (S' = {g : F o g~ = F}) ---");
stab(F, N, name) = {
  my(z0 = 0.1234 + 0.9876*I, f0 = F(z0), L = List());
  for(a = 0, N-1, for(b = 0, N-1, for(c = 0, N-1, for(d = 0, N-1,
    if((a*d - b*c - 1) % N == 0, my(M = liftSL([a, b; c, d], N));
      if(reld(F(mob(M, z0)), f0) < 1e-40, listput(L, [a, b; c, d])))))));
  print(name, ": |S'| = ", #L, " of |SL2(Z/", N, ")|; elements: ", Vec(L));
  Vec(L);
}
SG = stab(Gt6, 6, "Gt level 6");
SH = stab(Ht, 8, "Ht level 8");

print("--- EXPLORATORY: Goellnitz-Gordon Ht(i sqrt m) = H(e^{-pi sqrt m}), level 8, five idoneal m ---");
foreach([2, 3, 4, 5, 7], m, utest(Ht, 8, m, "Ht"));

print("--- half-characteristic piece: th[1/2,0]/th[0,0] vs (f2/f)^2 (first run compared 2 th/th and got 0 digits: a factor-2 slip in the seat derivation, corrected) ---");
{
  my(wf(z) = exp(-Pi*I/24) * eta((z+1)/2, 1) / eta(z, 1), wf2(z) = sqrt(2) * eta(2*z, 1) / eta(z, 1));
  foreach([0.1 + 0.9*I, I*sqrt(2), I*sqrt(6), 0.3 + 1.7*I], z,
    print("z = ", precision(z, 6), ": rel diff ", dig(reld(th(1/2, 0, z)/th(0, 0, z), (wf2(z)/wf(z))^2)), " digits"));
}

print("--- parity split (2-peel candidate): th[k/2l,0](z) = (th[k/l,0](z/4) + e^{-pi i k/l} th[k/l,1/2](z/4))/2 ---");
{
  foreach([[1,3], [1,5], [3,5], [1,7], [5,9]], kl, my(k = kl[1], l = kl[2]);
    foreach([0.1 + 0.9*I, I*sqrt(6)], z,
      my(lhs = th(k/(2*l), 0, z), rhs = (th(k/l, 0, z/4) + exp(-Pi*I*k/l) * th(k/l, 1/2, z/4))/2);
      print("k = ", k, ", l = ", l, ", z = ", precision(z, 6), ": agree to ", dig(reld(rhs, lhs)), " digits")));
}
