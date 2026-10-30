\\ sep.gp -- separation inequalities for the proof (RESULT-W1 Lemma S), evaluated at y = sqrt(3) (worst case, monotone in y).
\\ All series truncated at |n| <= 40 with a tail far below 1e-100; 100-digit arithmetic. Margins are reported.
default(realprecision, 100);
y = sqrt(3);
S(a) = sum(n = -40, 40, exp(-Pi*y*(n + a)^2));                \\ upper bound for |th[a, b](iy)|, any real b
L0 = 1 - 2*sum(n = 1, 40, exp(-Pi*y*n^2));                     \\ lower bound for |th[0, b](iy)|
L1(l) = exp(-Pi*y/l^2) - sum(n = -40, 40, if(n == 0, 0, exp(-Pi*y*(n + 1/l)^2)));   \\ lower bound for th[1/l, 0](iy) > 0
print("L0 = ", L0);
print("l=3: U(1/3) = ", S(1/3), "   L0 - U(1/3) = ", L0 - S(1/3));
print("l=5: U(1/5) = ", S(1/5), "   L0 - U(1/5) = ", L0 - S(1/5));
print("l=5: U(2/5) = ", S(2/5), "   L0 - U(2/5) = ", L0 - S(2/5));
print("l=5: L1 = ", L1(5), "  U(2/5) = ", S(2/5), "  L1 - U(2/5) = ", L1(5) - S(2/5));
\\ monotonicity: for y' >= y, L0 increases, S(a) (0 < a <= 1/2) decreases, and the ratio S(2/5)/L1(5) decreases:
\\ S(2/5) e^{pi y/25} = sum exp(-pi y((n+2/5)^2 - 1/25)) (all exponents > 0) decreases; L1 e^{pi y/25} = 1 - sum_{n != 0} exp(-pi y((n+1/5)^2 - 1/25)) increases.
{ my(ok = 1); forstep(t = 0, 3, 0.25, my(yy = sqrt(3) + t^2);
    my(s2 = sum(n = -40, 40, exp(-Pi*yy*(n + 2/5)^2)), l1 = exp(-Pi*yy/25) - sum(n = -40, 40, if(n == 0, 0, exp(-Pi*yy*(n + 1/5)^2))));
    if(s2 >= l1, ok = 0)); print("spot check y in [sqrt3, sqrt3 + 9]: L1 > U(2/5) everywhere sampled: ", ok); }
quit;
