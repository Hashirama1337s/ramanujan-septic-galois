I will open the cited papers and check the Galois rule, the field rule, and the integrality claims against those sources.In plain words: the Siegel ratio, the real ordering of the pieces, the square-class rule for \(\varepsilon(a)\), and the “algebraic integer with norm \(\pm 2^e\)” statement hold up against the papers that open. The two load-bearing steps do not. The root-of-unity proof that \(B_k^{g(x)}=B_{tk}\) is only a sketch, and Shimura’s law is quoted at \(\sqrt{-p}\) from a sentence Cox–McKay–Stevenhagen prove for different base points. Conductor \(2\) is the right order when \(p\equiv 3\pmod{4}\); it is not the order their opened computation covers. So C1 and C2 are not a complete proof for every odd prime. C3a is right. C3b’s valuation arithmetic is right once two identities are written out; it still leans on an unopened inertia fact.

Sources. **OPENED:** Cox–McKay–Stevenhagen, arXiv:math/0311202, ar5iv HTML, §3 through (3.6). Koo–Shin–Yoon, arXiv:1008.0473v2, ar5iv HTML, (1.3), Propositions 2.1, 2.2, 2.4, 2.6 and their proofs, Proposition 3.1. **PDF fetched, text not extracted:** Gee, JTNB 11 (1999), numdam PDF; the quoted sentences were not recovered here. **ABSTRACT / SNIPPET:** Stevenhagen, ASPM 30 (2001), Project Euclid abstract only. Lang, *Elliptic Functions*, contents only: Chapter 12 is “The Function \(\Delta(\mathfrak{a}\tau)/\Delta(\tau)\)”, with “Prime Factorization of its Values”. **Not opened:** Shimura, Theorem 6.31; Cox, *Primes of the form \(x^2+ny^2\)*; Neukirch. Hasse–Deuring as used in C3c: not found.

**(1) Siegel ratio and level of \(B_k\). CORRECT.**  
KSY (1.3) and the proof of Proposition 2.6(i) give
\[
g_{(1/2,1/2)}(\tau)=-e^{-\pi i/4}q^{-1/24}\prod_{n\ge 1}(1+q^{n-1/2})^2.
\]
With \(r=(a+1/2,1/2)\), \(\mathbf{B}_2(a+1/2)=a^2-1/12\), the same formula yields \(g_{(a+1/2,1/2)}/g_{(1/2,1/2)}=e^{\pi i a/2}\,\theta[a]/\theta[0]\). Thus
\[
u_k=2e^{-\pi i k/(2p)}g_{a_k}(\tau_0)/g_{a_0}(\tau_0),
\]
and the prefactor \((-i)^k\) in \(B_k\) is \((e^{-\pi i k/(2p)})^p\). The product form of \(B_k\) lies in \(\mathbb{Z}[[q^{1/(2p)}]]\). For \(s\in(2\mathbb{Z})^2\), KSY 2.4(iii) contributes a sign and a factor \(e^{-\pi i(s_1 r_2-s_2 r_1)}\); the \(p\)-th power of that factor is exactly the sign the write-up reduces, and that sign is \(+1\). So \(B_k\) is \(\Gamma(4p)\)-invariant with rational coefficients, i.e. in \(\mathcal{F}_{4p}\). KSY 2.4(ii) gives a 12th root depending only on \(\gamma\) for the generators \(S\) and \(T\), so it cancels in the ratio.

**(2) Lemma \(B_k^{g(x)}=B_{tk}\). GAP.**  
The shape is right: \(g(x)=\begin{pmatrix}t&-ps\\ s&t\end{pmatrix}\) is the CMS transpose, \(\det g(x)=N(x)\), and \(t+s\) is odd because \(N(x)\) is odd. Commutativity of \(\mathcal{O}\) makes \(g(x_1x_2)=g(x_1)g(x_2)\) even though transpose reverses products, so the CRT split is legitimate. What is not a proof is the sentence “Substituting: \(E\equiv 0\)”. The cross terms \(2(s_1s_2+s_1+s_2)\) and the exponential in KSY 2.4(iii) are not expanded mod \(4\). The check for \(p\le 61\) is finite. It does not prove the identity for every odd prime.

**(3) Shimura at \(\sqrt{-p}\). GAP.**  
CMS §3, (3.1), opened: “Shimura’s reciprocity law tells us how (the Artin symbol of) the idele \(x\in\widehat{\mathcal{O}}^\ast\) acts on \(f(\tau)\): we have \(f(\tau)^x=f^{g_\tau(x^{-1})}(\tau)\).” The same page fixes \(\tau\) to be \(-1/\sqrt{-n}\) or the Case 2 point, not \(\sqrt{-p}\). It also says \(\mathrm{Gal}(K^{\mathrm{ab}}/H_{\mathcal{O}})\) is the image of \(\widehat{\mathcal{O}}^\ast\), and that level \(N\) factors through \(\mathrm{GL}_2(\mathbb{Z}/N\mathbb{Z})\). The order \(\mathbb{Z}[\sqrt{-p}]\) is the right one: discriminant \(-4p\), conductor \(2\) when \(p\equiv 3\pmod{4}\), maximal when \(p\equiv 1\pmod{4}\). CMS Case 1 is that non-maximal order, but at a different base point. Shimura, Theorem 6.31, was not opened. Gee is cited for maximal orders; its text was not extracted, so it does not cover conductor \(2\). Using (3.1) at \(\tau_0\) is the right shape and the right order, and it is not proved by the pages that were opened. The side remark that the argument uses \(\mathcal{O}^\ast=\{\pm 1\}\) for \(\mathbb{Z}[\sqrt{-3}]\) is false (\(\mathcal{O}_K^\ast\) has order \(6\)); the stated range is \(p\ge 5\).

