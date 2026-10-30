\\ hm.gp -- is B_1^{(l)} = (2 th[1/l,0]/th[0,0])^l a Hauptmodul for its invariance group Gamma_B? (POST HOC, for the proof of generation)
\\ B_1 o gamma = (const) * 2^l (g_{a_1 gamma}/g_{a_0 gamma})^l  (KSY10 Prop 2.4(ii)), a_1 = ((l+2)/2l, 1/2), a_0 = (1/2, 1/2).
\\ ord_q (q = e^{2 pi i tau}) of B_1 o gamma = (l/2) (B2(<x1>) - B2(<x0>)), x_k = first coordinate of a_k gamma (KSY10 2.4(v)).
\\ Right cosets Gamma_B gamma <-> the pair (a_1 gamma, a_0 gamma) mod Z^2 up to a common sign (Gamma_B = Gamma* cap {A = +-1 mod l},
\\ C5 Lemma 3*). Sum over cosets of ord_q = sum over cusps of the order in the local parameter; degree = sum of the positive parts.
B2(x) = x^2 - x + 1/6;
fr(x) = x - floor(x);
hm(l) = {
  my(N = 2*l, a1 = [(l+2)/(2*l), 1/2], a0 = [1/2, 1/2], S = Map(), cnt = 0, deg = 0, neg = 0, tot = 0);
  for(A = 0, N-1, for(B = 0, N-1, for(C = 0, N-1, for(D = 0, N-1,
    if((A*D - B*C) % N != 1, next);
    my(g = [A, B; C, D], p1 = a1*g, p0 = a0*g, k1, k2);
    k1 = [fr(p1[1]), fr(p1[2]), fr(p0[1]), fr(p0[2])];
    k2 = [fr(-p1[1]), fr(-p1[2]), fr(-p0[1]), fr(-p0[2])];
    my(key = if(lex(k1, k2) <= 0, k1, k2));
    if(!mapisdefined(S, key),
      mapput(S, key, 1); cnt++;
      my(o = (l/2) * (B2(fr(p1[1])) - B2(fr(p0[1]))));
      tot += o; if(o > 0, deg += o); if(o < 0, neg += o))))));
  print("l=", l, ": cosets (pairs up to sign) = ", cnt, ", total order = ", tot, ", zeros = ", deg, ", poles = ", -neg);
}
hm(3); hm(5);
quit;
