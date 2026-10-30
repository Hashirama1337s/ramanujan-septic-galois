I'll referee the v2 cubic fixes and the quintic invariance claim against the opened sources, with no invented locators. First I'll load the house brief and the papers the write-up cites.The arXiv HTML is up. I'll pull Theorem 4.2 and Kani's Corollary 23 next, then check the function-field step against those sentences.**In plain words.** The cubic law stays accepted with one fix still open. The quintic law is not a proof: the invariance of \(p\) under \(\Gamma_5^*\) is still a citation, and the step that puts the ring class field inside \(K(z)\) is still an assertion.

**Cubic: ACCEPTED WITH FIXES. Quintic: NOT A PROOF.**

## What was opened

Berndt–Rebak, arXiv:2312.15513v2, HTML (OPENED). Theorem 4.2:

- (ii) \(p := uv = 4q\,\chi(q)/\chi(q^5)^5\).
- (iv) \(u = (\alpha p)^{1/5}\) and \(v = (\beta p)^{1/5}\).
- (v) \(\xi^2 - ((p-1)^2+7)\xi + p^3 = 0\).

The polynomials \(F = X^3-2X^2+8X-S\) and \(X^5-V\) are not in the theorem. They do follow: with \(S = u^5+v^5\) and \(V = u^5 v^5\), the opened identities give \(S = p((p-1)^2+7)\) and \(V = p^5\), so \(F(p) = 0\). The quote "BR Thm 4.2(iv)–(v): \(p\) is a common root of \(F\) and \(X^5-V\)" is their rewrite, and the algebra checks. The non-constancy line \(p = 4q^{1/10}+\cdots\) is their nome \(q = e^{2\pi i\tau}\) for \(p = U_1 U_2\). In Berndt–Rebak's nome the same product begins \(4q+\cdots\). Either way \(p\) is non-constant.

Kani, *Idoneal numbers and some generalizations*, Ann. Sci. Math. Québec 35 (2011), Wayback PDF of the journal file (OPENED). Theorem 12 (Grube): if \(n\) is idoneal and \(t^2\mid n\), then \(t^2\in\{1,4,9,16,25\}\); if \(9\mid n\) then \(n\in\{9,18,45,72\}\); if \(25\mid n\) then \(n = 25\). Those four values and \(25\) sit in Theorem 1's list of 65, which is exhaustive up to 10,000, so \(9n\) idoneal forces \(n\in\{1,2,5,8\}\) and \(25n\) idoneal forces \(n = 1\). Corollary 23: at most one squarefree idoneal number above 1848, and the three cases that follow. Remark 24(a): Frei's claim of at most one idoneal number \(n>1848\) "is frequently repeated in the literature" and is not what Weinberger gives. The v2 list sentence matches this. Odd non-squarefree idoneals are \(9,25,45\). The possible extra idoneal above 1848 is odd only in case (ii), and then it is squarefree and \(1\pmod{4}\).

KSY25, arXiv:2506.14139, HTML (OPENED through the ray-class section). Lemma 7.3 was not in that span. KSY10: not opened. C5 Lemmas 0, 1, 3*, P: not opened. `div3_out.txt`, `div5_out.txt`: not opened.

## Cubic fixes

The Grube / Kani Corollary 23 / Remark 24 wording is done, and it matches the opened pages. \(n = 2,8\) left undecided is required: Theorem W assumes \(m\) odd, and \(m = 18,72\) are even.

Lemma S is now a proof. \(|\vartheta[a,b](iy)|\le U_a\) and \(|\vartheta[0,b](iy)|\ge L_0\) are the triangle inequality. At \(y = \sqrt{3}\) the printed margins match a direct truncation: \(L_0\approx 0.99134\), \(U_{1/3}\approx 0.635\), \(U_{1/5}\approx 0.835\), \(U_{2/5}\approx 0.560\), \(L_1\approx 0.773\). For \(y\ge\sqrt{3}\), \(U_a\) decreases termwise and \(L_0\) increases. Every exponent in \(U_{2/5}e^{\pi y/25}\) is at least \(3/25>0\), and every exponent in the sum for \(L_1 e^{\pi y/25}\) is positive, so \(U_{2/5}/L_1\) decreases. The separation persists.

