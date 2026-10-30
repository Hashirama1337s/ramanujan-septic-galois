\\ posthoc.gp -- POST HOC (not in BAR-V1): for F1, compare the number of real conjugates with
\\   [Q(zeta_5) * Gen(O) : Q] / 2 = 4 * |Cl(O)[2]| / (2 if sqrt5 in Gen(O), i.e. 5 | n, else 1),
\\ which is what the group theory predicts when R(tau_O) generates K_{O,5} over K AND K_{O,5} cap Q^ab = Q(zeta_5) Gen(O).
\\ |Cl(O)[2]| = number of reduced ambiguous forms (b = 0, b = a or a = c).
read("veins/v1_law/law.gp");
amb(D) = { my(F = redforms(D)); sum(i = 1, #F, my(Q = F[i]); Q[2] == 0 || Q[2] == Q[1] || Q[1] == Q[3]); }
obs = [4,4,4,4,8,4,8,8,4,4,8,8,8,4,8,8,8,4,4,16,8,4,16,4,8,4,8,8,8,4,8,16,8,4,8,8,8,8,8,8,16,4,8,8,8,4,16,8,4,8,8,8,8,4,16,16,8,4,8];
{
  my(bad = 0);
  for(n = 2, 60, my(pr = 4 * amb(-4*n) / if(n % 5 == 0, 2, 1));
    if(pr != obs[n-1], bad++; print("  n=", n, " observed ", obs[n-1], " predicted ", pr)));
  print("F1 real-conjugate count vs 4|Cl[2]|/(1 or 2): ", 59 - bad, "/59 agree");
}
quit;
