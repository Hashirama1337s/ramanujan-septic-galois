\\ c5_checks.gp -- checks for C5-proof-v2.md (composite odd n).
read("proof/cert/cert.gp");   \\ thsum, dig
Bn(k, n, tau) = (2 * thsum(k / n, tau) / thsum(0, tau))^n;
fk(k, n) = { my(t = lift(Mod(k, n))); min(t, n - t); }

\\ (A) Class II* exhaustive: M = I + n M', all n odd, theta condition M11+M21, M12+M22 even, det relation
\\     M11 + M22 + n (M11 M22 - M12 M21) = 0. E = 2 Delta + n k (M12 - M11) + 2 k s2 (exact), must be 0 mod 4.
\\     Everything mod 4 depends only on n, k, M' mod 4, so we run over n in {1,3}, k, M'_ij in Z/4 (det relation imposed mod 4).
{
  my(cnt = 0, bad = 0);
  forstep(n = 1, 3, 2, for(k = 0, 3, for(a = 0, 3, for(b = 0, 3, for(c = 0, 3, for(d = 0, 3,
    if((a + c) % 2 || (b + d) % 2, next);
    if((a + d + n * (a*d - b*c)) % 4, next);
    my(c1 = n * (a + c) / 2, c2 = n * (b + d) / 2, s1 = c1 + k*a, s2 = c2 + k*b,
       Dl = (s1 + 1)*(s2 + 1) - (c1 + 1)*(c2 + 1), E = 2*Dl + n*k*(b - a) + 2*k*s2);
    cnt++; if(E % 4, bad++; print("  FAIL n=", n, " k=", k, " M'=", [a, b; c, d], " E=", E))))))));
  print("(A) class II* (M = I mod n, theta condition): ", cnt, " residue cases, ", bad, " failures");
}

