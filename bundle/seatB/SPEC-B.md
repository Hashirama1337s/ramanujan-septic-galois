# Seat B spec — independent check of a degree-11 analogue of Ramanujan's lost-notebook p.206 identity

You are an independent second implementation. You get this spec only. Do NOT open any other file in
the project folder (except writing into seatB/) until Step 5 says so.

## Definitions
Ramanujan's f(a,b) = sum over all integers n of a^{n(n+1)/2} b^{n(n-1)/2};  phi(q) = f(q,q) = sum q^{n^2}.
Let p = 11, q = e^{-pi/sqrt(11)}. For k = 1..5:
   u_k = 2 q^{k^2/11} f(q^{11+2k}, q^{11-2k}) / phi(q^{11}).
Then phi(q^{1/11}) / phi(q^{11}) = 1 + u_1 + ... + u_5 (theta dissection), and the transformation
phi(e^{-pi/x}) = sqrt(x) phi(e^{-pi x}) turns this into
   phi(e^{-11 pi sqrt 11}) = 11^{-3/4} phi(e^{-pi sqrt 11}) {1 + u_1 + ... + u_5}.

## Claims to test (no numbers given on purpose; find them yourself)
C1. P := u_1 u_2 u_3 u_4 u_5 is the real root of a cubic with small integer coefficients.
C2. b_k := u_k^11 (k = 1..5) are the five roots of a quintic whose coefficients are polynomials in P of degree <= 2
    with integer coefficients.
C3. Each b_k is an integer linear combination of the 15 numbers P^i cos(2 pi j/11), i = 0,1,2, j = 0..4 (cos 0 = 1),
    with coefficients of modest size.
C4. Rebuilding phi(e^{-11 pi sqrt 11}) from ONLY the cubic for P and your integer table for the b_k (plus
    phi(e^{-pi sqrt 11})) matches a direct computation of phi(e^{-11 pi sqrt 11}) to >= 1000 digits, and changing any
    one integer coefficient by 1 breaks the match.

## How (use a genuinely different route from the obvious one)
1. Compute u_k via the Jacobi triple product as infinite PRODUCTS, not theta series:
   f(a,b) = (-a; ab)_inf (-b; ab)_inf (ab; ab)_inf, and phi(q) = (-q; q^2)_inf^2 (q^2; q^2)_inf.
   Cross-check against the series at low precision only.
2. Use mpmath at >= 1500 digits. When calling mpmath.pslq / findpoly, ALWAYS pass maxsteps (e.g. 10**6): the default
   (100) silently gives up and returns None.
3. Before C1-C3 at p = 11, run a POSITIVE CONTROL at p = 7 (three pieces, q = e^{-pi/sqrt 7}): published closed forms
   (Rebak, Ramanujan J. 60 (2023) 885-911) are u_1 = (cos(2pi/7)/(2cos^2(3pi/7)))^{2/7}, u_2 = (cos(pi/7)/(2cos^2(2pi/7)))^{2/7},
   u_3 = (cos(3pi/7)/(2cos^2(pi/7)))^{2/7}. Your code must reproduce them to >= 500 digits, or stop and report.
4. Find the cubic (C1), the quintic coefficients in Z[P] (C2, via PSLQ on {e_j, 1, P, P^2} for the elementary symmetric
   functions e_j of the b_k), and the table (C3, via PSLQ on {b_k} + the 15 basis numbers). Then do C4.
5. Only after writing your results to seatB/seatB-result.md, open ../RESULT.md and compare: same cubic? same e_j?
   same table (up to ordering of k and the choice of cosine basis)? Report every disagreement.
Write scripts into seatB/ with the Write tool (no regex in shell heredocs). Each run under ~10 minutes.
