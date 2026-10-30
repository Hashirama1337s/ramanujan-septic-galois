\\ b_rootcheck.gp -- exact (integer) check of Lemma 3: for EVERY x = t + s sqrt(-p) in (O/4pO)^*, every k,
\\ the 4th root of unity Omega in  b_k o gam = Omega * b_{k'}  (gam = SL2(Z) lift of diag(1,1/d) g(x)) is 1.
\\ Uses only Koo-Shin-Yoon Prop 2.4 (ii),(iii):  g_r o gam = eps(gam) g_{r gam};  g_{r+s} = (-1)^{s1 s2+s1+s2} e^{-pi i (s1 r2 - s2 r1)} g_r.
\\ b_k = 2^p (-i)^k (g_{a_k}/g_{a_0})^p,  a_k = ((p+2k)/2p, 1/2), a_0 = (1/2,1/2).
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
\\ exponent of e^{pi i/2} = i in eps(r, s)^p, r = (r1, r2) rational, s integral; returns E mod 4 (as rational*... must be integer)
epsexp(r, s, p) = { my(e); e = 2*(s[1]*s[2] + s[1] + s[2]) - p*(s[1]*r[2] - s[2]*r[1])*2; e; }  \\ i^e  (e^{-pi i z} = i^{-2z})
check(p, ctl=0) = {
  my(N = 4*p, bad = 0, tot = 0, G, ak, a0, v, w, kp, s1, s0, E, d, g);
  for(t = 0, N - 1, for(s = 0, N - 1,
    d = t^2 + p*s^2; if(gcd(d, N) != 1, next);
    g = [Mod(t, N), Mod(-p*s, N); Mod(s, N), Mod(t, N)];
    G = liftsl2([1, 0; 0, 1/Mod(d, N)]*g, N);
    for(k = 1, (p - 1)/2,
      ak = [(p + 2*k)/(2*p), 1/2]; a0 = [1/2, 1/2];
      v = ak*G; w = a0*G;
      kp = lift(Mod(k*t, p));               \\ k' in [0, p)
      my(akp = [(p + 2*kp)/(2*p), 1/2]);
      s1 = v - akp; s0 = w - a0;
      if(denominator(s1) != 1 || denominator(s0) != 1, bad++; next);
      \\ Omega = (-i)^{k - k'} * eps(akp, s1)^p / eps(a0, s0)^p
      E = -(1-ctl)*(k - kp) + epsexp(akp, s1, p) - epsexp(a0, s0, p);
      if(denominator(E) != 1, error("nonint"));
      tot++; if(E % 4 != 0, bad++))));
  [tot, bad];
}
{
foreach(primes([5, 61]), p, my(r = check(p)); print("p=", p, ": ", r[1], " (x,k) pairs, Omega != 1 in ", r[2]));
}
{ foreach([11,13], p, my(r = check(p, 1)); print("NEGATIVE CONTROL (drop the (-i)^k normalisation) p=", p, ": Omega != 1 in ", r[2], " of ", r[1])); }
quit;
