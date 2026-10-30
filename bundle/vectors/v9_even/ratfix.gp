\\ ratfix.gp -- V9 instrument fix (2026-10-29): a rationality test that large denominators cannot fool.
\\ Fault (RESULT-U1 N1): law.gp intpol() uses bestappr with denominator bound 10^(P/4) at P working digits. Fractions with denominator
\\ <= 10^(P/4) are about 10^(-P/2) apart, so ANY real coefficient is approximated to ~P/2 digits and the "rounding error" says nothing.
\\ Fix: a FIXED small denominator bound Dmax, independent of P, with the working precision required to exceed it by a wide margin:
\\   ok = 1 only if (a) every coefficient's imaginary part is <= 10^(-P/2) (relative), (b) the common denominator den of the bestappr
\\   values (bound Dmax) is <= Dmax, (c) |den*c_i - round(den*c_i)| <= 10^(-P/2) max(1, |den*c_i|) for all i, and (d) P/2 >= 2 log10(Dmax) + 40.
\\ Fractions with denominator <= Dmax are >= 1/Dmax^2 apart, so (c) at 10^(-P/2) << Dmax^(-2) 10^(-40) leaves no room for accidents.
\\ Old files are not edited; new code uses prat().
prat(V, Dmax) = {
  my(P = default(realprecision), G0 = prod(i = 1, #V, 'x - V[i]), d = poldegree(G0), c, den = 1, G, err = 0., im = 0., r, ok);
  c = vector(d + 1, i, polcoef(G0, i - 1));
  for(i = 1, #c, im = max(im, abs(imag(c[i])) / max(1, abs(c[i]))));
  for(i = 1, #c, r = bestappr(real(c[i]), Dmax); den = lcm(den, denominator(r)));
  G = vector(#c, i, round(den * real(c[i])));
  for(i = 1, #c, err = max(err, abs(den * real(c[i]) - G[i]) / max(1, abs(den * c[i]))));
  ok = (im <= 10.^(-P/2)) && (den <= Dmax) && (err <= 10.^(-P/2)) && (P/2 >= 2*log(Dmax)/log(10) + 40);
  [Pol(Vecrev(G)), den, if(err == 0, 99999, floor(-log(err)/log(10))), ok];
}
