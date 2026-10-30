\\ conv.gp -- which composition convention for f^M in KSY25 Prop 4.1? Test on a form Q in the PRINCIPAL class of C_1(-4p) with a != 1 mod N:
\\ Q(x,y) = (3x+y)^2 + p(2x+y)^2 = [9+4p, 6+4p, 1+p]. sigma_Q is trivial on H_O and sends zeta_p -> zeta_p^{a'}, so by proof v4 Prop 4
\\ (convention-free) sigma_Q(b_1) = b_t with t^2 = a' (mod p). Prop 4.1 value: B_1(tau'' ) with tau'' = (b'(1 - a e) + sqrt -p)/a,
\\ e = a' (conv 1, right action f^{diag(1,d) gamma} = (f^diag)^gamma), a'^2 (conv 2), 1 (conv 3); b' = b/2.
read("proof/cert/cert.gp");
red(k, p) = { my(r = lift(Mod(k, p))); if(r > p / 2, p - r, r); }
tst(p) = {
  my(N = 4 * p, a = 9 + 4 * p, bb = 6 + 4 * p, ap = lift(Mod(a, N)^-1), bp = bb / 2, t = red(lift(Mod(3, p)^-1), p), target, out = []);
  default(realprecision, 120);
  target = Bm(t, p, I * sqrt(p));
  foreach([ap, ap^2, 1], e, my(v = Bm(1, p, (bp * (1 - a * e) + I * sqrt(p)) / a)); out = concat(out, [abs(v - target) / abs(target)]));
  print("p = ", p, ": Q = [", a, ",", bb, ",", 1 + p, "], a' = ", ap, ", predicted sigma_Q(b_1) = b_", t,
        ";  relative error conv1 / conv2 / conv3 = ", apply(z -> Strprintf("%.3g", z), out));
}
tst(23); tst(31); tst(47); tst(127);
quit
