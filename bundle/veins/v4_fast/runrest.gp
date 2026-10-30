\\ AMENDMENT-SWEEP2-4: remaining primes by the fast conjugate method, in sealed order.
read("veins/v4_fast/fastmin.gp");
{
  foreach([59, 71, 83, 89, 97], p,
    my(G = fastmin(p, 1));
    write(Str("veins/v4_fast/minpoly_p", p, ".gp"), G));
}
quit
