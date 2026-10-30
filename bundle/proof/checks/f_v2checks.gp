\\ f_v2checks.gp -- checks added for proof-C1-C3-v2.md (2026-10-27)
\\ (a) S g_c S^-1 = g(x) symbolically (CMS (3.2) Case 1 matrix at tau_c = -1/sqrt(-p))
\\ (b) printed residues of Lemma 3 (both CRT classes) for every x and k, 5 <= p <= 31, with ANY lift
\\ (c) h(-4p) = 3 h(-p) for p = 3 mod 8, 11 <= p < 10^4 (numerical, source not opened)
\\ (d) p = 3: b_1 = u_1^3
\\ (e) W_{K,2} at theta_K = (-1+sqrt(-p))/2, p = 3 mod 8: order 3

\\ (a)
S = [0, -1; 1, 0];
gc = [a, -b; p*b, a];
print("(a) S*gc*S^-1 = ", S*gc*S^-1, "   g(x) = [t,-p s; s,t] with t=a, s=b: ", S*gc*S^-1 == [a, -p*b; b, a]);

\\ (b)
liftsl2(M, N) = {
  my(a = lift(M[1,1]), b = lift(M[1,2]), c = lift(M[2,1]), d = lift(M[2,2]), cc, dd, k, uv, a1, b1, m, sol);
  cc = if(c == 0, N, c); k = 0;
  while(gcd(cc, d + k*N) != 1, k++); dd = d + k*N;
  uv = gcdext(dd, cc); a1 = uv[1]; b1 = -uv[2];
  sol = matsolve([cc, a1; dd, b1], [a - a1, b - b1]~); m = sol[1];
  a1 += m*cc; b1 += m*dd;
  my(G = [a1, b1; cc, dd]);
  if(matdet(G) != 1 || G*Mod(1, N) != M, error("lift check"));
  G;
}
\\ add a random multiple of 4p*(element of SL2-kernel) to test independence of the lift: G*(I + 4p*R) with det 1 is hard;
\\ instead use G and G*[1, 4p; 0, 1]*[1, 0; 4p, 1] (both lifts of the same class mod 4p).
chk(p) = {
  my(N = 4*p, bad1 = 0, bad2 = 0, n1 = 0, n2 = 0);
  for(t = 0, N - 1, for(s = 0, N - 1,
    my(d = t^2 + p*s^2, g, G0, cls);
    if(gcd(d, N) != 1, next);
    cls = if(t % 4 == 1 && s % 4 == 0, 1, if(t % p == 1 && s % p == 0, 2, 0));
    if(cls == 0, next);
    g = [Mod(t, N), Mod(-p*s, N); Mod(s, N), Mod(t, N)];
    G0 = liftsl2([1, 0; 0, 1/Mod(d, N)]*g, N);
    foreach([G0, G0*[1, N; 0, 1]*[1, 0; N, 1]], G,
      my(A = G[1,1], B = G[1,2], C = G[2,1], D = G[2,2]);
      for(k = 1, (p - 1)/2,
        my(kp = lift(Mod(k*t, p)), s1, s2, c1, c2, E);
        s1 = ((p + 2*k)*A + p*C - p - 2*kp)/(2*p); s2 = ((p + 2*k)*B + p*D - p)/(2*p);
        c1 = (A + C - 1)/2; c2 = (B + D - 1)/2;
        if(denominator([s1, s2, c1, c2]) != 1, error("nonintegral"));
        E = -(k - kp) + 2*(s1*s2 + s1 + s2) - p*s1 + (p + 2*kp)*s2 - 2*(c1*c2 + c1 + c2) + p*(c1 - c2);
        if(cls == 1,
          n1++;
          \\ class I: A=1+4al, B=4p be, C=4ka, D=1+4de ; c1=2(al+ka), c2=2(p be+de), s2=2((p+2k)be+de), p s1 = k-k'+2(p+2k)al+2p ka
          my(al = (A - 1)/4, be = B/(4*p), ka = C/4, de = (D - 1)/4);
          if(denominator([al, be, ka, de]) != 1 || c1 != 2*(al + ka) || c2 != 2*(p*be + de) || s2 != 2*((p + 2*k)*be + de)
             || p*s1 != k - kp + 2*(p + 2*k)*al + 2*p*ka || E % 4 != 0, bad1++),
          n2++;
          \\ class II: X = t-1+ps, Y = t-1-ps; 2c1=X, 2c2=Y, 2s1=X+2ks, 2s2=Y+2ks (mod 4); E = 2k(k-ps) or -2kps (mod 4)
          my(X = t - 1 + p*s, Y = t - 1 - p*s, Epred);
          Epred = if(s % 2 == 1, 2*k*(k - p*s), -2*k*p*s);
          if(kp != k || (2*c1 - X) % 4 || (2*c2 - Y) % 4 || (2*s1 - X - 2*k*s) % 4 || (2*s2 - Y - 2*k*s) % 4
             || (E - Epred) % 4 || E % 4, bad2++))))));
  [n1, bad1, n2, bad2];
}
{
foreach(primes([5, 31]), p, my(r = chk(p));
  print("(b) p=", p, ": class I (x=1 mod 4O) ", r[1], " cases, ", r[2], " failures; class II (x=1 mod pO) ", r[3], " cases, ", r[4], " failures"));
}

\\ (c)
{
my(bad = 0, n = 0);
forprime(p = 11, 10^4, if(p % 8 == 3, n++; if(qfbclassno(-4*p) != 3*qfbclassno(-p), bad++)));
print("(c) h(-4p) = 3h(-p) for p = 3 mod 8, 11 <= p < 10^4: ", n, " primes, ", bad, " exceptions;  p=3: h(-12)=", qfbclassno(-12), ", h(-3)=", qfbclassno(-3));
}

\\ (d)
default(realprecision, 200);
{
my(p = 3, q = exp(-Pi/sqrt(p)), u1);
u1 = 2*q^(1/p)*sum(n = -80, 80, q^(p*n^2 + 2*n))/sum(n = -80, 80, q^(p*n^2));
print("(d) p=3: b_1 = u_1^3 = ", u1^3 * 1.0, "   |b_1 - 2| = ", abs(u1^3 - 2) * 1.0);
}

\\ (e)
{
foreach([11, 19, 43, 59], p, my(C = (p + 1)/4, W = List());
  for(t = 0, 1, for(s = 0, 1, my(M = [t - s, -C*s; s, t]*Mod(1, 2)); if(matdet(M) != 0, listput(W, M))));
  my(al = [-1, -C; 1, 0]*Mod(1, 2));
  print("(e) p=", p, ": |W_{K,2}| = ", #W, ", order of [-1,-C;1,0] mod 2 = ", if(al^3 == matid(2), if(al == matid(2), 1, 3), "not 3")));
}
quit;
