\\ congcheck.gp -- confirmation only (not part of the proof) for RESULT-V3B §"1 (v3)".
\\ For every x = t + s sqrt(-p) mod N'' = 48 p^2 with d = t^2 + p s^2 prime to N'' and t = 1 (mod p)  [p = 5, 7: exhaustive; p = 11, 13: random sample],
\\ and for BOTH decompositions g(x) = diag(1,d) beta  /  g(x) = beta diag(1,d), build the explicit SL2(Z) lift of beta (algorithm of §1 v3),
\\ check det = 1 and the congruences, check S_1^(j), S_2^(j) are integers, and check 2*Phi(nu) is an integer for the lattice basis
\\ nu = p e_1, k^2 e_1 - e_k (k = 2..m) (each with the a_0 exponent -sum n). Null: nu = e_1 (sum n_j j^2 = 1) must give 2*Phi not in Z for some x.

liftSL2(A0, B0, C0, D0, N) = {
  my(D = lift(Mod(D0, N)), C, k = 0, g, u, v, a0, b0, j, A, B);
  if(D == 0, D = N);
  C = lift(Mod(C0, N)); while(gcd(C + k * N, D) != 1, k++); C = C + k * N;
  g = gcdext(D, C); u = g[1]; v = g[2];           \\ u D + v C = 1
  a0 = u; b0 = -v;                                 \\ a0 D - b0 C = 1
  j = lift(Mod(v * (A0 - a0) + u * (B0 - b0), N));
  A = a0 + j * C; B = b0 + j * D;
  if(A * D - B * C != 1, error("det"));
  if(Mod(A - A0, N) != 0 || Mod(B - B0, N) != 0 || Mod(C - C0, N) != 0 || Mod(D - D0, N) != 0, error("congruence"));
  [A, B, C, D];
}

\\ 2*Phi for exponent vector nu = [nu_0, nu_1, ..., nu_m] (nu_0 = exponent of g_{a_0}); returns [all S integral?, 2*Phi]
twophi(p, L, nu) = {
  my([A, B, C, D] = L, m = (p-1)/2, Bp = B / p, ok = 1, Phi = 0);
  for(j = 0, m,
    my(S1 = ((p + 2*j) * (A - 1) + p * C) / (2*p), S2 = ((p + 2*j) * Bp + D - 1) / 2);
    if(type(S1) != "t_INT" || type(S2) != "t_INT", ok = 0);
    Phi += nu[j + 1] * (-S1 / 2 + S2 / 2 + j * S2 / p));
  [ok, 2 * Phi];
}

check1(p, N, t, s, basis, nullv) = {
  my(d = t^2 + p * s^2, di, c = [0, 0, 0, 0]);
  if(gcd(d, N) != 1, return(c));
  di = lift(Mod(d, N)^-1);
  foreach([[t, -p*s, s*di, t*di], [t, -p*s*di, s, t*di]], M,
    my(L = liftSL2(M[1], M[2], M[3], M[4], N));
    if(L[1] % p != 1 || L[4] % p != 1 || L[2] % p != 0, error("A, D = 1, p | B failed"));
    c[1]++;
    foreach(basis, nu, my(r = twophi(p, L, nu)); if(!r[1], c[2]++); if(type(r[2]) != "t_INT", c[3]++));
    if(type(twophi(p, L, nullv)[2]) != "t_INT", c[4]++));
  c;
}
run(p, nsample) = {
  my(N = 48 * p^2, m = (p-1)/2, basis = List(), tot = [0, 0, 0, 0], t0 = getabstime(), nullv);
  listput(basis, concat([-p, p], vector(m - 1)));
  for(k = 2, m, my(v = vector(m + 1)); v[2] = k^2; v[k + 1] = -1; v[1] = -(k^2 - 1); listput(basis, v));
  nullv = concat([-1, 1], vector(m - 1));
  if(nsample == 0,
    forstep(t = 1, N - 1, p, for(s = 0, N - 1, tot += check1(p, N, t, s, basis, nullv))),
    for(i = 1, nsample, tot += check1(p, N, 1 + p * random(N / p), random(N), basis, nullv)));
  print("p = ", p, ": ", if(nsample, Str(nsample, " random x"), "all x with t = 1 mod p"), "; lifts checked ", tot[1],
        "; non-integral S ", tot[2], "; basis vectors with 2Phi not in Z ", tot[3], "; null (e_1) with 2Phi not in Z: ", tot[4],
        "  (", (getabstime() - t0) \ 1000, " s)");
}
run(5, 0);
run(7, 0);
run(11, 20000);
run(13, 20000);
quit
