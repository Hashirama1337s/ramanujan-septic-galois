read("veins/v1_law/law.gp");
read("veins/v1_law/run.gp");
read("vectors/v3_rr/rr.gp");
print("=== BAR-R1 block A: controls, nulls, n = 2..200");
ctl1();
nulls();
runlist(vector(199, i, i + 1));
quit;
