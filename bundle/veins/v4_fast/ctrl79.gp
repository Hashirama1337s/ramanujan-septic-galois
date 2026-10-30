\\ AMENDMENT-SWEEP2-4 positive control as sealed: the b_1 of the LLL run (W = 31200, high precision 31600) must be a root of
\\ G_79 (fast method, built at only 3918 digits) to >= 0.9 W = 28080 digits.
default(realprecision, 31700);
thf(a, b) = { my(s = 1., n = 1, t); while(1, t = a^(n*(n+1)/2)*b^(n*(n-1)/2) + a^(n*(n-1)/2)*b^(n*(n+1)/2); s += t; if(abs(t) < 10.^-31750, break); n++); s; }
p = 79; q = exp(-Pi/sqrt(p));
u1 = 2*q^(1/p)*thf(q^(p+2), q^(p-2))/thf(q^p, q^p);
b1 = u1^p;
G = read("veins/v4_fast/minpoly_p79.gp");
r = subst(G, 'x, b1);
dG = abs(subst(G', 'x, b1));
print("p=79 control: |G(b_1)| = 10^", floor(log(abs(r))/log(10)), "  |G'(b_1)| = 10^", floor(log(dG)/log(10)), "  => b_1 agrees with a root of G to ~", floor(-log(abs(r)/dG)/log(10)), " digits (bar: >= 28080)");
quit
