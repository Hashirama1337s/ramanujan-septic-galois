# DICTIONARY-SKELETON: Ramanujan's p.206 pieces as Stark units (boss #2). 2026-10-28. Internal; not for release.
User-seat draft. Status words: PROVED-ELSEWHERE (lab result, AI-refereed; cited), PROOF DRAFT (written here, unrefereed),
OPEN, GUESS (stated only to be tested). Audit of every input: AUDIT-USE.md. Sealed numerics: BAR-K1.md (+ AMENDMENT-K1a.md), k1_out.txt.

## In plain words
Stark's conjecture says: for certain number fields there is one special number (a "Stark unit") whose sizes, measured in all the
field's mirror images, add up (with the right weights) to the slope of an L-function at zero. Over fields like Q(sqrt -7) this is a
theorem, and the special numbers are built from elliptic functions. Our question: are Ramanujan's lost-notebook pieces these special numbers?
- **Answer so far, for primes p that leave remainder 7 when divided by 8:** yes, after one step. Multiply b_1 by all its "twins" that
  share the same p-th roots of unity (this is the norm N), then apply the symmetry zeta -> zeta^2. The result is exactly the Stark unit
  of the field Q(zeta_p) over Q(sqrt -p), for the set of places {infinity, sqrt -p, one prime above 2}. The extra prime above 2 is
  Ramanujan's "pinched" lattice showing through.
- **Checked to 150 digits** at p = 7 (the classic lost-notebook case) and p = 23 (all 10 characters), with four deliberately wrong
  versions failing. We also wrote the same number as an explicit quotient of Robert's elliptic units (the textbook Stark units), and that
  matched too.
- **Scope fix (REFEREE-K1):** the statement above is about the sigma_2-twin of the NORM of b_1, up to a root of unity; that equals
  b_1 (twisted) only at p = 7, where the class number is 1.
- **b_1 itself (D5, 2026-10-28 late, BAR-K2):** b_1 is NOT simply a Stark unit of its own field (that guess failed its sealed test).
  It is an exact product: three of Robert's elliptic units, one for each "way 2 can sit" in the field, times a Hilbert-class-field
  piece made of Dedekind's eta function. So character by character, b_1 carries Stark's L-slope times an explicit factor built from
  the prime above 2: (rho(P) + rho(Pbar) - 2) on the class-group part. Checked at p = 23 in all 33 mirror images and all 33 characters.
- **Still open:** primes with other remainders mod 8. The mechanism is classical (Kronecker, Stark 1980). What is new, as far as anyone
  has searched, is the explicit formula for Ramanujan's own numbers, with the constants.

## 0. Setting (PROOF DRAFT for the two field identifications; everything else cited)
p = 7 mod 8 prime, m = (p-1)/2, K = Q(sqrt -p) ⊂ L := Q(zeta_p), q = sqrt(-p) O_K, 2 O_K = P Pbar, P = (2, (1+sqrt -p)/2).
b_k = u_k^p (CONJECTURES l.13-14), F_p, M = H_O(zeta_p) (RESULT-V3C l.36). psi = (./p). W = 2p.
- **D0a.** H_O = H_K: H_K ⊂ H_O and [H_O:K] = h(-4p) = h(-p) = [H_K:K] (V3C Step 0 (F1), l.99-104). PROOF DRAFT (one line).
- **D0b.** M = K(q), the ray class field of K mod q, and L ⊂ K(q). Proof draft: for nu ≡ 1 (mod q), the Artin symbol of (nu) acts on zeta_p
  by zeta -> zeta^{N nu} and N nu ≡ [nu]^2 = 1 (mod p); so L ⊂ K(q). Then M = H_K L ⊂ K(q) and [K(q):K] = h |(O_K/q)*/{+-1}| = h m = [M:K]
  (v4 C1). PROOF DRAFT.
- **D0c.** Gal(L/K) = {sigma_s : zeta -> zeta^s, s a square mod p} ≅ G+ = (Z/p)*/{+-1} (p = 3 mod 4: each class has one square).
  Characters X of Gal(L/K) <-> even chi mod p, X(sigma_s) = chi(s); X(Frob_l) = chi(N l). Artin L-function over K:
  L_{S0}(s, X) = L(s, chi) L(s, chi psi), S0 = {inf, q} (Ind_K^Q X = chi + chi psi; both primitive mod p). CLASSICAL.
