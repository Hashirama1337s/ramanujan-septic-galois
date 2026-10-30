\ probe: degree of P_p (algdep up to 24) and class numbers, p = 41..97
read("sweep.gp");
forprime(p = 41, 97, {
  my(W = 1500, u, P, d = 0, pol, t0 = getabstime(), N, nb);
  u = pieces(p, W); P = prod(k = 1, #u, u[k]);
  for(dd = 1, 24, pol = algdep(P, dd); if(abs(subst(pol, x, P)) < 10.^(-W + 100) && poldegree(pol) == dd, d = dd; break));
  if(p % 4 == 3, nb = d * (p-1)/2, nb = (d/2) * eulerphi(4*p)/2);
  print("p=", p, " mod4=", p % 4, " h(-4p)=", qfbclassno(-4*p), " h(-p)=", if(p%4==3, qfbclassno(-p), "-"),
        " degP=", d, " basis=", nb, " maxcoef(P poly)~1e", if(d, floor(log(vecmax(abs(Vec(pol))))/log(10)), "?"), " (", (getabstime()-t0)\1000, "s)");
});
quit
