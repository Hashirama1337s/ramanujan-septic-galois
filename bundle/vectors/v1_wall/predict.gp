\\ predict.gp -- prints the sealed predictions (no theta value is computed here)
read("vectors/v1_wall/wall.gp");
odd = vector(24, i, 2*i + 1);
cubB = concat(odd, [63, 81, 99, 117, 153, 225, 243, 333, 441, 729, 765]);
cubW = concat(odd, [81, 85]);
quiB = concat(odd, [75, 125, 175, 225, 325, 625, 1225]);
quiW = odd;
show(l, fam, L) = {
  my(A = List(), S = List());
  print("--- l=", l, " fam=", fam);
  for(i = 1, #L, my(m = L[i]);
    print1("m=", m, " h=", #redforms(-4*m), " Cl2=", cl2(m), " deg=", preddeg(m, l, fam), " real=", predreal(m, l), " alt=", predalt(m, l, fam), " same=", predsame(m), "; ");
    if(predalt(m, l, fam), listput(A, m)); if(predsame(m), listput(S, m)));
  print(); print("  H_alt abelian set: ", Vec(A)); print("  H_same abelian set: ", Vec(S));
}
show(3, "B", cubB); show(3, "W", cubW); show(5, "B", quiB); show(5, "W", quiW);
quit;
