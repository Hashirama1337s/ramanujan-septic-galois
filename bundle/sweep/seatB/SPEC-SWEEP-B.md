# Seat B spec — independent check of a field rule for Ramanujan-type dissection pieces, p = 17..37

You are an independent second implementation. You get this spec only. Do NOT open any other file under
the project folder (except writing into this sweep/seatB/ folder) until Step 5 says so.

## Definitions
f(a,b) = sum over integers n of a^{n(n+1)/2} b^{n(n-1)/2} = (-a;ab)_inf (-b;ab)_inf (ab;ab)_inf;  phi(q) = f(q,q).
For an odd prime p and q = e^{-pi/sqrt(p)}:  u_k = 2 q^{k^2/p} f(q^{p+2k}, q^{p-2k}) / phi(q^p),  k = 1..(p-1)/2;
b_k = u_k^p;  P = u_1 u_2 ... u_{(p-1)/2}.   Identity: phi(e^{-p pi sqrt p}) = p^{-3/4} phi(e^{-pi sqrt p}) (1 + sum u_k).

## Claim to test, for p = 17, 19, 23, 29, 31, 37
FIELD RULE. Let d = degree of the minimal polynomial of P over Q (find it yourself).
- If p = 3 (mod 4): every b_k is a rational combination of P^i cos(2 pi j/p), 0 <= i < d, 0 <= j < (p-1)/2.
- If p = 1 (mod 4): every b_k is a rational combination of P^i cos(2 pi j/(4p)), 0 <= i < d/2, 0 <= j < phi(4p)/2
  (phi = Euler's totient).
For each p report: d; for every k whether an integer relation exists and to how many digits it holds at a precision
higher than the one used to find it; whether the identity rebuilt from your coefficients alone matches a direct
computation of phi(e^{-p pi sqrt p}); a negative control (same search with the conductor replaced: 4p for p = 3 mod 4,
p for p = 1 mod 4) must give no genuine relation (a 'relation' with huge coefficients holding only to roughly the
chance level counts as none — say how you judged it).

## How
1. Use your own code. PARI/GP is installed in WSL; run it with:
   wsl -e bash -lc 'cd <dir under the project folder>; gp -q -s 4G < yourscript.gp'
   (lindep/algdep are fast). Compute the u_k from the Jacobi triple PRODUCTS, not theta series.
2. Precision: at least 3,000 digits for p <= 23, 4,000 for 31 and 37, 6,000 for 29; verify at +400 digits.
3. Positive control first: at p = 7 your pieces must equal (cos(2pi/7)/(2cos^2(3pi/7)))^{2/7},
   (cos(pi/7)/(2cos^2(2pi/7)))^{2/7}, (cos(3pi/7)/(2cos^2(pi/7)))^{2/7} (in that order) to >= 500 digits.
4. Write sweep/seatB/sweepB-result.md with a per-prime verdict CONFIRMED / REFUTED / NOT REACHED.
5. Only then open ../sweep_p17.txt ... ../sweep_p37.txt (lines starting 'TABLE' hold the other seat's relations
   [d, n_1..n_m] with d*b_k + sum n_i * basis_i = 0, basis ordered i outer, j inner) and compare: same relations up to
   overall sign? Report every disagreement.
Write scripts into sweep/seatB/ with the Write tool.
