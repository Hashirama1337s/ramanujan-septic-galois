\ e2_trules.gp -- Weber T-rules with the correct branch q^(n-1/2) = exp(pi i tau (2n-1)) (e_valuations.gp used gp's principal power,
\ which is wrong after tau -> tau+1; its T line is superseded by this file; its other lines only used tau with |arg q| < pi or integer powers).
default(realprecision, 600);
wf(tau)  = exp(-2*Pi*I*tau/48) * prod(n = 1, 2000, 1 + exp(Pi*I*tau*(2*n - 1)));
wf1(tau) = exp(-2*Pi*I*tau/48) * prod(n = 1, 2000, 1 - exp(Pi*I*tau*(2*n - 1)));
wf2(tau) = sqrt(2)*exp(2*Pi*I*tau/24) * prod(n = 1, 2000, 1 + exp(2*Pi*I*tau*n));
digs(x, y) = round(-log(abs(x - y)/abs(y))/log(10));
t = 0.11 + 0.93*I;
print("T rules (f^24(t+1) = -f1^24, f1^24(t+1) = -f^24, f2^24(t+1) = f2^24): ", digs(wf(t+1)^24, -wf1(t)^24), " ", digs(wf1(t+1)^24, -wf(t)^24), " ", digs(wf2(t+1)^24, wf2(t)^24), " digits");
print("S rules (f^24 fixed, f1^24 <-> f2^24): ", digs(wf(-1/t)^24, wf(t)^24), " ", digs(wf1(-1/t)^24, wf2(t)^24), " ", digs(wf2(-1/t)^24, wf1(t)^24), " digits");
{
foreach([11, 19, 23], p, my(tp = (-1 + I*sqrt(p))/2, y = 2/wf(I*sqrt(p))^2, c = (x - 16)^3 - ellj(tp)*x);
  print("p=", p, " tau'=(-1+sqrt(-p))/2: y^12 = -f2(tau')^24: ", digs(y^12, -wf2(tp)^24), " digits; cubic residuals at f^24,-f1^24,-f2^24 (log10): ",
   round(log(abs(subst(c, x, wf(tp)^24)))/log(10)), " ", round(log(abs(subst(c, x, -wf1(tp)^24)))/log(10)), " ", round(log(abs(subst(c, x, -wf2(tp)^24)))/log(10))));
}
quit;
