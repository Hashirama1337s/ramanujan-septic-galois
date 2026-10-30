# Seat B spec — independent check of a thirteenth-degree analogue of Ramanujan's lost-notebook p.206 identity

You are an independent second implementation. You get this spec only. Do NOT open any other file under
the project folder (except writing into this seatB13/ folder) until Step 5 says so.

## Definitions
f(a,b) = sum over all integers n of a^{n(n+1)/2} b^{n(n-1)/2};  phi(q) = f(q,q).
p = 13, q = e^{-pi/sqrt(13)}. For k = 1..6:  u_k = 2 q^{k^2/13} f(q^{13+2k}, q^{13-2k}) / phi(q^{13}).
Dissection: phi(q^{1/13})/phi(q^{13}) = 1 + u_1 + ... + u_6, and with phi(e^{-pi/x}) = sqrt(x) phi(e^{-pi x}):
   phi(e^{-13 pi sqrt 13}) = 13^{-3/4} phi(e^{-pi sqrt 13}) {1 + u_1 + ... + u_6}.

## Claims to test (no numbers given on purpose)
D1. Each b_k := u_k^13 (k = 1..6) is a rational linear combination of the 12 numbers cos(2 pi j/52), j = 0..11, with an
    integer common denominator and integer coefficients of moderate size.
D2. The six elementary symmetric functions of b_1..b_6 each lie in Q(sqrt 13) (form (a + b sqrt13)/d, integers a, b, d).
D3. Rebuilding phi(e^{-13 pi sqrt 13}) from ONLY your table for the b_k (plus phi(e^{-pi sqrt 13})) matches a direct
    computation to >= 1000 digits, and changing any one integer of the table by +-1 breaks the match.
D4. The b_k pair up under the field automorphism cos(2 pi/52) -> -cos(2 pi/52) (i.e. j -> 26 - j sign pattern); report
    which pairs, or REFUTED.

## How (use a different route)
1. Compute u_k via the Jacobi triple product as infinite PRODUCTS: f(a,b) = (-a; ab)_inf (-b; ab)_inf (ab; ab)_inf,
   phi(q) = (-q; q^2)_inf^2 (q^2; q^2)_inf. Cross-check against the series at low precision only.
2. mpmath at >= 1600 digits. ALWAYS pass maxsteps (e.g. 10**6) to pslq/findpoly: the default (100) silently returns None.
3. POSITIVE CONTROL first, at p = 7 (three pieces, q = e^{-pi/sqrt 7}): Rebak (Ramanujan J. 60 (2023)) gives
   u_1 = (cos(2pi/7)/(2cos^2(3pi/7)))^{2/7}, u_2 = (cos(pi/7)/(2cos^2(2pi/7)))^{2/7}, u_3 = (cos(3pi/7)/(2cos^2(pi/7)))^{2/7};
   reproduce them to >= 500 digits or stop and report.
4. NEGATIVE CONTROLS: b_1 against the wrong field Q(cos 2pi/13) must give no relation; b_1 + 1e-300 must give no
   relation with moderate coefficients.
5. Only after writing seatB13/seatB13-result.md, open ../table13.json and ../r13_out.txt and compare row by row (allow
   an overall sign/denominator normalisation). Report every disagreement.
Write scripts into seatB13/ with the Write tool. Each run under ~10 minutes.
