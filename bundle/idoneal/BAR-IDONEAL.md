# BAR-IDONEAL — are Euler's idoneal numbers exactly where Ramanujan's p.206 identity has cyclotomic (cosine) closed forms?
Sealed 2026-10-27 before any computation at composite n.

## In plain words
For odd n, split phi(q^{1/n})/phi(q^n) = 1 + sum_{k=1}^{(n-1)/2} u_k at q = e^{-pi/sqrt n} (same formula as for primes).
Prediction: the pieces live in an abelian (cyclotomic, cosine-built) field exactly when n is one of Euler's idoneal numbers
(class group of discriminant -4n of exponent <= 2). Already consistent: 3, 5, 7, 9 (published), 13, 37 (ours).

## Test
For each n below, b = u_1^n and b' = u_1^{2n}; search an integer relation between b (then b') and the basis
cos(2 pi j/(4n)), j = 0 .. phi(4n)/2 - 1 (PARI lindep at W digits; verify at W + 400). "Abelian" = a relation for b or b'
holding to >= 0.9 W at W + 400.
- Idoneal (predict ABELIAN): 15, 21, 25, 33, 45, 57, 85, 93, 105.
- Non-idoneal odd n (predict NOT ABELIAN; negative controls): 11, 27, 35, 39, 51, 55, 63, 69, 75.
- Positive controls: 7, 13 (known abelian forms).
W = max(3000, 60 * basis size).
## Bar
HOLDS if every idoneal n is ABELIAN and every non-idoneal n is NOT ABELIAN. Any exception is reported by name (an
idoneal n failing could be a precision/exponent issue: then retry once at 2W and with b'' = u_1^{4n}, logged; a
non-idoneal n passing would falsify the prediction).
## Prior
~80% (the "if" direction follows from class field theory when the field is the genus field; the composite-n dissection
and the exponent are the risks).
