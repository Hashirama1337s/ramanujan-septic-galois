I'll referee RESULT-G1 against the sources it cites, starting from the house boot and the sealed proof text.**In plain words.** The parts this note marks proved are a proof once one false sentence in the separation estimate is replaced. The full “if and only if” is not proved. The open step is real, and it is not the only open step. The strict score misses do not touch the theorem.

## Verdicts

**Lemma M.** Accepted. The product form on the page has positive factors, and \(\cos 2\pi a\) is strictly decreasing on \([0,1/2]\), so \(a\mapsto\mathrm{th}[a,0](iy)\) is strictly decreasing there.

**Lemma T.** Accepted with one fix. The sentence “\(|n+a|\ge|n|\) for \(n\le -1\)” is false: at \(a=1/4\), \(n=-1\), one has \(|n+a|=3/4<1\). The displayed lower bound is the right one under the true estimates \(|n+a|\ge n\) for \(n\ge 1\) and \(|n+a|\ge|n|-1/4\) for \(n\le -1\). With that swap, \(\Lambda(y)e^{\pi y/16}\) increases, \(U(y)e^{\pi y/16}\) decreases, and both exponent claims on the page are right. At \(y=\sqrt{3}\) the same formula gives \(\Lambda\approx 0.6605>U\approx 0.635\), in line with the printed \(0.660524\ldots\) and \(0.635420\ldots\). The file `pchk_out.txt` was not opened. The inequality is strict because the two tail bounds are not saturated at the same \(a\).

**Lemma K.** Accepted for prime \(l\). The \(t=0\) choice and the split \(3c\ge l\) / \(3c<l\) are correct, and \(k\le l/4\) for \(l\ge 12\) follows from \(k\le l/(3c)+1\le l/6+1\). Hand witnesses: \(l=5\), \(k=1\); \(l=7\), \(t=\pm 2\), \(k=3\) (the ceiling formula gives \(k=2\), which fails, and the note correctly leaves \(l\le 11\) to hand); \(l=11\), \(k=2\) for \(t=\pm 2,\pm 3\), and \(k=1\) for \(t=\pm 4,\pm 5\). The machine check of \(75{,}791\) pairs was not opened and is not needed.

**Lemma 1.** The modulus claim matches what was opened. KSY25 Lemma 7.4 (html, §7) is \(-\overline{\omega_{Q^\gamma}}=\widehat{\gamma}(-\overline{\omega_Q})\). KSY10 Proposition 2.4(ii) (arXiv:1008.0473, §2) gives a 12th root of unity depending only on \(\gamma\), so it cancels in a ratio; 2.4(iii) is a modulus-one shift. The identification of \(B_k\) with a Siegel ratio is C5 Lemma 1, not opened.

**Lemma 2.** Accepted for prime \(l\), given Lemma 1 and C5 Lemma 3* (not opened). The representative \(\mu=d_1-4l\sqrt{-m}\) is prime to \(4l\), and the top row is \((k,0)\bmod l\).

**Lemma W.** Not used in the parts marked proved. The leading \(q\)-power \((l^2-1)/(24l)\) checks. The claim that every positive odd residue mod \(2l\) appears twice is asserted, not listed. Leave it with the open case.

**(A), “if”, \(l=p^e\mid m\), \(m\) idoneal.** Accepted, given the cited Lemma P. Kani, Remark 7(b) (SNIPPET, `idoneal.pdf`): “\(c(\Delta)=1\Leftrightarrow\mathrm{Cl}(\Delta)\) is an elementary abelian 2-group.” Theorem 6 is the Grube criterion. Because \(p^e\mid m\), \(t+s\sqrt{-m}\mapsto t\) is a ring map into \(\mathbb{Z}/p^e\mathbb{Z}\), \(N(\lambda)\equiv t(\lambda)^2\), and \(u^2=1\) in the cyclic group \((\mathbb{Z}/p^e\mathbb{Z})^\times\), so \(u=\pm 1\). Then \(B_{-k}=B_k\). Abelianness is the conjugation argument of Kani’s Theorem 32, applied to \(\mathbb{Q}(z)\) through the unopened (L2).

