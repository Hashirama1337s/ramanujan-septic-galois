# Referee report on proof/proof-C1-C3-v1.md (C1, C2, C3a, C3b) - hostile independent AI reviewer, 2026-10-27
I did not read any proof/referee-*-seatB-reply.md file. My scripts and output are in the private working folder, not shipped:
ref_lemma3.gp and ref_lemma3_out.txt.

## In plain words
The proof holds up. Every step of the Galois rule (C2) and the field rule (C1) checks out by hand. I re-derived the key lemma
myself, including the fiddly fourth-root-of-unity bookkeeping. An independent computer check with code written from scratch
agrees for every symmetry at p = 5 to 17. The main weakness is in citations, not in the mathematics. The reciprocity law is
quoted from Cox-McKay-Stevenhagen (CMS), but CMS state it at the point -1/sqrt(-p), not at sqrt(-p). Both C3b citation gaps
can be closed from sources that are already open. The full "unit iff p = 7 mod 8" statement is still not proved, and the
write-up says so honestly.

## Sources
- [CMS] arXiv:math/0311202, OPENED (PDF text). Sec. 3: "Shimura's reciprocity law tells us how (the Artin symbol of) the idele
  x in O-hat* acts on f(tau): we have (3.1) f(tau)^x = f^{g_tau(x^-1)}(tau), where g_tau ... sends x ... to the transpose of the
  matrix of multiplication by x on ... Z-hat tau + Z-hat with respect to the basis {tau, 1}." Their CM point is Case 1:
  "tau = -1/sqrt(-n), O = Z[n tau]", with (3.2) g_tau(a + b n tau) = [a, -b; nb, a]. Case 2 (n = 3 mod 4) gives O = O_K.
  Also: "modulo n, it is a product M1 M2 = diag(1,d) M2", where M1 "acts on f via its Fourier coefficients".
- [KSY] arXiv:1008.0473v2, OPENED. (1.3), Props 2.1, 2.2(i)-(iii), 2.4(ii),(iii), 2.6(i),(ii) are quoted correctly in the proof.
  2.2(ii) reads "If N is composite (that is, N has at least two prime factors)"; 2p qualifies. 2.4(ii): "epsilon a 12th root of
  unity (depending on gamma)", so it cancels in ratios. Also used below: Prop 3.1(i) "j(tau0) is an algebraic integer";
  Prop 4.3 "K(N) = K F_N(theta_K)"; Prop 4.7 (Stevenhagen): W_{K,N} = {[t - Bs, -Cs; s, t]} maps onto Gal(K(N)/H_K) by
  "h(theta) maps to h^alpha(theta_K)", for theta_K = (-1+sqrt d_K)/2 or sqrt(d_K)/2.
- [Gee] JTNB 11 (1999), numdam PDF, OPENED. Theorem 2 "(Shimura reciprocity law)", "Reference. [5; Theorem 6.31, Proposition 6.33]";
  Sec. 4: the level-2 functions "are the distinct roots of (X - 16)^3 - jX". The formula display of Theorem 2 is garbled in the text layer.
- Prior art: one search; the only hit was Rebak 2023 (Ramanujan J., p.206 identity, n = 7), at SNIPPET level. KSY Thm 1.2 (OPENED) treats
  phi(m tau0)/phi(tau0), i.e. the SUM 1 + sum u_k through identity (I_p), but not the individual pieces. The search was not exhaustive.

## Verdicts
**(1) Siegel expression, level, rational coefficients: CORRECT.** I redid the computation by hand. B2(a+1/2) = a^2 - 1/12. With q_z = -q^{a+1/2},
the product becomes prod(1+q^{n-1/2+a})(1+q^{n-1/2-a}). This gives u_k = 2 e^{-pi i k/2p} g_{a_k}/g_{a_0}, so b_k carries the factor (-i)^k.
B_k is a series in q^{1/2p} with integer coefficients. For Gamma(4p), the p-th powers of the KSY 2.4(iii) factors are
(-1)^{M11+M12+M21+M22} for both a_k and a_0, so they cancel. I also checked B_{k+p} = B_k (the factors (-i)^p and i^p cancel)
and B_{-k} = B_k (theta[-a] = theta[a]).

**(2) Lemma 3, B_k^{g(x)} = B_{tk}: CORRECT WITH FIXES (exposition).**
- Reduction mod Z^2: by hand, a_k G = a_{kt} mod Z^2, using t + s odd.
- Case x = 1 mod 4O: verified line by line.
- Case x = 1 mod pO: I get the same conclusion, but the write-up skips steps.
  - Subcase t odd, s even: s1 = s2 = c1 = c2 = (t-1+s)/2 mod 2, so the cross term vanishes, and the rest is k s(1-p) = 0 mod 4.
  - Subcase t even, s odd: with X = t-1+ps and Y = t-1-ps, we get 2c1 = X, 2c2 = Y, 2s1 = X+2k, 2s2 = Y+2k (mod 4).
    Then c1 + c2 is odd, so both products are even, and the rest is 2k(k - ps) = 0 mod 4.
  - The printed "2k s2 = k(t+sp-1)" holds only after multiplying by k (it needs k(k-ps) even).
  - Fix: print these residues.
