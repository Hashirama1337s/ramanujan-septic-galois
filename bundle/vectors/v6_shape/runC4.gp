\\ runC4.gp -- continuation of AMENDMENT-S1b: the p = 73 item only (runC3 was stopped by the seat during p = 73 on a false
\\ multi-thread alarm: the "_ZM_inv_worker" lines are this single-thread build's worker messages; gp has no nthreads default here).
read("vectors/v6_shape/sC.gp");
default(threadsizemax, 6000000000);
sc(73, 3000);
