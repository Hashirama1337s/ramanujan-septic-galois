\\ presel.gp -- machinery checks on CONTROLS ONLY (l = 3, 5; values already published in RESULT-W1), before sealing BAR-G1.
default(parisizemax, 4000000000);
read("vectors/vG_level/gl.gp");
gone("ctrl", 3, 15, 200);
gone("ctrl", 3, 7, 200);
gone("ctrl", 5, 15, 200);
gone("ctrl", 5, 21, 200);
gone("ctrl", 5, 1365, 0);
gnull(3, 21, 2); gnull(3, 21, 3);
gnull(5, 21, 2); gnull(5, 21, 3);
\\ product identity check: prod_{k=1}^{(l-1)/2} U_k = 2^{(l-1)/2} f(tau/l)/f(tau)^l, U_k = 2 th[k/l,0]/th[0,0], f = Weber f
default(realprecision, 80);
wf(t) = exp(-Pi*I/24) * eta((t+1)/2, 1) / eta(t, 1);
{ foreach([[3, 5], [7, 3], [7, 21], [11, 9], [13, 13], [15, 7]], pr, my(l = pr[1], m = pr[2], tau = I*sqrt(m) + 0.3, lhs, rhs);
    lhs = prod(k = 1, (l-1)/2, 2 * th(k/l, 0, tau) / th(0, 0, tau));
    rhs = 2^((l-1)/2) * wf(tau/l) / wf(tau)^l;
    print("product identity l=", l, " tau=i sqrt ", m, "+0.3: |lhs/rhs - 1| = 1e-", dig(lhs/rhs - 1))); }
