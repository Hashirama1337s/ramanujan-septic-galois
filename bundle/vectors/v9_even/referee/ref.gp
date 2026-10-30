default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
B2(x) = x^2 - x + 1/6;
fr(x) = x - floor(x);
/* referee's own exact order: cusp a/c, A = gcd(k, c); ord_q(F o g) = A^2/(2k) (B2(<u a k/A>) - B2(<v a k/A>)) */
ordR(g, k, u, v) = my(a = g[1,1], c = g[2,1], A = gcd(k, c)); A^2/(2*k) * (B2(fr(u*a*k/A)) - B2(fr(v*a*k/A)));
/* referee's own lift: brute search over small integer matrices */
liftR(M, N) = {
  for(R = 1, 4*N, for(c = -R, R, if(c == 0 || (c - M[2,1]) % N != 0, next);
    for(d = -R, R, if((d - M[2,2]) % N != 0 || gcd(c, d) != 1, next);
      for(a = -R, R, if((a - M[1,1]) % N != 0, next);
        if((a*d - 1) % c != 0, next);
        my(b = (a*d - 1)/c); if((b - M[1,2]) % N == 0, return([a, b; c, d]))))));
  error("no lift");
}
/* numeric Siegel g_(x,0)(tau) by (1.3) */
gS(x, tau) = { my(q = exp(2*Pi*I*tau), qz = exp(2*Pi*I*x*tau), p = -exp(Pi*I*tau*B2(x)) * (1 - qz), qn = 1, t); for(n = 1, 10^6, qn *= q; t = (1 - qn*qz) * (1 - qn/qz); p *= t; if(abs(qn) < 10^(-default(realprecision)+5), break)); p; }
Fv(k, u, v, z) = gS(u, k*z) / gS(v, k*z);
mob(M, z) = (M[1,1]*z + M[1,2]) / (M[2,1]*z + M[2,2]);
{
default(realprecision, 38);
foreach([["GG", 4, 1/8, 3/8, 8], ["CF", 3, 1/6, 1/2, 6]], fam,
  my(nm = fam[1], k = fam[2], u = fam[3], v = fam[4], N = fam[5], L = List(), stab = List(), z0 = 0.137 + 0.91*I, f0, sumo = 0, pol = 0, zer = 0, maxdev = 0, cnt = 0);
  f0 = Fv(k, u, v, z0);
  for(a=0,N-1, for(b=0,N-1, for(c=0,N-1, for(d=0,N-1, if((a*d-b*c-1) % N == 0, listput(L, [a,b;c,d]))))));
  for(i = 1, #L, my(g = liftR(L[i], N), o = ordR(g, k, u, v), y1 = 3, y2 = 6, l1, l2, est);
    sumo += o; pol += max(0, -o); zer += max(0, o);
    /* numeric order: slope of log|F(g(iy))| */
    l1 = log(abs(Fv(k, u, v, mob(g, I*y1)))); l2 = log(abs(Fv(k, u, v, mob(g, I*y2))));
    est = -(l2 - l1) / (2*Pi*(y2 - y1)); maxdev = max(maxdev, abs(est - o)); cnt++;
    /* numeric stabiliser: F o g = F at z0 */
    if(abs(Fv(k, u, v, mob(g, z0)) - f0) < 1e-25, listput(stab, L[i])));
  print(nm, ": |SL2(Z/", N, ")| = ", #L, "; numeric stabiliser size ", #stab, " = ", Vec(stab));
  print(nm, ": sum over ALL elements / |stab|: sum ord = ", sumo/#stab, ", poles = ", pol/#stab, ", zeros = ", zer/#stab);
  print(nm, ": numeric-vs-exact order, max deviation over ", cnt, " lifts = ", maxdev));
}
