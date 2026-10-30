\\ k2.gp - sealed test BAR-K2 (v8_stark user-seat, 2026-10-28). D5: Ramanujan's b_1 itself on M = K(q) at p = 23 (h = 3).
\\ One core. Output: k2_out.txt. Do not edit after sealing.
default(nbthreads,1);
print("nbthreads = ", default(nbthreads));
default(realprecision, 120);
print("realprecision = ", default(realprecision));
PASS = 1e-50; FAILNULL = 1e-3; INSTR = 1e-80;
lg10(x) = log(x)/log(10);
ub(x) = if(x == 0, "0 (exact at working precision)", Str("<= 1e", ceil(lg10(x))));
lb(x) = if(x == 0, "0", Str(">= 1e", floor(lg10(x))));
INSTRFAULT = 0; npass = 0; nfail = 0;
instr(name, x) = { my(ok = (x < INSTR)); print("  [instrument] ", name, ": ", ub(x), if(ok, "  ok", "  FAULT")); if(!ok, INSTRFAULT++); }
verdict(name, x, wantpass) = { my(ok = if(wantpass, x < PASS, x > FAILNULL)); print("  ", name, ": |diff| ", if(wantpass, ub(x), lb(x)), if(ok, "  -> as predicted", "  -> NOT AS PREDICTED")); if(ok, npass++, nfail++); ok; }
\\ summary verdict over a list of diffs (all must pass, or all must fail)
vlist(name, V, wantpass) = { my(okc = 0, worst); for(i = 1, #V, if(if(wantpass, V[i] < PASS, V[i] > FAILNULL), okc++));
  worst = if(wantpass, vecmax(V), vecmin(V));
  print("  ", name, ": ", okc, "/", #V, " as predicted; worst |diff| ", if(wantpass, ub(worst), lb(worst)), if(okc == #V, "  -> as predicted", "  -> NOT AS PREDICTED"));
  if(okc == #V, npass++, nfail++); }

\\ ---------- pieces (same code as k1.gp)
rf(a, b, T) = sum(n = -T, T, a^(n*(n+1)/2) * b^(n*(n-1)/2));
bR(p, k) = { my(q = exp(-Pi/sqrt(p)), T = 60); (2 * q^(k^2/p) * rf(q^(p+2*k), q^(p-2*k), T) / rf(q^p, q^p, T))^p; }
th(a, tau) = { my(T = 40); sum(n = -T, T, exp(Pi*I*tau*(n+a)^2)); }
Bk(p, k, tau) = (2 * th(k/p, tau) / th(0, tau))^p;
lab(p, t) = { my(r = t % p); if(r > (p-1)/2, p - r, r); }
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

\\ ---------- lattices, Siegel g (KSY10 (1.3) as in RESULT-V3C l.95), Robert theta (Ferrara 2.1), delta = A^6 |Delta|
lred(L) = { my(w1 = L[1], w2 = L[2], n);
  if(imag(w1/w2) < 0, w1 = -w1);
  for(it = 1, 200, n = round(real(w1/w2)); w1 = w1 - n*w2; if(abs(w1) < abs(w2), my(t = w1); w1 = -w2; w2 = t, break));
  if(imag(w1/w2) <= 0, error("orientation")); [w1, w2]; }
gS(L, z) = { my(M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], r = matsolve(M, [real(z), imag(z)]~), r1 = r[1] - floor(r[1]), r2 = r[2] - floor(r[2]), t = L[1]/L[2], q = exp(2*Pi*I*t), qz = exp(2*Pi*I*(r1*t + r2)), B2 = r1^2 - r1 + 1/6); -q^(B2/2) * exp(Pi*I*r2*(r1 - 1)) * (1 - qz) * prod(n = 1, 80, (1 - q^n*qz)*(1 - q^n/qz)); }
thR(L, z) = { my(e = elleta(L), M = [real(L[1]), real(L[2]); imag(L[1]), imag(L[2])], ab = matsolve(M, [real(z), imag(z)]~)); my(et = ab[1]*e[1] + ab[2]*e[2], t = L[1]/L[2]); (2*Pi/L[2])^12 * eta(t, 1)^24 * exp(-6*et*z) * ellsigma(L, z)^12; }
ldelta(L) = { my(A = abs(imag(L[1]*conj(L[2]))), t = L[1]/L[2]); 6*log(A) + log(abs((2*Pi/L[2])^12 * eta(t, 1)^24)); }

\\ ---------- field K = Q(sqrt -23), embedding x -> I sqrt 23
p = 23; m = (p-1)/2;
print("\n=== p = 23: hypotheses ===");
if(!isprime(p) || p % 8 != 7, error("hypothesis p"));
bnf = bnfinit(x^2 + p, 1);
print("h = ", bnf.no, ", bnfcertify = ", bnfcertify(bnf), ", qfbclassno(-4p) = ", qfbclassno(-4*p), ", #forms = ", #forms(p));
if(bnf.no != qfbclassno(-4*p) || #forms(p) != bnf.no, error("class numbers"));
toC(a) = subst(lift(nfbasistoalg(bnf, a)), x, I*sqrt(p));
latt(id) = { my(H = idealhnf(bnf, id)); lred([toC(H[,1]), toC(H[,2])]); };
qq = idealhnf(bnf, x);
dec = idealprimedec(bnf, 2);
iP = 0; for(i = 1, #dec, if(nfeltval(bnf, (1 + x)/2, dec[i]) > 0, iP = i));
if(iP == 0 || #dec != 2, error("P"));
PP = dec[iP]; PB = dec[3 - iP];
print("P = (2, (1+sqrt-23)/2) found; P principal? ", bnfisprincipal(bnf, PP, 0) == 0);
bnr1 = bnrinit(bnf, 1, 1); bnrq = bnrinit(bnf, qq, 1);
print("Cl cyc ", bnr1.cyc, ", ray class group mod q cyc ", bnrq.cyc, " (expect h m = ", bnf.no*m, ")");
if(prod(i = 1, #bnrq.cyc, bnrq.cyc[i]) != bnf.no*m, error("ray class order"));
\\ rho_k on ideals (Hecke), k = 0,1,2: e(k * log / 3)
rhoI(k, id) = { my(v = bnrisprincipal(bnr1, id, 0)); exp(2*Pi*I*k*sum(i = 1, #v, v[i]/bnr1.cyc[i])); }
G23 = znstar(p, 1);
chiv(chi, a) = exp(2*Pi*I*chareval(G23, chi, a));

\\ ---------- the 33 embeddings sigma_Q sigma_t: data [a, a', b', bQ ideal, t, u, value log|B_t(t_Q + x_Q)|]
EMB = List();
{F = forms(p);
for(i = 1, #F,
  my(Q = F[i], a = Q[1], b = Q[2], c = Q[3]);
  if(a % 2 == 0, my(tmp = a); a = c; b = -b; c = tmp);
  if(gcd(a, 4*p) != 1, error("gcd(a,4p)"));
  my(ap = lift(Mod(a, 4*p)^(-1)), xQ = -ap*b/2, tQ = (b + 2*I*sqrt(p))/(2*a), bp = b/2);
  my(bQ = idealadd(bnf, idealhnf(bnf, a), idealhnf(bnf, bp + x)));
  if(idealnorm(bnf, bQ) != a, error("N b_Q != a"));
  for(t = 1, m,
    my(v = Bk(p, t, tQ + xQ));
    listput(EMB, [a, ap, bp, bQ, t, lift(Mod(ap*t, p)), log(abs(v)), imag(v)/abs(v)])));}
print("embeddings: ", #EMB);
instr("b_1 route R vs Theorem M (principal form, t = 1)", abs(exp(EMB[1][7]) - bR(p, 1))/bR(p, 1));
instr("unit: |sum over 33 embeddings of log|sigma b_1||", abs(sum(i = 1, #EMB, EMB[i][7])));
instr("b_1 real: max relative |Im| over the embeddings with a = 1", vecmax(vector(m, i, abs(EMB[i][8]))));

\\ ---------- element-level prediction (PROOF DRAFT D5-E):
\\ 12 log|sigma_Q sigma_t(b_1)| = p [ G(C1) + G(C2) - 2 G(C3) ] - p [ ldelta(bP) + ldelta(bPbar) - 2 ldelta(b) ],
\\ G(C) := 12 log|g(1; q C^-1)| (= log|theta(1; q C^-1)|), C1 = ubar bbar Pbar, C2 = ubar bbar P, C3 = ubar bbar, ubar = u/2 mod p, u = a' t.
Gq(C) = { my(L = latt(idealmul(bnf, qq, idealinv(bnf, C)))); 12*log(abs(gS(L, 1))); };
GqR(C) = { my(L = latt(idealmul(bnf, qq, idealinv(bnf, C)))); log(abs(thR(L, 1))); };
conjI(id) = idealhnf(bnf, nfgaloisapply(bnf, -x, id));
Dd(b) = ldelta(latt(idealmul(bnf, b, PP))) + ldelta(latt(idealmul(bnf, b, PB))) - 2*ldelta(latt(b));
pred(e, mode) = {
  my(a = e[1], bQ = e[4], u = e[6], ub = lift(Mod(u, p)/2), bb = conjI(bQ), B = bQ, PPx = PP, PBx = PB, w1 = 1, w2 = 1, w3 = -2, useD = 1);
  if(mode == 1, bb = idealmul(bnf, bb, PP); B = idealmul(bnf, bQ, PP));   \\ Z1 wrong class: shift by [P]
  if(mode == 2, w1 = 0; w2 = 0; w3 = 1; useD = 0);                          \\ Z2 wrong level: one conductor-q Robert value, no 2-structure
  if(mode == 3, ub = u);                                                       \\ Z3 wrong u-bar (missing 1/2)
  if(mode == 4, useD = 0);                                                     \\ Z4 no Hilbert-class-field (Delta) term
  my(C3 = idealmul(bnf, ub, bb), C1 = idealmul(bnf, C3, PB), C2 = idealmul(bnf, C3, PP));
  p*(w1*Gq(C1) + w2*Gq(C2) + w3*Gq(C3)) - useD*p*Dd(B); }

print("\n-- instruments for the Robert/Siegel side");
{my(e = EMB[2], C = idealmul(bnf, lift(Mod(e[6], p)/2), conjI(e[4])));
instr("|theta(1;L)| = |g(1;L)|^12 (test lattice of embedding 2)", abs(Gq(C) - GqR(C)));
instr("ray-class invariance: ubar vs ubar + p", abs(Gq(C) - Gq(idealmul(bnf, lift(Mod(e[6], p)/2) + p, conjI(e[4])))));
instr("delta homothety invariance", abs(ldelta(latt(e[4])) - ldelta(latt(idealmul(bnf, 7, e[4])))));}

print("\n-- K2-E (element level, all 33 embeddings): Q1 prediction and nulls Z1-Z4");
{my(V0 = vector(#EMB, i, abs(12*EMB[i][7] - pred(EMB[i], 0))));
vlist("Q1 element-level formula (Siegel g)", V0, 1);
vlist("Q1' same with Robert theta (log|theta| in place of 12 log|g|), first 11 embeddings", vector(m, i, my(e = EMB[i], ub = lift(Mod(e[6], p)/2), bb = conjI(e[4]), C3 = idealmul(bnf, ub, bb)); abs(12*e[7] - (p*(GqR(idealmul(bnf, C3, PB)) + GqR(idealmul(bnf, C3, PP)) - 2*GqR(C3)) - p*Dd(e[4])))), 1);
vlist("Z1 null: wrong ideal class (b -> bP)", vector(#EMB, i, abs(12*EMB[i][7] - pred(EMB[i], 1))), 0);
vlist("Z2 null: wrong level (single conductor-q Robert value)", vector(#EMB, i, abs(12*EMB[i][7] - pred(EMB[i], 2))), 0);
vlist("Z3 null: ubar = u (missing 1/2)", vector(#EMB, i, abs(12*EMB[i][7] - pred(EMB[i], 3))), 0);
vlist("Z4 null: Hilbert-class-field (Delta) term dropped", vector(#EMB, i, abs(12*EMB[i][7] - pred(EMB[i], 4))), 0);}

\\ ---------- character level. LHS(rho_k, chi) = sum_sigma X(sigma) log|sigma b_1|^2, X(sigma_Q sigma_t) = rho_k([b_Q]) chi(a' t^2)
LHS(k, chi, dir) = sum(i = 1, #EMB, my(e = EMB[i], cl = if(dir == 0, e[4], conjI(e[4]))); rhoI(k, cl) * chiv(chi, lift(Mod(e[2]*e[5]^2, p))) * 2*e[7]);
\\ match X = rho_k (x) chi to a character of the ray class group mod q by values on prime ideals of norm < 400 (excluding q)
TESTP = List(); forprime(l = 2, 400, if(l != p, my(dl = idealprimedec(bnf, l)); for(j = 1, #dl, listput(TESTP, dl[j]))));
rayval(c, id) = { my(v = bnrisprincipal(bnrq, id, 0)); exp(2*Pi*I*sum(i = 1, #v, c[i]*v[i]/bnrq.cyc[i])); }
matchray(k, chi) = { my(hits = List());
  forvec(cv = vector(#bnrq.cyc, i, [0, bnrq.cyc[i] - 1]),
    my(ok = 1); for(j = 1, #TESTP, my(P0 = TESTP[j]); if(abs(rayval(cv, P0) - rhoI(k, P0)*chiv(chi, idealnorm(bnf, P0) % p)) > 1e-30, ok = 0; break));
    if(ok, listput(hits, cv)));
  if(#hits != 1, error(Str("character match not unique: ", #hits))); hits[1]; }
rP(k) = rhoI(k, PP);
rPb(k) = rhoI(k, PB);

print("\n-- K2-X (character level, 33 characters X = rho_k (x) chi, k = 0,1,2; chi = [2e], e = 0..10)");
print("PROOF DRAFT D5-X (i) chi != 1: sum X log|sigma b_1|^2 = -p [chi(2)(rho(P) + rho(Pbar)) - 2 chi(4)] L'(0, X)   (L of conductor q)");
print("PROOF DRAFT D5-X (ii) chi = 1, rho != 1: sum X log|sigma b_1|^2 = 2 p m (rho(P) + rho(Pbar) - 2) L'_K(0, rho)   (S = {inf})");
print("Z5 null (old GUESS: sigma_2(b_1) = Stark unit of M/K, S = {inf,q,P}): -2p chi(2)(1 - rho(P) chi(2)) L'_{S0}(0, X)");
{my(Vc = List(), Vn = List(), Vr = List(), Vd = List(), V0 = List(), Vz = List());
for(k = 0, 2, for(e = 0, 10,
  my(chi = [2*e], lhs = LHS(k, chi, 0), lhsd = LHS(k, chi, 1));
  listput(Vd, abs(lhs - lhsd));
  if(k == 0 && e == 0, listput(Vz, abs(lhs)); next);
  if(e != 0,
    my(cv = matchray(k, chi), Ld = lfun([bnrq, cv], 0, 1), c2 = chiv(chi, 2), c4 = chiv(chi, 4));
    my(rhs = -p*(c2*(rP(k) + rPb(k)) - 2*c4)*Ld, guess = -2*p*c2*(1 - rP(k)*c2)*Ld);
    printf("   k=%d chi=[%d]: LHS = %.25g %+.25g*I\n", k, 2*e, real(lhs), imag(lhs));
    if(k == 0, listput(V0, abs(lhs - rhs)), listput(Vc, abs(lhs - rhs)); listput(Vn, abs(lhs - guess))),
    my(Lr = lfun([bnr1, [k]], 0, 1));
    my(rhs = 2*p*m*(rP(k) + rPb(k) - 2)*Lr, guess = 0);
    printf("   k=%d chi=1: LHS = %.25g %+.25g*I\n", k, real(lhs), imag(lhs));
    listput(Vr, abs(lhs - rhs)); listput(Vn, abs(lhs - guess)))));
vlist("X0 trivial character: sum log|sigma b_1|^2 = 0", Vec(Vz), 1);
vlist("calibration (implied by V3C): rho = 1, chi != 1 (10 chars)", Vec(V0), 1);
vlist("Q2 NEW: rho != 1, chi != 1 (20 chars), formula (i)", Vec(Vc), 1);
vlist("Q3 NEW: chi = 1, rho != 1 (2 chars), formula (ii)", Vec(Vr), 1);
vlist("R1 rho vs rho-bar labelling of sigma_Q (predicted DEGENERATE: equal LHS, by complex-conjugation symmetry)", Vec(Vd), 1);
vlist("Z5 null: old GUESS D5 on the 22 rho != 1 characters", Vec(Vn), 0);}

print("\nSUMMARY: as predicted ", npass, ", not as predicted ", nfail, ", instrument faults ", INSTRFAULT);
