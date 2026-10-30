I'll referee Theorem I1 against the page itself and the cited inputs, and I will mark every source I actually open.Sharifi’s class-number formula is the one external input Remark 1 leans on. I’ll open that page and check the group-ring steps against it.**In plain words.** Parts (a)–(c) are a proof, from the quoted inputs plus the group ring. The determinant is exactly the product of the character absolute values. The false bar clause is correctly killed: that set has index \(f\) in \(S\). Part (d) has the right count \(p^{r-1}\), and Lemma 3 is proved, but the Teichmüller paragraph asserts the order of the quotient without computing the ideal. One sentence has to be written in. Remark 1 matches Sharifi once his printed \(-B_{1,\chi}\) is restored. The v3 files and the numerical logs were not opened.

## Verdicts

**(a) Rank.** Proved. Lemma 1: \(\mathbb{Z}[G]\) is free of rank \(m/f\) over \(\mathbb{Z}[H]\), and \(\{y\in\mathbb{Z}[H]:\operatorname{aug}(y)=0\}=(\sigma_2-1)\mathbb{Z}[H]\), so \(\Lambda=(\sigma_2-1)\mathbb{Z}[G]=\ker N_H\). The sums \(N_H g_i\) are supported on disjoint cosets, so they are \(\mathbb{Z}\)-independent (used, not named). On \(e_\chi\), \(N_H\) acts by \(f\) if \(\chi(2)=1\) and by \(0\) otherwise. There are \(m/f\) such characters, including \(1\), so \(\operatorname{rank}\Lambda=m-m/f\) and the drop from \(\operatorname{rank} C'\overline{}=m-1\) is \(m/f-1\).

**(b) Saturation.** Proved. If \(nx\in\Lambda\) then \(N_H x=0\), so \(x\in\Lambda\): \(\Lambda\) is saturated in \(\mathbb{Z}[G]\). With (V1) and \(\beta\) invertible on \(\Lambda\otimes\mathbb{Q}\), \(S=\varphi(\Lambda)=\mathbb{Z}[G]\cdot\xi_2=\{u\in C'\overline{}:N_H u=1\}\). The fixed field of \(\langle\sigma_2\rangle\) has degree \(m/f\), and its only roots of unity are \(\pm 1\).

**(c) Index, and the determinant question.** Proved. The equality is exact. \(\beta\) is a \(\mathbb{Z}\)-endomorphism of the free module \(\Lambda\). It is injective because every eigenvalue \(\chi(\beta)\) is nonzero (V3). Smith normal form gives \([\Lambda:\beta\Lambda]=|\det(\beta\mid\Lambda\otimes\mathbb{Q})|\). That determinant is the product of the eigenvalues, so its absolute value equals \(\prod|\chi(\beta)|\), with no extra unit and no idempotent denominator: the idempotents name the eigenvalues, they do not define the lattice. (V3) gives \(\chi(\beta)=-p B_{1,\overline{\chi}\psi}\), and \(\chi\mapsto\overline{\chi}\) permutes \(\{\chi:\chi(2)\ne 1\}\). Hence \([S:X]=\prod_{\chi(2)\ne 1}p|B_{1,\chi\psi}|\). Each factor may be irrational; the product is the positive integer \(|\det|\).

The repackaging \(N\overline{}=\varphi(\theta)\) matches the quoted Corollary 1: \(\sigma_{(4b)^{-1}}=\sigma_{1/4}\sigma_{1/b}\).

**(d) The \(p^{r-1}\).** Substance holds; the write-up does not finish it. Lemma 3 is proved: \(s(\pm x)=x(x/p)\) is a character because \((-1/p)=-1\), \(\beta\equiv -2e\pmod{p}\), and \(\sigma_c e=s(c)e\), so \((k^2-\sigma_{k^2})\beta\in p\mathbb{Z}[G]\). Thus \(y_k\in I_G\) and \(N(w_k)=\pm\varphi(y_k)\) once (V4) gives \(N(w_k)^p=N^{k^2}/\sigma_{k^2}(N)\). Each class in \(G\) contains exactly one square, so \(A'=(p,\,k^2-\sigma_{k^2}:k=2..m)\) has index \(p\) and equals \(A=\ker(g\mapsto s(g))\). Then \(W=\varphi(p^{-1}AY)\) and \([W:X]=p^r/[Y:AY]\).

The missing sentence: for \(x\in A\), \(\chi(x)\equiv\varepsilon_s(x)\equiv 0\pmod{p}\) whenever \(\chi(g)\equiv s(g)\pmod{p}\) for every \(g\). The reduction \(\mu_m\to\mathbb{F}_p^\times\) is injective, so this happens for exactly one character, the Teichmüller lift \(\omega_s\), and there \(\chi(A)=(p)\). For every other \(\chi\), some \(\chi(g)-s(g)\) is a \(p\)-adic unit, so \(\chi(A)=\mathbb{Z}_p\). Also \(\omega_s(2)=s(2)=2\not\equiv 1\), and \(\chi(\theta)\ne 0\) on that line by (V3). A field embedding keeps it nonzero in \(\mathbb{Z}_p\). Therefore \(Y_p/AY_p\cong\mathbb{Z}/p\) even if \(p\) divides \(\chi(\theta)\), and \([W:X]=p^{r-1}\). On the \(\omega_s\)-line, \(p^{-1}A\) does not enlarge the lattice; it enlarges each of the other \(r-1\) lines by \(p\).

**(Bar clause.)** The correction is right. Multiplication by \(\sigma_2-1\) identifies \(\Lambda\) with \(\mathbb{Z}[G]/N_H\mathbb{Z}[G]\), and \([\mathbb{Z}[G]:I_G+N_H\mathbb{Z}[G]]=|\mathbb{Z}/f\mathbb{Z}|=f\), since \(\operatorname{aug}(N_H)=f\).

**(Remark 3.)** Proved on the page. \(\prod_{\zeta^f=1,\,\zeta\ne 1}(1-\zeta)=f\), so the product of absolute values is \(f\), each root occurs \(m/f\) times, and the guess is \([S:X]\cdot f^{m/f}/2^r\).

**(Remark 1.)** Restatement only, and the printed citation is off. It is not an input to (a)–(d).

**(Table.)** Not opened. It is not part of the proof.

## Sources

- OPENED. Sharifi, *Iwasawa Theory*, Chapter 4, Theorem 4.2.20: “\(h_F^-=2[E_F:E_F^+]\prod_{\chi\text{ odd}}(-B_{1,\chi}/2)\)”. Lemma 4.2.16, proof: “\([E_F:E_F^+]=w_F|K|\) and \([E_F:\mu(F)E_F^+]=2|K|\)”. Same file, Sinnott argument: “\(Q_F w_F=2[E_F:E_F^+]\) by Lemma 4.2.16”. So \(h_F^-=Q_F w_F\prod(-B_{1,\chi}/2)\). The product \(\prod(-B)\) is positive, so it equals \(\prod|B|\) over all odd characters of one CM field. The ratio in Remark 1 then gives exactly \([S:X]=2^r p^{r-1} Q_k h^-(\mathbb{Q}(\zeta_p))/h^-(k)\).
- NOT OPENED. `RESULT-V3C.md`, v3b, v4 Proposition 4, v5.1 C3c, `idx_out.txt`, `posthoc_out.txt`. (V1)–(V3) were used as quoted. (V4) was not checked.
- Smith normal form: no textbook page opened. The index claim is the standard one for an injective endomorphism of \(\mathbb{Z}^r\).

**ACCEPTED WITH FIXES**

Next strike: insert into the (d) paragraph the computation that \(\chi(A)=(p)\) for \(\chi=\omega_s\) and \(\chi(A)=\mathbb{Z}_p\) otherwise, and stop there.