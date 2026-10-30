\\ law.gp -- vein 1: when is a CM value of a rational-coefficient modular function abelian over Q?
\\ Conjugates over K of f(tau_O), f in F_N with rational q-coefficients, D = disc(O) = 0 mod 4, D != -4:
\\   KSY25 (arXiv:2506.14139v1) Thm 6.2 + Lemma 7.1 + Prop 4.1 + Thm 7.5 / Rem 7.6:
\\   classes of C_N(D) = { Q_i o sigma : Q_i reduced, sigma in SL2(Z)/(+-Gamma_1(N)) (first column v mod N, up to sign),
\\                         gcd(Q_i(v), N) = 1 };
\\   sigma_[Q](f(tau_O)) = f( x + (b + sqrt D)/(2a) ),  Q = (a,b,c),  x = -a'(b + b_O)/2 mod N,  a a' = 1 mod N  (b_O = 0 here).
\\ Within a class we pick the first column v = v0 + N w with the smallest Q_i(v) (largest Im), and reduce b mod 2a (T in Gamma_1(N)).

dig(z) = if(z == 0, 99999, floor(-log(abs(z)) / log(10)));

\\ ---------- reduced forms and idoneal test (Cl(D) elementary 2 <=> every reduced form ambiguous) ----------
redforms(D) = {
  my(L = List());
  for(a = 1, sqrtint(-D \ 3), for(b = -a, a, my(n = b^2 - D);
    if(n % (4*a) == 0, my(c = n / (4*a));
      if(c >= a && gcd([a, b, c]) == 1 && !(b < 0 && (-b == a || a == c)), listput(L, [a, b, c])))));
  Vec(L);
}
iselem2(D) = { my(F = redforms(D)); for(i = 1, #F, my(Q = F[i]); if(!(Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]), return(0))); 1; }

\\ ---------- coset columns of SL2(Z)/(+-Gamma_1(N)) (KSY25 Lemma 7.1) ----------
cosetcols(N) = {
  my(L = List());
  for(a = 0, N - 1, for(c = 0, N - 1,
    if(gcd([a, c, N]) == 1, my(a2 = (-a) % N, c2 = (-c) % N);
      if([a, c] == [a2, c2] || lex([a, c], [a2, c2]) < 0, listput(L, [a, c])))));
  Vec(L);
}
qv(Q, v) = Q[1] * v[1]^2 + Q[2] * v[1] * v[2] + Q[3] * v[2]^2;

\\ representative form of the class [Q o sigma], sigma with first column = v0 mod N; returns [a,b,c] or 0 if gcd(a,N) > 1
classform(Q, v0, N) = {
  my(best = 0, bv, R = 3, d1, d3, d2, d4, u, a, b, c, g);
  if(gcd(qv(Q, v0), N) > 1, return(0));
  for(s = -R, R, for(t = -R, R,
    d1 = v0[1] + N * s; d3 = v0[2] + N * t;
    if(gcd(d1, d3) == 1, my(val = qv(Q, [d1, d3])); if(best == 0 || val < best, best = val; bv = [d1, d3]))));
  [d1, d3] = bv;
  g = gcdext(d1, d3); \\ [u, v, 1] with u d1 + v d3 = 1 -> d4 = u, d2 = -v
  d4 = g[1]; d2 = -g[2];
  if(d1 * d4 - d2 * d3 != 1, error("bezout"));
  a = qv(Q, [d1, d3]);
  b = 2 * Q[1] * d1 * d2 + Q[2] * (d1 * d4 + d2 * d3) + 2 * Q[3] * d3 * d4;
  b = b - 2 * a * round(b / (2 * a));       \\ T^k, k in Z: stays in the class
  c = (b^2 - (Q[2]^2 - 4 * Q[1] * Q[3])) / (4 * a);
  [a, b, c];
}

\\ list of [form, point z] for all classes of C_N(D), D = 0 mod 4
cmpoints(D, N) = {
  my(F = redforms(D), C = cosetcols(N), L = List());
  if(D % 4 != 0 || D == -4, error("need D = 0 mod 4, D != -4"));
  for(i = 1, #F, for(k = 1, #C,
    my(Q = classform(F[i], C[k], N));
    if(Q != 0, my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x = (-ap * b / 2) % N);
      listput(L, [Q, x + (b + sqrt(D)) / (2 * a)]))));
  Vec(L);
}

\\ ---------- function evaluators (z in H) ----------
\\ Ramanujan f(a,b) = sum_n a^{n(n+1)/2} b^{n(n-1)/2}
rf(a, b) = {
  my(s = 1, eps = 10.^(-default(realprecision) - 10), n = 1, t1, t2);
  while(1, t1 = a^(n*(n+1)/2) * b^(n*(n-1)/2); t2 = a^(n*(n-1)/2) * b^(n*(n+1)/2); s += t1 + t2;
    if(abs(t1) + abs(t2) < eps * abs(s), break); n++);
  s;
}
qpoch(x) = rf(-x, -x^2);                 \\ (x;x)_inf (Jacobi triple product)
\\ family 1: Rogers-Ramanujan R(z) = q^{1/5} (q;q^5)(q^4;q^5)/((q^2;q^5)(q^3;q^5)), q = e^{2 pi i z}; level 5
RR(z) = { my(q = exp(2*Pi*I*z)); exp(2*Pi*I*z/5) * rf(-q, -q^4) / rf(-q^2, -q^3); }
\\ family 2: cubic CF G(w) = q^{1/3} (q;q^2)/(q^3;q^6)^3, q = e^{2 pi i w}; we use Gt(z) = G(z/2) so that Gt(i sqrt n) = G(e^{-pi sqrt n})
Gcf(w) = { my(q = exp(2*Pi*I*w)); exp(2*Pi*I*w/3) * qpoch(q) * qpoch(q^6)^3 / (qpoch(q^2) * qpoch(q^3)^3); }
Gt(z) = Gcf(z / 2);

