/* check (E) for Lemma E': parity of h(-4p), and the h <= 2 list, for primes 5 <= p < 3000.
   Positive controls: h(-28) = 1, h(-20) = 2. Composite control: h(-60) = 2. */
bad3 = 0; bad1 = 0; small = List(); n3 = 0; n1 = 0;
{forprime(p = 5, 2999,
  my(h = qfbclassno(-4*p));
  if(p % 4 == 3, n3++; if(h % 2 == 0, bad3++));
  if(p % 4 == 1, n1++; if(h % 2 == 1, bad1++));
  if(h <= 2, listput(small, [p, h])));}
print("(E) p = 3 mod 4: ", n3, " primes, even h found: ", bad3);
print("(E) p = 1 mod 4: ", n1, " primes, odd h found: ", bad1);
print("(E) primes 5..2999 with h(-4p) <= 2: ", Vec(small));
print("(E) controls: h(-28) = ", qfbclassno(-28), " (want 1); h(-20) = ", qfbclassno(-20), " (want 2); h(-60) = ", qfbclassno(-60), " (composite, want 2)");
quit
