\\ train2.gp -- training, part 2 (before BAR-F1 is sealed). The direct nfinit([G,[2]]) at p = 29 was stopped by hand after
\\ ~10 min (memory 1.7 GB, degree 84, 577-digit coefficients). Here: the unit model z = b_1^e/2^p, cross-checked against the direct
\\ factorisation at 5, 13, 17, 11, 19 (train_out.txt), then p = 29 (Newton polygon, certificate, unit model); then the h3 checks.
read("vectors/v4_factor/f1.gp");
print("TRAINING RUN part 2 (vector 4)");
print("== unit model cross-check against the direct nfinit at 5, 13, 17, 11, 19");
foreach([5, 13, 17, 11, 19], p, umodel(p));
print("\n== p = 29");
factor1(29, 0, 0);
umodel(29);
quit
