\\ k1.gp - sealed test BAR-K1 (v8_stark user-seat, 2026-10-28). Stark identity for Ramanujan's p.206 unit at p = 7, 23.
\\ One core. Output: k1_out.txt. Do not edit after sealing.
default(nbthreads,1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 150);
print("realprecision = ", default(realprecision));
PASS = 1e-50; FAILNULL = 1e-3; INSTR = 1e-100;
lg10(x) = log(x)/log(10);
ub(x) = if(x == 0, "0 (exact at working precision)", Str("<= 1e", ceil(lg10(x))));
lb(x) = if(x == 0, "0", Str(">= 1e", floor(lg10(x))));
INSTRFAULT = 0;
instr(name, x) = { my(ok = (x < INSTR)); print("  [instrument] ", name, ": ", ub(x), if(ok, "  ok", "  FAULT")); if(!ok, INSTRFAULT++); }

\\ ---------- Ramanujan's own definition (route R): u_k = 2 q^(k^2/p) f(q^(p+2k), q^(p-2k)) / phi(q^p), q = exp(-Pi/sqrt p)
rf(a, b, T) = sum(n = -T, T, a^(n*(n+1)/2) * b^(n*(n-1)/2));
bR(p, k) = { my(q = exp(-Pi/sqrt(p)), T = 60); (2 * q^(k^2/p) * rf(q^(p+2*k), q^(p-2*k), T) / rf(q^p, q^p, T))^p; }

\\ ---------- Theorem M route (RESULT-M1-v2 sec. 1): v_{Q,k} = B_k(t_Q + x_Q)
th(a, tau) = { my(T = 40); sum(n = -T, T, exp(Pi*I*tau*(n+a)^2)); }
Bk(p, k, tau) = (2 * th(k/p, tau) / th(0, tau))^p;
lab(p, t) = { my(r = t % p); if(r > (p-1)/2, p - r, r); }
sqk(p, c) = { my(m = (p-1)/2); for(k = 1, m, if((k^2 - c) % p == 0, return(k))); error("not a square"); }
forms(p) = {
  my(D = -4*p, L = List());
  for(a = 1, sqrtint(4*p\3) + 1,
    for(b = -a + 1, a,
      my(num = b^2 - D);
      if(num % (4*a) == 0,
        my(c = num/(4*a));
        if(a <= c && !(b < 0 && a == c) && gcd([a, b, c]) == 1, listput(L, [a, b, c])))));
  Vec(L);
}
\\ iota_s(N): N = norm of b_1 from F_p to Q(zeta_p)^+, embedding zeta -> exp(2 Pi I s/p); product over the h forms of sigma_Q sigma_t (b_1), t^2 = a_Q s
iotaN(p, s) = {
  my(F = forms(p), pr = 1);
  for(i = 1, #F,
    my(Q = F[i], a = Q[1], b = Q[2], c = Q[3]);
    if(a % 2 == 0, my(tmp = a); a = c; b = -b; c = tmp);
    if(gcd(a, 4*p) != 1, error("hypothesis: gcd(a,4p) != 1"));
    if(kronecker(a*s, p) != 1, error("hypothesis: a_Q s not a square mod p"));
    my(ap = lift(Mod(a, 4*p)^(-1)), xQ = -ap*b/2, tQ = (b + 2*I*sqrt(p))/(2*a));
    my(t = sqk(p, (a*s) % p));
    pr *= Bk(p, t, tQ + xQ));
  pr;
}

\\ ---------- characters
chiv(G, chi, a) = exp(2*Pi*I*chareval(G, chi, a));

\\ Stark side for p (= 7 mod 8), character chi: returns [LHS_S3, LHS_S0, RHS, null1 shift, null2 conj, null3 |.| unsquared]
starkrow(p, G, chi, psich, NV) = {
  my(chps = charmul(G, chi, psich));
  if(zncharisodd(G, chi), error("hypothesis: chi odd"));
  if(!zncharisodd(G, chps), error("hypothesis: chi psi even"));
  my(L0c = lfun([G, chi], 0), L1c = lfun([G, chi], 0, 1), L0p = lfun([G, chps], 0), L1p = lfun([G, chps], 0, 1));
  my(LS0 = L0c*L0p, dLS0 = L1c*L0p + L0c*L1p, c2 = chiv(G, chi, 2));
  my(dLS3 = c2*log(2)*LS0 + (1 - c2)*dLS0);
  my(sq = select(s -> kronecker(s, p) == 1, [1..p-1]));
  my(R = 0, R1 = 0, R2 = 0, R3 = 0);
  for(i = 1, #sq, my(s = sq[i], s2 = (2*s) % p);
    R  += chiv(G, chi, s) * log(abs(NV[s2])^2);
    R1 += chiv(G, chi, s) * log(abs(NV[s])^2);
    R2 += conj(chiv(G, chi, s)) * log(abs(NV[s2])^2);
    R3 += chiv(G, chi, s) * log(abs(NV[s2])));
  my(W = 2*p);
  [dLS3, dLS0, -R/W, -R1/W, -R2/W, -R3/W, c2];
}

