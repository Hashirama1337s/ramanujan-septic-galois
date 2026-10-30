\\ (1) Sealed retry for idoneal failures: 2W and u^{4n} (conductor 4n).  (2) POST HOC exploration at n = 15 and n = 35:
\\ powers u^{n e}, e in {1,2,4,8,24}, against Q(cos 2pi/M), M in {4n, 8n, 12n, 24n}.
read("lib.gp");
\\ (idoneal.gp ends with quit only after its own runs; we redefine the test loop instead)
tryfield(n, e, M, W) = {
  my(nb = eulerphi(M)/2, Whi = W + 400, q, eps, u1, B, b, v, res);
  default(realprecision, Whi);
  q = exp(-Pi / sqrt(n)); eps = 10.^(-Whi - 20);
  u1 = 2 * q^(1/n) * thf(q^(n+2), q^(n-2), eps) / thf(q^n, q^n, eps);
  B = vector(nb, j, cos(2*Pi*(j-1)/M)); b = u1^(n*e);
  default(realprecision, W);
  v = lindep(concat([precision(b, W)], apply(x -> precision(x, W), B)));
  default(realprecision, Whi);
  if(v[1] == 0, return([0, 0]));
  res = dig(v[1]*b + sum(j = 1, nb, v[j+1]*B[j]));
  [res >= 0.9 * W, res];
}
print("== sealed retry (2W, u^{4n}, conductor 4n)");
foreach([15, 21, 33, 45, 57], n, my(nb = eulerphi(4*n)/2, W = 2*max(3000, 60*nb), r); r = tryfield(n, 4, 4*n, W); print("retry n=", n, " W=", W, ": ", if(r[1], Str("ABELIAN (holds ", r[2], ")"), Str("NOT ABELIAN (best ", r[2], ")"))));
print("== POST HOC exploration (labelled; not a verdict)");
foreach([15, 35], n, foreach([8*n, 12*n, 24*n], M, foreach([1, 2, 4, 8, 24], e,
  my(r = tryfield(n, e, M, max(3000, 80*eulerphi(M)/2))); if(r[1], print("POSTHOC n=", n, " M=", M, " u^", n*e, ": ABELIAN (holds ", r[2], ")"))))); print("POSTHOC done n=", n));
quit
