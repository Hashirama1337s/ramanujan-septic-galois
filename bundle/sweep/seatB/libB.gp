\\ Seat B library: Ramanujan dissection pieces from Jacobi triple PRODUCTS (independent implementation)
\\ (-a;Q)_inf and (a;Q)_inf truncated when |a Q^n| < 10^-(prec+30)

negpoch(a,Q) = {my(r=1., t=a, eps=10.^(-default(realprecision)-30)); while(abs(t)>eps, r*=(1+t); t*=Q); r};
pospoch(a,Q) = {my(r=1., t=a, eps=10.^(-default(realprecision)-30)); while(abs(t)>eps, r*=(1-t); t*=Q); r};
\\ f(a,b) = (-a;ab)(-b;ab)(ab;ab)
fprod(a,b) = {my(Q=a*b); negpoch(a,Q)*negpoch(b,Q)*pospoch(Q,Q)};
phiq(x) = fprod(x,x);

\\ pieces u_k, k=1..(p-1)/2, at current precision
pieces(p) = {
  my(q=exp(-Pi/sqrt(p)), qp=q^p, den=phiq(qp), m=(p-1)/2);
  vector(m,k, 2*exp(-Pi*k^2/p^(3/2))*fprod(q^(p+2*k), q^(p-2*k))/den)
};

\\ digits to which a linear form holds: -log10(|sum| / max|term|)
digs(terms) = {my(s=vecsum(terms), M=vecmax(apply(abs,terms))); if(s==0, return(default(realprecision))); -log(abs(s)/M)/log(10)};

\\ coefficient size in digits
cdig(v) = {my(M=vecmax(apply(abs,v))); if(M==0,0, log(M)/log(10))};

\\ basis: i outer (0..I-1), j inner (0..J-1): P^i cos(2 pi j / N)
basis(P,I,J,N) = {my(B=vector(I*J)); for(i=0,I-1, for(j=0,J-1, B[i*J+j+1] = P^i*cos(2*Pi*j/N))); B};

\\ find minimal polynomial of P: smallest n with algdep at precision D verified at current (higher) precision
findminpoly(P, D, nmax) = {
  my(PD=precision(P,D), pol, t, dd);
  for(n=1,nmax,
    pol = algdep(PD, n);
    if(poldegree(pol) < 1, next);
    t = vector(poldegree(pol)+1, i, polcoef(pol,i-1)*P^(i-1));
    dd = digs(t);
    printf("  algdep n=%d: coefdigits=%.1f verify-digits=%.1f irreducible=%d\n", n, cdig(Vec(pol)), dd, polisirreducible(pol));
    if(dd > D+200, return([pol, dd])));
  [0, 0]
};

\\ one lindep search: target t, basis B (at full precision), search precision D
\\ returns [rel, verifydigits at full precision, searchdigits at D, coefdigits]
relsearch(t, B, D) = {
  my(v=concat([t], B), vD=apply(x->precision(x,D), v), rel, terms, termsD, dv, dD);
  rel = lindep(vD);
  if(#rel==0, return([rel, 0, 0, 0]));
  if(rel[1] < 0, rel = -rel);
  terms = vector(#v, i, rel[i]*v[i]);
  termsD = vector(#v, i, rel[i]*vD[i]);
  dv = digs(terms); dD = digs(termsD);
  [rel, dv, dD, cdig(rel)]
};

\\ robust search: if lindep returns a GENUINE relation with c0=0 (basis itself dependent), drop the last basis
\\ element in that relation and retry. Returns [res, keptIndices, droppedIndices]
relloop(t, B, D) = {
  my(keep=[1..#B], drop=[], res, last, Bk);
  while(1,
    Bk = vector(#keep, i, B[keep[i]]);
    res = relsearch(t, Bk, D);
    if(#res[1]==0, return([res, keep, drop]));
    if(res[1][1]!=0 || res[2] <= D+200, return([res, keep, drop]));
    last = 0; for(i=2,#res[1], if(res[1][i]!=0, last=i-1));
    drop = concat(drop, [keep[last]]);
    keep = concat(keep[1..last-1], keep[last+1..#keep]));
};
\\ expand a relation on kept indices back to full basis length (zeros at dropped)
expandrel(rel, keep, n) = {my(v=vector(n+1)); v[1]=rel[1]; for(i=1,#keep, v[keep[i]+1]=rel[i+1]); v};

\\ relative agreement in digits (caps at working precision when exactly equal)
agree(x,y) = if(x==y, default(realprecision), -log(abs(x-y)/abs(x))/log(10));
