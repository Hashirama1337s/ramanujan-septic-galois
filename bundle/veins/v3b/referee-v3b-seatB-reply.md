I'll boot the house first, then open the cited papers and the proof text before attacking section 1.Cited papers first, then I’ll hunt the local proof files and the house boot.Opening both Koo–Shin–Yoon papers and the Siegel-function propositions next.Pulling the exact Galois and Siegel propositions, then checking Weber’s product formula and the Kummer step.**In plain words.** The sufficiency argument that \(\sum n_j j^2 \equiv 0\pmod{p}\) puts \(U=\prod u_j^{n_j}\) in \(F_p\) is a real proof, with sloppy 2-adic bookkeeping and two unopened lemmas. The \(p\)-th roots of unity die because that congruence (plus \(S_2^{(0)}\equiv 0\pmod{p}\)) makes the only non-\(\mu_4\) factor in Kubert–Lang a sign; \(\mu_4\cap\mu_p=\{1\}\) for odd \(p\). Each single \(u_j\) lives in the ray class field \(K_{\mathcal{O},48p^2}\), not in \(F_p\). The identity \(P=\varepsilon_J^{\pm(p-1)}\) is not a proof; it is a PARI check at two primes. GRH is not used in §1.

---

### Sources
| Item | Status |
|---|---|
| KSY10 arXiv:1008.0473v2, Prop 2.2 and 2.4 | **OPENED** (ar5iv HTML) |
| KSY25 arXiv:2506.14139, Prop 4.1, Prop 5.1, §4 display after (5) | **OPENED** (ar5iv HTML) |
| Ramanujan lost notebook p.206 | **SNIPPET** (Rebák, Ramanujan J. 2023 abstract; Kurims 1060-12) |
| Kubert–Lang, *Modular Units*, Ch. 3, 11, 13 | **ABSTRACT** / **SNIPPET** |
| Stevenhagen, ASPM 30 (2001) | **SNIPPET** |
| Folsom, class invariants from modular units | **OPENED** (afolsom PDF) |
| `proof/proof-C1-C3-v4.md` Lemmas 1–2 | **not found** this run |
| `verify_out.txt` | **not found** this run |

---

### Step 1 — modular function  
**CORRECT WITH FIXES.**  
KSY10 Prop 2.2(iii): “\(g_{(r_1,r_2)}(\tau)\) … belongs to \(\mathcal{F}_{12N^2}\)”. With \(N=2p\), \(N''=48p^2\) is right. KSY10 Prop 2.4(ii): “\(g_r(\tau)\circ\gamma=\varepsilon\,g_{r\gamma}(\tau)\) with \(\varepsilon\) a \(12^{\mathrm{th}}\) root of unity (depending on \(\gamma\))”; on generators \(S,T\) the factor is independent of \(r\), so total Siegel exponent \(0\) kills \(\varepsilon\). KSY25 §4: “\(K_{\mathcal{O},N}=K(f(\tau_{\mathcal{O}})\mid f\in\mathcal{F}_N\) is finite at \(\tau_{\mathcal{O}})\)”, so \(U=W(\tau_0)\in R:=K_{\mathcal{O},N''}\) and \(M\subset R\).

**Fix:** the identities \(W=c\cdot\prod g_{a_j}^{n_j}g_{a_0}^{-\sum n_j}\) and “\(q^{1/2p}\)-expansion with rational coefficients” are v4 Lemmas 1–2, **not found**. Without rational coefficients, \(\mathrm{diag}(1,d)\) need not fix \(W\).

### Step 2 — Kummer  
**CORRECT.** \(U^p=\prod b_j^{n_j}\in F_p\subset M\), so for \(\sigma\in\mathrm{Gal}(R/M)\), \(\sigma(U)/U\in\mu_p\subset M\subset R\).

### Step 3 — reciprocity  
**CORRECT WITH FIXES.**  
KSY25 Prop 5.1 (**OPENED**): \(W_{\mathcal{O},N}/T_{\mathcal{O},N}\xrightarrow{\sim}\mathrm{Gal}(K_{\mathcal{O},N}/H_{\mathcal{O}})\), \([\gamma]\mapsto(f(\tau_{\mathcal{O}})\mapsto f^\gamma(\tau_{\mathcal{O}}))\). For \(\mathcal{O}=\mathbb{Z}[\sqrt{-p}]\) one has \(b_{\mathcal{O}}=0\), \(c_{\mathcal{O}}=p\), so \(\gamma=\begin{pmatrix}t&-ps\\ s&t\end{pmatrix}\), matching the write-up. This is Galois over \(H_{\mathcal{O}}\), not over \(M=H_{\mathcal{O}}(\zeta_p)\). The extra cut “fixes \(\zeta_p\) iff \(d\equiv 1\pmod{p}\)” is the cyclotomic character \(\det\); then \(t^2\equiv 1\pmod{p}\). \(-I\) is trivial by KSY10 Prop 2.1.

**Fix:** say explicitly that you use Prop 5.1 plus \(\det\equiv 1\pmod{p}\), not Prop 5.1 alone.