- Roots of unity: mu(L) = mu_{2p}, so W = e = 2p. Ferrara's f = p (least positive integer in q), w_f = 1 (-1 is not 1 mod q).

## 1. The dictionary (one line per object)
| line | piece | field / extension | Galois group | characters | Stark identity | status |
|---|---|---|---|---|---|---|
| D1 | eps := sigma_2(N), N = N_{F_p/Q(zeta_p)^+}(b_1) | L = Q(zeta_p) over K = Q(sqrt -p), S = {inf, q, P} | (Z/p)*^2, cyclic of order m | all X = chi even mod p | L'_S(0, X) = -(1/2p) sum_{sigma} X(sigma) log|sigma(eps)|^2 | identity: PROOF DRAFT, a corollary of Theorem V3C (PROVED-ELSEWHERE, RESULT-V3C l.45-49); BAR-K1 P1/P2 HOLD |
| D1' | same eps | same | same | - | eps = zeta · u_L^{1 - sigma_2^{-1}}, u_L = Stark unit of L/K for S0 = {inf, q} (Ferrara Def 2.10) | PROOF DRAFT, uses Stark's theorem (Ferrara Thm 2.11, OPENED statement; Stark 1980 NOT OPENED) |
| D2 | N (Robert form) | L ⊂ K(q) = M | J = Gal(M/L), order h | - | sigma_2(N)^6 = zeta · E(J) / sigma_2^{-1}(E(J)),  E(J) = prod_{sigma in J} theta(1, q c_sigma^{-1})^p | PROOF DRAFT (corollary of D1' + Ferrara Def 2.10); BAR-K1 P4 HOLDS at p = 7 (J trivial) |
| D3 | Z[G+]-module of eps | in C' = <-1, Hasse units> | G+ | chi(2) != 1 | [S : <eps^{G+}>] = prod_{chi(2) != 1} p |B_{1,chi psi}|, S = <xi_2^{G+}> | PROVED-ELSEWHERE: C8 Theorem I1(c), RESULT-I1 l.40 (eps and N generate the same module; AUDIT A8) |
| D4 | eps | L(eps^{1/2p}) over K | - | - | abelian over K (Stark's extra condition); p-part witnessed explicitly: eps^{k^2 - sigma_{k^2}} = sigma_2(N(w_k))^p, w_k = u_1^{k^2}/u_k | abelian: PROOF DRAFT from Ferrara Thm 2.11; witness: PROVED-ELSEWHERE (C8 (d), RESULT-I1 l.87-93; V3B l.26-31) |
| D5-E | b_1 itself, each embedding | M = K(q) over K (Gal = Cl(O_K) x (Z/p)*^2, order hm) | - | - | 12 log|sigma(b_1)| = p[G(C1) + G(C2) - 2G(C3)] - p Dd(b), G(C) = log|theta(1; q C^{-1})| (Robert), C3 = ubar·bbar, C1 = C3 Pbar, C2 = C3 P, Dd = Delta/eta term on bP, bPbar, b (§2 D5) | PROOF DRAFT (from V3C Steps 2c, 3, 4 per element + Kronecker FIRST limit formula); BAR-K2 Q1 33/33, Q1' 11/11 |
| D5-X | b_1 itself, characters | M/K | Gal(M/K) | X = rho (x) chi (33 at p = 23) | (i) chi != 1: sum X(sigma) log|sigma b_1|^2 = -p[X(Fr_P)(1 - X(Fr_Pbar)) + X(Fr_Pbar)(1 - X(Fr_P))] L'(0, X); (ii) chi = 1, rho != 1: = 2pm(rho(P) + rho(Pbar) - 2) L'_K(0, rho) (Hilbert class field, S = {inf}); X = 1: 0 | PROOF DRAFT (D5-E + Ferrara Thm 2.8 with chi(sigma) + first limit formula + Hecke functional equation); BAR-K2 Q2 20/20, Q3 2/2 (new), calibration 10/10. Artin direction irrelevant (R1, proved by c-symmetry). Old GUESS D5 (sigma_2(b_1) = Stark unit of M/K) FAILED its sealed null Z5 (22/22 off by >= 100): b_1 is a two-Euler-factor twist plus an H_K-elliptic-unit part, not a Stark unit |
| D6 | b_1, or b_j/b_k, at p = 3 mod 8 and p = 1 mod 4 | ? | ? | ? | b_1 is not a unit there (C3b), so it cannot be a |S| >= 3 Stark unit; b_j/b_k are units (C9, CONJECTURES l.161-163): candidates of shape eps^{sigma_j - sigma_k} | OPEN |
| D7 | composite n (C5), levels l (Theorem G), cubic/quintic (C6), R(tau) (C7), G_n | various ring class / ray class fields | - | - | - | OPEN (gate: R, cubic CF, G_n PARTIAL in print; p.206 OPEN) |

Classical vs new. D0, D1 (mechanism), D1', D4 (abelian part): classical corollaries of Kronecker's second limit formula and Stark's theorem
for imaginary quadratic base (Stark 1980; Tate 1984 ch. IV; Robert units; via Ferrara §2.1, opened). Kubert-Lang 1979 Thm 4.2 is the
direct predecessor for conductor-p Siegel units (CONJECTURES l.153-159). New as far as searched (gate reply, this folder: "OPEN"): that
Ramanujan's b_1 (through its norm and the sigma_2 shift) IS that Stark unit with these constants (D1, D2), the index D3 (lab theorem C8),
and the reading of the V3 p-th roots w_k as Stark's Kummer roots (D4 witness). Ceiling: corollary-level dictionary.

## 2. Proof drafts (unrefereed)
**PROOF DRAFT D1.** Fix chi even, chi != 1, X(sigma_s) = chi(s). For x in Q(zeta_p)^+ and s a square, |sigma_s(x)| = |iota_s(x)| and
iota_s = iota_{-s}; the squares meet each class of G+ once. So sum_{sigma in Gal(L/K)} X(sigma) log|sigma(N)|^2 = 2 sum_{a=1}^m chi(a) log|iota_a(N)|
= 2 A_chi. Theorem V3C (RESULT-V3C l.46): A_chi = (p/2) chi(2)(chi(2)-1) B_{1,chi psi} C_chi. With L(0, chi psi) = -B_{1,chi psi} (Sharifi Prop 4.2.13,
opened per V3C l.214) and L'(0, chi) = -C_chi/2 (Lerch, see note), A_chi = -p chi(2)(1 - chi(2)) L'(0,chi) L(0,chi psi). By D0c and
L(0, chi) = 0 (chi even, != 1), L'_{S0}(0,X) = L'(0,chi) L(0,chi psi). Adding P to S multiplies L_{S0}(s,X) by (1 - chi(2) 2^{-s}), and
L_{S0}(0,X) = 0, so L'_S(0,X) = (1 - chi(2)) L'_{S0}(0,X). Hence sum_sigma X(sigma) log|sigma(N)|^2 = -2p chi(2) L'_S(0,X). Replacing N by
eps = sigma_2(N) (2 is a square mod p): sum_sigma X(sigma) log|sigma sigma_2(N)|^2 = chibar(2) sum_tau X(tau) log|tau(N)|^2 = -2p L'_S(0,X).
For X = 1: ord_{s=0} L_S(s,1) = |S| - 1 = 2, so L'_S(0,1) = 0; and sum_sigma log|sigma(eps)|^2 = log|N_{L/K}(eps)|^2 = 0 (eps a unit, C3c,
N_{L/K}(eps) in O_K* = {+-1}). ∎
*Note (Lerch).* For even chi != 1 mod p: L(s,chi) = p^{-s} sum_a chi(a) zeta(s, a/p); with zeta'(0,x) = log Gamma(x) - (1/2) log 2 pi (Lerch, NOT
OPENED) and sum_a chi(a) zeta(0,a/p) = L(0,chi) = 0, L'(0,chi) = sum_a chi(a) log Gamma(a/p); pairing a with p - a and Gamma(x)Gamma(1-x) =
pi/sin(pi x): L'(0,chi) = -(1/2) sum_a chi(a) log sin(pi a/p) = -(1/2) sum_a chi(a) log|1 - zeta^a| = -C_chi/2 (|1 - zeta^a| = 2 sin(pi a/p),
sum chi = 0). BAR-K1 computes L'(0,chi) by lfun, independently of this note.

