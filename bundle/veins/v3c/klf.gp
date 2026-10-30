\\ klf.gp -- vein 3c step checks for the proof in RESULT-V3C.md. Unconditional numerics only (no bnfinit, no minpoly).
\\ Lattice side: sigma_a(b_1) <-> p*(log 2 + log|g(z1; abar_O)| - log|g(w; abar_O)|), a = [l, (-b+sqrt -p)/2], point scaled by l.
\\ Conjugate side: proof/cert/cert.gp conjs(p,1) (KSY25 Prop 4.1), shift from v3b p127.gp.
read("proof/cert/cert.gp");
B1(p, chi) = sum(a = 1, p - 1, chi(a) * a) / p;
red(k, p) = { my(r = lift(Mod(k, p))); if(r > p / 2, p - r, r); }

\\ log|g(z; Z w1 + Z w2)| via Siegel product after Gauss reduction (|g| is basis independent)
lgsieg(z, w1, w2) = {
  my(t, n, M, r, r1, r2, tau, q, qz, s, k, term);
  if(imag(w1 / w2) < 0, w1 = -w1);
  while(1, t = w1 / w2; n = round(real(t)); w1 -= n * w2; if(abs(w1) < abs(w2) - 1e-30, [w1, w2] = [-w2, w1], break));
  M = [real(w1), real(w2); imag(w1), imag(w2)]; r = matsolve(M, [real(z), imag(z)]~);
  r1 = r[1] - floor(r[1]); r2 = r[2]; tau = w1 / w2;
  q = exp(2 * Pi * I * tau); qz = exp(2 * Pi * I * (r1 * tau + r2));
  s = (r1^2 - r1 + 1/6) / 2 * log(abs(q)) + log(abs(1 - qz));
  k = 1; until(abs(term) < 10.^(-default(realprecision) - 5) && k > 3,
    term = log(abs(1 - q^k * qz)) + log(abs(1 - q^k / qz)); s += term; k++);
  s;
}

