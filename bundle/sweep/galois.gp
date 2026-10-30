NS3 = 10;
\\ Galois-transport method: one LLL search for b_1, then every b_k is matched as a Galois image of b_1's expression.
\\ Usage inside gp (after read("sweep.gp")): grun(p, dP, W)   -> writes galois_p<p>.txt
\\ The image of P^i cos(2 pi j/N) under (cos 2pi/N -> cos 2pi a/N, P -> P') is P'^i cos(2 pi a j/N).

grun(p, dP, W) = {
  my(fn = Str("galois_p", p, ".txt"), Whi = W + 400, uh, Ph, Bh, u, v, N, nc, ni, roots, matched, t0 = getabstime(),
     exprs, lhs, phi1, rhs, best, bk, cand, found, used, pol);
  t0 = getabstime();
  if(p % 4 == 3, N = p; nc = (p-1)/2; ni = dP, N = 4*p; nc = eulerphi(4*p)/2; ni = dP/2);
  uh = pieces(p, Whi); Ph = prod(k = 1, #uh, uh[k]); Bh = basis(p, Ph, dP, 0);
  default(realprecision, W);
  v = lindep(concat([precision(uh[1]^p, W)], apply(x -> precision(x, W), Bh)));
  default(realprecision, Whi);
  write(fn, "p=", p, " dP=", dP, " basis=", #Bh, " W=", W, " Whi=", Whi);
  if(v[1] == 0, write(fn, "b_1: no relation -> FAILED"); return(0));
  bk = -sum(i = 1, #Bh, v[i+1] * Bh[i]) / v[1];
  write(fn, "b_1 relation: d=", v[1], " max|n|=", vecmax(abs(v[2..#v])), " holds ", dig(uh[1]^p - bk), " digits (",
        (getabstime() - t0) \ 1000, "s)");
  pol = algdep(Ph, dP);
  roots = polroots(pol);
  matched = vector(#uh); exprs = vector(#uh);
  for(r = 1, #roots, for(a = 1, N - 1, if(gcd(a, N) != 1, next);
    cand = -sum(i = 0, ni - 1, sum(j = 0, nc - 1, v[2 + i*nc + j] * roots[r]^i * cos(2*Pi*a*j/N))) / v[1];
    for(k = 1, #uh, if(!matched[k] && dig(uh[k]^p - cand) >= 0.9 * W,
      matched[k] = 1; exprs[k] = [r, a]; write(fn, "b_", k, " = image of b_1 under (P -> root ", r, ", a = ", a, ")  holds ",
        dig(uh[k]^p - cand), " digits")))));
  write(fn, "S1 via transport: ", sum(k = 1, #uh, matched[k]), " of ", #uh, " pieces matched -> ",
        if(sum(k = 1, #uh, matched[k]) == #uh, "HOLDS", "FAILED"));
  if(sum(k = 1, #uh, matched[k]) < #uh, return(0));
  lhs = thf(exp(-p*Pi*sqrt(p)), exp(-p*Pi*sqrt(p)), 10.^(-Whi-20));
  phi1 = thf(exp(-Pi*sqrt(p)), exp(-Pi*sqrt(p)), 10.^(-Whi-20));
  rhs = p^(-3/4) * phi1 * (1 + sum(k = 1, #uh, real(-sum(i = 0, ni - 1, sum(j = 0, nc - 1,
          v[2 + i*nc + j] * roots[exprs[k][1]]^i * cos(2*Pi*exprs[k][2]*j/N))) / v[1])^(1/p)));
  write(fn, "S2 identity rebuilt from b_1's relation + Galois images: ", dig(lhs - rhs), " digits at ", Whi);
  best = 0;
  for(t = 1, NS3, my(w = v, i = random(#v - 1) + 2, r2);
    w[i] += if(random(2), 1, -1);
    r2 = p^(-3/4) * phi1 * (1 + sum(k = 1, #uh, real(-sum(ii = 0, ni - 1, sum(j = 0, nc - 1,
          w[2 + ii*nc + j] * roots[exprs[k][1]]^ii * cos(2*Pi*exprs[k][2]*j/N))) / w[1])^(1/p)));
    best = max(best, dig(lhs - r2)));
  write(fn, "S3 random single-integer changes (NS3 of them) to b_1's relation: best agreement ", best, " digits");
  default(realprecision, W);
  my(neg = lindep(concat([precision(uh[1]^p, W)], apply(x -> precision(x, W), basis(p, Ph, dP, 1)))));
  write(fn, "NC wrong conductor: ", if(neg[1] == 0, "no relation involving b_1",
        Str("relation with max|n|=", vecmax(abs(neg)), " holding ",
            dig(uh[1]^p + sum(i = 1, #neg - 1, neg[i+1] * basis(p, Ph, dP, 1)[i]) / neg[1]), " digits (genuine only if >= 0.9W)")));
  default(realprecision, Whi);
  write(fn, "TABLE1 ", v);
  write(fn, "MAP ", exprs);
  write(fn, "total time ", (getabstime() - t0) \ 1000, "s");
  1;
}