**PROOF DRAFT D1'.** L ⊂ K(q) (D0b), and Ferrara Thm 2.11 (f = q, S0 = {inf, q}, e = 2p) gives u = u_L with L'_{S0}(0,X) = -(1/2p) sum X(sigma)
log|sigma(u)|_v for all X. Put u' := u / sigma_2^{-1}(u). Then sum X(sigma) log|sigma(u')|_v = (1 - chi(2)) sum X(sigma) log|sigma(u)|_v, so u'
satisfies the D1 identity for S (sigma_2 = Frob_P on L since N P = 2). q is totally ramified in L/K (one prime Q above q, fixed by Gal(L/K)),
u is a q-unit, so u' is a unit. eps/u' is a unit whose conjugates all have absolute value 1 (the X-components of log|.|^2 agree for every X,
and the characters separate functions on Gal(L/K)); by Kronecker's theorem it is a root of unity. (Ferrara Rem 2.2(3) states this uniqueness.)
Normalisation |.|_v = |.|^2 assumed (standard; not defined on the opened pages; consistent with BAR-K1 P3). ∎

**PROOF DRAFT D2.** Ferrara Def 2.10 with K -> L, F -> K, f = q: u^{12 f w_f} = E(J)^e, i.e. u^{12p} = E(J)^{2p}, so u^6 = zeta E(J). With D1':
eps^6 = zeta' u^{6(1 - sigma_2^{-1})} = zeta'' E(J)/sigma_2^{-1}(E(J)). By Ferrara Prop 2.7(ii), sigma_2^{-1}(E(sigma)) = E(sigma_2^{-1} sigma), i.e.
the lattice c is multiplied by an ideal of norm = 2^{-1} (mod p) in the ray class. At p = 7 (h = 1, J = 1, nu_1 = 1, nu_2 = (1+sqrt-7)/2,
nu_4 = 2): |iota_s(eps)|^6 = |R(s)|^7/|R(4s)|^7, R(d) = theta(1, (sqrt-7/nu_d) O_K): BAR-K1 P4, all three embeddings, <= 1e-151. ∎

