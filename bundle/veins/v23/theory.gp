\\ theory.gp -- class-group side only (no theta values): predicted number of REAL roots of G_n = minpoly of b_1,
\\ under the paper rule  #real = (phi(n)/2) * #{c in Cl(O)[2] : eps(c) = +-(1,...,1)},  O = Z[sqrt -n], D = -4n.
\\ eps(c): pick a prime l (coprime to 2n) represented by a form of class c; if c^2 = 1, l-ideal^2 = (s + t sqrt -n),
\\ s^2 + n t^2 = l^2, t != 0; eps_q = s/l mod q^e (= +-1) for each prime power q^e || n.
redforms(D) = {
  my(L = List());
  for(a = 1, sqrtint(-D \ 3), for(b = -a, a, my(m = b^2 - D);
    if(m % (4*a) == 0, my(c = m / (4*a));
      if(c >= a && gcd([a, b, c]) == 1 && !(b < 0 && (-b == a || a == c)), listput(L, [a, b, c])))));
  Vec(L);
}
primerep(Q, n) = {
  my([a, b, c] = Q);
  for(r = 1, 60, for(x = -r, r, for(y = -r, r, if(max(abs(x), abs(y)) == r && gcd(x, y) == 1,
    my(v = a*x^2 + b*x*y + c*y^2); if(isprime(v) && gcd(v, 2*n) == 1, return(v))))));
  error("no prime rep");
}
epsvec(Q, n) = {
  my(l = primerep(Q, n), f = factor(n), sol = 0);
  for(t = 1, sqrtint(l^2 \ n), my(r = l^2 - n*t^2); if(issquare(r), sol = [sqrtint(r), t]; break));
  if(sol == 0, return(0));
  vector(#f~, i, my(qe = f[i,1]^f[i,2], z = lift(Mod(sol[1], qe) / l)); if(z == 1, 1, if(z == qe - 1, -1, 99)));
}
predict(n) = {
  my(D = -4*n, F = redforms(D), h = #F, one = qfbred(Qfb(1, 0, n)), cnt = 0, two = 0, m = eulerphi(n)/2, E);
  for(i = 1, #F, my(Q = Qfb(F[i][1], F[i][2], F[i][3]));
    if(qfbred(qfbcomp(Q, Q)) == one, two++; E = epsvec(F[i], n);
      if(E == 0 || vecmin(E) == vecmax(E), cnt++)));
  [n, h, two, cnt, m, h*m, m*cnt, if(m*cnt == h*m, "ABELIAN", "not abelian")];
}
print("[n, h(-4n), |Cl[2]|, #eps-trivial in Cl[2], phi(n)/2, predicted degree, predicted #real roots, predicted verdict]");
foreach([7, 11, 9, 15, 21, 25, 27, 33, 45, 49, 85, 93, 105], n, print(predict(n)));
quit
