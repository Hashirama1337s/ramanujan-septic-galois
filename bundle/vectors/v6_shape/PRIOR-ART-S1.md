# PRIOR-ART-S1: prior-art gate on the three "shape" statements (vector 6)
2026-10-28, prior-art scout seat. Read-only on lab files; this file is the only one written. Newest date covered: arXiv listing
to 2026-10-12 (2610.18910) and 2026-09-02 (2608.04873v2); Zenodo API (best match) to 2026-10-28. Labels: OPENED = full text read
(arXiv PDF -> pdftotext in scratch, or the local lab copy); ABSTRACT; SNIPPET (search-engine text only); UNVERIFIED = recalled, not opened.

## In plain words
None of the three statements appears in print in the form we have it. All three are built on classical results.
- S1 (Theorem G degree and real-count formulas): the method is standard. The degree is the class number times the size of an orbit
  under Shimura reciprocity (Gee-Stevenhagen, as quoted by Kontogeorgis). The real count extends the classical rule "j is real
  exactly at classes of order <= 2", counted by genus theory (stated and proved in Chavan 2022, Prop 2.3). Nobody has written
  these formulas for the level-l theta pieces of Ramanujan. PARTIAL.
- S2 (C7 real count for R(i sqrt n)): the DEGREE half is published. Gee-Honsbeek prove R(tau) generates the ray class field mod 5
  and give its Galois group through (O/5O)^*/O^*, which gives deg = h e(n). The REAL-COUNT half, r(n)|Cl(O)[2]|, was not found
  anywhere. It is the level-5 version of the same genus-theory rule. PARTIAL: degree TAKEN, real count OPEN to the floor below.
- S3 (F1 (vi), residue degrees above 2): every step is textbook. The residue degree of q in Q(zeta_p) is ord_p(q). Residue degrees
  multiply in towers. F_p has index 2 in M. No paper states it for this field, but it is a corollary, not a result. PARTIAL
  (corollary-level).
None of the three is literally one classical theorem restated. The S1 and S2 real counts are both "classical genus theory
(ambiguous classes) + a fixed-point count on the torus (O/NO)^*/{+-1}". S3 is a direct corollary of cyclotomic reciprocity
(Washington Thm 2.13 type; opened here as Sharifi Prop 3.1.21).

## Statements gated (read from the lab files, not edited)
- S1: vG_level/RESULT-G1.md sec 5 + BAR-G1.md l. 42-45 (gl.gp preddeg/predreal): [Q(z):Q] = h * |orbit of (1,0) under g_x, mod +-|
  = h(l-1)/2 (l | m, l prime), h(l-1)^2/2 (-m a square mod l), h(l^2-1)/2 otherwise; real conjugates (prime l) = |Cl[2]|(l-1)/2
  if l | m, |Cl[2]|(l-1) otherwise. Status in the lab: derived under the generic-stabiliser hypothesis, NOT proved.
- S2: v3_rr/RESULT-R1.md sec 2 Supplement + 6.4: deg z_n = h(-4n) e(n); #real = |Gal(K_{O,5}/K)^c| (proved) = r(n)|Cl(O)[2]|,
  r = 4 (5 does not divide n), 2 (5 | n); surjectivity onto Cl[2] a SKETCH.
- S3: v4_factor/RESULT-F1.md (vi): f_P in {f_M/2, f_M}, f_M = lcm(2, ord_p 2) (marked NOT PROVED, dropped from C9).

## Scout observation (arithmetic, not a source)
For prime l not dividing m the S1 degree equals |C_l(O)| = h |(O/lO)^*| / |O^*| (GH exact sequence (3.1) below, O^* = {+-1}):
the map x -> (t, -m s) is injective when m is a unit mod l. So for l not dividing m the S1 degree claim says the same thing as
"K(z) has the degree of the ray class field of O mod l". That is a generation-type statement of the GH Lemma 4.1 / Jung-Koo-Shin
kind, not a new kind of statement.

