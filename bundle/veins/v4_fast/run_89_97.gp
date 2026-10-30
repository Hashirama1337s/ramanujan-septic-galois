\\ AMENDMENT-SWEEP2-5: save G first; cheap complex-conjugation-closure control F4' (60 digits).
read("veins/v4_fast/fastmin.gp");
OUT = "veins/v4_fast/";

\\ F4': max over v of min over w of |conj(v) - w|  (0 when the multiset is closed under conjugation)
closure(V) = vecmax(vector(#V, i, vecmin(vector(#V, j, abs(conj(V[i]) - V[j])))));
f4p(p) = {
  my(cg, cw);
  default(realprecision, 60);
  cg = closure(conjs(p, 1)[1]); cw = closure(conjs(p, 2)[1]);
  print("  (F4') p=", p, " closure correct conv: 10^", if(cg == 0, -99, floor(log(cg)/log(10))), "   wrong conv: 10^", floor(log(cw)/log(10)),
        "  -> ", if(cg < 1e-40 && cw > 1e-5, "PASS", "FAIL"));
}

\\ full F1-F3 with G saved before any control
run(p, full4) = {
  my(t0 = getabstime(), W, V, res, G, h = qfbclassno(-4*p), e, c0, v2, odd, res2);
  W = needdig(p); default(realprecision, W);
  V = conjs(p, 1)[1]; res = intpol(V); G = res[1];
  write(Str(OUT, "minpoly_p", p, ".gp"), G);
  e = if(p % 8 == 7, 0, if(p % 8 == 3, p * h * (p-1) / 6, p * h * (p-1) / 4));
  c0 = polcoef(G, 0); v2 = valuation(c0, 2); odd = c0 / 2^v2;
  print("p=", p, " h=", h, " W=", W, " degree=", poldegree(G), " (want ", h*(p-1)/2, ")  saved; ", getabstime() - t0, " ms");
  print("  (F1) rounding error 10^-", res[2], "  max coefficient digits ", res[3], "  monic=", pollead(G) == 1);
  print("  (F3) constant term = ", if(odd < 0, "-", "+"), "2^", v2, " * ", abs(odd), "   predicted 2^", e, "  -> ", if(abs(odd) == 1 && v2 == e, "MATCH", "MISMATCH"));
  print("  (F2) irreducible=", polisirreducible(G));
  if(full4, res2 = intpol(conjs(p, 2)[1]); print("  (F4) wrong convention: rounding error 10^-", res2[2], " -> ", if(res2[2] < 10, "fails as it should", "UNEXPECTEDLY INTEGRAL")));
  f4p(p);
  print("  total ", getabstime() - t0, " ms");
}

print("== F4' validation (13, 73: full F4 already passed)");
f4p(13); f4p(73);
print("== p = 97 (full F1-F4 + F4')");
run(97, 1);
print("== p = 89 (F1-F3 + F4')");
run(89, 0);
quit