**(A′), \(l=3\), \(m\equiv 2\pmod{3}\).** Not re-proved. Citation to RESULT-W1 §6 Step 5(b), not opened. Stands only as an already-refereed special case.

**(B), “only if”, prime \(l\nmid m\), except \(l=3\) split.** Accepted with the Lemma T fix. \(|N_1|=l+1\) or \(l-1\), and \(x\mapsto\bar x/x\) has image \(N_1\) by the count on the page. \(|N_1|>2\) except \(l=3\) split, which is \(m\equiv 2\pmod{3}\). Lemmas K and T give a piece and a Galois image with different absolute values. The ray-class group is abelian (KSY25 Proposition 3.1, opened), so those images cannot both fix a real \(z\). This covers idoneal and non-idoneal \(m\). It re-proves the \(l\in\{3,5\}\) torus step by a uniform argument.

**(C), \(l\mid m\) with two distinct prime factors.** Accepted on the page, given Lemma P at level \(l\). The displayed residues are \(u\equiv -1\) on one prime and \(u\equiv +1\) on the other, so \(c(u)\ge 2\), and Lemma M gives \(B_u(\tau_O)<B_1(\tau_O)\). No idoneal hypothesis and no generation hypothesis.

**(D) and the other open half.** Not proved. The note says so. \(K(V)=H_O\) is open for every \(l\ge 7\) that properly divides a non-idoneal \(m\), prime or prime power (so \(l=9\), \(m=27\) is open, not only prime \(l\)). Separately open, and only numerical: some prime-power part of \(l\) does not divide \(m\). Degree and real-count formulas are stated as unproved. That matches §3. It is wider than a single prime-level sentence in the header.

**Theorem U and the four specialisations.** The “if” half is the Shimura action (KSY25 Proposition 4.1, opened) plus (L2), unopened. The table is the right reduction: one stabiliser, plus generic stabiliser. Generic stabiliser for Theorem G is Lemmas K and T on the torus, and it stops where (D) stops. Rogers–Ramanujan: \(|N_1|\ge 4\) if \(5\nmid m\), and \(1+u\sqrt{-m}\) if \(5\mid m\), is a correct norm-one count; Hauptmodul injectivity is RESULT-R1, not opened. The cubic continued fraction is correctly withdrawn, not proved.

**Strict misses.** They do not bear on the proved steps. \(l=11\) does not divide \(m=1365\), so that row is case (B), which is analytic. \(\exp(-\pi\sqrt{1365})\) is about \(10^{-50.4}\), so a \(10^{-30}\) match can merge conjugates near \(2^{11}\). That explains a degree error. It was not re-run here. The failed null is a bad control: the note’s own diagnosis is that convention 2 is integral of the wrong degree. A control that does not fail does not falsify the statement.

## Final

**ACCEPTED WITH FIXES**, for the parts marked proved: (A) for prime powers, (B) for prime \(l\nmid m\), and (C) for two distinct primes. The fix is the tail sentence in Lemma T. The full Theorem G is **not a proof**.

## Prior art

Not found in the sources opened. Berndt–Rebak, arXiv:2312.15513v2 (OPENED): the last section says “as the order increases, we know less and less about the modular equations necessary for a possible grand theory.” A search of that html for “Galois” and “abelian” hits no classification. Kani Theorem 32 (SNIPPET) is the level-1 statement for \(j(\sqrt{-n})\) only; Remark 33, as far as the extract goes, is about powers of \(f,f_1,f_2\). KSY25 and KSY10 are the reciprocity and Siegel tools used here. Cho–Koo–Park, Gee–Honsbeek, Enge–Morain, Duke, and Cais–Conrad were not opened. No novelty claim.

Next strike: replace the false tail sentence in Lemma T, then prove \(K(V)=H_O\) for \(l=7\), \(m=49\), with \(V\) the Weber ratio at the two ambiguous forms.