\\ theta with characteristics th(a,b,z) = sum_m exp(pi i (m+a)^2 z + 2 pi i (m+a) b), evaluated through S/T reduction
thdirect(a, b, z) = {
  my(y = imag(z), pr = default(realprecision), M, s = 0.);
  M = ceil(sqrt((pr + 30) * log(10) / (Pi * y))) + 2;
  for(m = -M, M, s += exp(Pi*I*(m + a)^2*z + 2*Pi*I*(m + a)*b));
  s;
}
th(a, b, z) = {
  my(fac = 1, k, t);
  while(imag(z) < 0.6,
    k = round(real(z)); z -= k;
    \\ th(a,b,z0+k) = e^{-pi i a(a+1) k} th(a, b + k(a+1/2), z0)
    fac *= exp(-Pi*I*a*(a+1)*k); b += k*(a + 1/2);
    t = floor(b); fac *= exp(2*Pi*I*a*t); b -= t;          \\ th(a,b+t) = e^{2 pi i a t} th(a,b)
    if(imag(z) >= 0.6, break);
    \\ z = -1/w : th(a,b,-1/w) = sqrt(-i w) e^{2 pi i a b} th(b,-a,w)
    my(w = -1/z); fac *= sqrt(-I*w) * exp(2*Pi*I*a*b); [a, b] = [b, -a]; z = w;
    t = floor(a); a -= t;                                   \\ th(a+1,b) = th(a,b)
  );
  fac * thdirect(a, b, z);
}
\\ family 3: p.206 piece b_k(z) = (2 th[k/n,0](z) / th[0,0](z))^n, value at i sqrt n; level 4n
Bpiece(k, n, z) = (2 * th(k/n, 0, z) / th(0, 0, z))^n;

\\ ---------- conjugates, minimal polynomial, tests ----------
\\ values over all classes (complex); fe = closure
cvals(D, N, fe) = { my(P = cmpoints(D, N)); vector(#P, i, fe(P[i][2])); }

\\ cluster numerically equal values (tolerance tol), return [reps, multiplicities]
clust(V, tol) = {
  my(R = List(), M = List(), hit);
  for(i = 1, #V, hit = 0;
    for(j = 1, #R, if(abs(V[i] - R[j]) < tol * (1 + abs(R[j])), M[j]++; hit = 1; break));
    if(!hit, listput(R, V[i]); listput(M, 1)));
  [Vec(R), Vec(M)];
}
\\ rational rounding (cubic CF values are not always integral): bestappr with denominator bound 10^(prec/4),
\\ returns [primitive integer polynomial, rounding error digits, common denominator]
intpol(V) = {
  my(G0 = prod(i = 1, #V, 'x - V[i]), G, err = 0., B = 10^(default(realprecision) \ 4), den);
  G = vector(poldegree(G0) + 1, i, bestappr(real(polcoef(G0, i - 1)), B));
  for(i = 0, poldegree(G0), err = max(err, abs(polcoef(G0, i) - G[i + 1])));
  den = denominator(G);
  [Pol(Vecrev(G * den)), dig(err), den];
}
\\ monic integral polynomial with the same splitting field and the same real-root count (root scaling by the positive leading coefficient)
mon(P) = { my(c = pollead(P), d = poldegree(P)); if(c < 0, P = -P; c = -c); if(c == 1, P, c^(d-1) * subst(P, 'x, 'x / c)); }
needW(V) = { my(d = #V); ceil(1.3 * (sum(i = 1, d, max(0, log(abs(V[i])) / log(10))) + lngamma(d + 1) / log(10))) + 80; }

\\ rigorous non-Galois witness: a good prime with unequal factor degrees
nongalois(P) = {
  my(cnt = 0);
  forprime(p = 3, 20000,
    if(polcoef(P, poldegree(P)) % p == 0, next);
    my(F = factormod(P, p));
    if(vecmax(F[, 2]) > 1, next);
    my(dg = apply(poldegree, lift(F[, 1])));
    cnt++;
    if(vecmin(dg) != vecmax(dg), return([p, vecsort(dg~)]));
    if(cnt > 300, break));
  0;
}
\\ abelian test: returns [isabelian, SNF invariants or reason]
abtest(P) = {
  my(w, G, H);
  P = mon(P); w = nongalois(P);
  if(w != 0, return([0, Str("not Galois: mod ", w[1], " factor degrees ", w[2])]));
  G = iferr(galoisinit(P), E, 0);
  if(G == 0, return([0, "galoisinit refused (not Galois or not weakly super-solvable)"]));
  H = galoisisabelian(G);
  if(H == 0, return([0, "Galois, non-abelian"]));
  [1, matsnf(H)];
}
