\\ post.gp -- POST HOC (after the sealed run; not sealed): Theorem G's explicit lists at the other primes dividing odd idoneal numbers,
\\ predicted from the theorem before computing these items. Repaired instrument gl2.gp.
default(parisizemax, 6000000000);
read("vectors/vG_level/gl2.gp");
{ foreach([[17, 85], [17, 357], [19, 57], [19, 133], [23, 253], [31, 93], [37, 37],
           [17, 17], [19, 19], [17, 51], [23, 23], [31, 31], [17, 21], [19, 15]], it, gone("POST", it[1], it[2], 100)); }
