\\ Negative control p = 11 (h(-44) = 3): analytic minimal polynomial must be integral; its field must be non-abelian.
default(realprecision, 1500);
read("cert.gp");
{
  my(p = 11, V, Lab, res, G, aut, P, h);
  print("p = 11, reduced forms ", redforms(-44));
  for(conv = 1, 3, [V, Lab] = conjs(p, conv); res = intpol(V);
    print("  convention ", conv, ": degree ", #V, ", rounding error 10^-", res[2], ", max coefficient digits ", res[3]);
    if(conv == 1, G = res[1]; print("  min separation 10^", Strprintf("%.1f", log(minsep(V))/log(10)), ", irreducible=", polisirreducible(G))));
  print("  G = ", G);
  P = polredbest(G);
  print("  polredbest: ", P);
  aut = nfgaloisconj(P);
  print("  number of automorphisms of Q(b_1): ", #aut, " (degree ", poldegree(P), ") -> ", if(#aut < poldegree(P), "NOT Galois over Q, hence not abelian", "Galois"));
  print("  field discriminant factorisation: ", factor(nfdisc(P)));
  \\ the real cubic subfield J = Q(j(sqrt -11)) must appear and be non-Galois (h = 3, j(sqrt -11) has non-real conjugates)
  h = polclass(-44);
  print("  polclass(-44) = ", h, "; polgalois: ", polgalois(h), "; Q(j) subfield of Q(b_1): ", #nfisincl(h, P) > 0);
}
quit
