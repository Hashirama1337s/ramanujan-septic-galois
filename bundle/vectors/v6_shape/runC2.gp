\\ runC2.gp -- AMENDMENT-S1a: same sc() as sealed, thread stack raised for alarm(). Launch: gp -q -D parisizemax=6000000000 runC2.gp
read("vectors/v6_shape/sC.gp");
default(threadsizemax, 6000000000);
sc(47, 3000); sc(73, 3000); sc(59, 3600); sc(71, 3600); sc(41, 3600);
