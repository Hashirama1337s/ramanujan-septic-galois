I'll boot the house spec and open the cited sources before judging the ramification claim.The pasted claim is in hand; next I open Deuring, KSY25, and the house files the ramification step actually cites.Deuring §22 and the ramification bound in KSY25 are the load-bearing citations; I'll pull those pages next.Section 22 is located; I'll open the case list and the product formula next.I still need §13’s product formula and the local v5.1/v4 inputs Step 1 cites.Deuring §22 and KSY25 §2 match the quotes. The remaining hole is the cyclotomic intersection in (vi). Checking that compositum formula against the stated residue degrees.**In plain words.** Given the earlier C3/Lemma 5 inputs, the page proves the valuation claim: every prime of \(F_p\) above 2 has \(e(P\mid 2)=e\in\{2,3\}\), so \(v_P(b_k)=p\) for all such \(P\) and all \(k\), \((b_k)=r^p\), and the two unit statements. The ramification argument is a real proof. Uniformity in \(k\) is already in Lemma 5. The residue-degree closed form \(f_M=\mathrm{lcm}(2,\mathrm{ord}_p 2)\) is not proved: it skips \(H_O\cap\mathbb{Q}(\zeta_p)\). Numerics confirm; they do not prove.

**Sources.** [Deu] arXiv:2006.04531v1 HTML: **OPENED** (§22 L5635–5916; preliminary remark L5644–5754; cases 1–3 L5806–5828; fn. 10 L5799–5804; §13 product L4143). [KSY25] arXiv:2506.14139v1 HTML: **OPENED** (eq. (3)–(4) L133–155; (i) L163–164). v4 Lemma 5, v5.1 C3/Lemma G/F, C1, KSY10 4.7: **not found** this session (local; `file://` blocked). Hasse 1931, Cox, Yui–Zagier: **not found**. Computations: not re-run; confirmation only.

---

**Step 1 (i). ACCEPTED as corollary.** C3 + Lemma 5 give \(v_{\mathfrak{P}}(b_k)=(pc/12)v_{\mathfrak{P}}(2)\) on \(\overline{\mathbb{Q}}\); descending to \(L\ni b_k\) is \(v_P=v_{\mathfrak{P}}/e(\mathfrak{P}\mid P)\). Independent of \(k\) and of the prime above 2. Inputs not re-opened.

**Step 2. ACCEPTED as cross-check.** [Deu] L5670–5674: “the two (algebraic) numbers \(\varphi_S(\alpha)\) and \(\varphi_{S'}(\alpha)\) are associated”; L5749–5754: the ratio “is prime to the arbitrarily specified prime number \(p\), whence a unit”. Cases 2.3 and 3.2 (L5823, L5828) put \(\varphi_{P_C}(\tau_0)\) on a power of the unique prime of \(K\) above 2. Uniformity does not need the glyph.

**Step 3, Lemma R. ACCEPTED.** Attack on \(e(P\mid 2)\):

- \(M=H_O(\zeta_p)\supset F_p\), \(e(P\mid 2)\le e(\mathfrak{P}\mid 2)\). Compositum: \(\mathbb{Q}(\zeta_p)/\mathbb{Q}\) ramifies only at \(p\), so \(M/H_O\) is unramified above 2. (Their \(\mathrm{disc}(X^p-1)=\pm p^p\) is the same fact; locator for that discriminant **not found** here.)
- \(p\equiv 1\pmod 4\): [KSY25] (i) with \(\ell_O N=1\): “Every nonzero prime ideal of \(\mathcal{O}_K\) that ramifies in \(K_{\mathcal{O},N}\) divides \(\ell_{\mathcal{O}}N\mathcal{O}_K\)”. So \(H_O/K\) is unramified. \(e(2\mid K)=2\). Hence \(e(\mathfrak{P}\mid 2)\le 2\).
- \(p\equiv 3\pmod 8\): \(P_{\mathbb{Z},1}(\mathcal{O}_K,2)\) contains the ray group \(P_{K,1}(2)\) by (3)–(4), so \(H_K\subset H_O\subset K(2)\). The count \(|( \mathcal{O}_K/2\mathcal{O}_K)^*|/|\mathrm{im}\,\mathcal{O}_K^*|=3\) is written on the page; the exact sequence is **not found** this session. Thus \(e(\mathfrak{P}\mid 2)\le 3\).
- Integrality: \(v_P(b_k)=(pc/12)e(P\mid 2)\in\mathbb{Z}\) forces \(2\mid e(P\mid 2)\) or \(3\mid e(P\mid 2)\). Combined with the upper bounds, every \(P\) has \(e(P\mid 2)=e\). Mixed \(e\) is impossible. The bound is the local degree, so wildness of 2 is already in \(K/\mathbb{Q}\) when \(e=2\).

**Step 4 (iii)(iv). ACCEPTED.** \(pc e/12=p\). Then \((b_k)=r^p\), \(r^e=2\mathcal{O}\), \(b_j/b_k\) a unit, \(b_k^e/2^p\) a unit. (The ratio \(b_j/b_k\) is already a unit from Lemma 5.) Galois invariance of \(r\) uses only that \(\sigma\) preserves primes above 2.

**Uniformity in \(k\). ACCEPTED.** Lemma 5: each \(b_k\) is a unit times \(y^p\). The 2-adic ideal is Galois-invariant, so \(\sigma(b_k)=b_{tk}\) moves nothing at 2.

**Step 5(v). ACCEPTED.** Same \(e\) on \(M\) and on \(H_O\) because \(M/H_O\) is unramified at 2. For \(p\equiv 3\pmod 8\), \(e(Q\mid 2)=3\) and \([H_O:J]=2\) force \(e(Q\cap J\mid 2)=3\) (the degree-2 piece cannot supply the 3). Mixed \(e\) in \(J\) for \(p\equiv 1\pmod 4\) is observational and unused.

**Step 5(vi). NOT A PROOF of the closed form.** \(f_P\in\{f_M/2,f_M\}\) holds: \([M:F_p]=2\), unramified at 2, so \(f(\mathfrak{P}\mid P)\in\{1,2\}\). The identification \(f_M=\mathrm{lcm}(2,\mathrm{ord}_p 2)\) from “Frob acts as \(\zeta\mapsto\zeta^4\), hence \(f(M/H_O)=\mathrm{ord}_p 4\)” assumes the cyclotomic character is faithful on \(\mathrm{Gal}(M/H_O)\). It ignores \(H_O\cap\mathbb{Q}(\zeta_p)\) (genus field: \(\mathbb{Q}(\sqrt p)\) for \(p\equiv 1\pmod 4\); \(K\) for \(p\equiv 3\pmod 4\)). “Which of the two occurs” is already marked exploratory. \(\mathbb{Q}(\zeta_p)\) does not change \(v_P\); that half is proved. It also changes the *number* of primes, as (iv) already says.

**Computations.** Confirmation only. Newton/Graeffe given \(G\) are exact; “\(G\) is the minpoly” is rounding (their vector 5). T3 missing at 41, 43, 53 is a resource failure, not a proof.

---

**Final: ACCEPTED WITH FIXES.**

(i)–(v) and the vector’s valuation/unit statements are a proof, contingent on C3, Lemma 5, Lemma G, and \(F_p\subset H_O(\zeta_p)\). Drop or repair the formula \(f_M=\mathrm{lcm}(2,\mathrm{ord}_p 2)\).

Next strike: write \(H_O\cap\mathbb{Q}(\zeta_p)\) from the genus field and recompute \(f_M\) in the compositum, or delete the closed form.