I'll re-judge the revised write-up against the opened sources, starting with the two round-1 gaps: the root-of-unity expansion and where Shimura reciprocity is applied.In plain words, the root-of-unity sum is now a real argument, and the matrix move lands on the point Cox–McKay–Stevenhagen actually use. The Galois and field rules for a prime that is 1 mod 4 are in good shape. The same rules for a prime that is 3 mod 4 still call a general reciprocity law a quotation. The “not a unit” theorem for primes that are 3 mod 8 still turns on a floating-point permutation. That keeps the package short of a proof.

## Verdicts

**Lemma 3 (the exponent E).** CORRECT WITH FIXES.

KSY Proposition 2.4(iii), opened, states \(g_{r+s}=(-1)^{s_1 s_2+s_1+s_2}e^{-\pi i(s_1 r_2-s_2 r_1)}g_r\). For odd \(p\), the six exponents T1–T6 match that formula together with \((-i)^{k-k'}=i^{-(k-k')}\). Class I, \(x\equiv 1\pmod{4O}\), reduces exactly as written, and the sum is \(0\pmod{4}\). Class II’s exact formula
\[
E=2\big[(s_1+1)(s_2+1)-(c_1+1)(c_2+1)\big]+k(B-A+1)+2ks_2
\]
is right, and both subcases (\(s\) even and \(s\) odd) give \(E\equiv 0\pmod{4}\). The Chinese-remainder gluing is right, and \(i^E=1\), so the identity is exact.

Two repairs: the line “T3+T6 \(= -pk M_{11}\)” drops \(-pc_2\). The true line is T3+T6 \(= -pk M_{11}-pc_2\), and that \(pc_2\) cancels the one in T4. The bracket is even, so twice the bracket is \(0\pmod{4}\); it need not itself be \(0\pmod{4}\). The banner “up to sign” is then too weak.

**\(S g_{\tau_c} S^{-1}=g(y)\).** CORRECT.

CMS (3.2), opened, §3: \(g_\tau(a+bn\tau)=\begin{pmatrix}a&-b\\ nb&a\end{pmatrix}\) for Case 1. With \(S=\begin{pmatrix}0&-1\\ 1&0\end{pmatrix}\) and \(S^{-1}=\begin{pmatrix}0&1\\ -1&0\end{pmatrix}\),
\[
S\begin{pmatrix}t&-s\\ ps&t\end{pmatrix}S^{-1}=\begin{pmatrix}t&-ps\\ s&t\end{pmatrix}.
\]
Then \(Sg_{\tau_c}(y)=g(y)S\), so the right action sends \(B_k\circ S\) to \(B_{tk}\circ S\). At \(\tau_c=-1/\sqrt{-p}\) one has \(S(\tau_c)=\sqrt{-p}\).

**(3.1) at CMS’s point.** GAP for \(p\equiv 3\pmod{4}\). CORRECT for \(p\equiv 1\pmod{4}\), by the other route.

CMS (3.1), opened, §3, is the sentence “Shimura’s reciprocity law tells us how (the Artin symbol of) the idele \(x\in\widehat{\mathcal O}^*\) acts on \(f(\tau)\): we have \(f(\tau)^x=f^{g_\tau(x^{-1})}(\tau)\).” The \(f\) of that section is a \(\Gamma_0(n)\)-function with rational \(q\)-expansion. Case 1 in the same section is \(\tau=-1/\sqrt{-n}\), order \(\mathbb Z[n\tau]=\mathbb Z[\sqrt{-n}]\). The revised point matches Case 1. The revised function \(B_k\circ S\in F_{4p}\) does not match that \(f\). Invariance under \(\Gamma(4p)\) is a smaller demand than invariance under \(\Gamma_0(4p)\). The sentence “no extension beyond the opened text is used” is false. The missing citation is Shimura’s Theorem 6.31, which this seat did not open.

For \(p\equiv 1\pmod{4}\), KSY Proposition 4.7, opened, applies directly at \(\theta_K=\sqrt{-p}\): \(W_{K,4p}\) consists of the matrices \(\begin{pmatrix}t&-ps\\ s&t\end{pmatrix}\) and maps onto \(\mathrm{Gal}(K(4p)/H_K)\) by \(h(\theta_K)\mapsto h^\alpha(\theta_K)\), kernel \(\{\pm I\}\) since \(p\ge 5\). Lemma 3 then gives \(\beta_k\mapsto\beta_{tk}\).

**C1 and C2, \(p\ge 5\).** GAP.