- CRT and right action: correct, since g is multiplicative on a commutative O.
- Independent check (my own lift code, theta series only, no KSY input): B_k(G tau) = B_{tk}(tau) for every x in (O/4pO)* and every k.
  That is 30,624 pairs at p = 5, 7, 11, 13, 17, with 0 failures and worst agreement 61 digits (precision 60).
  - The other factorisation, g diag(1,1/d), also gives 0 failures.
  - Control: the non-transposed matrix [t, s; -ps, t] fails 864/1008 (p = 7) and 4000/4400 (p = 11). So the transpose convention matters, and CMS's convention is the one the data obey.

**(3) Shimura reciprocity: CORRECT WITH FIXES.**
- Transpose: as in CMS (3.1).
- Direction of the Artin map: immaterial, because the same formula is applied to zeta_4p and to beta_k.
- Order: Z[sqrt(-p)] has discriminant -4p and conductor 2 when p = 3 mod 4; it is O_K when p = 1 mod 4. Both are handled correctly.
- Gap G1 is real as written: CMS state (3.1) at tau_c = -1/sqrt(-p), not at sqrt(-p).
- Exact fix: apply (3.1) at tau_c to f = B_k o S. Then S g_c S^{-1} = [t, -ps; s, t] = g(x), checked by hand from CMS (3.2), so f^{g_c}(tau_c) = B_{tk}(sqrt(-p)).
  This uses only CMS's own Case 1, valid for arbitrary n. For p = 1 mod 4, KSY Prop 4.7 with theta_K = sqrt(-p) also gives g(x) directly.

**(4) eps(a): CORRECT.** Norms N(y) = t^2 + ps^2 with t + s odd are 1 mod 4 when p = 1 mod 4. So a'' = (-1)^{(a-1)/2} a, and sigma_a exists
iff (a/p) = 1. When p = 3 mod 4, fixing sqrt(-p) forces a'' = (a/p) a. Spot checks against the sweep: p = 29, a = 5 gives b_11 (11^2 = 5); a = 7 gives b_14 (14^2 = -7).
Scope note: C2 is proved for sigma fixing Q(j(sqrt -p)). That is the only meaningful reading, because the Q-orbit of b_1 has h(p-1)/2 > (p-1)/2 elements when h > 1.
CONJECTURES.md should say this explicitly.

**(5) Degree h(p-1)/2 and monotonicity: CORRECT.** The Poisson step has r = e^{-pi/sqrt p}, and the triple-product factors 1 + 2r^{2n-1}cos(2 pi k/p) + r^{4n-2}
decrease strictly on [0, p/2]. The orbit bound (p-1)/2 gives equality. The linear-disjointness step is fine.
Fix: cite KSY Prop 3.1(i) (opened) for "j(tau0) is an algebraic integer". H_O = K(j(tau0)) remains a textbook citation (G2).

**(6) C3a: CORRECT.** a_k has primitive denominator 2p, so KSY 2.2(i),(ii) and 3.1(i) make g_{a_k}(tau0) a unit. KSY 2.6(ii) gives y | 2.
I checked the Lemma 5 constant by hand: e^{-pi i p/4} i^{-p} = (-1)^p e^{pi i p/4}. So b_k = unit * y^p and N(b_k) = +-2^e.

**(7) C3b (p = 3 mod 8): CORRECT WITH FIXES.**
- y^12 = -f2(tau')^24: re-derived (Delta(tau'+1) = Delta(tau'), tau0 = 2tau'+1).
- The roots multiply to 4096; T and S permute them as stated; [1,1;1,0] has order 3 mod 2.
- Fix A (removes G1 here): KSY Prop 4.7 with B = 1, (t,s) = (0,1) gives exactly [-1, -C; 1, 0] at theta_K = tau'.
- Fix B (removes G3), using only basic ray-class facts: R_i(tau') lie in K(2) (KSY 4.3). Gal(K(2)/H_K) has order |F_4*| = 3 for p > 3.
  The inertia group of (2) in the abelian extension K(2)/K lies in Gal(K(2)/H_K) (H_K/K is unramified) and is nontrivial (only (2) can ramify).
  So it is the whole group, and the 3-cycle fixes every prime above 2.
- Fix C: "e = p h(-p)(p-1)/2" needs p > 3. At p = 3, h(-12) = 1, which is not 3h(-3). I computed b_1 = 2.000... at p = 3, consistent with e = p h(-4p)(p-1)/6 = 1.
- Independent check at new primes: p = 107 (h = 9) gives |N(y^4)| = 2^12; p = 131 (h = 15) gives 2^20. Both match the prediction; minimal polynomials are monic and irreducible; Newton slope 4/3.
- Norm formula reproduces 55, 78, 272, 171, 0, 1218, 0, 666 (recomputed).

**C3c / full C3 "unit iff p = 7 mod 8": NOT PROVED** (depends on G4, unopened), and correctly labelled as such. It must not be released as a theorem.

## Final verdict: ACCEPTED WITH FIXES
This covers C1 and C2 for every odd prime (p = 3 is trivial: F_3 = Q, b_1 = 2), C3a, and C3b. None of the fixes changes a statement except the p > 3 caveat.
Release blockers: the three citation fixes (G1 via CMS's own point or KSY 4.7, G3 via the inertia argument, KSY 3.1(i)) and printing the Lemma 3 case-2 residues.
C3c stays a conjecture.
Single next strike: C3c at p = 7 mod 8. Here 2 splits and all R_i(tau') lie in H_K, so the 3-cycle trick is unavailable. Use the CMS (3.5) non-unit-idele form with x a uniformiser at one prime above 2,
and check it against KSY Prop 3.1(ii) (a^12 Delta((a tau0 + b)/d)/Delta(tau0) divides (ad)^12).
