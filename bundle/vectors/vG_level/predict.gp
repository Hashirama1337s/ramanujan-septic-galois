\\ predict.gp -- sealed predictions for BAR-G1 from class groups and residues ONLY (no theta values computed).
read("vectors/vG_level/gl.gp");
read("vectors/vG_level/lists.gp");
\\ alternative hypotheses (sealed to be scored as well): H_C5 = m idoneal prime power; H_idon = m idoneal;
\\ H_split = m idoneal and (l | m or -m a nonzero square mod l)  (l prime)
hc5(l, m) = idon(m) && isppow(m);
hsplit(l, m) = idon(m) && (m % l == 0 || (isprime(l) && kronecker(-m, l) == 1));
pr(blk) = {
  foreach(blk, it, my(l = it[1], L = it[2], ab = List());
    for(i = 1, #L, my(m = L[i]); if(predab(l, m), listput(ab, m)));
    print("l=", l, "  ", #L, " items; predicted ABELIAN at ", Vec(ab));
    for(i = 1, #L, my(m = L[i]);
      print("   l=", l, " m=", m, " idoneal=", idon(m), " h=", #redforms(-4*m), " cl2=", cl2(m), " kron(-m,l)=", kronecker(-m, l),
            " pred=", if(predab(l, m), "A", "-"), " preddeg=", preddeg(l, m), " predreal=", predreal(l, m),
            " H_C5=", if(hc5(l, m), "A", "-"), " H_idon=", if(idon(m), "A", "-"), " H_split=", if(hsplit(l, m), "A", "-"))));
}
print("== positive controls (must reproduce C6 / RESULT-W1) =="); pr(LCTRL);
print("== main block: prime levels 7, 11, 13 =="); pr(LMAIN);
print("== composite / prime-power levels 9, 15, 21, 25 =="); pr(LCOMP);
