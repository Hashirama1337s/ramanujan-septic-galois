\\ train.gp -- training primes for vector 4 (before BAR-F1 is sealed).
read("vectors/v4_factor/f1.gp");
print("TRAINING RUN (vector 4), engine f1.gp");
foreach([5, 13, 17, 11, 19], p, factor1(p, 1));
factor1(23, 1);   \\ p = 7 mod 8 control (units)
factor1(29, 0);
quit
