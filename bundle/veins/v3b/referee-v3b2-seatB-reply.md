The dispute is about whether an SL2(Z) lift with A ≡ D ≡ 1 (mod 2p) is required. I will check that arithmetic against the written congruences and the cited KSY statements, and I will not treat the local numerical files as read.The 2025 Koo–Shin–Yoon paper matches the cited Galois description. I am opening Proposition 5.1 and the Fourier-coefficient action.In plain words: the demanded lift with \(A \equiv D \equiv 1 \pmod{2p}\) does not exist for every element that fixes \(M\), and “\(D\) odd” fails exactly when \(t\) is even. The weaker congruences do make the written quantity \(S_2^{(0)}\) an integer divisible by \(p\). That is not yet a proof that the product lies in \(F_p\), because the page never shows that those congruences force every such Galois element to fix the product.

**Dispute: BOTH PARTLY.** The seat is right about existence and about parity. The seat has not shown that the weaker lift is sufficient.

Take \(N''=48p^2\). Koo–Shin–Yoon, arXiv:2506.14139 (OPENED), Proposition 5.1, gives
\[\mathrm{Gal}(K_{\mathcal{O},N}/H_{\mathcal{O}})\;\cong\; W_{\mathcal{O},N}/T_{\mathcal{O},N},\]
with matrices \(\begin{pmatrix}t&-c_{\mathcal{O}}s\\ s&t\end{pmatrix}\). For the order \(\mathbb{Z}[\sqrt{-p}]\) one has \(c_{\mathcal{O}}=p\), so the seat’s \(g(x)\) matches. Remark 5.2(i) (OPENED): for this discriminant the units are \(\{\pm 1\}\), so \(T\) contributes only \(\pm I\). Replacing \(x\) by \(-x\) preserves the parity of \(t\). Section 4 (OPENED) says that \(\mathrm{diag}(1,d)\) acts on Fourier coefficients by \(\zeta_N\mapsto\zeta_N^d\).

Any \(\mathrm{SL}_2(\mathbb{Z})\) lift of the seat’s \(\gamma\) satisfies \(A\equiv t\pmod{N''}\) or \(A\equiv -t\pmod{N''}\). Both are even when \(t\) is even, so \(A\not\equiv 1\pmod{2}\), and the congruence \(A\equiv D\equiv 1\pmod{2p}\) is impossible. Such a matrix occurs: \(p=7\), \(t=8\), \(s=1\), \(d=71\), with \(\gcd(71,48\cdot 49)=1\), \(t\equiv 1\pmod 7\), and \(t\) even. The same example has \(d=71\equiv 3\pmod 4\).

The seat’s two uses of the weaker lift are correct arithmetic, and they do not need \(D\) odd. Since \(d\) is prime to \(N''\), \(d\) is odd, so \(t\) and \(s\) have opposite parity. Then \(D\equiv t\pmod 2\) and
\[pB'+D-1\equiv t+s-1\equiv 0\pmod 2,\]
so \(S_2^{(0)}=(pB'+D-1)/2\) is an integer. After choosing the sign so that \(t\equiv 1\pmod p\) (available from \(\pm I\), not written), \(D\equiv 1\pmod p\), hence \(2S_2^{(0)}\equiv 0\pmod p\). As \(p\) is odd, \(S_2^{(0)}\equiv 0\pmod p\).

**Fixes**

- Fix 1. The exponent check is correct as written: if \(\sum n_j j^2=p\ell\), the leading power is \(\ell/(2p)\), and \(n-\tfrac12\pm j/p\in\tfrac1{2p}\mathbb{Z}\) with or without the hypothesis. KSY10 (1.3) was not opened. The sentence “\(W\in F_{N''}\)” is assumed, not proved.
- Fix 2. Accepted as a reading of Proposition 5.1 plus the diagonal action: \(\sigma\) fixes \(H_{\mathcal{O}}(\zeta_p)\) precisely when \(d\equiv 1\pmod p\), i.e. \(t\equiv\pm 1\pmod p\). This uses \(R=K_{\mathcal{O},48p^2}\), which is the seat’s identification.
- Fix 3. The \(\mathrm{SL}_2(\mathbb{Z})\) lift exists; “\(\equiv j(C,D)\)” is true modulo \(N''\), and \(\det=1\) is exact. The congruences \(A\equiv D\equiv 1\pmod p\) are written only for \(t\equiv 1\). The quantities \(S_1^{(j)}\) are not defined, and no transformation law turns them into \(\sigma(U)=U\). The claim \(\Omega^d\in\mu_4\) for odd \(d\) is true; it does not show that the constant is fixed.
- Fix 4. Accepted as a label. Necessity is numerical on the page (2+10+14=26). The files were not opened.
- Fix 5. The sum \(\sum_{j\le m} j^2=p(p^2-1)/24\) is an integer multiple of \(p\) for \(p\ge 5\). Prop D was not opened (local file). Given \(P^p\in J\subset\mathbb{R}\) and \(P>0\), with \(p\) odd, \(P\notin J\) does mean that \(P^p\) is not a \(p\)th power in \(J\), so \([J(P):J]=p\), which cannot divide \((p-1)/2\). The exponent \(\pm(p-1)\) is correctly labelled numerical. For odd class number the class polynomial has one real root (arXiv:2301.11169, OPENED), so the rank-1 unit sentence matches that signature. It does not prove the exponent.

**Section 1 sufficiency: NOT A PROOF.**

Next strike: write the transformation of \(W\) under the lift, define \(S_1^{(j)}\), choose the sign \(t\equiv 1\pmod p\), and show from those congruences that every \(\sigma\in\mathrm{Gal}(R/M)\) fixes \(U\).