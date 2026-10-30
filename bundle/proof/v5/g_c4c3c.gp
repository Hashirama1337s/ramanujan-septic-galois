\\ g_c4c3c.gp -- numerical backing for proof v5 (C4 'only if' and C3c).  Not load-bearing.
\\ (A) bound lemma: for every reduced primitive form Q=(a,b,c) of disc -4p with a>=2, and tau = -conj(tau_Q) = (b+sqrt(-4p))/(2a),
\\     max_i |R_i(tau)| < w := f(sqrt -p)^24, plus the explicit bounds 4.89 e^{pi y} (R0,R1) and 19.7 (R2).
\\     Negative control: the principal form (1,0,p) gives |R0| = w (equality, so the strict bound must fail there).
\\ (B) product formula P = prod u_k = 2^{(p-1)/2} f^{1-p} from theta sums.
\\ (C) v = P^p has degree exactly h over Q and Q(v) = Q(j(sqrt -p)) (nfisisom with polclass(-4p)).
\\ (D) minimal polynomial of w = f(sqrt -p)^24: degree h, monic, |constant term| = 2^{c h}, c = 12 (p=7 mod 8), 8 (p=3 mod 8), 6 (p=1 mod 4).
th(a, s) = suminf(n = 0, exp(-Pi*s*(n + a)^2)) + suminf(n = 1, exp(-Pi*s*(n - a)^2));
th0(s) = 1 + 2*suminf(n = 1, exp(-Pi*s*n^2));
R0(t) = weber(t, 0)^24;
R1(t) = -weber(t, 1)^24;
R2(t) = -weber(t, 2)^24;
redforms(D) = {
  my(L = List(), A = sqrtint(-D \ 3) + 1);
  for(a = 1, A, for(b = -a, a, if((b^2 - D) % (4*a), next); my(c = (b^2 - D)/(4*a));
    if(c < a, next); if(gcd([a, b, c]) != 1, next);
    if((abs(b) == a || a == c) && b < 0, next);
    listput(L, [a, b, c])));
  Vec(L);
}
{
default(realprecision, 60);
my(bad = 0, cnt = 0, negok = 1);
forprime(p = 5, 1000,
  my(D = -4*p, F = redforms(D), w = R0(I*sqrt(p)), h = qfbclassno(D));
  if(#F != h, print("form count mismatch at p=", p); bad++);
  foreach(F, Q,
    my(a = Q[1], b = Q[2], t = (b + sqrt(D))/(2*a), y = imag(t), m01 = max(abs(R0(t)), abs(R1(t))), m2 = abs(R2(t)));
    if(a == 1, if(abs(abs(R0(t)) - w) > 1e-40*w, negok = 0); next);
    cnt++;
    if(!(m01 < w && m2 < w && m01 < 4.89*exp(Pi*y) && m2 < 19.7 && y >= sqrt(3)/2 - 1e-30 && y <= sqrt(p)/2 + 1e-30),
       bad++; print("BOUND FAIL p=", p, " Q=", Q))));
print("(A) primes 5..1000: ", cnt, " non-principal reduced forms checked, failures = ", bad, "; principal-form equality (control) holds: ", negok);
}
{
default(realprecision, 300);
my(bad = 0);
forprime(p = 5, 61,
  my(m = (p - 1)/2, s = sqrt(p), P = prod(k = 1, m, 2*th(k/p, s)/th0(s)), Pw = 2^m*weber(I*s, 0)^(1 - p));
  if(abs(P - Pw) > 1e-250*abs(P), bad++; print("P formula FAIL p=", p)));
print("(B) P = 2^{(p-1)/2} f^{1-p} for primes 5..61 at 300 digits: failures = ", bad);
}
{
default(realprecision, 2500);
foreach([5, 7, 11, 13, 17, 19, 23], p,
  my(h = qfbclassno(-4*p), m = (p - 1)/2, s = sqrt(p),
     v = prod(k = 1, m, (2*th(k/p, s)/th0(s))^p), pol, lower, iso);
  pol = algdep(v, h);
  lower = if(h > 1, algdep(v, h - 1), 0);
  iso = if(h > 1, nfisisom(pol, polclass(-4*p)) != 0, poldegree(pol) == 1);
  print("(C) p=", p, " h=", h, ": deg minpoly(v)=", poldegree(pol), " irreducible=", polisirreducible(pol),
        " residual log10=", round(log(abs(subst(pol, x, v)) + 10^-2400)/log(10)),
        " | best degree-(h-1) relation: residual log10=", if(h > 1, round(log(abs(subst(lower, x, v)) + 10^-2400)/log(10)), "n/a"),
        " max coeff log10=", if(h > 1, round(log(vecmax(abs(Vec(lower))))/log(10)), "n/a"), " (vs ", round(log(vecmax(abs(Vec(pol))))/log(10)), " for the true one)",
        " | Q(v) = Q(j) (nfisisom): ", iso));
}
{
default(realprecision, 400);
foreach([5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 71, 79], p,
  my(h = qfbclassno(-4*p), w = R0(I*sqrt(p)), pol = algdep(w, h), c = if(p % 8 == 7, 12, if(p % 8 == 3, 8, 6)), c0);
  c0 = polcoef(pol, 0);
  print("(D) p=", p, " (p mod 8 = ", p % 8, ") h=", h, ": deg=", poldegree(pol), " monic=", abs(pollead(pol)) == 1,
        " resid log10=", round(log(abs(subst(pol, x, w)) + 10^-390)/log(10)),
        " |c0| = 2^", if(c0, valuation(c0, 2), "?"), " odd part ", if(c0, abs(c0)/2^valuation(c0, 2), "?"),
        " predicted 2^", c*h));
}
