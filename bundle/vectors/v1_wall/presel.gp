\\ presel.gp -- machinery checks on CONTROLS ONLY (before BAR-W1 is sealed). No non-control m is evaluated here.
read("vectors/v1_wall/wall.gp");
\\ theta reducer vs direct sum at a low point with a nonzero second characteristic
default(realprecision, 120);
{ my(z = 0.3 + 0.21*I, a = th(0, 1/3, z), b = thdirect(0, 1/3, z)); print("reducer check th[0,1/3] at low z: 1e-", dig(abs(a-b)/abs(b))); }
\\ S-relation W_1(i sqrt m) = B_1(i / sqrt m) at a control point (m = 3)
{ my(a = Wv(3, 1, I*sqrt(3)), b = Bv(3, 1, I/sqrt(3))); print("W_1(i sqrt3) vs B_1(i/sqrt3): 1e-", dig(abs(a-b)/abs(b)), "  value ", a); }
\\ BR Cor 3.7 (Thm 3.3, n = 3): u^3 = 2/(2^(1/3)-1)
{ my(a = Wv(3, 1, I*sqrt(3))); print("BR Cor 3.7 check: 1e-", dig(abs(a - 2/(2^(1/3)-1)))); }
\\ BR Cor 3.9 (Thm 3.3, n = 5): u^3 = 2(sqrt3 + sqrt5)  [control m = 5, cubic W]
{ my(a = Wv(3, 1, I*sqrt(5))); print("BR Cor 3.9 check: 1e-", dig(abs(a - 2*(sqrt(3)+sqrt(5))))); }
\\ BR Cor 3.4: cubic B at m = 3 equals 2 (u = 2^(1/3))
{ my(a = Bv(3, 1, I*sqrt(3))); print("BR Cor 3.4 check (B, m=3): 1e-", dig(abs(a - 2))); }
\\ BR Cor 5.4: quintic u, v at q = e^{-pi/sqrt5}... B_1, B_2 at i sqrt 5; u^5 = 2(1+tan(pi/5))/(1-sin(pi/5))
{ my(a = Bv(5, 1, I*sqrt(5)), b = Bv(5, 2, I*sqrt(5)));
  print("BR Cor 5.4 check u^5: 1e-", dig(abs(a - 2*(1+tan(Pi/5))/(1-sin(Pi/5)))), "  v^5: 1e-", dig(abs(b - 2*(1-tan(Pi/5))/(1+sin(Pi/5))))); }
\\ engine on controls
wone("CTRL", 3, 3, "B", 0);
wone("CTRL", 3, 3, "W", 0);
wone("CTRL", 5, 3, "W", 0);
wone("CTRL", 5, 5, "B", 0);
print("BR Cor 3.9 polynomial x^4-64x^2+64 expected for cubic W m=5");
quit;