\\ class representatives of Cl(q), q = (sqrt -p): key = [reduced form of a, l mod p]; returns list of [l, b]
reps(p, h, m, twice) = {
  my(L = Map(), out = List(), dup = List(), l = 2, cnt = 0);
  while(cnt < h * m || (twice && #dup < 20),
    l = nextprime(l + 1); if(l == p || kronecker(-p, l) != 1, next);
    my(b0 = lift(sqrt(Mod(-p, l))));
    if(b0 % 2 == 0, b0 = l - b0);
    foreach([b0, -b0], b,
      my(c = (b^2 + p) / (4 * l), key = [Vec(qfbred(Qfb(l, b, c))), l % p]);
      if(mapisdefined(L, key), if(twice && #dup < 20, listput(dup, [l, b, mapget(L, key)])),
        mapput(L, key, [l, b]); listput(out, [l, b]); cnt++)));
  [Vec(out), Vec(dup)];
}

Fval(p, l, b) = {
  my(s = I * sqrt(p), z1 = (1 + s) / 2 + s / p, w = (1 + s) / 2);
  p * (log(2) + lgsieg(l * z1, b + s, l) - lgsieg(l * w, b + s, l));
}

run(p, prec, shift) = {
  my(t0 = getabstime(), m = (p - 1) / 2, h = qfbclassno(-4 * p), R, D, Fv, gen, lg = vector(p - 1), worst = 0., wsgn = 0.);
  default(realprecision, prec);
  print("\n==== p = ", p, "  h = ", h, "  |Cl(q)| = ", h * m);
  [R, D] = reps(p, h, m, 1);
  print("  primes used up to l = ", vecmax(apply(v -> v[1], R)));
  Fv = vector(#R, i, Fval(p, R[i][1], R[i][2]));
  \\ (a) trivial class reproduces log b_1
  my(b1 = real(Bm(1, p, I * sqrt(p))), i0 = 0);
  \\ principal O_K form of disc -p is [1,1,(1+p)/4]
  for(i = 1, #R, my(Q = qfbred(Qfb(R[i][1], R[i][2], (R[i][2]^2 + p) / (4 * R[i][1])))); if(R[i][1] % p == 1 && Vec(Q)[1] == 1, i0 = i));
  print("  (a) trivial class rep l = ", R[i0][1], ": |Fval - log b_1| = ", Strprintf("%.3g", abs(Fv[i0] - log(b1))), "   also direct a = O_K: ", Strprintf("%.3g", abs(Fval(p, 1, 1) - log(b1))));
  \\ (b) class function: second representatives
  my(dmax = 0.); for(i = 1, #D, dmax = max(dmax, abs(Fval(p, D[i][1], D[i][2]) - Fval(p, D[i][3][1], D[i][3][2]))));
  print("  (b) ", #D, " pairs of distinct ideals in the same class of Cl(q): max |dFval| = ", Strprintf("%.3g", dmax));
  \\ (c) multiset equals analytic conjugates (KSY25 Prop 4.1 via cert.gp)
  my(V, Lab, lv, lf);
  [V, Lab] = conjs(p, 1);
  lv = vecsort(apply(z -> log(abs(z)), V)); lf = vecsort(Fv);
  print("  (c) sorted log|conjugates| vs sorted Fval: #", #lv, " vs #", #lf, ", max diff ", Strprintf("%.3g", vecmax(apply(abs, lv - lf))));
  \\ (d) signed identity A_chi = (p/2) chi(2)(chi(2)-1) B_{1,chi psi} C_chi
  gen = znprimroot(p); for(i = 0, p - 2, lg[lift(gen^i)] = i);
  for(j = 1, m - 1, my(jj = 2 * j, ch, cho, A, C, B, pred);
    ch = (a -> exp(2 * Pi * I * lg[lift(Mod(a, p))] * jj / (p - 1)));
    cho = (a -> exp(2 * Pi * I * lg[a] * (jj + (p - 1) / 2) / (p - 1)));
    A = sum(i = 1, #R, ch(R[i][1]) * Fv[i]);
    C = sum(a = 1, m, ch(a) * log(abs(2 - 2 * cos(2 * Pi * a / p))));
    B = B1(p, cho);
    pred = (p / 2) * ch(2) * (ch(2) - 1) * B * C;
    worst = max(worst, abs(A - pred) / max(abs(C), 1)));
  print("  (d) signed identity, ", m - 1, " characters: max |A - pred|/|C| = ", Strprintf("%.3g", worst));
  \\ (e) per-embedding norm: lattice N(a) vs closed form N(b_1)^2 = prod_b (eta_{a/(4b)}/eta_{a/(2b)})^(psi(b)(2b-p))
  my(LN = vector(p - 1), e2 = 0.);
  for(i = 1, #R, LN[R[i][1] % p] += Fv[i]);
  forstep(a = 1, p - 1, 1, if(kronecker(a, p) == 1,
    my(rhs = sum(b = 1, m, kronecker(b, p) * (2 * b - p) * (log(abs(2 - 2 * cos(2 * Pi * lift(Mod(a, p) / (4 * b)) / p))) - log(abs(2 - 2 * cos(2 * Pi * lift(Mod(a, p) / (2 * b)) / p))))));
    e2 = max(e2, abs(2 * LN[a] - rhs))));
  print("  (e) closed form for N(b_1)^2 at all ", m, " embeddings: max |log diff| = ", Strprintf("%.3g", e2), "   (sum of log N over embeddings = ", Strprintf("%.3g", sum(a = 1, p - 1, if(kronecker(a, p) == 1, LN[a], 0))), ")");
  \\ (f) shift used in v3b (trace integrality) vs lattice labels, and reciprocity prediction x_Q^2 = a_Q (mod p)
  my(F = redforms(-4 * p), reps2 = [], b = vector(m, k, real(V[k])), Wl, e3 = 0., pred = []);
  for(i = 1, #F, if(F[i][2] > 0, reps2 = concat(reps2, [i])));
  Wl = vector(#reps2, i, vector(m, k, V[(reps2[i] - 1) * m + k]));
  for(i = 1, #reps2, my(Q = F[reps2[i]], aq = Q[1]); if(gcd(aq, 4 * p) > 1, aq = Q[3]);
    my(x = lift(sqrt(Mod(aq, p)))); pred = concat(pred, [red(x, p)]));
  if(#shift < #reps2, shift = pred);
  print("  (f) v3b shift ", shift, "; reciprocity prediction (x^2 = a_Q mod p, up to sign) ", pred);
  for(t = 1, m, my(Nt = log(b[t]) + sum(i = 1, #reps2, log(norm(Wl[i][red(t * shift[i], p)])))); e3 = max(e3, abs(Nt - LN[lift(Mod(t, p)^2)])));
  print("      log N_t (v3b shift) vs lattice log N(t^2): max diff ", Strprintf("%.3g", e3), "   (", (getabstime() - t0) \ 1000, " s)");
}