## S1. Theorem G degree and real-count formulas: PARTIAL
| source | label | exact sentence | locator | covers |
|---|---|---|---|---|
| Kontogeorgis, "Constructing class invariants", arXiv:1203.4902v1, quoting Gee-Stevenhagen | OPENED | "The function value h(theta) is a class invariant if and only if the group W_{N,theta} acts trivially on h." | PDF p. 2, Theorem 1 ("Proof. [5, cor. 4]") | the stabiliser/orbit mechanism behind "degree = h x orbit"; level N, maximal order |
| Konstantinou-Kontogeorgis, "Ramanujan invariants for discriminants congruent to 5 mod 24", arXiv:1107.0413v1 | OPENED | "Assume that h(theta) in R and h(theta) is algebraic. Let H1 be the subgroup of G that stabilizes the field K(h(theta)) ..." | PDF p. 5, Proposition 4 | minimal polynomial as a product over Cl(O) x cosets: degree = h x [H:H1] |
| Koo-Shin-Yoon (KSY25), arXiv:2506.14139v1 (lab copy veins/v1_law/src/ksy25.txt) | OPENED | "If f(tau_O) is real, then [Q(f(tau_O)) : Q] = ... = [K(f(tau_O)) : K]." (glyphs restored) | Remark 7.6, ksy25.txt l. 547-551 | degree over Q = degree over K for real values, orders allowed; no count of real conjugates |
| Chavan, "On discriminants of minimal polynomials of the Ramanujan t_n class invariants", arXiv:2210.00681v1 | OPENED | "Then j(a) is a real number if and only if the class of a has order at most 2 in the ideal class group Cl(O)." | PDF p. 5, Proposition 2.3 | level-1 backbone of the real count (|Cl[2]| real roots of H_D) |
| same | OPENED | "the real roots of Hilbert class polynomial Hn are given by {j(a) / a in Cl(O), order of a at most 2} = Cl(n)[2]." | PDF p. 7, sec 5 | the same, as a root count |
| same | OPENED | "using the ambiguous class number formula from genus theory, we find that for all positive squarefree inetgers n = 11 (mod 24), we have |Cl(n)[2]| = 2^{t-1}" | PDF p. 3 | genus-theory count |
| Jung-Koo-Shin, "Ray class invariants over imaginary quadratic fields", arXiv:1007.2317v2 | OPENED (grep only, for real counts) | abstract: "We prove that singular values of certain Siegel functions generate K(N) over K" | p. 1 | generation/degree for Siegel-function values, maximal orders; grep for real root / real conjugate / number of real: 0 hits |
| Koo-Yoon, arXiv:1407.5713v3 | OPENED (grep) | "generates K(N) over K as a real algebraic integer" | sec 6, txt l. 1633-1661 | real generators; no count of real conjugates |
| Berndt-Rebak, arXiv:2312.15513v2 (lab copy) | OPENED by the lab (RESULT-G1 sec 8), not re-opened here | evaluations only | br.txt l. 2080 | no degree or Galois statement for the pieces |

Not found: any degree or real-conjugate formula for (2 th[k/l,0]/th[0,0])^l, or for theta-characteristic quotients of odd level l,
at i sqrt m. Searched by mechanism: arXiv API "theta constants" AND "ray class field" (3 hits: 1202.3213, 1203.4662, 1508.05602;
CM-field or cyclotomic base, not these pieces); "theta" + "characteristics" + "CM points" + "Galois" (0 relevant); "Siegel
functions" AND "orders" (1506.06317, 1007.2318; titles only); "real conjugates" / "real roots" + "class field" / "class
polynomial" (0 hits); 6 web searches. Covered: the mechanism (orbit/stabiliser degree; real iff order <= 2 at level 1). Not
covered: the torus-orbit count for these pieces, the drop to (l-1)/2 when l | m, and the real-count factor (l-1) resp. (l-1)/2.

