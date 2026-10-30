\\ probe_instr.gp - instrument probe only (generic lattice, NOT a test item). v8_stark user-seat, 2026-10-28.
default(nbthreads,1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 60);
w1 = 0.3 + 1.7*I; w2 = 1.1 + 0.2*I;
L = [w1, w2];
print("Im(w1/w2) > 0: ", imag(w1/w2) > 0);
e = elleta(L);
z = 0.17 + 0.05*I;
print("eta1 check: ", abs(ellzeta(L, z + w1) - ellzeta(L, z) - e[1]));
print("eta2 check: ", abs(ellzeta(L, z + w2) - ellzeta(L, z) - e[2]));
print("Legendre e1*w2 - e2*w1 - 2 Pi I: ", abs(e[1]*w2 - e[2]*w1 - 2*Pi*I));
G = elleisnum(L, 4, 1); H = elleisnum(L, 6, 1);
tau = w1/w2;
D1 = (2*Pi/w2)^12 * eta(tau, 1)^24;
print("Delta check: ", abs(D1 - (G^3 - 27*H^2))/abs(D1));
s = ellsigma(L, z);
print("sigma(z) small-z sanity |sigma(z)/z - 1|: ", abs(s/z - 1));
G7 = znstar(7, 1); print("znstar(7) cyc ", G7.cyc, " gen ", G7.gen);
G23 = znstar(23, 1); print("znstar(23) cyc ", G23.cyc, " gen ", G23.gen);
\\ lfun sanity on a known value: zeta-like check L(0, psi) = -B_{1,psi} = h(-7) = 1 for psi = (./7)
qch = [3];
print("L(0,psi) for psi=(./7): ", lfun([G7, qch], 0), " (expect 1 = h(-7)) odd? ", zncharisodd(G7, qch));
th(L, z) = { my(e = elleta(L), M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], ab = matsolve(M, [real(z), imag(z)]~), et = ab[1]*e[1] + ab[2]*e[2]); my(t = L[1]/L[2]); (2*Pi/L[2])^12 * eta(t,1)^24 * exp(-6*et*z) * ellsigma(L, z)^12; }
print("theta periodicity |th(z+w1)|/|th(z)| - 1: ", abs(th(L, z + w1))/abs(th(L, z)) - 1);
print("theta periodicity |th(z+w2)|/|th(z)| - 1: ", abs(th(L, z + w2))/abs(th(L, z)) - 1);
lam = 0.7 - 0.4*I;
print("theta homogeneity |th(lam z, lam L)/th(z,L) - 1|: ", abs(th(lam*L, lam*z)/th(L, z) - 1));
