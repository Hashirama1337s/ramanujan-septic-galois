\\ extra.gp -- cross-checks on the certified data: N(b_1) vs C3c exponent; C2 rule vs the Galois matching; explicit G for p = 5, 7.
default(realprecision, 1500);
read("cert.gp");
{
  foreach([[7, 7], [5, 20], [13, 52], [37, 148]], PN, my(p = PN[1], N = PN[2], V, Lab, G, h = qfbclassno(-4*p), e, c0, m = (p-1)/2, bad = 0, nchk = 0);
    [V, Lab] = conjs(p, 1); V = real(V); G = intpol(V)[1]; c0 = polcoef(G, 0);
    e = if(p % 8 == 7, 0, if(p % 8 == 3, p*h*(p-1)/6, p*h*(p-1)/4));
    print("p=", p, ": constant term of G = ", if(abs(c0) == 1, c0, factor(c0)), "; C3c predicts |N(b_1)| = 2^", e, " -> ", if(abs(c0) == 2^e, "MATCH", "NO MATCH"));
    if(p <= 7, print("   G = ", G));
    \\ C2: for (a/p) = 1 (or every a when p = 3 mod 4), sigma_a(b_1) = b_{+-x}, x^2 = eps(a) a mod p.
    \\ Here sigma_a(b_1) is read off numerically as the value of c_1 at theta -> 2cos(2 pi a/N)  -- uses the certified b_1 = iota(c_1).
    my(Pt = fieldpol(N), R, c1, rel);
    rel = Map([7, [1, 0, 3, [-10, -8]]; 5, [2, 5, 0, [-2, 4, -4]]; 13, [6, 39, 7, [-6, 50, -24, -40, -30, -8, -12, -44, -18, -58, -36]];
               37, [4, 74, -5, -[4,-62,48,12,-60,48,-64,46,-16,174,40,-70,68,152,20,-74,52,2,8,-28,-28,80,-32,58,12,130,-44,-146,56,174,24,22,36,110,72]]]);
    my(r = mapget(rel, p)); R = 2^r[2] * p^r[3] * prod(j = 1, #r[4], Sa(j, Pt)^(r[4][j]/2));
    my(rts = if(r[1] == 1, [R], nfroots(Pt, 'x^r[1] - lift(R))), dbest = +oo);
    for(i = 1, #rts, my(z = Mod(lift(rts[i]), Pt), dd = abs(emb(z, N, 1) - V[1])); if(dd < dbest, dbest = dd; c1 = z));
    for(a = 1, N\2, if(gcd(a, N) != 1, next); my(epsa, w = emb(c1, N, a), k = 0);
      epsa = if(p % 4 == 3, kronecker(a, p), (-1)^((a-1)/2));
      if(p % 4 == 1 && kronecker(a, p) != 1, next);
      for(kk = 1, m, if(Mod(kk, p)^2 == Mod(epsa * a, p), k = kk));
      nchk++; if(dig(w - V[k]) < 1000, bad++));
    print("   C2 rule checked for ", nchk, " values of a: ", bad, " mismatches"));
}
quit