### Step 4 — roots of unity (the attack)  
**CORRECT WITH FIXES.**  
KSY10 Prop 2.4(iii), quoted:  
\(g_{r+s}=(-1)^{s_1s_2+s_1+s_2}e^{-\pi i(s_1 r_2-s_2 r_1)}g_r\).  
With \(r_2=1/2\) everything is in \(\mu_4\) except \(e^{\pi i j S_2^{(j)}/p}\). The exponent sum is \(S_2^{(0)}\sum n_j j+B'\sum n_j j^2\). The hypothesis kills the second term mod \(p\); \(D\equiv 1\pmod{p}\) and \(D\) odd force \(D\equiv 1\pmod{2p}\), so \(S_2^{(0)}\equiv 0\pmod{p}\) and the first term dies too. Remainder \(e^{\pi i\cdot\mathbb{Z}}\in\mu_2\subset\mu_4\). Then \(\mu_4\cap\mu_p=\{1\}\).

That is exactly Kubert’s quadratic condition (Kubert, Math. Ann. 225 (1977); Kubert–Lang Ch. 3, **ABSTRACT**): a Siegel product is modular of the expected level once \(\sum n_r r^2\equiv 0\) and a mod-12 condition hold. Here the mod-12 leftover is only \(\mu_4\), which Kummer kills.

**Fixes (required):**  
(i) \(B'=-s\) and “\(B'+D-1=s+t-1\)” is only mod 2; write it as a congruence.  
(ii) Choose an \(\mathrm{SL}_2(\mathbb{Z})\)-lift with \(A\equiv D\equiv 1\pmod{2p}\), \(B\equiv 0\pmod{p}\), not merely mod \(p\).  
(iii) Record that \(\mathrm{diag}(1,d)\) sends \(\Omega\mapsto\Omega^d\in\mu_4\) even when \(d\equiv 3\pmod{4}\).

### Step 5 — \(U\in F_p\)  
**CORRECT**, given 1–4. Real positive \(U\) in \(M\) is in \(F_p=M\cap\mathbb{R}\). No GRH.

\(E_R=E_w\): **CORRECT** (pure exponent arithmetic, \(b_1=u_1^p\)).

Necessity: **NOT A PROOF** (26 PARI roots; admitted).

Where the \(u_j\) live: each \(u_j\in K_{\mathcal{O},48p^2}\). The remark that \(u_1\notin F_p\) is consistent (\(e^{-\pi i s/p}\neq 1\)). They do **not** lie in the ring class field \(H_{\mathcal{O}}\).

### Claim \(P=\prod_{j=1}^m u_j=\varepsilon_J^{\pm(p-1)}\)  
**GAP** as a theorem.  
The exponent vector \((1,\dots,1)\) satisfies the hypothesis: \(\sum_{j=1}^m j^2=p(p^2-1)/24\equiv 0\pmod{p}\), so \(P\in F_p\) is proved. Descent to \(J=\mathbb{Q}(j(\sqrt{-p}))\) and the exact power of a fundamental unit are **not**. The text offers PARI “ring arithmetic in \(F_p\)” at \(p=23,31\) (`verify_out.txt` **not found**) and the slogan “Weber’s \(2^m/f(\sqrt{-p})^{p-1}\)”. No Weber locator was opened. Sign \(\pm\) is PARI’s unit, not a formula.

Units for \(p\equiv 7\pmod{8}\): **NOT CHECKED** (depends on earlier work).

Indices / GRH: as the author states. §1 does not use GRH. The numbers 22 and 1 at 23, and 30 and 1 at 31, are GRH-conditional and correctly not claimed.

---

### Prior art
**\(p\)-th roots of Siegel-unit quotients in a class field.** Not found as a theorem that those roots lie in the *ring* class field. Standard is the opposite power: Ramachandra / KSY10 Prop 4.5, \(g_{(0,1/N)}(\theta_K)^{12N}\) a unit; Kubert–Lang Ch. 11 (**ABSTRACT**): “we keep this 12th power (and the additional \(N\)-th power)”. Gee–Stevenhagen: high-level functions (Weber \(\mathfrak{f}\in\mathcal{F}_{48}\)) can still generate \(H_{\mathcal{O}}\). Folsom (**OPENED**): theta/Siegel quotients give modular units of level \(12\ell\) and cyclotomic units after specialisation. The present move — keep the \(p\)-th root and cut by the quadratic condition plus Kummer — is not in those sources.

**Norm \(= (p/2)|1-\chi(2)|\,|B_{1,\chi\psi}|\) times a cyclotomic unit.** Shape is classical: \(L(0,\chi)=-B_{1,\chi}\); Sinnott’s cyclotomic-unit index; Kubert–Lang Ch. 13 “Computation of a Unit Index”; Robert, *Unités elliptiques*. The precise twist \((p/2)|1-\chi(2)|\) and the character \(\chi\psi\) are **not found** as a cited identity; in this document they are post-hoc matches at 7, 23, 31, 47, 71, 79.

---

### Final verdict: **ACCEPTED WITH FIXES**

Sufficiency “\(\sum n_j j^2\equiv 0\pmod{p}\Rightarrow U\in F_p\)” is a proof once v4 Lemmas 1–2 are on the desk and the \(\mathrm{SL}_2\) lift is written mod \(2p\). Necessity is computational. \(P=\varepsilon_J^{\pm(p-1)}\) is not a proof.

**Next strike:** put v4 Lemmas 1–2 and an \(\mathrm{SL}_2(\mathbb{Z})\) lift with \(A\equiv D\equiv 1\pmod{2p}\) on this desk; until then do not quote \(P=\varepsilon_J^{\pm(p-1)}\) as a theorem.