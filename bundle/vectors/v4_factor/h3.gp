\\ h3.gp -- exact check (reduced-form enumeration, no analytic class-number routine) of the order class-number relation used in
\\ RESULT-F1 Lemma R: h(-4p) = 3 h(-p) for p = 3 mod 8, h(-4p) = h(-p) for p = 7 mod 8 (5 <= p < 3000); plus the newtonpoly convention.
read("proof/cert/cert.gp");
nred(D) = #redforms(D);
{
  my(bad3 = 0, bad7 = 0, n3 = 0, n7 = 0);
  forprime(p = 5, 2999, if(p % 4 == 3,
    my(a = nred(-4*p), b = nred(-p));
    if(p % 8 == 3, n3++; if(a != 3*b, bad3++; print("  p = ", p, ": h(-4p) = ", a, ", h(-p) = ", b)),
                   n7++; if(a != b, bad7++; print("  p = ", p, ": h(-4p) = ", a, ", h(-p) = ", b)))));
  print("p = 3 mod 8: ", n3, " primes, exceptions to h(-4p) = 3h(-p): ", bad3);
  print("p = 7 mod 8: ", n7, " primes, exceptions to h(-4p) = h(-p): ", bad7);
  print("control: h(-12) = ", nred(-12), " vs 3 h(-3) = ", 3 * nred(-3), " (p = 3: unit index 3, relation must FAIL)");
  print("cross-check against qfbclassno at p < 200: ", select(p -> p % 4 == 3 && nred(-4*p) != qfbclassno(-4*p), primes([5, 199])) == []);
  print("newtonpoly convention: x^2 - 2 -> ", newtonpoly(x^2 - 2, 2), ";  x^3 - 8x - 16 -> ", newtonpoly(x^3 - 16, 2), " (expect 1/2,1/2 and 4/3 x3)");
}
quit
