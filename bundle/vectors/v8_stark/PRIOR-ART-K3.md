# PRIOR-ART-K3 - is "2/f(sqrt -p)^2 = rank-one Stark unit of H_K/K, S = {inf, P, P-bar}" already published?

Scout: prior-art seat. Date: 2026-10-28. Newest material covered: arXiv 1810.07381 (v1 only on arXiv, 2018-10-17); HRV Duke 1997 scan; web searches run 2026-10-28.

## In plain words

The verdict is **PARTIAL, and close to TAKEN in substance**. A 1997 paper by Hajir and Rodriguez Villegas, which I opened, states three things:

1. For p = 7 mod 8, the number f(sqrt -p)/sqrt 2 is a unit and a class invariant.
2. That number is the unit u_{P2} attached to the prime above 2.
3. The logarithms of the units u_C are differences of derivatives of partial zeta functions at s = 0 (Kronecker's first limit formula, their Theorem 25).

Put those together with their Galois-action lemma and you get the claim's character-sum identity in about three lines, with the Euler factors (1 - rho(P))(1 - rho(P-bar)). I did not find the claim's own sentence anywhere: the words "Stark unit", the set S = {inf, P, P-bar}, and the two-prime Euler factor. Yang-Yin-Yu is about lambda, not Weber f, and has no L-function or Stark statement. I could not open Stark 1980. It is in the publisher's open archive, but the server returned 403 to every route I tried.

So we can't claim the statement as a new theorem. At most it is a restatement, in Stark's language, of a classical fact that Hajir and Rodriguez Villegas already use.

## Table

| item | verdict | best source | label | quoted sentence | locator |
|---|---|---|---|---|---|
| 2/f(sqrt -p)^2 is a unit in H_K (p = 7 mod 8) | TAKEN | Hajir & Rodriguez Villegas, Explicit elliptic units I, Duke Math J 90 (1997) 495-521, author copy https://frvillegas.github.io/pdf/frv-hajir-exp-ell-uts.pdf | OPENED | "For each of the 4-types of o listed in Table 5, P2 is a proper primitive ideal of o, whose corresponding unit u = u_{P2} has the indicated expression in terms of f or f1, giving rise to a class invariant that is a unit generator of H+" ; Table 5 row 2^0_+: P2 = [(1+sqrt(-d0))/2, 2], u = f(sqrt(-d0))/sqrt2, class invariant (f(sqrt(-d0))/sqrt2)^{w3} | Theorem 28 + Table 5, p. 518. 4-type 2^0_+ means d0 = 7 mod 8 (Table 3, p. 507). w3 = 1 when 3 does not divide d (Table 4, p. 507). H+ = maximal real subfield of H (p. 497) |
| u_C is canonical, depends only on the class, u_A = u_{A-bar} | TAKEN | HRV 1997 | OPENED | "Note that u_A = u_{A-bar} = conj(u_A) is a positive real number (u_o = 1), canonically defined for all proper primitive ideals, not just those prime to 6." Lemma 23(i): "Suppose A, A1 are in the same o-ideal class. Then u_{A1} = u_A." | Definition 22 and Lemma 23, p. 514 |
| log of the unit = derivative of partial zeta at 0 | TAKEN | HRV 1997 | OPENED | "THEOREM 25 (Kronecker's first limit formula). Let zeta_o(s, C) be the partial Dedekind zeta function of a class C in Cl(o). Then zeta'_o(0, C) - zeta'_o(0, [o]) = -log(u_C)." Proof cites "[St, p. 206]" (Stark 1980) | Theorem 25, p. 516 |
| Galois conjugates of u_A | TAKEN | HRV 1997 | OPENED | Lemma 23(v): "If A in I*(6d) and A1 in I*(6a) has norm a1, then u_A^{sigma_{A1}} = e8((w-1)(a-1)a1)(a1/a*) eta(A A1) eta(A-bar A1) / (sqrt(a*) eta(A1)^2)." | Lemma 23(v), p. 515 |
| S-modified L' with Euler factor, written in the Kronecker formula | PARTIAL (one prime only) | HRV 1997 | OPENED | "we put L(s, psi, P) = L(s, psi)(1 - psi(sigma_P) N P^{-s}), which vanishes at s = 0 with the leading term L'(0, psi, P) = ... L'(0, psi)(1 - psi(sigma_P)) [psi != psi1]"; "the Kronecker limit formula reads (see [H1]) L'(0, chi, P) = -(1/n) sum_{sigma in G} psi(sigma) log \|(p^{12n} alpha^n)^sigma\|^2" | Proof of Theorem 26, pp. 516-517. This is for a prime P of norm p prime to 6 and alpha = eta(A)/eta(o), not for P2 or the pair {P, P-bar} |
| THE CLAIM as worded: "Stark unit for S = {inf, P, P-bar}", sum rho(C) log\|sigma_C(2/f^2)\|^2 = c L'_S(0, rho-bar) with (1-rho(P))(1-rho(P-bar)) | PARTIAL: ingredients printed, assembled sentence not found | (our inference from HRV Thm 25 + Lemma 23 + Thm 28) | n/a | Not found in any opened source. Assembly (OUR derivation, signs and the rho vs rho-bar convention unchecked): log\|sigma_C u_P\| = log u_{CP} + log u_{CP-bar} - 2 log u_C, then Thm 25 gives sum rho(C) log\|sigma_C u_P\| = (1 - rho-bar(P))(1 - rho-bar(P-bar)) L'(0, rho), using rho(P)rho(P-bar) = 1, and 2/f^2 = u_P^{-2} | n/a |
| Yang-Yin-Yu Thm 1.1(4) | Not about f, no Stark content | Yang, Yin, Yu, The lambda invariants at CM points, arXiv:1810.07381v1 | OPENED | "(4) When d = 1 (mod 8), 16/(lambda0(1-lambda0)) is a unit." with lambda0 = lambda((d+sqrt d)/2), d a negative fundamental discriminant. Proof: "a = lambda0(1 - lambda0), omega0 = -16/a ... So omega0 is a unit as claimed." | Theorem 1.1, p. 2; proof pp. 8-9. Text search of the whole PDF for "Weber", "Stark", "L-function": no hits in the body ("derivative" only in reference titles). No p = 7 mod 8 statement for f(sqrt -p). OUR inference (not in the paper): with the standard identities lambda = (f1/f)^8, 1 - lambda = (f2/f)^8 and f f1 f2 = sqrt2 (HRV eq. (9)), 16/(lambda(1-lambda)) = f^24 at tau0, so Thm 1.1(4) gives a unit f((d+sqrt d)/2)^24, a different point and normalization from 2/f(sqrt -p)^2. IMRN 2021 version not opened |
| Stark 1980 (Adv. Math. 35, 197-235), DOI 10.1016/0001-8708(80)90049-3 | NOT OPENED | publisher site | SNIPPET (metadata only) | Crossref record: title "L-functions at s = 1. IV. First derivatives at s = 0", vol 35, pp 197-235, with an open-access user licence starting 2013-07-17 (elsevier.com/open-access/userlicense/1.0). Article page and PDF routes returned HTTP 403 to both fetch tools | Crossref API. HRV cites it for "[St, Theorem 3']" (Shimura reciprocity), "[St, p. 206]" (limit formula) and "[St, p. 219]" (one discriminant per class mod 48). Whether Stark writes a Weber f example at S containing primes above 2: UNVERIFIED |
| Damm-Johnsen (context) | background | arXiv:2301.08977 | SNIPPET (via search; previously OPENED by the second seat) | "In [Sta80], Stark proved that logarithms of elliptic units appear as special values of derivatives of Hecke L-functions" | Introduction |

## Searches run (floor, not proof of absence)

- Mechanism phrasings: Stark unit + Weber function + f(sqrt -p) + prime above 2; Weber class invariant + Stark unit + "2 splits" + Kronecker limit formula; Stark units + Weber functions + S containing primes above 2. No source wrote the S = {inf, P, P-bar} sentence.
- Duke-Imamoglu-Toth, "Kronecker's first limit formula, revisited" (UCLA preprint): OPENED. It discusses Weber's f(sqrt -q) values but has no Stark-unit or prime-above-2 statement.
- Not opened: Stark 1980 (403), Tate's "Les conjectures de Stark" Ch. IV, Kubert-Lang, Schertz's book, Hajir's thesis and Acta Arith 1993 ([H1], cited by HRV for the S-modified Kronecker formula in the proof of Thm 26). **[H1] is the most likely place where the two-prime version is written. Open it next.**

## Gap that is genuinely open (one sentence)

None of the opened sources writes 2/f(sqrt -p)^2 explicitly as the rank-one Stark unit for S = {inf, P, P-bar}, but that statement is a short corollary of HRV 1997 (Thm 25 + Lemma 23(v) + Thm 28), so the open part is wording, not mathematics.

## Most dangerous neighbour / method to borrow

- Neighbour: the explicit-elliptic-units line (Hajir; Rodriguez Villegas; Schertz; Koo-Shin-Yoon on CM-value Galois actions). They hold every ingredient.
- Method to borrow: HRV Lemma 23(v) (explicit Galois action on eta-quotient units) plus Theorem 25 is the clean proof route. Cite it rather than re-deriving numerically.
