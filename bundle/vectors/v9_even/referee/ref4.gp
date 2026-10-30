default(nbthreads, 1); default(realprecision, 200);
qp(a, b, q) = prod(n = 0, 400, 1 - a*b^n);
q = exp(-Pi);
H = sqrt(q) * qp(q, q^8, q) * qp(q^7, q^8, q) / (qp(q^3, q^8, q) * qp(q^5, q^8, q));
G = q^(1/3) * qp(q, q^2, q) / qp(q^3, q^6, q)^3;
print("H(e^-pi) - (sqrt(4+2sqrt2) - (1+sqrt2)) = ", H - (sqrt(4+2*sqrt(2)) - 1 - sqrt(2)));
pH = algdep(H, 8); pG = algdep(G, 8);
pH = algdep(H, 4); print("algdep H (deg 4): ", pH, "  err ", abs(subst(pH, x, H)), "  polgalois ", polgalois(pH));
print("algdep G: ", pG, "  err ", abs(subst(pG, 'x, G)), "  polgalois: ", polgalois(pG));
