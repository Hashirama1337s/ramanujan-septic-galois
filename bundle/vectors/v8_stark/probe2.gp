\\ probe2.gp - instrument probe for BAR-K2 (PARI conventions only; generic lattice; no test quantity). 2026-10-28.
default(nbthreads,1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 60);
thR(L, z) = { my(e = elleta(L), M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], ab = matsolve(M, [real(z), imag(z)]~)); my(et = ab[1]*e[1] + ab[2]*e[2], t = L[1]/L[2]); (2*Pi/L[2])^12 * eta(t, 1)^24 * exp(-6*et*z) * ellsigma(L, z)^12; }
gS(L, z) = { my(M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], r = matsolve(M, [real(z), imag(z)]~), r1 = r[1] - floor(r[1]), r2 = r[2] - floor(r[2]), t = L[1]/L[2], q = exp(2*Pi*I*t), qz = exp(2*Pi*I*(r1*t + r2)), B2 = r1^2 - r1 + 1/6); -q^(B2/2) * exp(Pi*I*r2*(r1 - 1)) * (1 - qz) * prod(n = 1, 80, (1 - q^n*qz)*(1 - q^n/qz)); }
L = [0.3 + 1.7*I, 1.1 + 0.2*I]; z = 0.37 + 0.21*I;
print("|theta| vs |g|^12: ", abs(abs(thR(L, z)) - abs(gS(L, z))^12)/abs(thR(L, z)));
bnf = bnfinit(x^2 + 23, 1); print("h = ", bnf.no, " cyc ", bnf.cyc, " zk ", bnf.zk, " certify ", bnfcertify(bnf));
q = idealhnf(bnf, x); bnr = bnrinit(bnf, q, 1); print("ray cyc mod q: ", bnr.cyc);
bnr1 = bnrinit(bnf, 1, 1); print("cl cyc: ", bnr1.cyc);
dec = idealprimedec(bnf, 2); print("P cands: ", vector(#dec, i, nfeltval(bnf, (1 + x)/2, dec[i])));
print("chareval test: ", chareval(bnr1, [1], bnrisprincipal(bnr1, dec[1], 0)));
print("lfun L'(0,rho): ", lfun([bnr1, [1]], 0, 1));
print("zk to complex: ", subst(lift(nfbasistoalg(bnf, [0, 1]~)), x, I*sqrt(23)));
