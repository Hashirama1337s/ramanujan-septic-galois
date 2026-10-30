\\ v4.gp -- uniform conjugation B_1(i sqrt m) -> B_2(i sqrt m) for odd m with 5 | m, by a Class I* matrix (M = I mod 4, 5 | M_12).
\\ d1 = 13 mod 20, d1 = 1 mod every prime of m other than 5 (CRT); d3 = 20; d4 = d1^{-1} mod 80, d2 = (d1 d4 - 1)/20 (= 0 mod 4);
\\ a = d1^2 + 400 m, b = 2(d1 d2 + 20 m d4), y = -a' b/2 mod 20 (KSY25 Prop 4.1), M = [d4 + 20 y, d2 + y d1; 20, d1].
read("vectors/v1_wall/wall.gp");
default(realprecision, 120);
pick(m) = { my(r = 1, F = factor(m)[, 1]); for(i = 1, #F, if(F[i] != 5, r *= F[i])); lift(chinese(Mod(13, 20), Mod(1, r))); }
v4(m) = {
  my(n = 5, k = 1, kp = 2, d1 = pick(m), d3 = 20, d4 = lift(Mod(d1, 80)^-1), d2 = (d1*d4 - 1)/20, a, b, ap, y, M, A, B, C, D,
     s1, s2, c1, c2, E, z1, z2);
  a = d1^2 + 400*m; b = 2*(d1*d2 + 20*m*d4); ap = lift(Mod(a, 20)^-1); y = lift(Mod(-ap*b/2, 20));
  M = [d4 + 20*y, d2 + y*d1; 20, d1]; [A, B, C, D] = [M[1,1], M[1,2], M[2,1], M[2,2]];
  s1 = ((n+2*k)*A + n*C - n - 2*kp)/(2*n); s2 = ((n+2*k)*B + n*D - n)/(2*n); c1 = (A+C-1)/2; c2 = (B+D-1)/2;
  E = -(k-kp) + 2*(s1*s2+s1+s2) - n*s1 + (n+2*kp)*s2 - 2*(c1*c2+c1+c2) + n*(c1-c2);
  z1 = Bv(5, 1, act(M, I*sqrt(m))); z2 = Bv(5, 2, I*sqrt(m));
  print("m=", m, " d1=", d1, " gcd(a,20m)=", gcd(a, 20*m), " M=", M, " det=", matdet(M), " M mod 4=", M % 4, " A mod 5=", A % 5,
        " B mod 5=", B % 5, " s1,s2,c1,c2 integral=", type(s1)=="t_INT" && type(s2)=="t_INT", " E=", E, " E mod 4=", E % 4,
        " |B1(M tau)-B2(tau)|/|B2|=1e-", dig(abs(z1 - z2)/abs(z2)));
}
act(M, z) = (M[1,1]*z + M[1,2])/(M[2,1]*z + M[2,2]);
v4(245); v4(35); v4(1225); v4(5); v4(15); v4(105);
\\ all 18 cosets of Gamma*_5 for p, with orders (incl. zeros), and all 12 for B_1^(3)
quit;
