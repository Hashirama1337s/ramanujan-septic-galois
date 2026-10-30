I'll boot the house spec first, then referee REPAIR-GD against the lemmas and the size argument.The closed form is the first checkpoint; I’ll open KSY and Weber’s f identities next and then stress-test the size bound.**In plain words.** The repair does close the gap. Multiplying only the unit-index pieces puts the product in \(K(z)\) by Lemma 2, the Weber ratio at levels \(l\) and \(l/p\) is the right closed form, and the size comparison still forces \(K(V')=H_O\) for every prime power \(l=p^e\) (\(e\ge 2\)) dividing odd \(m\), with the single analytic exclusion \((l,m)=(9,9)\) (idoneal, so (D) is empty there). Two constant patches remain, matching the local referee. No circularity.

---

**(1) Closed form for \(V'\). CORRECT.**

Lemma W (RESULT-G1, any odd level) gives
\[
V^{(L)}=2^{L(L-1)/2}\bigl(f(\tau/L)/f(\tau)^L\bigr)^L.
\]
For \(l=p^e\), the non-units in \(\{1,\dots,(l-1)/2\}\) are exactly \(k=pk'\) with \(1\le k'\le(l'-1)/2\), \(l'=l/p\). Under the powered definition of \(B_k\) used by that formula (and by C5 Lemma 1), \(B_{pk'}^{(l)}=(B_{k'}^{(l')})^p\), so the non-unit product is \((V^{(l')})^p\) and
\[
V'=V^{(l)}/(V^{(l')})^p=2^c\bigl(f(\tau_O/l)/f(\tau_O/l')\bigr)^l f(\tau_O)^{-l\varphi(l)},
\]
with \(c=l(l-1)/2-p\,l'(l'-1)/2\). The exponent of \(f(\tau_O)\) is \(-l^2+p(l')^2=-l\varphi(l)\). Raising to the 24th power is \(V'^{24}=2^{24c}\,w_a^l w_b^{-l}w_1^{-l\varphi(l)}\). Phases/24th roots are irrelevant: step 1 never uses the closed form, and step 4 uses moduli.

OPENED: Wikipedia, Weber modular function, definition of \(\mathfrak f\) and “The transformation \(\tau\to-1/\tau\) fixes \(f\)”; cubic \((X-16)^3-jX=0\) with roots \(f^{24},-f_1^{24},-f_2^{24}\).

---

**(2) Size / content \(\ge p\). CORRECT WITH FIXES.**

\(\tau_O/l'\) is a root of the form \((l',0,pm')\). Content \(d_b=\gcd(l',pm')\). Since \(e\ge 2\), \(p\mid l'\), hence \(d_b\ge p\) for every odd prime \(p\), every \(e\ge 2\), every odd \(m'\). Discriminant \(-4m/d_b^2\) divides \(-4m\) with square cofactor, so \(j(\tau_O/l')\) lies in a ring class field of an order containing \(O\), hence in \(H_O\). Same for \(\tau_O/l\) with \(d_a=\gcd(l,m')\ge 1\). Reduced heights: \(\mathrm{Im}\,t'\le\sqrt{m}/d_a\) and \(\sqrt{m}/d_b\).

The comparison
\[
\log\bigl(|\sigma V'|^{24}/V'^{24}\bigr)=l\bigl[\varphi(l)(\log w_1-\log|\tilde\sigma w_1|)+(\log|\tilde\sigma w_a|-\log w_a)-(\log|\tilde\sigma w_b|-\log w_b)\bigr]
\]
is the right combination of three Weber cubics. Worst-case bounds from RESULT-G1 §3b / v5.1 B, B', C are inserted independently, which is valid as a lower bound.

Fixes (same as the local referee, rechecked):
- \(\log 3688=8.2128\ldots\). Printed \(8.213\) is an unsafe over-round. For \(l\ge 25\) the crude estimate uses \(\min(1.018,X)\ge 1.018-2\pi\sqrt{m}\) and never touches \(8.213\). For \(l=9\) it is used; replacing by \(8.2128\) and keeping \(-3.935\) still gives a positive bound.
- At \(l=9\), \(d_b=3\), worst \(d_a=1\), \(m'=m/9\ge 3\):
  \[
  F\ge 2\pi\sqrt{m'}+\pi\bigl(\sqrt{m'}-\max(\sqrt{m'}/3,\,3/\sqrt{m'})\bigr)-3.935.
  \]
  The right-hand side increases in \(m'\) for \(m'\ge 3\), and at \(m'=3\) equals \(2\pi\sqrt{3}-3.935=6.9478\ldots\) (print \(6.948\), not \(6.95\)).
- \((9,51)\) is not a test of the statement: \(9\nmid 51\).

The only place the lower bound on \(F\) goes negative is \(m'=1\), i.e. \(m=9\), which is idoneal (OPENED: Wikipedia, Idoneal number, Euler–Gauss list begins \(1,2,3,4,5,6,7,8,9,\ldots\); \(27\) is absent). For \(l\ge 25\), \(\varphi(l)\ge 18\) and \(\sqrt{m}\ge 5\) give \(F\ge 6.26\varphi-54.1>0\) even at \(m=l\). So the size argument covers every claimed pair.

---

**(3) \(K(V')=H_O\) and \(H_O\subset K(z)\). CORRECT.**

Step 1: each unit-index \(B_k(\tau_O)\) is a \(K\)-conjugate of \(z\) (Lemma 2). \(K(z)/K\) is abelian because \(z\) is a CM value of a level-\(l\) modular function, hence lies in the ray class field of \(O\) (OPENED: KSY arXiv:2506.14139, (2) and §2: \(K_{O,N}/K\) abelian). Subextensions of abelian extensions are Galois, so every such \(B_k\) lies in \(K(z)\) and \(V'\in K(z)\). Principal classes permute unit pieces (C5 Lemma P, only \(l\mid m\)); \(V'\) is fixed by \(\mathrm{Gal}(L/H_O)\) and lies in \(H_O\), and is real positive.

Step 4: for \(\sigma\in\mathrm{Gal}(H_O/K)\), \(\sigma\neq 1\), the bound gives \(|\sigma V'|>V'\), so \(\sigma\) does not fix \(V'\). Thus \(K(V')=H_O\), hence \(H_O\subset K(z)\). If \(m\) is not idoneal then \(\mathrm{Cl}(-4m)\) is not elementary \(2\)-torsion (OPENED/SNIPPET: Kani, Idoneal numbers, Thm 6 / Rem. 7(b) and Thm 32: \(Q(j(\sqrt{-n}))/Q\) Galois iff \(n\) idoneal), so \(H_O/Q\) is non-abelian, and any field containing \(H_O\) is non-abelian over \(Q\). That is (D).

---

**(4) Circularity. CORRECT (none left).**

The original hole was “\(V\in K(z)\) by Lemma 2” for *all* \(k\). The repair invokes Lemma 2 only for \(\gcd(k,l)=1\). Abelianness of \(K(z)/K\) is CM, not the \(Q\)-abelian claim. The Weber identity is an identity of modular functions, independent of Galois generation. The rest of (D) is the standard inversion action of complex conjugation on \(\mathrm{Cl}(O)\).

---

**Overall: CORRECT WITH FIXES.** Patch \(8.2128\) and \(6.948\); delete \((9,51)\) from the bar. The argument then proves (D) at every prime power \(l=p^e\), \(e\ge 2\), dividing a non-idoneal odd \(m\).

Next strike: write those two constants into REPAIR-GD and reseal the bar without \((9,51)\).