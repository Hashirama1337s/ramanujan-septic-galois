\\ runC5.gp -- sealed BAR-S1 item p = 59 alone (prediction [3,29],[3,58]), single thread. Outer cap 3 h (shell timeout).
default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
read("vectors/v6_shape/sC.gp");
default(threadsizemax, 6000000000);
sc(59, 10700);
