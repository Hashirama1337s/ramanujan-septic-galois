I will open Koo–Shin–Yoon 2025 and the Weber/eta sources and check the revised lemmas against those statements, not against the write-up’s summary of them.In plain words, the revised argument is a proof of C1, C2 for primes \(p\ge 5\), and of C3a, once three local repairs are written in. C3b, for \(p\equiv 3\pmod 8\) and \(p\ge 11\), is a proof modulo the two named gaps G3′ and G5. C3c stays a conjecture. The round-2 holes are closed: Koo–Shin–Yoon 2025 states Shimura reciprocity for every order and every function in \(\mathcal F_N\), and the Weber 3-cycle is derived on the page.

**Final verdict: ACCEPTED WITH FIXES**

## What was opened

**[KSY25] OPENED**, ar5iv text of arXiv:2506.14139v1.

Equation (5): \(\tau_{\mathcal O}=\sqrt{D}/2\) if \(D\equiv 0\pmod 4\), and \(\mathcal O=\mathbb Z\tau_{\mathcal O}+\mathbb Z\). Equation (6): \(\mathrm{irr}(\tau_{\mathcal O},\mathbb Q)=x^2+b_{\mathcal O}x+c_{\mathcal O}\). For \(D=-4p\) this is \(\tau_{\mathcal O}=\sqrt{-p}\), \(b_{\mathcal O}=0\), \(c_{\mathcal O}=p\). The matrix in §5 is
\[
W_{\mathcal O,N}=\Bigl\{\begin{bmatrix}t-b_{\mathcal O}s&-c_{\mathcal O}s\\ s&t\end{bmatrix}\in\mathrm{GL}_2(\mathbb Z/N\mathbb Z)\Bigr\}.
\]
Proposition 5.1: there is an isomorphism \(W_{\mathcal O,N}/T_{\mathcal O,N}\to\mathrm{Gal}(K_{\mathcal O,N}/H_{\mathcal O})\) by \([\gamma]\mapsto\bigl(f(\tau_{\mathcal O})\mapsto f^\gamma(\tau_{\mathcal O})\bigr)\) for every \(f\in\mathcal F_N\) finite at \(\tau_{\mathcal O}\). Remark 5.2(i): \(\mathcal O^\times=\mathcal O\cap\mathcal O_K^\times=\langle\zeta_2\rangle\) if \(D\neq -3,-4\). The §4 rule used in Lemma 3 is the one in the paper: an \(\mathrm{SL}_2\) class acts by \(f^\alpha=f\circ\widetilde\alpha\), and \(\mathrm{diag}(1,d)\) acts by \(\zeta_N\mapsto\zeta_N^d\).

The proof line of Proposition 5.1 is only “See Stevenhagen, Sections 3, 4, 6 (cf. Cox, Lemma 15.17 and Theorem 15.22).” Those two books were **not opened**. The statement and its hypotheses were opened, and they match this order and this level \(N=4p\).

Remark 5.2(ii) does **not** say \(H_{\mathcal O}=K_{\mathcal O,1}\). It says Stevenhagen’s map extends the isomorphism \(\mathcal C_1(D)\xrightarrow{\sim}\mathrm{Gal}(H_{\mathcal O}/K)\). Remark 3.2(i) does say that the reduced forms give \(|\mathcal C_1(D)|=h\). Proposition 3.1 gives \(\mathcal C_1(D)\cong\mathrm{Gal}(K_{\mathcal O,1}/K)\). The generation formula in §4 gives \(K_{\mathcal O,1}=K(j(\tau_{\mathcal O}))\), since \(\mathcal F_1=\mathbb Q(j)\).

**[KSY10] OPENED**, ar5iv text of arXiv:1008.0473v2. Proposition 2.2(i)–(ii): \(g_r\) is integral over \(\mathbb Z[j]\), and \(g_r^{-1}\) is too when the primitive denominator is composite. Proposition 2.4(ii): \(g_r\circ S=\zeta_{12}^9 g_{rS}\) and \(g_r\circ T=\zeta_{12} g_{rT}\), so for general \(\gamma\in\mathrm{SL}_2(\mathbb Z)\) one has \(g_r\circ\gamma=\varepsilon g_{r\gamma}\) with a 12th root \(\varepsilon\) depending on \(\gamma\). Proposition 2.4(iii) is the translation formula the exponent \(E\) is built from. Proposition 2.6(ii), verbatim: \(g_{(0,1/2)}g_{(1/2,0)}g_{(1/2,1/2)}=2e^{\pi i/4}\). The proof of 2.6(i) gives \(g_{(1/2,1/2)}=-e^{-\pi i/4}q^{-1/24}\prod(1+q^{n-1/2})^2\). Proposition 4.7: \(W_{K,N}\twoheadrightarrow\mathrm{Gal}(K_{(N)}/H_K)\) with kernel \(\{\pm I\}\) when \(K\) is not \(\mathbb Q(i)\) or \(\mathbb Q(\sqrt{-3})\).

**[Wiki-W] OPENED.** The definition includes \(\mathfrak f(\tau)=e^{-\pi i/24}\eta((\tau+1)/2)/\eta(\tau)\). Verbatim: “The transformation \(\tau\to -1/\tau\) fixes \(f\) and exchanges \(f_1\) and \(f_2\).” The three roots of \(j=(x-16)^3/x\) are \(\mathfrak f^{24}\), \(-\mathfrak f_1^{24}\), \(-\mathfrak f_2^{24}\).

