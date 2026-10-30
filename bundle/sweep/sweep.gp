\\ BAR-SWEEP runner (PARI/GP). Usage inside gp:  run(p, dP, W)   with dP = degree of P_p (probe_P.txt), W = digits.
\\ Writes sweep_p<p>.txt in the current directory.

thf(a, b, eps) = {
  my(s = 1., n = 1, t);
  while(1, t = a^(n*(n+1)/2) * b^(n*(n-1)/2) + a^(n*(n-1)/2) * b^(n*(n+1)/2); s += t; if(t < eps, break); n++);
  s;
}
dig(x) = if(x == 0, 99999, floor(-log(abs(x)) / log(10)));

pieces(p, W) = {
  my(q, eps, den);
  default(realprecision, W);
  q = exp(-Pi / sqrt(p)); eps = 10.^(-W - 20); den = thf(q^p, q^p, eps);
  vector((p-1)/2, k, 2 * q^(k^2/p) * thf(q^(p+2*k), q^(p-2*k), eps) / den);
}

basis(p, P, dP, wrong) = {
  my(N, nc, ni, B = []);
  if(p % 4 == 3, N = p; nc = (p-1)/2; ni = dP, N = 4*p; nc = eulerphi(4*p)/2; ni = dP/2);
  if(wrong, N = if(p % 4 == 3, 4*p, p));
  for(i = 0, ni - 1, for(j = 0, nc - 1, B = concat(B, P^i * cos(2 * Pi * j / N))));
  B;
}

tabf(rs, Bh) = vector(#rs, k, -sum(i = 1, #Bh, rs[k][i+1] * Bh[i]) / rs[k][1]);
rhsf(rs, Bh, p, phi1) = my(bs = tabf(rs, Bh)); p^(-3/4) * phi1 * (1 + sum(k = 1, #rs, bs[k]^(1/p)));

run(p, dP, W) = {
  my(phi1, fn = Str("sweep_p", p, ".txt"), Whi = W + 400, u, uh, P, Ph, B, Bh, rels = [], v, b, ok = 1, t0, lhs, rhs, best, neg);
  t0 = getabstime();
  uh = pieces(p, Whi); Ph = prod(k = 1, #uh, uh[k]); Bh = basis(p, Ph, dP, 0);
  default(realprecision, W);
  u = apply(x -> precision(x, W), uh); P = precision(Ph, W); B = apply(x -> precision(x, W), Bh);
  write(fn, "p=", p, " dP=", dP, " basis size=", #B, " W=", W, " Whi=", Whi);
  for(k = 1, #u,
    v = lindep(concat([u[k]^p], B));
    if(v[1] == 0, write(fn, "S1 b_", k, ": relation has zero b-coefficient -> FAILED"); ok = 0; rels = concat(rels, [0]); next);
    default(realprecision, Whi);
    b = -sum(i = 1, #Bh, v[i+1] * Bh[i]) / v[1];
    write(fn, "S1 b_", k, ": d=", v[1], " max|n|=", vecmax(abs(v[2..#v])), " holds ", dig(uh[k]^p - b), " digits at ", Whi,
          " (", (getabstime() - t0) \ 1000, "s)");
    if(dig(uh[k]^p - b) < 0.9 * W, ok = 0);
    rels = concat(rels, [v]);
    default(realprecision, W));
  write(fn, "S1: ", if(ok, "HOLDS", "FAILED"));
  write(fn, "TABLE ", rels);
  if(!ok, return(0));
  default(realprecision, Whi);
  lhs = thf(exp(-p*Pi*sqrt(p)), exp(-p*Pi*sqrt(p)), 10.^(-Whi-20));
  phi1 = thf(exp(-Pi*sqrt(p)), exp(-Pi*sqrt(p)), 10.^(-Whi-20));
  rhs = rhsf(rels, Bh, p, phi1);
  write(fn, "S2 identity rebuilt from table: ", dig(lhs - rhs), " digits at ", Whi);
  best = 0;
  for(t = 1, 40, my(rs = rels, k = random(#rels) + 1, i = random(#Bh) + 2);
    rs[k][i] += if(random(2), 1, -1); best = max(best, dig(lhs - rhsf(rs, Bh, p, phi1))));
  write(fn, "S3 40 random single-integer changes: best agreement ", best, " digits");
  default(realprecision, W);
  neg = lindep(concat([u[1]^p], basis(p, P, dP, 1)));
  write(fn, "NC wrong conductor: relation ", if(neg[1] == 0, "none involving b_1", Str("d=", neg[1], " max|n|=", vecmax(abs(neg)))),
        if(neg[1] != 0, Str(" (check: holds ", dig(u[1]^p + sum(i = 1, #neg - 1, neg[i+1] * basis(p, P, dP, 1)[i]) / neg[1]), " digits)"), ""));
  write(fn, "total time ", (getabstime() - t0) \ 1000, "s");
  1;
}
