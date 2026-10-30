I'll referee Prop D_l against the sources, starting with the house boot and the files the proof cites.**In plain words.** The size argument is the right one, and it does close the prime case, including the test point \(l=7\), \(m=49\). Two printed decimals in the comparison are rounded the unsafe way, so that line is not an equality, but a corrected bound stays positive by a wide margin. The discriminant sentence is wrong as soon as \(l\) is composite. Lemma T and the square root in Lemma W are fixed correctly.

Not opened: v5.1 Lemmas B, B', C; `pchk_out.txt`; `pd_out.txt`; C5 Lemma P; `kani2011`.

**Lemma T.** The repaired estimate is the right one. For \(0\le a\le 1/4\) and \(n\le -1\), \(|n+a|=|n|-a\ge |n|-1/4\), and the old claim \(|n+a|\ge |n|\) is false (\(a=1/4\), \(n=-1\)). The exponents \((n-1/4)^2-1/16\ge 1/2\) and \(n^2-1/16\ge 15/16\) make \(\mathrm{Lam}(y)e^{\pi y/16}\) increase, and \((n+1/3)^2-1/16\ge 7/144\) makes \(U(y)e^{\pi y/16}\) decrease. At \(y=\sqrt 3\), direct summation gives \(\mathrm{Lam}=0.660524\ldots\) and \(U=0.635420\ldots\). So \(\mathrm{Lam}>U\) for all \(y\ge\sqrt 3\).

**Lemma W, step 0.** For fixed \(j\ge 1\), \(k\) from \(-(l-1)/2\) to \((l-1)/2\) makes \(2lj-l+2k\) run through the \(l\) odds \(2l(j-1)+1,\ldots,2lj-1\) once; the minus sign repeats the set. The \(q\)-powers cancel, \((l^2-1+1-l^2)/24l=0\), and
\[
V^{24}=2^{12l(l-1)}\,w_2^l/w_1^{l^2}.
\]
The positive square root is the one with leading coefficient 1.

**Step 2 (order for \(w_1\)).** OPENED KSY25 (ar5iv of arXiv:2506.14139), Remark 3.2(i): a reduced form satisfies \(|b|\le a\le c\), and the reduced forms are the classes in \(\mathcal C_1(D)\). Proposition 4.1 at level \(N=1\) sends the class of \(Q\) to \(j(\omega_Q)\). For \(D=-4m\), the only reduced form with \(a=1\) is \((1,0,m)\), so a non-identity conjugate has \(a\ge 2\) and \(\sqrt 3/2\le \mathrm{Im}\,t_Q\le\sqrt m/2\). OPENED Wikipedia, Weber modular function, “Relation to \(j\)-function”: the roots of \(j=(x-16)^3/x\) are \(f^{24},-f_1^{24},-f_2^{24}\). So a conjugate of \(w_1\) has modulus at most \(\max|R_i(t_Q)|\). The factor \(\exp(24\,r^{1/2}/(1-r))\) at \(r=e^{-\pi\sqrt 3}\) is \(<4.888\), and \(|R_2|\) is smaller, so \(|\widetilde\sigma(w_1)|\le 4.888\,e^{\pi\sqrt m/2}\). Lemma C itself was not opened; the bound was recomputed.

**Step 3.** OPENED same Wikipedia page: “The transformation \(\tau\to -1/\tau\) fixes \(f\) and exchanges \(f_1\) and \(f_2\).” Thus \(w_2=f(iY)^{24}\) with \(Y=\sqrt m/\min(l,m')\). Since \(l\ge 5\) and \(m'\ge 3\), \(\min\ge 3\), so \(1\le Y\le\sqrt m/3\). The product at \(Y\ge 1\) is \(<\exp(24\,e^{-\pi}/(1-e^{-2\pi}))<2.83\), and \(w_2<2.83\,e^{\pi\sqrt m/3}\).

**Step 4.** The form \((l,0,m')\) has discriminant \(-4m\) and content \(d=\gcd(l,m')\). The order of \(\tau_O/l\) has discriminant \(D'=-4m/d^2\), not only the two values written in the proof. For prime \(l\), \(d\in\{1,l\}\), so the split is complete. For composite \(l\) the sentence is false; the estimates still hold, because \(|D'|\le 4m\) and a reduced \(\mathrm{Im}\) is at least \(\sqrt 3/2\). The inequalities \(1-x\ge\exp(-x/(1-x))\), \(r<0.004334\), \(|R_0|,|R_1|>2.77\), and \(|R_2|>3688\,e^{-2\pi\sqrt m}\) check out. The constant \(3688\) is only about \(0.01\) above the rounded expression, but the inequality is strict.

**Step 5.** The shape
\[
\log(|\sigma V|^{24}/V^{24})=l\log(|\widetilde\sigma w_2|/w_2)+l^2\log(w_1/|\widetilde\sigma w_1|)
\]
is right, and bounding the two factors separately is legitimate. The next line is not. Printed: \(2\pi+\pi/3=7.330\) and \(\pi/2=1.5708\). In fact \((7/3)\pi=7.33038\ldots\) and \(\pi/2=1.570796\ldots\), both the unsafe way, and the “\(=\)” is false. With those constants replaced by \((7/3)\pi\) and \(\pi/2\), and with \(7.172<\log(3688/2.83)\) and \(1.5868>\log 4.888\), the corrected \(F(5,\sqrt{15})>1.26\) and \(F(7,\sqrt{21})>12\). So \(|\sigma V|>V\) survives for every odd \(l\ge 5\) and every allowed \(m\).

**Hand case \(l=7\), \(m=49\).** SNIPPET, Wikipedia “Complex multiplication”: “\(j(\mathbf Z[i])=j(i)=1728\).” Expanding, \((X-16)^3-1728X=(X-64)(X+8)^2\). The positive root is \(f(i)^{24}=64\). Those three roots are rational, so the only Galois conjugate of \(w_2\) is \(64\); calling \(-8\) a conjugate is the wrong word. Using modulus \(8\) is still a valid lower bound. Then \(7\log(8/64)+49(7\pi/2-\log 4.888)=-14.556+461.0>0\). Separately, the primitive reduced forms of discriminant \(-196\) are exactly \((1,0,49)\), \((2,2,25)\), \((5,2,10)\), \((5,-2,10)\), so \(h(-196)=4\). The class of \((5,2,10)\) is not its inverse, so the group is cyclic of order \(4\), not exponent \(2\).

**Prop \(D_l\): ACCEPTED WITH FIXES.** **Theorem G for every odd prime \(l\): ACCEPTED WITH FIXES.** The fixes are the step-5 constants and, on the composite side of \(D_l\), \(D'=-4m/d^2\).

Next strike: the torus half for composite \(l\) when a prime-power part of \(l\) does not divide \(m\).