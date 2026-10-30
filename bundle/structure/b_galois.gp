\\ Finding 3: Galois action of Gal(Q(cos 2pi/N)/Q) (extended to L fixing P) on the b_k.
\\ For each a in (Z/N)^*/{+-1} that fixes Q(P) cap Q(cos 2pi/N), apply sigma_a to the sweep table of b_k
\\ (cos(2 pi j/N) -> cos(2 pi a j/N), P fixed) and see which b_k' it lands on.
\\ Hypothesis H3: sigma_a(b_k) = b_{x k mod p} (up to k -> -k), where x^2 = chi(a) * a mod p,
\\ chi(a) = Legendre (a/p) for p = 3 mod 4, chi(a) = (-1)^((a-1)/2) for p = 1 mod 4 (a a QR mod p).
TAB = vector(40); read("tables.gp");
default(realprecision, 400);
thf(a, b, eps) = {
  my(s = 1., n = 1, t);
  while(1, t = a^(n*(n+1)/2) * b^(n*(n-1)/2) + a^(n*(n-1)/2) * b^(n*(n+1)/2); s += t; if(t < eps, break); n++);
  s;
}
pieces(p) = {
  my(q = exp(-Pi / sqrt(p)), eps = 10.^(-420), den);
  den = thf(q^p, q^p, eps);
  vector((p-1)/2, k, 2 * q^(k^2/p) * thf(q^(p+2*k), q^(p-2*k), eps) / den);
}
dig(x) = if(x == 0, 99999, floor(-log(abs(x)) / log(10)));
kcls(k, p) = my(r = k % p); min(r, p - r);   \\ class of k in (Z/p)/{+-1}
evalrow(v, p, P, a) = {
  my(N, nc, ni, s = 0, idx = 1);
  if(p % 4 == 3, N = p; nc = (p-1)/2; ni = 3, N = 4*p; nc = eulerphi(4*p)/2; ni = (#v - 1) / nc);
  for(i = 0, ni - 1, for(j = 0, nc - 1, idx++; s += v[idx] * P^i * cos(2 * Pi * a * j / N)));
  -s / v[1];
}
{
for(t = 1, 8, my(p = [11,13,17,19,23,29,31,37][t], T = TAB[p], u, b, P, N, perms = [], okH = 1, okHinv = 1, nT = 0, worst = 99999);
  u = pieces(p); b = vector(#u, k, u[k]^p); P = prod(k = 1, #u, u[k]);
  N = if(p % 4 == 3, p, 4*p);
  \\ sanity: table reproduces b
  for(k = 1, #b, worst = min(worst, dig(evalrow(T[k], p, P, 1) - b[k])));
  for(a = 1, N \ 2, if(gcd(a, N) != 1, next);
    if(p % 4 == 1 && kronecker(a, p) != 1, next);
    my(chi = if(p % 4 == 3, kronecker(a, p), (-1)^((a-1)/2)), x, pi = vector(#b), best);
    x = lift(sqrt(Mod(chi * a, p)));
    for(k = 1, #b, my(s = evalrow(T[k], p, P, a), hit = 0);
      for(kk = 1, #b, if(dig(s - b[kk]) > 300, hit = kk));
      pi[k] = hit);
    nT++;
    for(k = 1, #b, if(pi[k] != kcls(x * k, p), okH = 0); if(pi[k] != kcls(lift(Mod(x, p)^-1) * k, p), okHinv = 0));
    perms = concat(perms, [[a, x, pi]]));
  print("p=", p, " N=", N, " table check ", worst, " digits | automorphisms tested: ", nT,
        " | H3 (k->xk) holds for all: ", okH, " | variant k->x^-1 k holds for all: ", okHinv);
  for(i = 1, min(#perms, 6), print("    a=", perms[i][1], " x=", perms[i][2], " perm k->", perms[i][3]));
);
}
\\ negative control: a non-QR a at p = 13 (moves sqrt 13, so P cannot stay fixed): sigma_a(b_1) should match no b_k'
{
my(p = 13, u = pieces(13), b, P, s, hits = 0);
b = vector(#u, k, u[k]^p); P = prod(k = 1, #u, u[k]);
forstep(a = 1, 25, 2, if(a % 13 == 0 || kronecker(a, 13) == 1, next);
  s = evalrow(TAB[13][1], 13, P, a);
  for(kk = 1, #b, if(dig(s - b[kk]) > 300, hits++)));
print("NC p=13, non-QR a: sigma_a(b_1) coincides with some b_k in ", hits, " cases (expect 0)");
}
quit