## S2. Rogers-Ramanujan R(i sqrt n): degree TAKEN, real count not found -> PARTIAL
| source | label | exact sentence | locator | covers |
|---|---|---|---|---|
| Gee-Honsbeek, "Singular values of the Rogers-Ramanujan continued fraction", KdVI preprint 1999 (lab copy v3_rr/src/gh/RogRam_a.txt) | OPENED | "Lemma 4.1. The class field H_5 is generated by R(tau) over K." | p. 9; txt l. 798 | generation, hence the degree |
| same | OPENED | "Before we can describe the explicit action of Gal(H_N/K) on elements of H_N, we first look at Gal(H_N/H_1), which fits in a short exact sequence 1 -> O^* -> (O/NO)^* -> Gal(H_N/H_1) -> 1: (3.1)" | p. 7, (3.1); txt l. 584-590 | |Gal| = h |(O/5O)^*|/2, i.e. deg = h e(n) |
| KSY25 (lab copy) | OPENED by the lab (RESULT-R1 sec 5) | Lemma 7.3: K_{O,N}/Q Galois, Gal = Gal(K_{O,N}/K) x| <c> | p. 9 | the semidirect shape behind "#real = |G^c|" |
| Chavan 2022 (above) | OPENED | Prop 2.3 (quoted in S1) | p. 5 | level-1 analogue of r(n)|Cl[2]| |
| Cais-Conrad, "Modular curves and Ramanujan continued fraction", author preprint (math.arizona.edu/~cais/Papers/Preprints/J5.pdf) | OPENED (text layer; grep) | "We also prove that a singular value on the imaginary axis, necessarily real, lies in a radical tower in R only if all odd prime factors of its degree over Q are Fermat primes" | abstract, p. 1 | real-radical obstruction; grep for real roots / real conjugates / number of real: 0 hits |
| Morton, arXiv:1806.11079v4 and 1612.06268v4 | OPENED (grep) | "the real number j(w) has degree h(-d) over Q" | 1806.11079 txt l. 761 | degrees/generation for r(w/5); no real-conjugate count |
| Jha, "Cyclic Kronecker Fourier Transforms, Weber Norms, and Rogers-Ramanujan Singular Values", arXiv:2610.18910v1 (12 Oct 2026) | OPENED (abstract + grep) | "Consequently [Q(R_j) : Q] = 4M, [Q(R_j + R_j^{-1}) : Q] = 2M" | abstract, p. 1 | different values (mirror ratios, D = -5n fundamental, cyclic Cl); no real count for R(i sqrt n) |
| Griffin-Ono-Warnaar, arXiv:1401.7718v4 | OPENED (grep) | abstract: "its singular values are algebraic integral units" | p. 1 | no real count |
| Duke 2005; Berndt-Chan-Zhang 1996; Cho-Koo(-Park) RR papers | UNVERIFIED (not opened by this seat) | - | - | the lab gate (external-gate-c6c8-reply.md) opened Duke Thm 2 and the Cho-Koo-Park abstract: generation/units only |

Searched by mechanism: arXiv API "Rogers-Ramanujan continued fraction" AND (singular OR "class field") (6 hits), "Rogers-Ramanujan"
AND "singular value" (3), "class invariants" AND "real" (21; relevant: 2610.18910, 0807.2976); web "Rogers-Ramanujan" + "real
roots" (no count found); Zenodo best-match x6 (only non-technical series notes 23339909, 23409973 and an evaluation note 20230413;
none counts real conjugates). TAKEN: the degree h e(n) (GH Lemma 4.1 + (3.1)). Not found: #real = r(n)|Cl(O)[2]|.

