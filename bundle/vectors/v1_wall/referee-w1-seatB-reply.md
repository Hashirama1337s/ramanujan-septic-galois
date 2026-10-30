I'll referee section 6 against the stated law, opening the cited sources first and marking anything I cannot read.**In plain words.** Section 6 does not finish the law in section 5. The cubic argument for the theta piece \(B_1^{(3)}\) has the right shape and can be made into a proof by writing out three checks that are only cited. The quintic argument is not a proof: the step that kills non-idoneal multiples of 5 is a floating-point check, and the author says the proof is unwritten. Two sentences in section 5 are false as written (the cubic list \(\{1,5\}\), and “at most one” further idoneal number). No opened source classifies when these quotients are abelian.

**Cubic: ACCEPTED WITH FIXES. Quintic: NOT A PROOF.**

**Prior art.** No classification found. Not a closed search.

### What was opened
Berndt–Rebak arXiv:2312.15513v2, HTML, cited theorems (OPENED). Koo–Shin–Yoon arXiv:2506.14139v1, Lemma 7.3 and Propositions 3.1 and 4.1 (OPENED). Kani, Ann. Sci. Math. Québec 35 (2011), via the 2022 archive PDF (OPENED; OCR is dirty). Kim–Rebak arXiv:2506.01181v1, pattern search over the HTML (OPENED search). Rebák arXiv:2112.11884, abstract only (ABSTRACT). Weinberger, Acta Arith. 22 (1973), not opened. C5 and RESULT-V1, not opened. “KSY10 2.4(v)” not found: the opened Acta Arith. 141 (2010) text has Proposition 2.1 (i)–(iii), citing Kubert–Lang Proposition 2.4, with no (v).

### Definitions
OPENED Theorem 2.1(0) and Theorem 4.2(0) match the displayed \(u\) and \(v\). Lemma 3.1 is \(p=\sqrt{2}\,G_n/G_{9n}^3\), and Theorem 2.1(ii) sets \(p:=u\), so the cubic formula is right once \(u=p\). Lemma 5.1 is \(p=2G_n/G_{25n}^5\). Theorem 4.2(iv)–(v) is \(u=(\alpha p)^{1/5}\), \(v=(\beta p)^{1/5}\), and \(\xi^2-((p-1)^2+7)\xi+p^3=0\). That does give \(u^5+v^5=p((p-1)^2+7)\) and \(u^5v^5=p^5\). The page’s “\(B_1+B_2=\cdots\)” is this only after \(B_1=u^5\), \(B_2=v^5\).

The W gloss is wrong. OPENED Theorem 3.3 says
\(\varphi(e^{-9\pi\sqrt{n}})/\varphi(e^{-\pi\sqrt{n}})=\frac13\bigl(1+\sqrt{2}\,G_{9n}/G_n^3\bigr)\).
Corollary 3.9 is \(\bigl[1+(2(\sqrt{3}+\sqrt{5}))^{1/3}\bigr]/3\). Section 3’s polynomial \(x^4-64x^2+64\) is the minimal polynomial of the radicand \(2(\sqrt{3}+\sqrt{5})\), not of that phi ratio. Section 6 proves a statement about the theta piece \(W_1\). It does not prove the same statement for the Entry 1.1 phi ratio. The quintic Theorem 5.3 is \(s(p)\), with fifth roots, not \(u^5\).

### Load-bearing steps
OPENED Lemma 7.3 says only that \(K_{\mathcal{O},N}/\mathbb{Q}\) is Galois and \(\mathrm{Gal}(K_{\mathcal{O},N}/\mathbb{Q})=\mathrm{Gal}(K_{\mathcal{O},N}/K)\rtimes\langle\mathfrak{c}\rangle\). It does not say “\(\mathbb{Q}(z)\) is abelian if and only if \(\psi(G)\) fixes \(z\)”. That (L2), and \(\psi(\sigma_{[a]})=\sigma_{[\bar a\,a^{-1}]}\), are not in the opened text. They are deferred to RESULT-V1.