\\ (B) Class I* exhaustive (M = I mod 4, n | B so B = 4 n beta): A = 1+4al, C = 4ka, D = 1+4de; k' = k A mod n.
\\     E from the six terms of v4 Lemma 3 with general k, k'. s1 = ((n+2k)A + nC - n - 2k')/(2n) must be an integer.
\\     Mod 4 depends on al, ka, be, de mod 2 and on (k - k') and s1 mod 4; we run over small integer ranges exactly.
{
  my(cnt = 0, bad = 0);
  foreach([3, 5, 7, 9, 15, 21, 25], n, for(k = 1, (n-1)/2, for(al = 0, 3, for(ka = 0, 3, for(be = 0, 3, for(de = 0, 3,
    my(A = 1 + 4*al, B = 4*n*be, C = 4*ka, D, kp, s1n, s1, s2, c1, c2, E);
    \\ D is forced by det = 1 only up to the choice of lift; use D = (1 + B C)/A when integral, else skip (other lifts covered by other al)
    if((1 + B*C) % A, next); D = (1 + B*C) / A; if((D - 1) % 4, next);
    kp = lift(Mod(k * A, n));
    s1n = (n + 2*k)*A + n*C - n - 2*kp; if(s1n % (2*n), next); s1 = s1n / (2*n);
    s2 = ((n + 2*k)*B + n*D - n) / (2*n); c1 = (A + C - 1)/2; c2 = (B + D - 1)/2;
    E = -(k - kp) + 2*(s1*s2 + s1 + s2) - n*s1 + (n + 2*kp)*s2 - 2*(c1*c2 + c1 + c2) + n*(c1 - c2);
    cnt++; if(E % 4, bad++; print("  FAIL n=", n, " k=", k, " M=", [A, B; C, D], " E=", E))))))));
  print("(B) class I* (M = I mod 4, n | B): ", cnt, " integer matrices, ", bad, " failures");
}

\\ (C) Analytic test of Lemma 3*: B_k(M tau) = B_{k A}(tau) for random M in SL2(Z) with n | B and (1,1)M = (1,1) mod 2.
\\     Negative controls: M = [1, n; 0, 1] (n | B, theta condition violated) and M = [1, 1; 0, 1].
randM(n) = {
  while(1, my(A = random(41) - 20, C = random(41) - 20, g, u, B, D);
    if(gcd(A, n*C) != 1 || A == 0, next);
    u = gcdext(A, n*C);                     \\ u[1]*A + u[2]*(n C) = 1  ->  D = u[1], B = -n u[2]
    D = u[1]; B = -n * u[2];
    if(A*D - B*C != 1, error("det"));
    if((A + C) % 2 == 1 && (B + D) % 2 == 1, return([A, B; C, D])));
}
mob(M, z) = (M[1,1]*z + M[1,2]) / (M[2,1]*z + M[2,2]);
{
  default(realprecision, 60);
  my(tau = 0.137 + 1.21*I, worst = 99999, cnt = 0, negT, negN);
  foreach([9, 15, 21, 25, 27, 33, 45, 49], n,
    for(r = 1, 6, my(M = randM(n));
      for(k = 1, (n-1)/2, my(lhs = Bn(k, n, mob(M, tau)), rhs = Bn(fk(k * M[1,1], n), n, tau));
        worst = min(worst, dig(lhs / rhs - 1)); cnt++)));
  print("(C) Lemma 3* analytic: ", cnt, " (n, M, k) cases, worst agreement 10^-", worst);
  negN = dig(Bn(1, 15, mob([1, 15; 0, 1], tau)) / Bn(1, 15, tau) - 1);
  negT = dig(Bn(1, 15, tau + 1) / Bn(1, 15, tau) - 1);
  print("    negative controls at n = 15, k = 1: M = [1,15;0,1] agreement 10^-", negN, ", M = T agreement 10^-", negT, " (both should be ~10^0)");
}

\\ (D) Lemma P: for mu = d1 - d3 sqrt(-n) primitive, N(mu) prime to 4n, Prop 4.1 at Q = Q0^gamma gives
\\     sigma(b_k) = B_k(T^y gamma* tau_O) and Lemma P says this equals b_{k/d1}. Test numerically.
{
  default(realprecision, 60);
  my(cnt = 0, worst = 99999);
  foreach([9, 15, 21, 25, 45], n, my(tO = I * sqrt(n));
    for(r = 1, 5, my(d1, d3, d2, d4, u, a, b, ap, y, Ms, val);
      until(gcd(d1, d3) == 1 && gcd(d1^2 + n*d3^2, 4*n) == 1, d1 = random(30) - 15; d3 = random(30) - 15);
      u = gcdext(d1, d3); d4 = u[1]; d2 = -u[2];               \\ d1 d4 - d2 d3 = 1
      a = d1^2 + n*d3^2; b = 2*(d1*d2 + n*d3*d4);              \\ Q0^gamma = (a, b, *), Q0 = x^2 + n y^2
      ap = lift(Mod(a, 4*n)^-1); y = -ap * b / 2;
      Ms = [d4 + y*d3, d2 + y*d1; d3, d1];
      if(Ms[1,2] % n, error("n does not divide B"));
      for(k = 1, (n-1)/2, val = Bn(k, n, mob(Ms, tO));
        worst = min(worst, dig(val / Bn(fk(k * lift(Mod(d1, n)^-1), n), n, tO) - 1)); cnt++)));
  print("(D) Lemma P (Prop 4.1 at principal classes): ", cnt, " cases, worst agreement 10^-", worst);
}

\\ (E) eps on the ambiguous class (q^e, 0, n/q^e): a = ((q^e + 2 sqrt -n)/q^e) * [q^e, sqrt -n], N a = q^e + 4n/q^e,
\\     a^2 = (lambda), lambda = q^e - 4n/q^e + 4 sqrt -n; eps_r = t(lambda)/N a mod r^{e_r}.
{
  foreach([15, 21, 33, 45, 57, 85, 93, 105, 9, 25], n, my(f = factor(n), out = []);
    for(i = 1, #f~, my(Q = f[i,1]^f[i,2], Na = Q + 4*n/Q, t = Q - 4*n/Q, ev);
      if(t^2 + 16*n != Na^2, error("norm"));
      if(gcd(Na, 2*n) != 1, error("not prime to 2n"));
      ev = vector(#f~, j, my(R = f[j,1]^f[j,2], z = lift(Mod(t, R) / Na)); if(z == 1, 1, if(z == R - 1, -1, 99)));
      out = concat(out, [[Q, Na, ev]]));
    print("(E) n=", n, ": [q^e, N a, eps vector over primes of n] = ", out));
  \\ referee's hand check at n = 15: P = (17, sqrt-15 - 6), P^2 = (7 - 4 sqrt-15)
  print("    referee check n=15: 6^2 + 15 = ", 36 + 15, " = 3*17; N(7 - 4 sqrt-15) = ", 49 + 16*15, " = 17^2; 7/17 mod 3 = ",
        lift(Mod(7, 3)/17), ", mod 5 = ", lift(Mod(7, 5)/17), "  -> (", if(lift(Mod(7,3)/17) == 2, -1, 1), ", ", if(lift(Mod(7,5)/17) == 1, 1, -1), ")");
}
quit
