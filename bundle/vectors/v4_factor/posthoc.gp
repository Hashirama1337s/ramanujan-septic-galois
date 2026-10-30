\\ posthoc.gp -- POST HOC (after the sealed BAR-F1 run): the decomposition of 2 in F_p from a small model, at the test primes where
\\ the sealed T3 instrument could not finish (stack). Model: F_p = J . Q(zeta_N)^+ (N = p for p = 3 mod 4, N = 4p for p = 1 mod 4):
\\ both lie in F_p (J = H_O ∩ R, Q(zeta_N)^+ = Q(zeta_N) ∩ R, zeta_N ∈ M = H_O(zeta_p) since i ∈ H_O for p = 1 mod 4), so if a factor
\\ of their compositum has degree n = [F_p:Q] it IS F_p. Combined with T1 (every root of G has 2-adic valuation p c/12, v(2) = 1),
\\ v_P(b_1) = (p c/12) e_P for every P | 2 of F_p. Unconditional: nfinit([T,[2]]) maximal at 2, idealprimedec. No bnfinit.
default(parisizemax, 8*10^9);
read("vectors/v4_factor/f1.gp");
cospol(N) = subst(minpoly(Mod('x + 'x^-1, polcyclo(N))), 'x, 'x);
model(p) = {
  my(t0 = getabstime(), h = qfbclassno(-4*p), n = h*(p-1)/2, N = if(p % 4 == 3, p, 4*p), J, C, L, T, nf, dec, e = epred(p));
  J = polredbest(polclass(-4*p)); C = cospol(N);
  L = polcompositum(J, C); L = select(t -> poldegree(t) == n, L);
  if(#L == 0, print("  p = ", p, ": no compositum factor of degree ", n, " -> model not available"); return(0));
  T = polredbest(L[1]);
  print("  p = ", p, ": J = ", J, "  (deg ", poldegree(J), "); Q(zeta_", N, ")^+ deg ", poldegree(C), "; compositum factors of degree n = ", n, ": ", #L,
        "; model max coeff digits ", vecmax(apply(z -> if(z == 0, 0, #digits(abs(z))), Vec(T))));
  nf = nfinit([T, [2]]); dec = idealprimedec(nf, 2);
  print("    primes P | 2 in F_p: ", #dec, "; [e, f] = ", vector(#dec, i, [dec[i].e, dec[i].f]), "; all e_P = ", e, ": ",
        vector(#dec, i, dec[i].e) == vector(#dec, i, e), "; sum e f = ", sum(i = 1, #dec, dec[i].e * dec[i].f), " (= n: ", sum(i = 1, #dec, dec[i].e * dec[i].f) == n, ")");
  print("    hence (with T1) v_P(b_1) = ", vector(#dec, i, p * cval(p) * dec[i].e / 12), "; sum f_P v_P = ",
        sum(i = 1, #dec, dec[i].f * p * cval(p) * dec[i].e / 12), " vs v_2(N b_1) = p h (p-1)/", if(e == 2, 4, 6), " = ", p * n / e, "  [", (getabstime() - t0) \ 1000, " s]");
}
print("POST HOC model check (not part of the sealed test)");
print("== positive controls at training primes (direct factorisation known): 17 ([2,4],[2,4],[2,8]), 11 ([3,5]), 29");
foreach([17, 11, 29], p, model(p));
print("== test primes where sealed T3 did not finish");
foreach([43, 41, 53], p, my(r = iferr(alarm(1800, model(p)), E, E)); if(type(r) == "t_ERROR", print("  p = ", p, ": NOT RUN (", errname(r), ")")));
quit
