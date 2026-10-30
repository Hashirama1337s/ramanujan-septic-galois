\\ c5_checks_v3.gp -- confirmation (not proof) of Lemma 3* Class II*: M = I + n M', entries of M' over Z/8, n mod 8 in {1,3,5,7}, k mod 8.
\\ Necessary conditions imposed: M'11+M'21, M'12+M'22 even; (1+nM'11)(1+nM'22) - n^2 M'12 M'21 = 1 mod 8. u, v = exact halves of the reps.
{
  my(cnt = 0, bad = 0);
  forstep(n = 1, 7, 2, for(k = 0, 7, for(a = 0, 7, for(b = 0, 7, for(c = 0, 7, for(d = 0, 7,
    if((a + c) % 2 || (b + d) % 2, next);
    if(((1 + n*a)*(1 + n*d) - n^2*b*c - 1) % 8, next);
    my(u = (a + c)/2, v = (b + d)/2, c1 = n*u, c2 = n*v, s1 = c1 + k*a, s2 = c2 + k*b,
       Dl = (s1 + 1)*(s2 + 1) - (c1 + 1)*(c2 + 1), E = 2*Dl + n*k*(b - a) + 2*k*s2);
    cnt++; if(E % 4, bad++)))))));
  print("(A') Class II* mod-8 confirmation: ", cnt, " residue cases, ", bad, " failures");
}
quit