Step 1's ray-class sentence checks: \(\mu\equiv\nu\,\bar\nu^{-1}\pmod{4l}\) gives \(\mu^{-1}\equiv\bar\nu\,\nu^{-1}\pmod{4l}\). Surjectivity \(\mathrm{SL}_2(\mathbb{Z})\to\mathrm{SL}_2(\mathbb{Z}/N)\) is the classical fact they invoke.

The cusp fix is not finished. The order formula \(\mathrm{ord}_q(B_1\circ g) = (l/2)(B_2\langle x_1\rangle-B_2\langle x_0\rangle)\) is on the page, and the identity coset really does give \(1/6\) once the characteristics are the half-integer shifts in their Step 2. The claim "12 cosets, six of order \(1/6\), three of order \(-1/3\), the rest 0" is a summary of `div3_out.txt`. Those rows are not on the page, and the file was not opened. Degree 1 for the cubic Hauptmodul is therefore unchecked here. The real-count formula is still a sketch, as v2 says; it is outside Theorem W.

## Quintic

Item 1 does not prove \(\Gamma_5^*\)-invariance of \(p\).

The page says \(S = B_1+B_2\) and \(V = B_1 B_2\) are invariant because "C5 Lemma 3*: \(B_k\circ M = B_{kA}\)" and \(\{A,2A\}=\{\pm1,\pm2\}\pmod{5}\). Lemma 3* is not quoted. In this same document the cubic use of that lemma is only the fixed case \(A\equiv\pm1\), conclusion \(B_1\circ M = B_1\). v1 itself named the missing step as the phase computation for the product \(g_{a_1}g_{a_2}/g_{a_0}^2\). A parenthetical that drops the phase is the same gap. The set arithmetic is fine: for \(A\in(\mathbb{Z}/5\mathbb{Z})^\times\), \(\{A,2A\}\) is \(\{1,2\}\) up to sign, and \(B_{-k}=B_k\) would preserve \(\{B_1,B_2\}\) if the transformation law has no \(k\)-dependent multiplier. That law is not proved here.

The function-field sentence is the right idea and is not yet a proof. In \(\mathbb{C}(S,V)[X]\) with \(S,V\) treated as free, \(\gcd(F,X^5-V)\) is \(1\). The repair, which is not written, is: \(V = p^5\) so \([\mathbb{C}(p):\mathbb{C}(V)] = 5\), and \(S(\zeta p)-S(p) = p\bigl((\zeta^3-1)p^2-2(\zeta^2-1)p+8(\zeta-1)\bigr)\) is not the zero function for \(\zeta^5=1\), \(\zeta\neq 1\) (divide by \(\zeta-1\); the leading coefficient \(\zeta^2+\zeta+1\neq 0\)). Thus \(S\notin\mathbb{C}(V)\). A degree-5 extension has no intermediate field, so \(\mathbb{C}(S,V)=\mathbb{C}(p)\).

Step 6 still asserts "\(z' = B_2(\tau_O)\) is a conjugate of \(z\) inside \(K(z)/K\)." Lemma P is cited inside the idoneal paragraph. For non-idoneal \(m\) with \(5\mid m\), the page does not show that the reciprocity image of \(t(\nu)\) meets \(\pm 2\pmod{5}\). Without \(z'\in K(z)\), the gcd puts \(p(\tau_O)\) in \(K(z,z')\), and \(H_O\subset K(z)\) does not follow. The cubic has no second root, so this hole is quintic-only.

The quintic divisor "index 18, ten cosets of order \(1/10\), five of order \(-1/5\)" is the same off-page summary (`div5_out.txt`, not opened). It is idle until invariance is proved.

Next strike: quote C5 Lemma 3* verbatim and write the multiplier of \(B_k\circ M\) for every \(M\in\Gamma_5^*\); the product \(B_1 B_2\) and the sum \(B_1+B_2\) are invariant only after that factor is shown to be 1, and then show \(B_2(i\sqrt{m})\) is a \(K\)-conjugate of \(B_1(i\sqrt{m})\) for every odd \(m\) divisible by 5.