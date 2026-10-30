\\ Seat B driver. Expects globals pp (prime), DD (search precision digits) set before \r of this file.
\\ Everything computed at D2 = DD+400; searches run on values truncated to DD digits.
{
my(p=pp, D=DD, D2=DD+400, u, b, P, mp, d, I, J, N, B, Bex, res, out, rel, Pex, rts, bre, ure, lhs, rhs, idd, m, Ineg, Jneg, Nneg, Bneg, tm, verdict);
default(realprecision, D2);
tm = getabstime();
printf("=== p=%d  p mod 4=%d  D=%d  D2=%d\n", p, p%4, D, D2);
u = pieces(p); m = #u;
b = apply(x->x^p, u);
P = prod(k=1,m,u[k]);
printf("u_k (30 dig): %s\n", apply(x->precision(x,30), u));
printf("P = %s\n", precision(P,40));
lhs = phiq(exp(-p*Pi*sqrt(p)));
rhs = p^(-3/4)*phiq(exp(-Pi*sqrt(p)))*(1+vecsum(u));
printf("identity (direct pieces): agree to %.1f digits\n", agree(lhs,rhs));
res = findminpoly(P, D, 40);
mp = res[1]; d = poldegree(mp);
printf("MINPOLY d=%d verify-digits=%.1f\nMINPOLY %s\n", d, res[2], mp);
printf("MINPOLY polredabs: %s ; disc factor: %s\n", polredabs(mp), factor(abs(nfdisc(mp))));
if(p%4==3, I=d; J=(p-1)/2; N=p, I=d/2; J=eulerphi(4*p)/2; N=4*p);
if(type(I)!="t_INT", error("d odd for p=1 mod 4"));
printf("basis: I=%d J=%d N=%d size=%d\n", I, J, N, I*J);
B = basis(P, I, J, N);
rts = real(select(r->abs(imag(r))<10.^(-D2/2), polroots(mp)));
Pex = rts[1]; for(i=2,#rts, if(abs(rts[i]-P)<abs(Pex-P), Pex=rts[i]));
printf("P = real root of minpoly nearest numeric P (%d real roots); |Pex-P|=%.3e\n", #rts, abs(Pex-P));
Bex = basis(Pex, I, J, N);
bre = vector(m); verdict = 1;
for(k=1,m,
  out = relloop(b[k], B, D); res = out[1];
  if(#out[3]>0, printf("POS k=%d NOTE basis dependent, dropped indices %s\n", k, out[3]));
  if(#res[1]==0, printf("POS k=%d NO RELATION\n",k); verdict=0; next);
  rel = expandrel(res[1], out[2], #B);
  printf("POS k=%d c0=%s coefdig=%.1f digits@D=%.1f digits@D2=%.1f %s\n", k, rel[1], res[4], res[3], res[2], if(rel[1]!=0 && res[2]>D+200, "GENUINE", "NOT-GENUINE"));
  if(!(rel[1]!=0 && res[2]>D+200), verdict=0);
  printf("RELB %d %d %s\n", p, k, rel);
  if(rel[1]!=0, bre[k] = -sum(i=2,#rel, rel[i]*Bex[i-1])/rel[1]));
if(vecmin(apply(x->x!=0,bre))==1,
  ure = apply(x->x^(1/p), bre);
  rhs = p^(-3/4)*phiq(exp(-Pi*sqrt(p)))*(1+vecsum(ure));
  idd = agree(lhs,rhs);
  printf("REBUILT identity: phi(e^{-p pi sqrt p}) matches to %.1f digits (D2=%d)\n", idd, D2);
  printf("REBUILT pieces vs direct: min agreement %.1f digits\n", vecmin(vector(m,k, agree(u[k],ure[k])))),
  printf("REBUILT identity: skipped (missing relation)\n"));
printf("POSITIVE SEARCH ALL GENUINE: %d\n", verdict);
\\ negative control: conductor swapped, same index ranges (p=1 mod 4: J=(p-1)/2 distinct cosines)
if(p%4==3, Nneg=4*p; Jneg=J, Nneg=p; Jneg=(p-1)/2);
Ineg = I;
Bneg = basis(P, Ineg, Jneg, Nneg);
printf("NEG basis: I=%d J=%d N=%d size=%d\n", Ineg, Jneg, Nneg, Ineg*Jneg);
for(k=1,m,
  out = relloop(b[k], Bneg, D); res = out[1];
  if(#out[3]>0, printf("NEG k=%d NOTE basis dependent, dropped %d indices\n", k, #out[3]));
  if(#res[1]==0, printf("NEG k=%d NO RELATION returned\n",k); next);
  printf("NEG k=%d c0digits=%.1f coefdig=%.1f digits@D=%.1f digits@D2=%.1f %s\n", k, cdig([res[1][1]]), res[4], res[3], res[2], if(res[1][1]!=0 && res[2]>D+200, "GENUINE", "NONE(spurious)")));
if(p%4==1,
  Bneg = basis(P, d, (p-1)/2, p);
  printf("NEG2 basis: I=%d J=%d N=%d size=%d\n", d, (p-1)/2, p, d*(p-1)/2);
  for(k=1,m,
    out = relloop(b[k], Bneg, D); res = out[1];
    if(#out[3]>0, printf("NEG2 k=%d NOTE basis dependent, dropped %d indices\n", k, #out[3]));
    if(#res[1]==0, printf("NEG2 k=%d NO RELATION returned\n",k); next);
    printf("NEG2 k=%d coefdig=%.1f digits@D=%.1f digits@D2=%.1f %s\n", k, res[4], res[3], res[2], if(res[1][1]!=0 && res[2]>D+200, "GENUINE", "NONE(spurious)"))));
printf("time %.1f s\n", (getabstime()-tm)/1000.);
}
