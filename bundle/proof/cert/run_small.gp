default(realprecision, 3000);
read("cert.gp");
\\ p = 7: b_1 = 7^3 s1^-10 s2^-8, s_a = 2 sin(pi a/7)
c7 = cert(7, 7, 1, 0, 3, [-10, -8]);
\\ Rebak septic control: u_1^7 = d2^6/d1^2, u_2^7 = d1^6/d2^4, u_3^7 = d1^-4 d2^-2, d_j = sin((j+1)pi/7)/sin(pi/7)
{
  my(Pt = fieldpol(7), S1 = Sa(1, Pt), S2 = Sa(2, Pt), S3 = Sa(3, Pt), r1, r2, r3, V = real(conjs(7, 1)[1]));
  r1 = S3^3 / (S1^2 * S2); r2 = S2^3 / (S1 * S3^2); r3 = S1^3 / (S2^2 * S3);
  print("  REBAK control: c_1 == d2^6/d1^2 exactly: ", Mod(lift(c7), Pt) == r1,
        "; |iota(d1^6/d2^4) - b_2| = 10^-", dig(emb(r2, 7, 1) - V[2]), "; |iota(d1^-4 d2^-2) - b_3| = 10^-", dig(emb(r3, 7, 1) - V[3]));
}
\\ p = 5: b_1^2 = 2^5 s2^4/(s1^2 s3^4), s_a = 2 sin(pi a/20)
c5 = cert(5, 20, 2, 5, 0, [-2, 4, -4]);
\\ p = 13: b_1^6 = 2^39 13^7 prod s_a^C_a, s_a = 2 sin(pi a/52)
c13 = cert(13, 52, 6, 39, 7, [-6, 50, -24, -40, -30, -8, -12, -44, -18, -58, -36]);
quit