Both say “as in v1.” For \(p\equiv 1\pmod{4}\) the new input, Proposition 4’s second route, is opened and sufficient, modulo Cox’s Theorem 11.1 for \(H_O=K(j(\sqrt{-p}))\) when one still wants the non-maximal wording, and modulo Lemma 2’s membership \(B_k\in F_{4p}\) (still “as in v1”). For \(p\equiv 3\pmod{4}\) they stand on the GAP above. Naming Shimura 6.31 and Cox 11.1 is the right shape of gap. Asserting that the opened CMS text already contains the general case is not.

**C3a, \(p\ge 5\).** CORRECT WITH FIXES.

KSY 2.2(i)–(ii) and 3.1(i): primitive denominator \(2p\) makes \(g_{a_k}(\tau_0)\) a unit when \(p\nmid k\). From 2.6(ii), \(y\cdot g_{(1/2,1/2)}(\tau_0)\) is \(2\) times a root of unity, so \(y\) is an algebraic integer dividing \(2\). Thus \(b_k\) is a \(\{2\}\)-unit and its norm to \(\mathbb Q\) is \(\pm 2^e\). The displayed prefactor in Lemma 5 matches 2.6(ii). The second constant, “\((-i)^k(-1)e^{\pi i p/4}\)”, does not equal \((-i)^k e^{-\pi i p/4}\). State \(p\nmid k\). The denominator of \(a_0=(1/2,1/2)\) is \(2\), which is not composite.

**C3b, \(p\equiv 3\pmod{8}\), \(p\ge 11\).** GAP.

These parts check. KSY 4.7 at \(\tau'=(-1+\sqrt{-p})/2\), minimal polynomial \(X^2+X+(p+1)/4\) with \((p+1)/4\) odd, gives \(|W_{K,2}|=3\). Modulo \(2\), \(-I=I\), so \(|\mathrm{Gal}(K(2)/H_K)|=3\). The matrix for \((t,s)=(0,1)\) is \(\equiv\begin{pmatrix}1&1\\ 1&0\end{pmatrix}\pmod{2}\), and that matrix cubes to the identity over \(\mathbb F_2\). The identity \(y^{12}=-\mathfrak f_2(\tau')^{24}\) follows from the \(q\)-product definitions in the text, \(\tau_0=2\tau'+1\), and \(\Delta(\tau+1)=\Delta(\tau)\). For \(p\equiv 3\pmod{8}\), \(-p\equiv 5\pmod{8}\), so \(2\) is inert; one inertia group in an abelian extension is then the whole \(\mathrm{Gal}(K(2)/H_K)\). The ratio \(v(y)/v(2)\) is unchanged in further extensions, and
\[
e=p\cdot[F_p:\mathbb Q]/3=p\cdot h(-4p)(p-1)/6
\]
is the right norm exponent. The monic cubic \(X^3-48X^2+(768-j)X-4096\) has product of roots \(4096\). Gee’s numdam PDF was opened; the text layer is broken. Fragments in §4 show “level 2,” “rational” Fourier coefficients, and “\((X-16)^3-jX\)”. No clean sentence is available.

The hole: “T swaps \(R_0\leftrightarrow R_1\) and S swaps \(R_1\leftrightarrow R_2\)” is a 614-digit file, not a transformation law. Without an algebraic 3-cycle, equal valuations are not proved. G3′ (Hilbert class field unramified; ray class field modulo \(2\) unramified outside \(2\)) is a fair named definitional gap. The file is not.

**C3c.** Correctly labelled CONJECTURE. Hasse–Deuring was not opened here either.

**Final verdict: NOT A PROOF.**

## Sources

CMS, arXiv:math/0311202, ar5iv HTML: OPENED. (3.1), (3.2), Case 1 table, and the §2 form-class sentence citing Cox, Theorem 7.7, as quoted above.

KSY, arXiv:1008.0473v2, ar5iv HTML: OPENED. (1.3); Propositions 2.1, 2.2, 2.4, 2.6 (including the product in the proof of 2.6(i)); 3.1(i); 4.3; 4.7, equation (4.2).

Gee, JTNB 11 (1999) 45–72, numdam PDF: OPENED, text layer broken. Fragments only.

Shimura, Cox, Neukirch, Schertz: not opened. The PARI transcripts were not re-run.

Next strike: prove, from the Weber transformation law or from irreducibility of \((X-16)^3-jX\) over \(H_K\), that \(\sigma_\alpha\) cycles \(R_0(\tau'),R_1(\tau'),R_2(\tau')\), and replace the false T3+T6 line by T3+T6 \(=-pkM_{11}-pc_2\).