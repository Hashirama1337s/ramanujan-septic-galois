\ referee POST HOC checks for v8_stark (not sealed; referee's own). One core.
default(nbthreads,1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 60);
th(a, tau) = { my(T = 40); sum(n = -T, T, exp(Pi*I*tau*(n+a)^2)); }
Bk(p, k, tau) = (2 * th(k/p, tau) / th(0, tau))^p;
sqk(p, c) = { my(m = (p-1)/2); for(k = 1, m, if((k^2 - c) % p == 0, return(k))); error("not a square"); }
forms(p) = { my(D = -4*p, L = List()); for(a = 1, sqrtint(4*p\3) + 1, for(b = -a + 1, a, my(num = b^2 - D); if(num % (4*a) == 0, my(c = num/(4*a)); if(a <= c && !(b < 0 && a == c) && gcd([a, b, c]) == 1, listput(L, [a, b, c]))))); Vec(L); }
iotaN(p, s) = { my(F = forms(p), pr = 1); for(i = 1, #F, my(Q = F[i], a = Q[1], b = Q[2], c = Q[3]); if(a % 2 == 0, my(tmp = a); a = c; b = -b; c = tmp); my(ap = lift(Mod(a, 4*p)^(-1)), xQ = -ap*b/2, tQ = (b + 2*I*sqrt(p))/(2*a)); my(t = sqk(p, (a*s) % p)); pr *= Bk(p, t, tQ + xQ)); pr; }
thR(L, z) = { my(e = elleta(L), M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], ab = matsolve(M, [real(z), imag(z)]~)); my(et = ab[1]*e[1] + ab[2]*e[2], t = L[1]/L[2]); (2*Pi/L[2])^12 * eta(t, 1)^24 * exp(-6*et*z) * ellsigma(L, z)^12; }
chiv(G, chi, a) = exp(2*Pi*I*chareval(G, chi, a));
{foreach([7, 23], p, my(G = znstar(p, 1), mx = 0); for(e = 1, (p-3)/2, my(chi = [2*e]); my(lhs = lfun([G, chi], 0, 1), rhs = -(1/2)*sum(a = 1, p-1, chiv(G, chi, a)*log(abs(1 - exp(2*Pi*I*a/p))))); mx = max(mx, abs(lhs - rhs))); print("Lerch form p=", p, ": max |L'(0,chi) + C_chi/2| = ", mx));}
p = 23; w = (1 + sqrt(-p))/2;
reps = [[1, 1], [2, 1], [2, -1]];
nrm(x, y) = x^2 + x*y + 6*y^2;
findnu(t, skip) = { my(cnt = 0); for(y = 0, 30, for(x = -30, 30, my(n = nrm(x, y)); if(n % p != 0 && (n - t) % p == 0, cnt++; if(cnt > skip, return(x + y*w))))); error("no nu"); }
qcinv(r, nu) = { my(a = r[1], b = r[2], L = [sqrt(-p)*a/(a*nu), sqrt(-p)*((-b - sqrt(-p))/2)/(a*nu)]); if(imag(L[1]/L[2]) < 0, L = [L[2], L[1]]); L; }
logE(sres, skip) = { my(tot = 0); for(i = 1, 3, my(r = reps[i], t = lift(Mod(sres, p)/r[1]), nu = findnu(t, skip)); if((r[1]*norm(nu) - sres) % p != 0, error("norm residue")); tot += log(abs(thR(qcinv(r, nu), 1)))); tot; }
sq = select(s -> kronecker(s, p) == 1, [1..p-1]);
h2 = lift(Mod(2, p)^(-1));
mx = 0; mn1 = 1e9; mn2 = 1e9; mxrep = 0; sumE = 0;
{for(i = 1, #sq, my(s = sq[i]); my(lhs = 6*log(abs(iotaN(p, (2*s) % p)))); my(rhs = p*(logE(s, 0) - logE((s*h2) % p, 0))); my(rnull = p*(logE(s, 0) - logE((2*s) % p, 0))); my(lnull = 6*log(abs(iotaN(p, s)))); mx = max(mx, abs(lhs - rhs)); mn1 = min(mn1, abs(lhs - rnull)); mn2 = min(mn2, abs(lnull - rhs)); mxrep = max(mxrep, abs(logE(s, 0) - logE(s, 3))));}
print("D2 p=23: max |6 log|iota_s eps| - Robert side| = ", mx);
print("D2 p=23 null sigma_2 instead of sigma_2^-1: min diff = ", mn1);
print("D2 p=23 null unshifted N: min diff = ", mn2);
print("D2 p=23 representative independence of log|E|: max diff = ", mxrep);
p = 7; w7 = (1 + sqrt(-7))/2; latt(nu) = { my(c = sqrt(-7)/nu); [c*w7, c]; };
nud = [1, w7, 0, 2]; Rv = vector(4, d, if(d == 1 || d == 2 || d == 4, thR(latt(nud[d]), 1), 0));
mn = 1e9; {foreach([1, 2, 4], s, mn = min(mn, abs(6*log(abs(iotaN(7, (2*s) % 7))) - 7*(log(abs(Rv[s])) - log(abs(Rv[(2*s) % 7]))))));}
print("p=7 null Robert sigma_2 (not inverse): min diff = ", mn);
G7 = znstar(7, 1); psi7 = [3];
{foreach([[2], [4]], chi, my(d0 = lfun([G7, chi], 0, 1)*lfun([G7, charmul(G7, chi, psi7)], 0)); my(wb = -(1/84)*sum(i = 1, 3, my(d = [1, 2, 4][i]); conj(chiv(G7, chi, d))*log(abs(Rv[d]^7)^2))); my(wc = -(1/84)*sum(i = 1, 3, my(d = [1, 2, 4][i]); chiv(G7, chi, d)*log(abs(Rv[d]^7)^2))); print("p=7 chi=", chi, ": Thm2.8 with chi |diff| = ", abs(d0 - wc), "; with chibar |diff| = ", abs(d0 - wb)));}
p = 31; G = znstar(31, 1); NV = vector(p-1, s, if(kronecker(s, p) == 1, iotaN(p, s), 0));
{for(e = 1, 14, my(chi = [2*e]); if(abs(chiv(G, chi, 2) - 1) < 1e-30, my(R = sum(s = 1, p-1, if(kronecker(s, p) == 1, chiv(G, chi, s)*log(abs(NV[(2*s) % p])^2), 0))); print("p=31 chi=", chi, " chi(2)=1: |RHS sum| = ", abs(R))));}
