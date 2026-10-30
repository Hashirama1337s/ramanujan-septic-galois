# PRIOR-ART-U2 (scout, 2026-10-29; saved by the lead from the hand-back) - full-text gate on Cho-Koo-Park and Akkarapakam-Morton
Downloads: refs/ckp/ (ckp2010_tohoku, am2024_nyjm, am_companions/am_cubic_2311.06591, chan_huang_1997 excerpt; ckp2009_jnt EMPTY - blocked).
Coverage: web + Zenodo to 2026-10-29; citers of both CKP papers to 2026-09-21; arXiv API returned 429 (arXiv via web search only).

## In plain words
No paper states either "abelian over Q iff ..." classification (U-GG, U-CF). Closest work stops at "the value generates a ray/ring class
field over K"; the idoneal step to an iff over Q is not in print. Caveats: (1) the Hauptmodul property of the cubic fraction G is TAKEN
(Cho-Koo-Park 2010) - cite, do not claim; (2) CKP 2010 print the minimal polynomials of 1/G at n = 4 and n = 8 without identifying either
as abelian; the scout's check: n = 8 Galois group V4, field Q(sqrt2, sqrt3) (abelian), n = 4 D4 (not) - a free external positive/negative
control agreeing with U-CF and the h w3/2 degree; (3) Cho-Koo-Park 2009 (the H paper) full text NOT opened (abstract + zbMATH review only).

| item | verdict | best source | label | quote | locator |
|---|---|---|---|---|---|
| U-GG classification | OPEN (search floor) | Akkarapakam-Morton 2024 | OPENED | "The units v(w/8) and v^2(w/8) have degree 4h(-d) over Q." (-d = 1 mod 8 only) | NYJM 30, Thm 6.1 pp. 801-802 |
| U-CF classification | OPEN; n = 8 printed, not identified as abelian | CKP 2010 table; AM cubic | OPENED | "X^4 - 20X^3 + 12X^2 + 16X - 8" (dK = -8); "c(w/3) generates the ring class field Omega_2f over Q" | Tohoku 62 p. 602; arXiv:2311.06591 Thm 1.1 |
| degree 8h(-4m) for H | OPEN at odd-m points; neighbouring shape elsewhere; even-m possibly implicit in CKP 2009 (unverified) | AM 2024 | OPENED | "have degree 4h(-d) over Q" | Thm 6.1 |
| degree h w3 (h w3/2) for G | PARTIAL: n = 4k with -4k fundamental follows implicitly from Thm 13 + degree of K(6); table degree 4 at n = 4, 8; no formula stated | CKP 2010 | OPENED | "K(C(theta)) is the ray class field modulo 6 over K if (6, a) = 1." | Thm 13 p. 597 |
| Hauptmodul, G | TAKEN | CKP 2010 | OPENED | "C(tau) is a generator for the function field of Gamma1(6) cap Gamma^0(3)." | Thm 4 p. 586; Lemma 15 p. 598 |
| Hauptmodul, H | UNVERIFIED (likely CKP 2009) | CKP 2009 | ABSTRACT | "computing the affine models of modular curves X(Gamma) with Gamma = Gamma1(8) cap Gamma0(16p)" | JNT 129 abstract |
| conjugates at D = -4m / -4n | PARTIAL (method over K; worked only dK = -3) | CKP 2010 | OPENED | "is the set of all the conjugates of h(theta) over K" | p. 601 |
| Guadalupe 2026 (Bull. Iranian Math. Soc. 52 no. 24) | adjacent, closed | search summary | SNIPPET | units at tau, tau/2, tau/3, tau/6 "under dK = 5 mod 8" (paraphrase) | DOI 10.1007/s41980-026-01042-1 |
Chan-Huang 1997 (excerpt, OPENED): Thm 4.1 p. 84 nested radicals for H(e^{-pi sqrt n}); n = 3 value printed (p. 85) - our abelian m = 3,
not called abelian.

Scout's consistency check (private working folder ckpcheck2.gp, 80 digits; data not proof): 1/G(e^{-pi sqrt8}) root of the dK = -8 polynomial (4e-92),
1/G(e^{-2pi}) of the dK = -4 one (3e-93); polredabs(n = 8) = x^4 - 4x^2 + 1; Galois V4 (n = 8), D4 (n = 4); degrees 4 = h(-32) w3/2 =
h(-16) w3/2 match the lab formula.

Most dangerous neighbours: Akkarapakam-Morton (already "generates a ring class field, normal over Q" for v and c - a short step to an
idoneal remark); Guadalupe (two 2026 papers, odd discriminants so far). Method to borrow: CKP 2010 Thm 17 explicit Shimura-reciprocity
matrices u_p (independent conjugate computation); CKP table as external controls.

Open gap: no opened source states the abelian-over-Q iff for H at e^{-pi sqrt m} or G at e^{-pi sqrt n}, or the degree formulas 8h(-4m),
h w3 (h w3/2) as general formulas. Unread source that could change this: Cho-Koo-Park 2009 full text (JNT 129(4) 922-947,
DOI 10.1016/j.jnt.2008.09.018; open archive) - to be saved into refs/ckp/ckp2009_jnt/.

## UPDATE (PRIOR-ART-U3, scout, 2026-10-29): Cho-Koo-Park 2009 full text OPENED (refs/ckp/ckp2009_jnt/ckp2009_jnt.pdf)
- H Hauptmodul: TAKEN - Thm 5 p.932 "v(tau) is a Hauptmodul for Gamma1(8) cap Gamma^0(2)"; p.933 f = 1/v(2 tau) Hauptmodul for Gamma1(8) cap Gamma0(16), simple pole only at infinity, simple zero only at 3/16. Cite; do not claim. (Their proof: Duke v^2 Hauptmodul for Gamma1(8) + index 2; ours: Siegel cusp orders.)
- Ray class field mod 8: Thm 15 p.946 needs b^2 - 4ac = d_K and (2, a) = 1 - does NOT reach our points (a = 4, D = -16m).
- Degree 8h(-4m): not in the paper (only table = modular equations, p.938). Abelian over Q / idoneal: absent (only "abelian" is r(tau) over K, p.923).
- U-GG classification + degree: OPEN in print (search floor: this full text + PRIOR-ART-U2 coverage to 2026-10-29).
- Zip (refs/ckp/sd_zip_2026-10-29, 15 PDFs = JNT 129 issue): only Ren-Sczech (Stark over complex cubic fields; conjectural; far analogue) is on theme; none relevant to our claims.
