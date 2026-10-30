\\ runA.gp -- BAR-S1 block A run list (sealed). Launch: gp -q -D parisizemax=4000000000 runA.gp
read("vectors/v6_shape/sA.gp");
default(realprecision, 120);
\\ A1 all-characteristics identity (prime l, and composite l)
a1(3, sqrt(7)); a1(5, sqrt(11)); a1(7, sqrt(3)); a1(11, sqrt(13)); a1(13, sqrt(5)); a1(9, sqrt(13)); a1(15, sqrt(7));
\\ A2 line identity (split prime l)
a2(5, 9); a2(7, 3); a2(11, 7); a2(13, 3);
\\ A3 orbit norm vs closed form and vs the other cosets
a3(5, 3); a3(5, 9); a3(7, 3); a3(11, 3); a3(7, 21); a3(15, 7); a3(9, 13); a3(5, 39);
\\ A4 constants
a4();
\\ A5 sealed items
a5("A5", 5, 9, 150);
a5("A5", 17, 3, 150);
a5("A5", 17, 13, 150);
a5("A5", 19, 7, 150);
a5("A5", 19, 5, 150);
a5("A5", 23, 5, 150);
a5("A5", 29, 3, 150);
a5("A5", 23, 69, 150);
a5("A5", 9, 13, 150);
a5("A5", 15, 13, 150);
a5("A5", 21, 25, 150);
a5("A5-open", 35, 3, 150);
a5("A5-open", 9, 51, 150);
a5("A5-open", 25, 7, 150);