**[Wiki-η] OPENED**, §Definition: \(\eta(\tau+1)=e^{\pi i/12}\eta(\tau)\) and \(\eta(-1/\tau)=\sqrt{-i\tau}\,\eta(\tau)\), with the square root equal to 1 at \(\tau=i\).

Stevenhagen 2001, Cox, and Shimura’s book: **not opened**.

## Item verdicts

**Lemma 3 — CORRECT.** With \(b_{\mathcal O}=0\), \(g(x)=[t,-ps;s,t]\) is the matrix in KSY25 §5. The 12th root in KSY10 2.4(ii) depends only on \(\gamma\) (the factors for \(S\) and for \(T\) do not depend on \(r\)), so it cancels in \(B_k\). The repaired Class II identities check: \(T_3+T_6=-pkM_{11}-pc_2\), the \(pc_2\) cancels against \(T_4\), and “\(\Delta\) even \(\Rightarrow 2\Delta\equiv 0\pmod 4\)” is true. Both parities of \(s\) give \(E\equiv 0\pmod 4\). Class I, including \(p\equiv 3\pmod 4\), also sums to \(0\pmod 4\). The CRT splitting \(x=x_1x_2\) is valid because \(4\mathcal O+p\mathcal O=\mathcal O\).

**C1 — CORRECT WITH FIXES.** Proposition 4 is the right use of Proposition 5.1 at \(N=4p\): \(\sigma(b_k)=b_{tk}\) and \(\sigma(\zeta_{4p})=\zeta_{4p}^d\) with \(d\equiv t^2\pmod p\). The degree count \([F_p:\mathbb Q]=h(p-1)/2\), the orbit of size \((p-1)/2\), and \(F_p=\mathbb Q(j)(b_1)\) then follow from Lemma 4′.

Exact fixes:
- In the definition of \(F_p\), the cyclotomic field is \(\mathbb Q(\zeta_p)\). The letter \(N\) is already the level \(4p\).
- Do not cite Remark 5.2(ii) for \(H_{\mathcal O}=K_{\mathcal O,1}\). Insert this: \(j\circ\gamma=j\) and the Fourier coefficients of \(j\) are rational, so every class in \(W_{\mathcal O,4p}\) fixes \(j(\tau_{\mathcal O})\). Thus \(K(j(\tau_{\mathcal O}))\subset H_{\mathcal O}\). Both have degree \(h\) over \(K\), so \(H_{\mathcal O}=K(j(\tau_{\mathcal O}))=K_{\mathcal O,1}\).

**C2 — CORRECT WITH FIXES.** The same reciprocity gives the action on \(b_k\). Existence for every \(a\) when \(p\equiv 3\pmod 4\), and precisely when \((a/p)=1\) when \(p\equiv 1\pmod 4\), matches the image of \(\mathrm{Gal}(M/H_{\mathcal O})\) in the squares.

Exact fix: define the sign in the statement. For \(p\equiv 3\pmod 4\), \(\varepsilon(a)=(a/p)\). For \(p\equiv 1\pmod 4\), \(\varepsilon(a)=(-1)^{(a-1)/2}\). Then \(a''=\varepsilon(a)a\) and \(\sigma_a(b_k)=b_{\pm xk}\) with \(x^2\equiv\varepsilon(a)a\pmod p\).

**C3a — CORRECT.** The constant identity is the one in the proof of KSY10 2.6(i) together with 2.6(ii): \(c_k=(-i)^k e^{-3\pi i p/4}=(-i)^k e^{-\pi i p/4}i^{-p}\). For \(1\le k\le(p-1)/2\) the vector \(a_k\) has primitive denominator \(2p\), which is composite, so KSY10 2.2(i)–(ii) and 3.1(i) make \(g_{a_k}(\tau_0)\) a unit. The denominator-\(2\) factors sit in \(y\), and \(y\,g_{a_0}(\tau_0)=-2e^{-\pi i/4}\), so \(y\) divides 2 in the algebraic integers. Hence \(b_k\) is an algebraic integer, \(N(b_k)=\pm 2^e\), and \(b_k\) is a unit if and only if \(y\) is.

**Weber laws and C3b — CORRECT, modulo G3′ and G5 only.** The transformations \(T\) and \(S\), the rules for \(R_0,R_1,R_2\), and the 3-cycle under \(TS\equiv[1,1;1,0]\pmod 2\) follow from the opened product and eta formulae. Either composition convention is still a 3-cycle. For \(p\equiv 3\pmod 8\), \(C=(p+1)/4\) is odd, so KSY10 4.7 at level 2 gives a group of order 3 generated by that class. The identity \(y^{12}=-\mathfrak f_2(\tau')^{24}\) is an equality of complex numbers, and the cubic has product of roots \(4096\). With G3′ (inertia at 2 is the whole \(\mathrm{Gal}(K_{(2)}/H_K)\)) and G5 (\(R_i\in\mathcal F_2\)), one gets \(v_{\mathfrak P}(y)=v_{\mathfrak P}(2)/3\), so \(b_k\) is not a unit and
\[
e=p\cdot h(-4p)\cdot(p-1)/6.
\]
No further hole. G4 is used only for C3c. The relation \(h(-4p)=3h(-p)\) is correctly left uncited.

Numerical transcripts are not load-bearing in v3.

Next strike: insert the \(H_{\mathcal O}=K(j(\tau_{\mathcal O}))\) inclusion and the definition of \(\varepsilon(a)\) into the text of C1 and C2.