**PROOF DRAFT D4.** Ferrara Thm 2.11 gives L(u^{1/2p})/K abelian, hence Galois over K; it contains a 2p-th root of sigma(u) for every sigma
(extend sigma). So eps^{1/2p} ∈ L(u^{1/2p}, zeta_{4p^2}) (eps = zeta u / sigma_2^{-1}(u)), an abelian extension of K. ∎
Explicit p-part: RESULT-I1 l.87-93 gives N(w_k)^p = N^{k^2}/sigma_{k^2}(N); applying sigma_2, eps^{k^2 - sigma_{k^2}} = sigma_2(N(w_k))^p, which is
the p-part of the Kummer condition "eps^{sigma - c(sigma)} is a W-th power" (criterion NOT OPENED; AUDIT A14). The 2-part has no explicit witness yet.

**PROOF DRAFT D5 (b_1 itself; p = 7 mod 8; unrefereed).** Notation of V3C §2: sigma = sigma_Q sigma_t, c = c_Q, b = c O_K, a = N b, u = a' t,
ubar := u/2 (mod p), G(C) := 12 log|g(1; q C^{-1})| = log|theta(1; q C^{-1})|, ldelta(L) := log(A(L)^6 |Delta(L)|), Dd(b) := ldelta(bP) + ldelta(bPbar) - 2 ldelta(b).
*D5-E.* V3C l.160: log|sigma(b_1)| = p(log 2 + log|g(z_u; c/a)| - log|g(w; c/a)|). Apply V3C Step 4 to one sigma (no character sum):
E(z_u, c/a; s) = p^{s/2}[2^{-s} Phi_u(bP) + 2^{-s} Phi_u(bPbar) - Phi_u(b)]. For a lattice e prime to q, the phase e(-u[nu]/p) on e equals
e(Im(conj(z') nu)/A(e)) with z' = ubar sqrt(-p) Ne/p (since Im(conj(z')nu)/A(e) = Tr(conj(z')nu/(sqrt(-p) Ne)), A(e) = Ne sqrt(p)/2, and
[nu] = (2x)/2 for nu = x + y sqrt(-p)), and (Ne/N nu)^s = (2/sqrt p)^s (A(e)/|nu|^2)^s; so Phi_u(e, s) = (2/sqrt p)^s E(z', e; s). At s = 1 the
factors cancel: E(z_u, c/a; 1) = E(z'_{bP}) + E(z'_{bPbar}) - 2E(z'_b). Scaling by lambda = p/(sqrt(-p) Ne) sends (z', e) to (ubar, q ebar^{-1}),
then by 1/ubar to (1, q (ubar ebar)^{-1}); with ebar = bbar Pbar, bbar P, bbar this gives C1, C2, C3. The w-term is the same decomposition at
u = 0, where Phi_0(e, s) = (2/sqrt p)^s Z(e, s) is the Epstein zeta: E(w, c/a; s) = Z1 + Z2 - 2^s Z3; with Kronecker's first limit formula
Z(L, s) = pi/(s-1) + 2 pi(gamma - log 2 - log(sqrt(y)|eta(tau)|^2)) + O(s-1) the poles cancel and log|g(w; c/a)| = log 2 + (1/12) Dd(b).
log 2 cancels: **12 log|sigma(b_1)| = p[G(C1) + G(C2) - 2G(C3)] - p Dd(b).** ∎ (inputs: V3C Steps 2(c), 3, 4; Wikipedia "Kronecker limit
formula", opened in V3C; |theta| = |g|^12 checked as an instrument, not cited.)
*D5-X.* Put alpha(tau) := log|E(tau)|^2, E(Art C) = theta(1, q C^{-1})^p (Ferrara Def 2.6, f = p, w_f = 1), so 12 log|sigma b_1|^2 = alpha(Art C1) +
alpha(Art C2) - 2 alpha(Art C3) - 2p Dd(b). Art(C3) acts on zeta_p by N C3 = a u^2/4 (sigma acts by a u^2) and on H_K through [bbar]; so
Art(C3(sigma)) = sigma_{1/4} sigma* where sigma* = sigma or its class-part inverse, depending on the Artin direction of KSY25 Prop 4.1.
(i) chi != 1: the Dd term dies (it depends on Q only; sum_u chi^2(u) = 0). By Ferrara Thm 2.8 (with chi(sigma)), sum X(sigma) alpha(sigma_{1/4} tau sigma) =
X(sigma_4) Xbar(tau) (-12p L'(0, X)); with tau = Art(Pbar), Art(P), 1 the bracket is chi(2)rho(P) + chi(2)rho(Pbar) - 2chi(4), so
**sum_sigma X(sigma) log|sigma b_1|^2 = -p[X(Fr_P)(1 - X(Fr_Pbar)) + X(Fr_Pbar)(1 - X(Fr_P))] L'(0, X)** (L of conductor q, S0 = {inf, q}).
(ii) chi = 1, rho != 1: the Robert part is -12p L'_{S0}(0, rho) = 0 (rho(q) = 1 adds a second zero). The Dd part: sum_C rho(C) Dd(C) =
(rho(P) + rho(Pbar) - 2) sum_C rho(C) ldelta(C), and the first limit formula with the Hecke functional equation (root number 1) gives
L'_K(0, rho) = -(1/12) sum_C rho(C) ldelta(C). Hence **sum_sigma rho(sigma) log|sigma b_1|^2 = 2pm(rho(P) + rho(Pbar) - 2) L'_K(0, rho).**
(iii) Direction: replacing sigma* by the other choice turns X into X^c = rhobar (x) chi; L(s, X^c) = L(s, X), and rho(P) <-> rho(Pbar) swaps the
two symmetric terms; on the left, c sigma c^{-1} has the same |sigma b_1| because b_1 is real. So D5 does not depend on the Artin direction
(AUDIT A4 closed for real units). ∎
*Reading.* For rho = 1 both brackets reduce to D1 (2 chi(2)(1 - chi(2))). For rho != 1, b_1 is not a Stark unit of M/K for any S: its chi != 1 part
is a fixed group-ring twist of the Stark unit of K(q)/K, (1/2)[Fr_P^{-1} + Fr_Pbar^{-1} - 2 sigma_4^{-1}] (one Euler factor at each prime above 2,
summed, not multiplied), and its chi = 1 part is an elliptic unit of the Hilbert class field H_K weighted by (rho(P) + rho(Pbar) - 2).
Ties to V3B: the chi = 1 part is N_{M/H}(b_1) = P^p (P = u_1...u_m, Weber), so (ii) is a Kronecker-limit statement for Weber's f(sqrt -p):
sum_tau rho(tau) log|tau f(sqrt -p)| = (1 - Re rho(P)) L'_K(0, rho) (PROOF DRAFT corollary; not separately tested).

## 3. Numerics (sealed BAR-K1, k1_out.txt; 70/70 as predicted, 0 instrument faults)
p = 7, chi = [2] (chi(3) = e^{2 pi i/3}): L'_{S0}(0,X) = 0.304960873251955135... - 0.455256723334384821... i; D1 identity (S = {inf,q,P}) holds to
<= 1e-153; nulls: no sigma_2 shift (>= 1), conjugate character (>= 0.1), log|.| unsquared (>= 0.1), Euler factor at P kept (>= 0.1) all fail.
Ferrara Thm 2.8 holds only with chi(sigma) inserted (<= 1e-152; as printed >= 1). Robert match D2 holds (<= 1e-151). p = 23 (h = 3): D1 holds
for all 10 nontrivial even chi (<= 1e-152); all nulls fail (>= 1).
**BAR-K2** (sealed 2408eb41..., AMENDMENT-K2a code-only after a crash; k2_out.txt; 12/12 verdict lines as predicted, 0 instrument faults,
bnfcertify = 1): p = 23, b_1 itself. D5-E at all 33 embeddings and its Robert form at 11 (<= 1e-130). Q2 (rho != 1, chi != 1, 20 characters) and
Q3 (chi = 1, rho != 1, 2 characters) hold (<= 1e-131); V3C calibration 10/10; trivial character 0. R1 (rho vs rho-bar labelling) degenerate as
predicted. Content nulls fail at every item: wrong ideal class (b -> bP), wrong level (one conductor-q Robert value), ubar = u, Delta term
dropped (all >= 10), and the old GUESS D5 (>= 100 on all 22 rho != 1 characters).

## 4. Next strikes (smarter first)
1. Independent AI reviewer on D0-D2, D4 (short; the only new inputs are Ferrara Thm 2.11/Def 2.10 and Lerch).
2. DONE 2026-10-28 (D5 PROOF DRAFT + BAR-K2 HOLDS). Next: a independent AI reviewer on D5 §2 (Step-4-per-element, the z' scaling, the first-limit pole
   bookkeeping, the Hecke functional-equation step in (ii)); then an out-of-sample seal at p = 31 (chi(2) = 1 for 2 characters: (i) predicts
   rank drops) and p = 47 (h = 5, rho of order 5, rho(P) + rho(Pbar) takes two different values).
3. D6: test whether a ratio b_j/b_k (a unit for p != 7 mod 8, by C9) fits a Stark identity with S = {inf, q, (2)} (p = 3 mod 8, 2 inert).

[Lead 2026-10-28, REFEREE-K1 fix: the Lerch step is now SOURCED - DLMF 25.11.18 (zeta'(0,a) = ln Gamma(a) - 1/2 ln 2pi), 25.15.3, 5.5.3, OPENED by the independent AI reviewer; numerically checked to 1.5e-76. Any "Lerch, NOT OPENED" above is superseded. Scope: statements hold for the sigma_2-twin of the norm of b_1 (= b_1 at p = 7), up to a root of unity; D2 at p = 23 is POST HOC.]

[Lead 2026-10-28, REFEREE-K2 (round 1): D5-E CORRECT WITH FIXES, (i) CWF, (ii) CORRECT, negative claim CWF, rho/rho-bar CORRECT, scoring HONEST. Scope: PROOF DRAFT for every p = 7 mod 8 (nothing depends on h); sealed at p = 23; referee unsealed checks at 31, 47 (POST HOC). First limit formula source OPENED (Wikipedia, see REFEREE-K2). Cite Ferrara Thm 2.8 WITH chi(sigma) inserted. Reading of (ii): (rho(P)+rho(P-bar)-2) = -(1-rho(P))(1-rho(P-bar)) so (ii) = -2pm L'_S(0,rho), S = {inf,P,P-bar}: 2/f(sqrt -p)^2 is (up to +-1) the Stark unit of H_K/K. "Not a Stark unit of M/K for any S" rests on the one-line rho(q) = 1 argument in REFEREE-K2, not on Z5. R1 (rho vs rho-bar) is an identity, not evidence. Mechanism CLASSICAL; ceiling corollary.]