\\ ---------- Robert theta (Ferrara arXiv:1904.10561 sec. 2.1 as printed): theta(z,L) = Delta(L) exp(-6 eta(z,L) z) sigma(z,L)^12,
\\ eta(z,L) = R-linear extension of the quasi-periods (PARI elleta), Delta(L) = (2 Pi/w2)^12 q prod(1-q^n)^24
thR(L, z) = { my(e = elleta(L), M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], ab = matsolve(M, [real(z), imag(z)]~)); my(et = ab[1]*e[1] + ab[2]*e[2], t = L[1]/L[2]); (2*Pi/L[2])^12 * eta(t, 1)^24 * exp(-6*et*z) * ellsigma(L, z)^12; }

nfail = 0; npass = 0;
verdict(name, x, wantpass) = { my(ok = if(wantpass, x < PASS, x > FAILNULL)); print("  ", name, ": |diff| ", if(wantpass, ub(x), lb(x)), if(ok, "  -> as predicted", "  -> NOT AS PREDICTED")); if(ok, npass++, nfail++); }

\\ ======================= p = 7 =======================
p = 7; m = (p-1)/2;
print("\n=== p = 7 ===");
print("hypotheses: isprime ", isprime(p), ", p mod 8 = ", p % 8, ", h(-4p) = ", qfbclassno(-4*p), ", forms ", forms(p));
if(!isprime(p) || p % 8 != 7, error("hypothesis p"));
if(#forms(p) != qfbclassno(-4*p), error("form count"));
\\ instrument: route R vs Theorem M route; sine control u_1^7 = d2^6/d1^2
for(k = 1, m, instr(Str("b_", k, " route R vs Theorem M"), abs(bR(p, k) - Bk(p, k, I*sqrt(p)))/abs(bR(p, k))));
dq(j) = sin((j+1)*Pi/7)/sin(Pi/7);
instr("sine control b_1 = d2^6/d1^2", abs(bR(7, 1) - dq(2)^6/dq(1)^2));
instr("unit: |log|b_1 b_2 b_3||", abs(log(abs(bR(7,1)*bR(7,2)*bR(7,3)))));
NV7 = vector(p-1, s, if(kronecker(s, p) == 1, iotaN(p, s), 0));
for(s = 1, p-1, if(kronecker(s, p) == 1, instr(Str("iota_", s, "(N) = b_", sqk(p, s), " (C2 label)"), abs(NV7[s] - bR(p, sqk(p, s)))/abs(NV7[s]))));
G7 = znstar(7, 1); psi7 = [3];
for(a = 1, 6, if(round(real(chiv(G7, psi7, a))) != kronecker(a, 7), error("psi is not (./7)")));
print("characters: cyc ", G7.cyc, " gen ", G7.gen, "; psi = [3] checked = (./7)");
print("\n-- K1-a (primary): chi = [2] (chi(3) = e(1/3)); and its conjugate [4]");
{foreach([[2], [4]], chi,
  my(r = starkrow(p, G7, chi, psi7, NV7));
  print(" chi = ", chi, ", chi(2) = ", r[7], ", L'_S(0,chi) [S = {inf,q,P}] = ", r[1]);
  verdict("P1 Stark identity, eps = sigma_2(N), W = 2p, log|.|^2", abs(r[1] - r[3]), 1);
  verdict("N1 null: no sigma_2 shift", abs(r[1] - r[4]), 0);
  verdict("N2 null: conjugate character on the unit side", abs(r[1] - r[5]), 0);
  verdict("N3 null: log|.| not squared", abs(r[1] - r[6]), 0);
  verdict("N4 null: S = {inf,q} (Euler factor at P kept)", abs(r[2] - r[3]), 0));}

print("\n-- K1-b/K1-c: Robert units at p = 7 (lattices (sqrt-7/nu) O_K, nu = 1, w, 2 for d = 1, 2, 4)");
w = (1 + sqrt(-7))/2;
latt(nu) = { my(c = sqrt(-7)/nu); [c*w, c]; };
nud = [1, w, 0, 2];
for(d = 1, 4, if(d == 1 || d == 2 || d == 4, my(nn = norm(nud[d])); if(round(real(nn)) != d, error("N(nu_d) != d"))));
Rv = vector(4, d, if(d == 1 || d == 2 || d == 4, thR(latt(nud[d]), 1), 0));
{foreach([1, 2, 4], d,
  my(L = latt(nud[d]));
  my(per = abs(abs(thR(L, 1 + L[1]))/abs(Rv[d]) - 1), hom = abs(thR(L/(1 + I/3), 1/(1 + I/3))/Rv[d] - 1));
  my(e = elleisnum(L, 4, 1), f6 = elleisnum(L, 6, 1), Dl = (2*Pi/L[2])^12 * eta(L[1]/L[2], 1)^24);
  instr(Str("theta periodicity d=", d), per); instr(Str("theta homogeneity d=", d), hom);
  instr(Str("Delta = g2^3 - 27 g3^2, d=", d), abs(Dl - (e^3 - 27*f6^2))/abs(Dl)));}
print("K1-b (Robert match): 6 log b_{k(2s)} = 7 (log|R(s)| - log|R(4s)|), s = 1, 2, 4");
{foreach([1, 2, 4], s,
  my(rhs = 7*(log(abs(Rv[s])) - log(abs(Rv[(4*s) % 7]))));
  verdict(Str("P4 s=", s), abs(6*log(bR(7, sqk(7, (2*s) % 7))) - rhs), 1);
  verdict(Str("N6 null s=", s, " (unshifted b_{k(s)})"), abs(6*log(bR(7, sqk(7, s))) - rhs), 0));}
print("K1-c (Ferrara Thm 2.8 with chi(sigma) inserted, |.|_v = |.|^2, S = {inf, q}, f = 7, w_f = 1)");
{foreach([[2], [4]], chi,
  my(r = starkrow(p, G7, chi, psi7, NV7));
  my(withchi = -(1/(12*7*1)) * sum(i = 1, 3, my(d = [1, 2, 4][i]); chiv(G7, chi, d) * log(abs(Rv[d]^7)^2)));
  my(nochi = -(1/(12*7*1)) * sum(i = 1, 3, my(d = [1, 2, 4][i]); log(abs(Rv[d]^7)^2)));
  print(" chi = ", chi, ": L'_S0(0,chi) = ", r[2]);
  verdict("P3 Thm 2.8 with chi(sigma)", abs(r[2] - withchi), 1);
  verdict("N5 null: Thm 2.8 as printed (no chi(sigma))", abs(r[2] - nochi), 0));}

\\ ======================= p = 23 =======================
p = 23; m = (p-1)/2;
print("\n=== p = 23 ===");
print("hypotheses: isprime ", isprime(p), ", p mod 8 = ", p % 8, ", h(-4p) = ", qfbclassno(-4*p), ", forms ", forms(p));
if(!isprime(p) || p % 8 != 7, error("hypothesis p"));
if(#forms(p) != qfbclassno(-4*p), error("form count"));
NV23 = vector(p-1, s, if(kronecker(s, p) == 1, iotaN(p, s), 0));
instr("max |Im iota_s(N)|/|iota_s(N)|", vecmax(vector(p-1, s, if(NV23[s] != 0, abs(imag(NV23[s]))/abs(NV23[s]), 0))));
instr("unit: |sum_s log|iota_s(N)||", abs(sum(s = 1, p-1, if(NV23[s] != 0, log(abs(NV23[s])), 0))));
instr("iota_1(N) principal factor = b_1 (route R)", abs(Bk(23, 1, I*sqrt(23)) - bR(23, 1))/bR(23, 1));
G23 = znstar(23, 1); psi23 = [11];
for(a = 1, 22, if(round(real(chiv(G23, psi23, a))) != kronecker(a, 23), error("psi is not (./23)")));
print("characters: cyc ", G23.cyc, " gen ", G23.gen, "; psi = [11] checked = (./23)");
print("-- K1-d: all 10 nontrivial even chi = [2e], e = 1..10");
{for(e = 1, 10,
  my(chi = [2*e], r = starkrow(p, G23, chi, psi23, NV23));
  print(" chi = ", chi, ", chi(2) = ", r[7]);
  verdict("P2 Stark identity", abs(r[1] - r[3]), 1);
  verdict("N1 null shift", abs(r[1] - r[4]), 0);
  verdict("N2 null conj", abs(r[1] - r[5]), 0);
  verdict("N3 null unsquared", abs(r[1] - r[6]), 0);
  verdict("N4 null Euler", abs(r[2] - r[3]), 0));}

print("\nSUMMARY: as predicted ", npass, ", not as predicted ", nfail, ", instrument faults ", INSTRFAULT);
