I'll boot the house first, then open the named sources and check each PROVED claim against the actual statements.Local boot files are blocked from this tool, so I’m opening the arXiv and class-number sources next and checking the load-bearing statements.The HTML of KSY25 is open; I’ll pull Prop 4.1, Remark 3.2, Lemma 7.3, and Deuring §22 next.I have Deuring §22 and a class-number-2 table; next I’ll pin ω_Q, Remark 5.2(iii), Weber’s three roots, and how Deuring defines P_𝔭.**In plain words.** The abelian form of C4 and the 2-adic form of C3c are proofs from the sources they name. Lemma B is the load-bearing step and it matches Koo–Shin–Yoon Proposition 4.1 at level 1. The size bound and the product generating \(\mathbb{Q}(j(\sqrt{-p}))\) check. The list of primes with \(h(-4p)=2\) is still a gap: the opened class-number-2 sources list **fields**, and \(D=-4p\) is a non-maximal order when \(p\equiv 3\pmod{4}\).

---

### 1. Lemma B / B′ — **CORRECT**
**OPENED:** [KSY25] arXiv:2506.14139v1 HTML.

- \(\omega_Q=(-b+\sqrt{D})/(2a)\) (display before Prop. 3.1). Then \(-\overline{\omega_Q}=(b+\sqrt{D})/(2a)\).
- Prop. 4.1: \([Q]\mapsto\bigl(f(\tau_{\mathcal{O}})\mapsto f^{[1,\,-a'(b+b_{\mathcal{O}})/2;\,0,\,a']}(-\overline{\omega_Q})\bigr)\) is an isomorphism \(\mathcal{C}_N(D)\to\mathrm{Gal}(K_{\mathcal{O},N}/K)\). \(N\) is any positive integer, so \(N=1\) is allowed. \(\gcd(a,1)=1\) is automatic. \(aa'\equiv 1\pmod{1}\) holds; take \(a'=1\).
- \(\mathcal{F}_1=\mathbb{Q}(j)\) (KSY §4; [Deu] §1: \(\Lambda_{\mathfrak{M}}=\Lambda(j)\)). The level-1 matrix action on \(j\) is trivial (\(j(\tau+k)=j(\tau)\)). So \(\sigma_{[Q]}(j(\tau_{\mathcal{O}}))=j(-\overline{\omega_Q})\).
- \(\tau_{\mathcal{O}}=\sqrt{D}/2\) for \(D\equiv 0\pmod{4}\) (KSY (5)), hence \(\tau_{\mathcal{O}}=\tau_0\). \(K_{\mathcal{O},1}=H_{\mathcal{O}}\).
- Rem. 3.2(i): reduced means \(|b|\le a\le c\) and \(b\ge 0\) if \(|b|=a\) or \(a=c\); then \(a\le\sqrt{|D|/3}\); the reduced forms are a complete set of class representatives. Distinct classes give distinct \(\sigma_i\), and \(\mathrm{Gal}(K(j(\tau_0))/K)\) is determined by the image of \(j(\tau_0)\), so the \(j(t_i)\) are distinct.
- B′ is elementary from that \(a\)-bound. Proof of Prop. 4.1 is cited to [13, Thm 12.3] (**not opened**; already flagged).

### 2. Lemma C / Proposition D — **CORRECT**
**OPENED:** Wikipedia “Weber modular function”: the roots of \(j=(x-16)^3/x\) are \(\mathfrak{f}^{24},\,-\mathfrak{f}_1^{24},\,-\mathfrak{f}_2^{24}\). Product bounds use \(|1\pm z|\le e^{|z|}\) and \(r\le r_0=e^{-\pi\sqrt{3}}\). The three inequalities and the comparison \(4.888\,e^{\pi\sqrt{p}/2}<e^{\pi\sqrt{p}}\) (i.e. \(\sqrt{p}>2\ln 4.888/\pi\approx 1.0103\)) hold for \(p\ge 3\); \(19.7<e^{\pi\sqrt{3}}\le w\). Strictness for \(a\ge 2\) is correct.

In D, any extension \(\tilde\sigma\) sends \(w\) to one of the three roots at \(t_Q\), all strictly smaller than \(w\), so \(|\sigma(v)|>v\). Stabilizer in \(\mathrm{Gal}(H_{\mathcal{O}}/K)\) is trivial, \(K(v)=H_{\mathcal{O}}\), \(v\) real, \(\mathbb{Q}(v)=J\), then \(E=F_p\) by v4 C1 step 5. I did not open `g_c4c3c_out.txt`.

