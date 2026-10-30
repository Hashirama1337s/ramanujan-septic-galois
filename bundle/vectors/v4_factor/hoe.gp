\\ hoe.gp -- POST HOC, cheap exact upper bound for e(P|2) in F_p (Lemma R, steps 1-3, done by machine):
\\ F_p ⊂ M = H_O(zeta_p), zeta_p unramified at 2, H_O = J(sqrt -p) = K(j(sqrt -p)). So every e(P|2) in F_p divides an e(Q|2) in H_O.
\\ With T1 (every root of G has valuation p c/12, so e | e_P by integrality) this gives e_P = e exactly.
\\ H_O has degree 2h only. nfinit([T,[2]]) maximal at 2; no bnfinit.
default(parisizemax, 8*10^9);
{
  print("POST HOC: ramification of 2 in H_O = J(sqrt -p) (degree 2h)");
  foreach([17, 11, 29, 37, 43, 41, 53], p,
    my(J = polredbest(polclass(-4*p)), L, T, nf, dec, e = if(p % 8 == 3, 3, 2));
    L = polcompositum(J, x^2 + p); L = select(t -> poldegree(t) == 2*poldegree(J), L);
    T = polredbest(L[1]); nf = nfinit([T, [2]]); dec = idealprimedec(nf, 2);
    print("  p = ", p, " (h = ", poldegree(J), "): primes of H_O above 2: [e, f] = ", vector(#dec, i, [dec[i].e, dec[i].f]),
          "; max e = ", vecmax(vector(#dec, i, dec[i].e)), " (Lemma R bound ", e, ": ", vecmax(vector(#dec, i, dec[i].e)) <= e, ")"));
}
quit
