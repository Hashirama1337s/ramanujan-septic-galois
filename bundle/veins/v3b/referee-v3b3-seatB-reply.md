I'll referee the sufficiency proof against the cited sources, not the write-up's summary of them. First I load the house boot and the round-2 strike so the verdict stays on the page.**In plain words**

The new calculation does the round-2 strike. With the representative \(t\equiv 1\pmod{p}\), the lift multiplies \(W\) by a fourth root of unity, and every \(\sigma\in\mathrm{Gal}(R/M)\) multiplies \(U\) by that same root. A fourth root that is also a \(p\)-th root is \(1\). That last inference still sits on two sentences that are not in this text. Sufficiency is not proved.

**Sources.** OPENED: KSY10, arXiv:1008.0473, HTML, Propositions 2.1, 2.2, 2.4. OPENED: KSY25, arXiv:2506.14139, HTML, §2, §4, Proposition 5.1, Remark 5.2. NOT OPENED: `proof/proof-C1-C3-v4.md` (Lemma 1, Theorem C1) — not found. NOT OPENED: section 1 (v2), Fix 1 and Fix 3 — not found. The `congcheck` table is marked as outside the proof and was not opened.

**Step 0 — partly.** The exponents \(\nu_j\), the constant \(c\), and \(W=c\prod g_{a_j}^{\nu_j}\) are defined here. The sentence "By v4 Lemma 1, \(W=\prod(2\theta[j/p]/\theta[0])^{n_j}\). So \(W(i\sqrt{p})=U\)" was not opened.

**Step 1 — partly.** KSY10 Proposition 2.2(iii), opened: "\(g_{(r_1,r_2)}(\tau)\) is holomorphic and has no zeros and poles on \(\mathfrak{H}\). Furthermore, \(g_{(r_1,r_2)}(\tau)\) … belongs to \(\mathcal{F}_{12N^2}\)". Each \(a_j\) lies in \((1/(2p))\mathbb{Z}^2\setminus\mathbb{Z}^2\), so \(N=2p\) puts every \(g_{a_j}\) in \(\mathcal{F}_{48p^2}\). The rational \(q\)-expansion is the clause "by the triple-product formula in 1 (v2), Fix 1". Not found. "\(U^p\in F_p\subset M\)" cites v4 C1. Not found.

**Step 2 — holds once \(U^p\in M\).** KSY25 §2, opened: \(K_{\mathcal{O},N}/K\) is abelian, so \(R/M\) is Galois. Then \(\sigma(U)^p=\sigma(U^p)=U^p\). Membership of \(U^p\) in \(M\) is the unopened C1 line.

**Step 3 — holds.** KSY25 Proposition 5.1, opened: \([\gamma]\mapsto\bigl(f(\tau_{\mathcal{O}})\mapsto f^\gamma(\tau_{\mathcal{O}})\bigr)\). For \(\mathcal{O}=\mathbb{Z}[\sqrt{-p}]\), (5) and (6) give \(b_{\mathcal{O}}=0\), \(c_{\mathcal{O}}=p\), so the Cartan matrices are \([t,-ps;s,t]\). KSY25 §4, opened: \(\mathrm{diag}(1,d)\) acts by \(\zeta_N\mapsto\zeta_N^d\). So \(\sigma(\zeta_p)=\zeta_p^d\), and \(d\equiv t^2\pmod{p}\), hence fixing \(\zeta_p\) forces \(t\equiv\pm 1\pmod{p}\). Remark 5.2(i), opened, says \(\mathcal{O}^\times=\langle\zeta_2\rangle\) for \(D\neq -3,-4\). It does not contain the sentence "\(T_{\mathcal{O},N}=\{\pm I\}\)". The basis \(\{\tau_{\mathcal{O}},1\}\) just before Proposition 5.1 sends \(-1\) to \(-I\), so the representative \(t\equiv 1\pmod{p}\) is legitimate. The citation label is wrong.

**Step 4 — holds.** Any lift \(\widetilde{\gamma}\equiv\beta\pmod{48p^2}\) in \(\mathrm{SL}_2(\mathbb{Z})\) has (a)–(d). In particular \(B\equiv -pse\pmod{48p^2}\) gives \(B=pB'\) with \(B'\equiv -se\pmod{48p}\), and \(d\) odd gives \(d^{-1}\equiv 1\pmod{2}\), so \(D\equiv t\pmod{2}\). Fix 3 was not opened. These congruences do not use it.

**Step 5 — holds.** KSY10 Proposition 2.4(ii), opened: "\(g_r(\tau)\circ\gamma=\varepsilon g_{r\gamma}(\tau)\) with \(\varepsilon\) a 12th root of unity (depending on \(\gamma\))". \(\sum\nu_j=0\), so the \(\varepsilon\)-power is \(1\). Proposition 2.4(iii), opened: "\(g_{r+s}(\tau)=(-1)^{s_1 s_2+s_1+s_2}e^{-\pi i(s_1 r_2-s_2 r_1)}g_r(\tau)\)". With \(r_2=1/2\) and \(r_1=(p+2j)/(2p)\) this is the written \(\Omega\). Steps (a)–(d) make \(S_1^{(j)},S_2^{(j)}\in\mathbb{Z}\), \(S_2^{(j)}=S_2^{(0)}+jB'\), and \(2S_2^{(0)}\equiv D-1\equiv 0\pmod{p}\). Since \(p\) is odd, \(S_2^{(0)}\equiv 0\pmod{p}\). Then \(pT\) is divisible by \(p\), and the hypothesis \(\sum n_j j^2\equiv 0\pmod{p}\) is used in that one term. So \(\Phi\in\tfrac12\mathbb{Z}\) and \(\Omega\in\mu_4\).

**Step 6 — open.** Both orders are written, and \(d\) odd keeps \(\{\Omega,\Omega^d\}\subset\mu_4\). The equality \(W^{\mathrm{diag}(1,d)}=W\) is the rational-coefficient sentence. Not found. KSY10 Proposition 2.1, opened, sends a coefficient \(c\) to \(c^{\sigma_d}\). A coefficient outside \(\mathbb{Q}\) can take \(\Omega'\) out of \(\mu_4\).

**Step 7 — open.** For odd \(p\), \(\mu_4\cap\mu_p=\{1\}\) is the right last line once \(\sigma(U)=\Omega'U=\zeta_\sigma U\) and \(\Omega'\in\mu_4\). It waits on Step 6. The letter \(R\) is \(K_{\mathcal{O},N''}\) in Step 1 and the real field in the last line "\(M\cap R=F_p\)".

**Final: NOT A PROOF.**

Next strike: on this page, expand \(W=c\prod g_{a_j}^{\nu_j}\) in \(q^{1/(48p^2)}\) and prove that every coefficient lies in \(\mathbb{Q}\), so \(\mathrm{diag}(1,d)\) fixes \(W\).