## S3. Residue degrees above 2 in F_p: PARTIAL (textbook corollary; not stated for F_p anywhere found)
| source | label | exact sentence | locator | covers |
|---|---|---|---|---|
| Sharifi, Algebraic number theory notes, ch. 3 (math.ucla.edu/~sharifi/notes/algnum-ch03.html) | OPENED (page fetched; quotes through the fetch summary) | "let f be the order of p in (Z/mZ)^x." ... "the p_i are distinct primes of Z[mu_n] of residue degree f." | Proposition 3.1.21 | residue degree in Q(zeta_p) = ord_p(q); gives f(M/H_O) = ord_p(4) for a prime of norm 4 |
| Jakhar, IIT Madras lecture 4 | SNIPPET | "Let p be a rational prime not dividing m and having order h modulo m. Then pO_K = p1 ... pg, where g = phi(m)/h and each prime ideal pi has residual degree h." | search snippet | the same fact |
| Cox, Primes of the form x^2+ny^2, sec 9 (principal primes split completely in the ring class field) | UNVERIFIED (not opened) | - | - | residue degree 2 of 2 in H_O |
| web: "decomposition of 2 in compositum of ring class field and Q(zeta_p)" | - | nothing specific found | - | - |

Every step is textbook: f(2 in H_O) = 2 (Artin), f(M/H_O) = ord_p(4) (cyclotomic reciprocity for the Frobenius zeta -> zeta^4),
so f_M = 2 ord_p(4) = lcm(2, ord_p 2), and [M:F_p] = 2 unramified gives f_P in {f_M/2, f_M}. No paper on the factorisation of 2
in fields of Ramanujan-type theta pieces was found. Yui-Zagier and Gross-Zagier-type factorisation papers were not opened.

## Table
| item | verdict | best source | label | quoted sentence | locator |
|---|---|---|---|---|---|
| S1 degree formula | PARTIAL | Kontogeorgis 1203.4902 (Gee-Stevenhagen criterion) | OPENED | "The function value h(theta) is a class invariant if and only if the group W_{N,theta} acts trivially on h." | p. 2, Thm 1 |
| S1 real-count formula | PARTIAL | Chavan 2210.00681 | OPENED | "Then j(a) is a real number if and only if the class of a has order at most 2 in the ideal class group Cl(O)." | p. 5, Prop 2.3 |
| S2 degree h e(n) | TAKEN | Gee-Honsbeek 1999 | OPENED | "Lemma 4.1. The class field H_5 is generated by R(tau) over K." + (3.1) | p. 9; p. 7 |
| S2 real count r(n)|Cl[2]| | OPEN (search floor) | nearest: Chavan Prop 2.3 (level 1) | OPENED | as above | p. 5 |
| S3 f_P in {f_M/2, f_M} | PARTIAL (corollary) | Sharifi Prop 3.1.21 | OPENED | "the p_i are distinct primes of Z[mu_n] of residue degree f." | Prop 3.1.21 |

## Most dangerous neighbour
The Koo-Shin-Yoon group: KSY25 (arXiv:2506.14139, an algorithm for Galois actions on values with rational coefficients at orders)
and 2608.04873v2 (Sep 2026, "Adelic framed form class groups and explicit class field theory"; abstract + grep). They have every
ingredient (orders, level N, complex conjugation, rational coefficients). A degree or real-count corollary for any named family
is one remark for them. Second: authors on Rogers-Ramanujan singular values (Morton; Jha, Oct 2026).

## Method worth borrowing
The sign test in Chavan 2210.00681 sec 5: "the discriminant of a polynomial in Q is positive if and only if the number of non-real
roots of the polynomial is divisible by 4". The sign of disc(P) costs nothing on the exact integer polynomials. It gives an
independent parity check of every sealed real count, next to the Sturm count.

## Gap that is genuinely open (one sentence)
No source found gives the real-conjugate counts (|Cl[2]|(l-1) or |Cl[2]|(l-1)/2 for the theta pieces; r(n)|Cl(O)[2]| for R(i sqrt n))
or the orbit-degree formula for the level-l theta pieces of Ramanujan; both follow from genus theory plus a torus fixed-point count,
so they are shape corollaries, not new mechanisms.
