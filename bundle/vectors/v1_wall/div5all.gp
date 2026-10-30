B2(x) = x^2 - x + 1/6;
fr(x) = x - floor(x);
nrm(v) = { my(w = [fr(v[1]), fr(v[2])], w2 = [fr(-v[1]), fr(-v[2])]); if(lex(w, w2) <= 0, w, w2); }
{ my(S = Map(), cnt = 0, zer = 0, pol = 0, tot = 0, a1 = [7/10, 1/2], a2 = [9/10, 1/2], a0 = [1/2, 1/2]);
  for(A = 0, 9, for(B = 0, 9, for(C = 0, 9, for(D = 0, 9,
    if((A*D - B*C) % 10 != 1, next);
    my(g = [A, B; C, D], p1 = a1*g, p2 = a2*g, p0 = a0*g, key);
    key = concat(nrm(p0), vecsort([nrm(p1), nrm(p2)]));
    key = [key[1], key[2], key[3][1], key[3][2], key[4][1], key[4][2]];
    if(!mapisdefined(S, key), mapput(S, key, 1); cnt++;
      my(o = (B2(fr(p1[1])) + B2(fr(p2[1])) - 2*B2(fr(p0[1]))) / 2);
      tot += o; print("  coset rep ", g, " ord_q ", o); if(o > 0, zer += o); if(o < 0, pol -= o))))));
  print("(ii) cosets = ", cnt, ", total order = ", tot, ", zeros = ", zer, ", poles = ", pol); }
quit;
