# BAR-R1 — An eleventh-degree analogue of Ramanujan's septic identity (lost notebook p.206). Sealed 2026-10-27.

## In plain words
Ramanujan's page-206 identity splits his theta function into 1 + u + v + w and, at one special point, each piece is
an exact algebraic number raised to the power 2/7 (Rebak 2023 found the closed forms; cubic, quintic and ninth-degree
analogues followed in 2023-2025). The eleventh-degree case has five pieces u_1..u_5, and nobody has written them down.
We compute them to 1,000+ digits and ask whether each piece raised to the power 11/2 is an exact algebraic number we
can identify. The method must first reproduce Rebak's known septic answers, or we stop.

## Definitions (from Kim-Rebak arXiv 2506.01181 eq. (0) pattern; Rebak arXiv 2112.11884 Entry (i) and def:u,v,w)
f(a,b) = sum_{n in Z} a^{n(n+1)/2} b^{n(n-1)/2};  phi(q) = sum q^{n^2}.
For odd p: u_k(q) = 2 q^{k^2/p} f(q^{p+2k}, q^{p-2k}) / phi(q^p),  k = 1..(p-1)/2,  so phi(q^{1/p})/phi(q^p) = 1 + sum u_k.
Self-dual point q = e^{-pi sqrt(p)} (then q^{1/p} = e^{-pi/sqrt p}); there 1 + sum u_k = sqrt(p) (from
phi(e^{-pi/x}) = sqrt(x) phi(e^{-pi x})). Target numbers: a_k = u_k^{p/2}.

## Checks (instrument; any failure = stop)
- C1 (septic control): at p = 7, u_1, u_2, u_3 equal Rebak's Theorem values to >= 400 digits:
  u_1 = (cos(2pi/7) / (2 cos^2(3pi/7)))^{2/7}, u_2 = (cos(pi/7) / (2 cos^2(2pi/7)))^{2/7},
  u_3 = (cos(3pi/7) / (2 cos^2(pi/7)))^{2/7}   (Rebak 2112.11884, lines 564-566 of the TeX source).
- C2: 1 + sum u_k = sqrt(p) to >= 400 digits for p = 7 and p = 11.
- C3 (negative control): perturbing one septic closed form (cos(2pi/7) -> cos(2pi/7) + 10^-30) must break C1.

## Predictions (p = 11), scored at working precision 1,200 digits
- P1: each a_k (k = 1..5) satisfies an integer polynomial of degree <= 10 with coefficients <= 10^15 (mpmath
  findpoly at 700 digits), and the same polynomial holds to >= 1,000 digits. HOLDS -> five exact algebraic values
  identified (numerically certain, not proved). FAILED if any a_k has no such polynomial.
- P2: each a_k lies in Q(cos(2pi/11)): PSLQ on {a_k, 1, c_1, c_2, c_3, c_4} (c_j = cos(2 pi j/11)) finds integer
  relations with coefficients <= 10^8 stable at 1,000 digits. Scored but not a gate.
- My prior: P1 ~80%, P2 ~55%.

## Descriptive only
The minimal polynomials and their discriminants; any cosine-ratio form like the septic one (searched by small exhaustive
search over cos(a pi/11)/(2 cos^2(b pi/11)) and products); the same pipeline at p = 13.

## Limits stated in advance
Numerical identification is not proof. A HOLD means "we know what the five missing degree-11 terms are, to 1,000 digits";
a proof would be the next, separate step.
