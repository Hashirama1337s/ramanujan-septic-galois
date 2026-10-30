read("veins/v1_law/law.gp");
read("veins/v1_law/run.gp");
fam3([7, 13, 11, 9, 15, 21, 25]);
default(realprecision, 200); spotcheck(-60, 60, z -> Bpiece(1, 15, z), "F3 n=15");
quit;
