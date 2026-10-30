\\ hm2.gp -- POST HOC, for the quintic generation step. Is BR's p = u v = U_1 U_2 (U_k = 2 th[k/5,0]/th[0,0]) a Hauptmodul for
\\ Gamma*_5 = { M in SL2(Z) : 5 | M_12, (1,1) M = (1,1) mod 2 } (index 18)?
\\ (ii) divisor: right cosets of Gamma*_5 <-> (a_0 gamma, {+-a_1 gamma, +-a_2 gamma}) mod Z^2 (gamma mod 10);
\\      ord_q(p o gamma) = (1/2)(B2<x1> + B2<x2> - 2 B2<x0>) (KSY10 2.4(v), p = const * g_{a_1} g_{a_2} / g_{a_0}^2 by C5 Lemma 1).
read("veins/v1_law/law.gp");
default(realprecision, 80);
U(k, z) = 2 * th(k/5, 0, z) / th(0, 0, z);
pp(z) = U(1, z) * U(2, z);
inG(M) = (M[1,2] % 5 == 0) && ((M[1,1] + M[2,1]) % 2 == 1) && ((M[1,2] + M[2,2]) % 2 == 1);
act(M, z) = (M[1,1]*z + M[1,2]) / (M[2,1]*z + M[2,2]);
  while(cnt < 40, my(a = random(41) - 20, c = random(41) - 20, g = gcdext(a, c));
    if(g[3] != 1, next);
    my(M = [a, -g[2]; c, g[1]]);
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
      tot += o; if(o != 0, print("  coset rep ", g, " ord_q ", o));if(o > 0, zer += o); if(o < 0, pol -= o))))));
  print("(ii) cosets = ", cnt, ", total order = ", tot, ", zeros = ", zer, ", poles = ", pol); }
quit;