The top-row congruence in Step 1 does hold modulo \(4l\) if \(\det M=1\): the difference on each entry is a factor \(1-a'a\). The page writes “\(=\)” and “mod \(l\)” and does not say \(\det M=1\). The link \(\rho([\mu^{-1}\mathcal{O}])=\psi(\rho([\nu\mathcal{O}]))\) is one sentence. The ray-class reason (if \(\mu\equiv\nu/\bar\nu\pmod{4l}\), then \((\mu)^{-1}\) and \((\bar\nu)(\nu)^{-1}\) are the same ray class) is not written. Fixable. Existence of a primitive such \(\mu\) is not written.

Lemma S is not a proof. \(U_a\) decreases and \(L_0\) increases, as stated. The comparisons at \(y=\sqrt{3}\) are five-decimal floats, and section 2 says there is no interval arithmetic. For \(l=5\), “\(U_{2/5}/L_1\) decreases” is “spot-checked” on a bounded interval. Both “only if” directions that quote Lemma S inherit this.

Step 5(a)–(b) and the cubic stabilizer \(\Gamma_B\) are “C5 Lemma P / 3* transfers verbatim.” C5 was not opened here. OPENED Kani, Theorem 32’s proof, does say \(n\) is idoneal if and only if \(\mathrm{Cl}(-4n)\) is an elementary abelian 2-group, via Remark 7(b). That use is right. Theorem 6’s own sentence is only the OCR line that idoneal numbers are those with \(c(-4n)=1\).

Cubic Step 6 names a Hauptmodul because “hm_out.txt: 12 cosets, one simple zero (at infinity), one simple pole,” with orders from the unopened “KSY10 2.4(v).” The outcome is stated; the divisor is not on the page. That is the whole “only if” for non-idoneal \(m\equiv 0,2\pmod{3}\).

### Quintic invariance
Not provable in a line or two from the opened pages. BR never says \(p\) is invariant under \(\Gamma_5^*\). The seat writes that the check is \(1.5\times 10^{-93}\) on 40 matrices and that “an on-the-page proof is the same E-exponent bookkeeping as C5 Lemma 3*, NOT YET WRITTEN.” A float is not a proof. Without it, \(j=R(p)\) is not shown, so \(H_{\mathcal{O}}\subset K(z)\) is not shown, so non-idoneal \(m\) divisible by 5 are not shown to be non-abelian. The later root-counting (a common root \(\zeta p\) would force \(p=4\) and \(4(1+2\cos(2\pi k/5))\neq 2\)) is coherent with Theorem 4.2(v), and it never starts if \(p(\tau_{\mathcal{O}})\) is not known to lie in \(K(z)\).

### Lists and Grube
OPENED Kani, Theorem 12 (Grube): if \(n\) is idoneal and \(9\mid n\), then \(n\in\{9,18,45,72\}\); if \(25\mid n\), then \(n=25\). For a positive integer \(n\), \(9n\) idoneal gives \(n\in\{1,2,5,8\}\), not \(\{1,5\}\). Also \(m=18\) and \(m=72\) are even, and Theorem W assumes \(m\) odd, so section 6 does not decide them. The chain “abelian iff \(9n\) is idoneal iff \(n\in\{1,5\}\)” is false. The quintic integer chain “\(25n\) idoneal iff \(n=1\)” matches Theorem 12(b). Calling the cubic list unconditional is wrong.

The seat’s “at most one further” idoneal number, cited from memory, is the error Kani corrects. OPENED Corollary 23: “There is at most one squarefree idoneal number \(n>1848\).” Remark 24(a): Frei’s claim of at most one idoneal number \(n>1848\) “is frequently repeated” and “cannot be” held without a separate ban on large even idoneal numbers. Weinberger’s paper was not opened, here or by that seat.

### Prior art, precisely
BR’s last paragraph (OPENED) asks for higher-order identities and says nothing about fields or Galois groups. Kim–Rebak HTML: zero hits for abelian, Galois, class field, idoneal. Rebák 2112.11884 abstract: evaluations of \(\varphi(e^{-n\pi})\) and \(G_{343}\), no Galois classification. Web searches on \(G_n/G_{9n}\) and abelian theta quotients returned no such theorem (SNIPPET). “Not found” is the result of that pass, not a claim that none exists.

Next strike: write the \(\Gamma_5^*\) multiplier for \(p=g_{a_1}g_{a_2}/g_{a_0}^2\) in full, and replace “\(n\in\{1,5\}\)” and “at most one” by Grube’s four idoneal multiples of 9 and Kani’s Corollary 23 plus Remark 24.