### 3. Lemma E — **CORRECT**
Fourier coefficients of \(j\) are rational integers ([Deu] (9)), so \(\overline{j(t)}=j(-\overline{t})\). The identifications \(-\overline{t_Q}=\tau_Q=t_{Q'}\) match the definitions. The reduced-form count for \(D=-4p\) (\(b\) even) is complete: only \((1,0,p)\), and \((2,2,(p+1)/2)\) when \(p\equiv 1\pmod{4}\). Rem. 3.2(i) then gives \(h=1\) or \(h=2\).

### 4. C4 both ways — **CORRECT WITH FIXES**
(ii)\(\Rightarrow\)(i) is C1. (i)\(\Rightarrow\)(iii): subfield of an abelian extension of \(\mathbb{Q}\) is Galois, so \(J/\mathbb{Q}\) Galois and real, hence every \(j(t_i)\) is real, then Lemma E.

(iii)\(\Rightarrow\)(ii) without Gauss sums: **OPENED** KSY Lemma 7.3: \(K_{\mathcal{O},N}/\mathbb{Q}\) is Galois with \(\mathrm{Gal}=\mathrm{Gal}(K_{\mathcal{O},N}/K)\rtimes\langle\mathfrak{c}\rangle\). At \(N=1\), \([H_{\mathcal{O}}:\mathbb{Q}]=2h\le 4\), so the group is abelian; the compositum \(M=H_{\mathcal{O}}\mathbb{Q}(\zeta_p)\) is abelian, hence so is \(F_p\). Proof of 7.3 is cited to [14] (**not opened**).

**Fix.** The extra sentence “moreover, (iii) means \(h=1\) for \(p\equiv 3\pmod{4}\) and \(h=2\) for \(p\equiv 1\pmod{4}\)” is proved only under (i), via Lemma E. Unconditionally it needs that \(h(-4p)\) is never 2 for \(p\equiv 3\pmod{4}\). The explicit cyclotomic identifications use GAP-G (as labeled) and only the two cases that occur in the tables; the abelian conclusion does not need them.

h=1 half: **OPENED** KSY Rem. 5.2(iii): \(|\mathcal{C}_1(D)|=1\) iff \(D\in\{-3,-4,-7,-8,-11,-12,-16,-19,-27,-28,-43,-67,-163\}\). The only \(D=-4p\) with \(p\ge 3\) prime are \(-12,-28\), i.e. \(p=3,7\).

### 5. GAP-L — **GAP**
**OPENED:** Watkins, *Math. Comp.* **73** (2004), 907–938, PDF: Baker and Stark “completed the classification for \(N=1\) and \(N=2\)”; the paper treats **fundamental discriminants / fields**.  
**OPENED:** http://www.numbertheory.org/classnos/ : squarefree \(d\) with field class number 2 are \(5,6,10,13,15,22,35,37,51,58,91,115,123,187,235,267,403,427\). The only primes \(\equiv 1\pmod{4}\) in that list are \(5,13,37\).  
**SNIPPET:** Wikipedia “Class number problem”: “Class number 2: solved, Baker (1971), Stark (1971)”; no list.  
**Not opened:** Baker 1971, Stark 1971, LMFDB.

Those sources list **fields**. For \(p\equiv 1\pmod{4}\), \(D=-4p\) is fundamental, so \(\{5,13,37\}\) is the complete list of such primes with \(h(-4p)=2\) if one takes that table as the Baker–Stark list. For \(p\equiv 3\pmod{4}\), \(\mathcal{O}=\mathbb{Z}[\sqrt{-p}]\) has conductor 2, so the field theorem does not list \(h(-4p)\). The write-up is right to leave the list form as GAP-L.

### 6. C3c / C3b-again — **CORRECT WITH FIXES**
**OPENED:** [Deu] arXiv:2006.04531v1 HTML, §22 (pp. 41–42 in the write-up’s pagination; HTML around the divisor theorem). \(\varphi_S(\omega)=s^{12}\Delta(S(\omega_1;\omega_2))/\Delta(\omega_1;\omega_2)\) (§3). \(\approx\) means associated (ratio a unit; §22 preliminary remark). Cases used:

- 1.2 split: \(\varphi_P\approx p^{12}\) when \(P(\alpha)\) is a characteristic ideal of \(R_{fp^{-1}}\);
- 3.2 inert: \(\varphi_P\approx p^{12[1-1/(p^{t-1}(p+1))]}\); \(t=1,p=2\) gives exponent \(8\);
- 2.3 ramified: \(\varphi_{P_{\mathfrak{p}}}\approx p^6\) when \(P_{\mathfrak{p}}(\alpha)\) is a basis of \(\mathfrak{a}\mathfrak{p}\).

§13: \(\prod_{\nu=1}^{p+1}\varphi_{P_\nu}(\alpha)=p^{12}\).

Lemma F: \(P_C=[1,1;0,2]\), \(\alpha_1=\sqrt{-p}\), \(\alpha_2=1\), homogeneity gives \(\varphi_{P_C}(\tau_0)=\Delta((\tau_0+1)/2)/\Delta(\tau_0)=-w\). Lemma G’s split/inert/ramified checks for \(2\) are elementary and match the three hypotheses.

**Fix.** Deuring defines \(P_{\mathfrak{p}}\) as a matrix of determinant \(p\), unique up to equivalence, for which \(P_{\mathfrak{p}}(\alpha_1;\alpha_2)\) is a basis of \(\mathfrak{a}_R\mathfrak{p}_R\) (§13). The write-up must say that \(P_C\) is such a matrix in the ramified case (it already shows the image lattice is \(\mathfrak{p}\)). Then \(c=0,4,6\), \(v_P(y)=(c/12)v_P(2)\), and \(e=pc\cdot h(p-1)/24\) are correct. C3b no longer needs G3′/G5.

---

### Package: **ACCEPTED WITH FIXES**
Intrinsic C4 (\(F_p/\mathbb{Q}\) abelian \(\Leftrightarrow h(-4p)\le 2\)) and C3c are proofs. Keep GAP-G, GAP-L, and the inherited citations ([13],[14], Hasse 1931) as named. The strong sine-product form is correctly **OPEN**. Insert the two fixes in §4 and §6.

Next strike: on the page, count reduced ambiguous forms and quote that they give \(\mathrm{Cl}[2]\), so \(h(-4p)\) is never 2 for \(p\equiv 3\pmod{4}\); then GAP-L shrinks to the field class-number-2 theorem for \(p\equiv 1\pmod{4}\).