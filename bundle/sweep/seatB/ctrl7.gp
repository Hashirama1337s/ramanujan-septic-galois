\r libB.gp
default(realprecision, 700);
{
my(u=pieces(7), c=Pi/7, tgt);
tgt = [(cos(2*c)/(2*cos(3*c)^2))^(2/7), (cos(c)/(2*cos(2*c)^2))^(2/7), (cos(3*c)/(2*cos(c)^2))^(2/7)];
for(k=1,3, printf("p=7 k=%d u=%s target=%s agree=%.1f digits\n", k, precision(u[k],25), precision(tgt[k],25), -log(abs(u[k]-tgt[k])/abs(tgt[k]))/log(10)));
my(lhs=phiq(exp(-7*Pi*sqrt(7))), rhs=7^(-3/4)*phiq(exp(-Pi*sqrt(7)))*(1+vecsum(u)));
printf("p=7 identity agree=%.1f digits\n", -log(abs(lhs-rhs)/abs(lhs))/log(10));
\\ cross-check the product f against a theta SERIES once (independent sanity of fprod)
my(a=exp(-1.3), bb=exp(-0.7), s=sum(n=-200,200, a^(n*(n+1)/2)*bb^(n*(n-1)/2)));
printf("fprod vs series: agree=%.1f digits\n", -log(abs(s-fprod(a,bb))/abs(s))/log(10));
}
\q
