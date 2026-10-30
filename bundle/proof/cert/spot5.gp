/* independent spot-check (lead seat): p = 5, b_1 = u_1^5 vs 4 s4 s5 / (s1 s3^2 s6 s8), s_j = 2 sin(pi j/20) */
default(realprecision, 600);
thf(a, b) = {my(s = 1., n = 1, t); while(1, t = a^(n*(n+1)/2)*b^(n*(n-1)/2) + a^(n*(n-1)/2)*b^(n*(n+1)/2); s += t; if(abs(t) < 10.^-620, break); n++); s;}
p = 5; q = exp(-Pi/sqrt(p));
u1 = 2*q^(1/p)*thf(q^(p+2), q^(p-2))/thf(q^p, q^p);
b1 = u1^p;
s(j) = 2*sin(Pi*j/20);
c = 4*s(4)*s(5)/(s(1)*s(3)^2*s(6)*s(8));
print("b1 = ", precision(b1, 20));
print("c  = ", precision(c, 20));
print("log10|b1 - c| = ", if(b1 == c, -600, floor(log(abs(b1 - c))/log(10))));
/* negative control: drop one factor */
c2 = 4*s(4)*s(5)/(s(1)*s(3)^2*s(6)*s(7));
print("control (s8 -> s7) log10|b1 - c2| = ", floor(log(abs(b1 - c2))/log(10)));
quit
