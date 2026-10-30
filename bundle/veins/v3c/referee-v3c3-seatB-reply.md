I will open Sharifi’s chapter 4 and check the revised Corollary 2 against the statements it cites.**In plain words.** The revised Corollary 2 is a proof of the statement it now makes. The old claim \(C'=C_{F^+}\) is gone, and the independence argument no longer uses Sharifi’s unproved generation sentence. One equality is still skipped on the page, so the verdict is not a clean accept.

**Verdict: ACCEPTED WITH FIXES.**

**What was opened.** Sharifi, *Iwasawa theory*, Chapter 4, https://math.ucla.edu/~sharifi/notes/iwasawa-ch04.html, and the regulator paragraphs of Chapter 1 (same site). Read 2026-10-28.

Theorem 4.2.20 (OPENED): “Suppose that \(F\) is a CM abelian field. Then
\[
h_F^-=2[E_F:E_F^+]\prod_{\chi\in X(F),\,\chi\text{ odd}}\Bigl(-\frac{B_{1,\chi}}{2}\Bigr)
\]
and
\[
h_{F^+}=\frac1{R_{F^+}}\prod_{\chi\in X(F),\,\chi\neq1\text{ even}}\Bigl(-\frac12\sum_{a=1}^{f_\chi}\chi(a)\log\bigl|1-e^{2\pi i a/f_\chi}\bigr|\Bigr)."
\]
Lemma 4.2.16 (OPENED): \(Q_F=[E_F:\mu(F)E_F^+]\) and \([E_F:E_F^+]=Q_F w_F/2\). Lemma 4.2.17 (OPENED): for \(F=\mathbb{Q}(\mu_m)\), \(m\not\equiv2\pmod4\), “\(Q_F=1\) if \(m\) is a prime power, and \(Q_F=2\) otherwise.” So \(Q_{\mathbb{Q}(\mu_p)}=1\). Definition 1.2.4 (OPENED): the regulator is \(|\det|\). Notation 1.2.3 (OPENED): the log map on units is an isomorphism onto the trace-zero space, so \(R_{F^+}>0\). Class number \(h_{F^+}\ge1\). The product of those factors is therefore nonzero, and each factor is nonzero.

Proof of Theorem 4.3.3 (OPENED) defines
\[
\xi_a=\frac{\zeta_{p^n}^{a/2}-\zeta_{p^n}^{-a/2}}{\zeta_{p^n}^{1/2}-\zeta_{p^n}^{-1/2}}
\]
and states \(\log|\sigma_a(\xi_b)|=\log|1-\zeta^{ab}|-\log|1-\zeta^a|\). The sentence “forms an independent set of generators of \(C_{F^+}\)” is on that page and is not used. The branch \(\zeta^{x/2}:=\zeta^{x(p+1)/2}\) was **not found** in Chapter 4. It is the note’s own normalization. Under it, \(\xi\) of Corollary 1 equals \(\xi_2\), and \(|\xi_a|=|1-\zeta^a|/|1-\zeta|\), which matches the absolute-value line above. Signs die in \(C'/\{\pm1\}\).

Parts (ii)–(iv) are internal and check. If \(2\) generates \(G^+\), then \(\sigma_{2^k}-1=(\sigma_2-1)(1+\cdots+\sigma_2^{k-1})\), so \((\sigma_2-1)\mathbb{Z}[G^+]=I_G\). Corollary 1 puts \(\overline N=\sigma_{1/4}\beta\cdot\xi_2\) with \(\beta=\sum_b(b/p)(p-2b)\sigma_{1/b}\). Pairing \(b\) with \(p-b\) gives the eigenvalue \(-p B_{1,\overline\chi\psi}\). Thus \([I_G:\beta I_G]=\prod_{\chi\neq1}p|B_{1,\chi\psi}|\). Part (v) matches Theorem 4.2.20: \(w_{\mathbb{Q}(\mu_p)}=2p\) gives \(h^-=2p\prod(-B_{1,\varphi}/2)\), and for \(K\) one has \([E_K:E_K^+]=1\), so \(h_K^-=-B_{1,\psi}\). The proof of 4.2.20 obtains \(h_F^-\) as the ratio of the two analytic class-number formulas, and \(K^+=\mathbb{Q}\), so \(h_K^-=h(-p)\). Counting odd characters then gives \(2^{m-1}p^{m-2}h^-/h(-p)\).

**The fix.** Before “the \(h^+\) formula says \(\prod(-L_\chi)=hR\)”, write the missing identity. For even \(\chi\neq1\), conductor \(p\),
\[
\sum_{a=1}^{p-1}\chi(a)\log|1-\zeta^a|=2L_\chi,
\]
so Sharifi’s factor \(-\frac12\sum_{a=1}^{f_\chi}\) equals \(-L_\chi\). Without that line, the quoted formula does not literally mention \(L_\chi\). The identity is true; it is not written. Also delete the attribution of the half-exponent branch to Sharifi.

Next strike: insert that doubling identity, and nothing else, then close Corollary 2.