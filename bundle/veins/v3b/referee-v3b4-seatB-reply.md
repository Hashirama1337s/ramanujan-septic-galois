I'll check the new Step 6–7 text against the cited sources and the q-expansion arithmetic, then give a sufficiency verdict.In plain words: the sufficiency claim \(U\in F_p\) is proved. Steps 6 and 7 hold. The header sentence \(E_R=E_w\) is not proved on the page.

**Step 6 — HOLD.** **Step 7 — HOLD.**

**Final verdict: ACCEPTED WITH FIXES.**

The fix is only the group sentence in the statement header. The theorem that is actually proved (section 1 (v3)) is \(U\in F_p\).

KSY10 = arXiv:1008.0473, OPENED (ar5iv). KSY25 = arXiv:2506.14139, OPENED (ar5iv, §4 and Prop. 5.1). `proof/proof-C1-C3-v4.md` was not opened; Lemma 1 is the verbatim block in the brief.

KSY10 (1.3): \(g_{(r_1,r_2)}(\tau)=-q^{\frac12\mathbf{B}_2(r_1)}e^{\pi i r_2(r_1-1)}(1-q_z)\prod_{n\ge1}(1-q^n q_z)(1-q^n q_z^{-1})\), with \(\mathbf{B}_2(x)=x^2-x+1/6\). For \(r=(a+\tfrac12,\tfrac12)\) this gives
\[
\frac{g_{(a+1/2,1/2)}}{g_{(1/2,1/2)}}=e^{\pi i a/2}\frac{\theta[a]}{\theta[0]}.
\]
So \(\theta[m/p]/\theta[0]=e^{-\pi i m/(2p)}g_{a_m}/g_{a_0}\) as functions on \(\mathbb{H}\). That is the last line of the quoted Lemma 1. Step 0’s constant \(c\) matches, and \(W=\prod_{j\ge1}(2\theta[j/p]/\theta[0])^{n_j}\) on \(\mathbb{H}\).

Step 6(b) is the expansion of that product, \(q=e^{2\pi i\tau}\). The identity \((pn+j)^2/(2p^2)=n^2/2+nj/p+j^2/(2p^2)\) is correct. Only \(n=0\) has exponent 0, so each \(S_j\) has constant term 1. Exponents lie in \(\frac1{2p}\mathbb{Z}\), coefficients are non-negative integers, and the inverse stays in \(\mathbb{Z}[[q^{1/(2p)}]]\). The same holds for \(\theta[0]^{-1}\). With \(\sum n_j j^2=p\ell\),
\[
W=2^{\sum n_j}q^{\ell/(2p)}G,\qquad G\in\mathbb{Z}[[q^{1/(2p)}]],
\]
constant term 1. Coefficients lie in \(\mathbb{Z}[1/2]\subset\mathbb{Q}\). And \(q^{1/(2p)}=(q^{1/N''})^{24p}\) because \(N''=48p^2\).

KSY10 Prop. 2.1: the matrix \(\begin{pmatrix}1&0\\0&d\end{pmatrix}\) acts by \(\sum c_n q^{n/N}\mapsto\sum c_n^{\sigma_d}q^{n/N}\), \(\zeta_N\mapsto\zeta_N^d\). KSY25 §4 states the same formula. Rational \(c_n\) are fixed, so \(W^{\mathrm{diag}(1,d)}=W\).

Step 6′ is then forced. For the two decompositions of Step 3 the multiplier is \(\Omega\) or \(\Omega^d\). Both lie in \(\mu_4\) because \(d\) is odd and Step 5 gives \(\Omega\in\mu_4\). No identification \(\Omega'=1\) is used here.

Step 7. KSY25 Prop. 5.1: \([\gamma]\mapsto\bigl(f(\tau_O)\mapsto f^\gamma(\tau_O)\bigr)\). Thus \(\sigma(U)=\Omega'U\). Step 2 gives \(\sigma(U)=\zeta_\sigma U\) with \(\zeta_\sigma^p=1\). Since \(U\neq0\), \(\Omega'=\zeta_\sigma\in\mu_4\cap\mu_p\). For odd \(p\) that intersection is \(\{1\}\), so \(\sigma(U)=U\). Hence \(U\in M\). Each \(u_j>0\), so \(U\in\mathbb{R}\) and \(U\in M\cap\mathbb{R}=F_p\).

The hypothesis is used only to put \(\Omega\) in \(\mu_4\) (Step 5). Rationality of the expansion does not use it. Necessity stays numerical, as the text says.

The header’s “since \(b_1=u_1^p\)” shows only that \(b_1\) lies in the set defining \(E_R\). It does not show that \(p e_1\) and \(k^2 e_1-e_k\) generate that exponent lattice, so \(E_R=E_w\) is not proved on the page. Membership \(w_k\in F_p\) does follow: the exponent vector \(k^2 e_1-e_k\) has weighted sum \(0\).

Next strike: add the one-line lattice generation (or delete \(E_R=E_w\)).