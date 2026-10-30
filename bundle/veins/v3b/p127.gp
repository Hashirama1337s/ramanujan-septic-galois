\\ p127.gp -- AMENDMENT A1 test (sealed 2b285461...): vanishing branch of the norm identity at p = 127.
\\ Unconditional numerics only: no bnfinit, no minimal polynomial. N(b_t) = norm from F_p to Q(zeta_p)^+ built from the analytic
\\ conjugates (KSY25 Prop 4.1, convention 1, as in proof/cert/cert.gp), block shifts x_Q found by trace integrality.
\\ Instrument controls: p = 23 (identity, no zeros) and p = 31 (2 zeros) must be reproduced.
read("proof/cert/cert.gp");
B1(p, chi) = sum(a = 1, p - 1, chi(a) * a) / p;
red(k, p) = { my(r = lift(Mod(k, p))); if(r > p / 2, p - r, r); }

test(p, prec) = {
  my(t0 = getabstime(), m = (p-1)/2, F = redforms(-4*p), h = #F, V, Lab, reps = [], blk = [], cands, nb, N, gen, lg = vector(p - 1), worst = 0., zmax = 0., zeros = 0, scale = 0.);
  default(realprecision, prec);
  [V, Lab] = conjs(p, 1);
  for(i = 1, h, my(Q = F[i]); if(Q[2] > 0, reps = concat(reps, [i])));
  print("\n==== p = ", p, "  h = ", h, "  forms ", F, "  pair representatives ", vector(#reps, i, F[reps[i]]), "  (", (getabstime() - t0) \ 1000, " s)");
  if(#reps != (h - 1) / 2, error("pairing"));
  my(b = vector(m, k, real(V[k])), W = vector(#reps, i, vector(m, k, V[(reps[i] - 1) * m + k])));
  \\ search block shifts x = (x_1..x_r) in [1..m]^r: N_t = b_t * prod_i |W_i[red(t x_i)]|^2; trace must be an integer
  my(r = #reps, best = [], X = vector(r, i, 1), done = 0, ntr = 0);
  forvec(X = vector(r, i, [1, m]),
    my(tr = sum(t = 1, m, b[t] * prod(i = 1, r, norm(W[i][red(t * X[i], p)]))), e = abs(tr - round(tr)));
    ntr++;
    if(e < 10.^(-prec / 2), best = concat(best, [X])));
  print("  shift vectors tried ", ntr, "; with integral trace (to 10^-", prec / 2, "): ", best);
  if(#best != 1, print("  INSTRUMENT: need exactly one block assignment; got ", #best); return(0));
  N = vector(m, t, b[t] * prod(i = 1, r, norm(W[i][red(t * best[1][i], p)])));
  my(Pn = prod(t = 1, m, 'X - N[t]), err);
  err = iferr(vecmax(apply(z -> abs(z - round(z)), Vec(Pn))), E, -1);
  print("  log10 max |N_t| = ", Strprintf("%.1f", vecmax(apply(z -> abs(log(z)), N)) / log(10)), "; char. polynomial of N(b_t): ",
        if(err < 0, "coefficients exceed working precision (check skipped)", Str("integral to 10^", Strprintf("%.0f", log(err + 10.^-prec) / log(10)), ", constant term ", round(polcoef(Pn, 0)))));
  gen = znprimroot(p); for(i = 0, p - 2, lg[lift(gen^i)] = i);
  my(f = vector(m, t, log(N[t])), g = vector(m, a, log(abs(2 - 2 * cos(2 * Pi * a / p)))));
  for(j = 1, m - 1, my(jj = 2 * j, ch, cho, A, C, B, c2);
    ch = (a -> exp(2 * Pi * I * lg[a] * jj / (p - 1)));
    cho = (a -> exp(2 * Pi * I * lg[a] * (jj + (p-1)/2) / (p - 1)));
    A = abs(sum(t = 1, m, ch(lift(Mod(t, p)^2)) * f[t])); C = abs(sum(a = 1, m, ch(a) * g[a])); B = abs(B1(p, cho)); c2 = ch(2);
    scale = max(scale, C);
    if(abs(1 - c2) < 1e-50, zeros++; zmax = max(zmax, A / C); print("    chi^", jj, ": chi(2) = 1   |A|/|C| = ", Strprintf("%.3g", A / C), "  (predicted 0)"),
       my(q = A / ((p / 2) * abs(1 - c2) * B * C)); worst = max(worst, abs(q - 1));
       if(abs(q - 1) > 1e-40, print("    chi^", jj, ": observed/predicted = ", Strprintf("%.20g", q)))));
  print("  RESULT p = ", p, ": ", m - 1 - zeros, " characters with chi(2) != 1, worst relative deviation ", Strprintf("%.3g", worst),
        "; ", zeros, " characters with chi(2) = 1, max |A|/|C| = ", Strprintf("%.3g", zmax), "  (", (getabstime() - t0) \ 1000, " s)");
}
test(23, 400);
test(31, 400);
test(127, 1500);
quit