**(4) \(\varepsilon(a)\). CORRECT.**  
For \(p\equiv 3\pmod{4}\), \(\sqrt{-p}\in\mathbb{Q}(\zeta_p)\) and \((-1/p)=-1\), so exactly one of \(\pm a\) is a square, namely \((a/p)a\). For \(p\equiv 1\pmod{4}\), the lift that fixes \(i\) is the class \(\equiv 1\pmod{4}\), which is \((-1)^{(a-1)/2}a\), and \((a/p)=1\) is forced because every norm from \(\widehat{\mathcal{O}}^\ast\) is a square mod \(p\). Proposition 4 ties the index \(t\) to the same idele as the cyclotomic character, since KSY 2.1 sends \(\zeta_N\mapsto\zeta_N^d\) under \(\mathrm{diag}(1,d)\) and \(\det g(y)=N(y)\).

**(5) Degree and monotonicity. CORRECT WITH FIXES.**  
Lemma \(4'\) is complete. Poisson at \(c=\pi/p^{3/2}\) and the Jacobi triple product give
\[
u_k=C\prod_{n\ge 1}\bigl(1+2r^{2n-1}\cos(2\pi k/p)+r^{4n-2}\bigr)
\]
with \(C>0\) independent of \(k\) and \(r\in(0,1)\). Each factor is positive and strictly decreasing on \([0,p/2]\). The degree arithmetic \([\mathbb{F}_p:\mathbb{Q}]=h(p-1)/2\) is right once \([H_{\mathcal{O}}:K]=h(-4p)\). CMS identifies \(\mathrm{Gal}(H_{\mathcal{O}}/K)\) with \(C(\mathcal{O})\) and, citing Cox, Theorem 7.7, with forms of discriminant \(\mathrm{disc}(\mathcal{O})=-4p\). Cox was not opened. The fix is to quote that bijection as the definition of \(h(-4p)\), not as a checked theorem. KSY Proposition 3.1(i), opened, already says \(j(\tau_0)\) is an algebraic integer, so that part of G2 need not stay open.

**(6) C3a. CORRECT WITH FIXES.**  
\(a_k=((p+2k)/(2p),p/(2p))\) has primitive denominator \(2p\), composite for \(p\ge 3\). KSY 2.2(i)(ii) make \(g_{a_k}(\tau_0)^{\pm 1}\) integral over \(\mathbb{Z}[j(\tau_0)]\), so \(g_{a_k}(\tau_0)\) is a unit. KSY 2.6(ii), opened: \(g_{(0,1/2)}g_{(1/2,0)}g_{(1/2,1/2)}=2e^{\pi i/4}\). With the product in the proof of 2.6(i), \(y:=2/\mathfrak{f}(\tau_0)^2=i\,g_{(0,1/2)}(\tau_0)g_{(1/2,0)}(\tau_0)\) is an algebraic integer and \(y\cdot\mathfrak{f}(\tau_0)^2=2\). The constant in Lemma 5 equals \((-i)^k(-1)e^{\pi i p/4}\). Thus \(b_k\) is an algebraic integer, a \(\{2\}\)-unit, of absolute norm \(\pm 2^e\), and \(b_k\) is a unit if and only if \(y\) is. Fix: cite the proof of KSY 2.6(i), not the statement. The statement is \(\varphi(\tau)=-\eta(\tau)g_{(1/2,1/2)}(\tau)/\sqrt{2\pi}\).

**(7) C3b. CORRECT WITH FIXES.**  
From the write-up’s own product rules, \(\tau_0=2\tau'+1\) and \(\Delta(\tau+1)=\Delta(\tau)\) give \(y^{12}=-\mathfrak{f}_2(\tau')^{24}\). Also \(T\) swaps \(\mathfrak{f}^{24}\) and \(-\mathfrak{f}_1^{24}\), and \(S\) swaps \(-\mathfrak{f}_1^{24}\) and \(-\mathfrak{f}_2^{24}\). Those are transpositions, and \(g_{\tau'}(\tau')\equiv\begin{pmatrix}1&1\\1&0\end{pmatrix}\pmod{2}\) has order \(3\), so it is a \(3\)-cycle on the three roots of \((X-16)^3-jX\). The product of the roots is \(4096\), so equal \(\mathfrak{P}\)-valuations give \(v_{\mathfrak{P}}(y)=v_{\mathfrak{P}}(2)/3\). For \(p\equiv 3\pmod{8}\), \(C=(p+1)/4\) is odd and \(2\) is inert, so one place divides \(2\). Then \(e=p[\mathbb{F}_p:\mathbb{Q}]/3=p\,h(-4p)\,(p-1)/6\). The rewrite \(e=p\,h(-p)(p-1)/2\) needs \(h(-4p)=3h(-p)\), which was not opened in Cox. The inertia step is the unopened G3: a unit idele supported only at \(2\) lands in every inertia group above \(2\). That application is the standard one; it is not proved in an opened source. The \(614\)-digit test is not the proof. The eta calculation above is.

C3c stays open. A statement that \(\Delta(\mathfrak{a})/\Delta(\mathcal{O}_K)\) generates \(\mathfrak{a}^{-12}\) was not found.

**NOT A PROOF.**

Next strike: expand \(E\bmod 4\) in Lemma 3 from KSY 2.4(iii) for both congruence classes, for a general odd prime, until every term is on the page.