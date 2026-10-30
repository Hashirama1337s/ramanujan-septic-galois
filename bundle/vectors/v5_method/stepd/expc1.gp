\\ expc1.gp -- export the CANDIDATE c_1 in Q(theta), theta = 2cos(2 pi/N), exactly as CERT-C4-STRONG Step C builds it
\\ (root of x^E - R nearest b_1, R = 2^A p^B prod S_j^{C_j/2}). Candidate only: stepd.py verifies everything exactly / in balls.
\\ Output: c1_p<p>.txt with lines "N", "E A B", "C...", then the coefficients of lift(c_1) in t (constant first), one rational per line.
default(realprecision, 300);
read("proof/cert/cert.gp");
exp1(p, N, E, A, B, C) = {
  my(Pt = fieldpol(N), R, rts, c1, b1, dbest = +oo, f, v);
  b1 = real(conjs(p, 1)[1][1]);
  R = 2^A * p^B * prod(j = 1, #C, Sa(j, Pt)^(C[j] / 2));
  rts = if(E == 1, [R], nfroots(Pt, 'x^E - lift(R)));
  for(i = 1, #rts, my(z = Mod(lift(rts[i]), Pt), dd = abs(emb(z, N, 1) - b1)); if(dd < dbest, dbest = dd; c1 = z));
  f = Str("vectors/v5_method/stepd/c1_p", p, ".txt");
  v = Vecrev(lift(c1), poldegree(Pt));
  write1(f, ""); \\ touch
  write(f, N); write(f, Str(E, " ", A, " ", B)); write(f, strjoin(apply(x -> Str(x), C), " "));
  for(i = 1, #v, write(f, v[i]));
  print("p = ", p, ": candidate c_1 exported (", #v, " coefficients), |iota(c_1) - b_1| ~ 10^", round(log(dbest + 10.^-299) / log(10)));
}
exp1(7, 7, 1, 0, 3, [-10, -8]);
exp1(5, 20, 2, 5, 0, [-2, 4, -4]);
exp1(13, 52, 6, 39, 7, [-6, 50, -24, -40, -30, -8, -12, -44, -18, -58, -36]);
e37 = [4,-62,48,12,-60,48,-64,46,-16,174,40,-70,68,152,20,-74,52,2,8,-28,-28,80,-32,58,12,130,-44,-146,56,174,24,22,36,110,72];
exp1(37, 148, 4, 74, -5, -e37);
quit
