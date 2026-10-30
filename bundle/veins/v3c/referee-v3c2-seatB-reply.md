I'll open KSY25 and Sharifi chapter 4 and judge the two claimed fixes against the pages, not the file's summary.The arXiv extract of Example 8.1 is in hand. Next I read the action definition in KSY25 §4 and the Sharifi statements the corollary cites.In plain words

The signed identity is a proof. The order of the two matrix factors is the reduction Koo–Shin–Yoon actually perform in Example 8.1, Step 4. Section 4 never states the abstract right-action rule. Corollary 2 is not proved: \(C_+/\{\pm 1\}=I_G\) is hung on a sentence inside the proof of Sharifi’s Theorem 4.3.3 that those notes assert and do not prove.

**(a) Closed.** KSY25, arXiv:2506.14139v1, HTML, §4 (OPENED): for \(\alpha\in\mathrm{SL}_2(\mathbb{Z}/N\mathbb{Z})/\{\pm I_2\}\), “\(f^\alpha=f\circ\widetilde\alpha\)”; for \(\alpha=\mathrm{diag}(1,d)\), the Fourier coefficients are sent by \(\zeta_N\mapsto\zeta_N^d\). The group is identified with \(\mathrm{GL}_2(\mathbb{Z}/N\mathbb{Z})/\{\pm I_2\}\) by citation of Lang, Chapter 6, Theorem 3, and Shimura, Proposition 6.9(1). The rule \(f^{\alpha\beta}=(f^\alpha)^\beta\) is **not found**.

Example 8.1, Step 4 (OPENED) replaces
\[
\begin{pmatrix}1&-a'(b+b_{\mathcal O})/2\\0&a'\end{pmatrix}
\]
by the same matrix with lower-right entry \(1\), “because \(r\) has rational Fourier coefficients,” and keeps the upper-right entry. That is the deletion the proof uses. Matrix arithmetic: \(\mathrm{diag}(1,a')\begin{pmatrix}1&-a'c\\0&1\end{pmatrix}\) leaves the upper-right entry \(-a'c\); the opposite order produces \(-a'^2 c\). The example keeps \(-a'c\), so \(\tau''=-\overline{\omega_Q}-a'b'\) matches the paper. The four-prime run is only a check. Wording fix, not a gap: cite Example 8.1, Step 4, for this reduction. Do not attribute the abstract rule to §4. Lang was not opened; the example makes that unnecessary.

**(b) Not closed.** Opened and correctly copied:

- Theorem 4.2.20: for CM abelian \(F\), \(h_F^-=2[E_F:E_F^+]\prod_{\chi\text{ odd}}(-B_{1,\chi}/2)\).
- Lemma 4.2.16: \(Q_F=[E_F:\mu(F)E_F^+]\in\{1,2\}\) and \([E_F:E_F^+]=Q_F w_F/2\). The displayed fraction is easy to misread; the proof gives \([E:E^+]=w_F|K|\) and \(Q_F=2|K|\), and the notes later say “\(Q_F w_F=2[E_F:E_F^+]\) by Lemma 4.2.16.”
- Lemma 4.2.17: \(Q_F=1\) when \(m\) is a prime power. For \(F=\mathbb{Q}(\mu_p)\), \(w_F=2p\), so \([E:E^+]=p\) and \(h^-=2p\prod(-B_{1,\varphi}/2)\). For \(K=\mathbb{Q}(\sqrt{-p})\), \(p>3\), one odd character and \([E_K:E_K^+]=1\) give \(h(-p)=-B_{1,\psi}\). Part (v)’s arithmetic matches these lines.
- Proposition 4.2.13: \(L(\chi,1-n)=-B_{n,\chi}/n\), so \(L(\chi,0)=-B_{1,\chi}\).
- Theorem 4.2.14 matches the \(L(1,\varphi)\) formulae used in Step 6.

Theorem 4.3.3’s statement is only \(h_{F^+}=[E_{F^+}:C_{F^+}]\). The proof begins: the set \(\{\xi_a:1<a<p^n/2,\ (a,p)=1\}\) “forms an independent set of generators of \(C_{F^+}\).” The preamble says the result is proved in general in Theorem 4.7.1. That later proof was **not opened**. Corollary 2 does not use the index \(h^+\). It uses the generating sentence to get a \(\mathbb{Z}\)-basis of \(C_+/\{\pm 1\}\). Definition 4.3.1 puts \(-1\) in \(C_{F^+}\), since \((1-\zeta^a)/(1-\zeta^{-a})=-\zeta^a\) puts \(\mu_p\) inside \(\langle 1-\zeta^a\rangle\). The \(\xi_a\) miss \(-1\): a product equal to \(-1\) would force every exponent to vanish by linear independence of \(\log|\xi_a|\), and then the product is \(+1\). So that sentence, read literally, is false, and it is not proved where it is cited. The file’s own check that \(\sigma_c(\xi_a)=\pm\xi_{ac}/\xi_c\) makes the map \(\mathbb{Z}[G_+]\)-linear on the quotient is fine. It has nothing to map onto until generation modulo \(\{\pm 1\}\) is proved. Parts (ii)–(iv) do not repair (i).

**Else.** The second equality of Theorem V3C, the \(L_K'(0)\) form, still uses the Lerch formula for \(L'(0,\chi)\). The file marks that input NOT OPENED. It is not part of the proved identity. Steps 2(c), 4 and 5 were not re-opened.

**ACCEPTED WITH FIXES**

Next strike: rewrite Corollary 2(i) from the opened proof of Sharifi’s Theorem 4.7.1 that the classes of \(\xi_a\) are a \(\mathbb{Z}\)-basis of \(C_{F^+}/\{\pm 1\}\).