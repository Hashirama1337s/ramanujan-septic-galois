\\ e_valuations.gp -- (i) y^12 = -f2(tau')^24, y = 2/f(sqrt -p)^2, tau' = (-1+sqrt -p)/2  (p = 3 mod 4)
\\ (ii) 2-adic Newton polygon of the minimal polynomial of Y = y^4: all slopes equal (uniform valuation at all primes over 2)?
\\ (iii) Weber transformation rules on 24th powers: T: f^24 -> -f1^24, f1^24 -> -f^24, f2^24 -> f2^24;  S: f^24 fixed, f1^24 <-> f2^24
default(realprecision, 600);
wf(tau)  = { my(q = exp(2*Pi*I*tau)); exp(-2*Pi*I*tau/48) * prod(n = 1, 2000, 1 + q^(n - 1/2)); }
wf1(tau) = { my(q = exp(2*Pi*I*tau)); exp(-2*Pi*I*tau/48) * prod(n = 1, 2000, 1 - q^(n - 1/2)); }
wf2(tau) = { my(q = exp(2*Pi*I*tau)); sqrt(2)*exp(2*Pi*I*tau/24) * prod(n = 1, 2000, 1 + q^n); }
digs(x, y) = if(x == y, default(realprecision), round(-log(abs(x - y)/abs(y))/log(10)));
{
foreach([7, 11, 19, 23, 31], p, my(y = 2/wf(I*sqrt(p))^2, tp = (-1 + I*sqrt(p))/2);
  print("p=", p, ": y^12 = -f2(tau')^24 to ", digs(y^12, -wf2(tp)^24), " digits"));
my(t = 0.11 + 0.93*I);
print("T rules: ", digs(wf(t+1)^24, -wf1(t)^24), " ", digs(wf1(t+1)^24, -wf(t)^24), " ", digs(wf2(t+1)^24, wf2(t)^24), " digits");
print("S rules: ", digs(wf(-1/t)^24, wf(t)^24), " ", digs(wf1(-1/t)^24, wf2(t)^24), " ", digs(wf2(-1/t)^24, wf1(t)^24), " digits");
}
default(realprecision, 1500);
{
foreach([23, 31, 47, 71, 11, 19, 59, 83, 5, 13, 17, 29, 41], p,
  my(h = qfbclassno(-4*p), Y = (2/wf(I*sqrt(p))^2)^4, P);
  P = algdep(Y, h);
  print("p=", p, " (p mod 8 = ", p % 8, "), h=", h, ": 2-adic Newton slopes of minpoly(Y): ", newtonpoly(P, 2)));
}
quit;
