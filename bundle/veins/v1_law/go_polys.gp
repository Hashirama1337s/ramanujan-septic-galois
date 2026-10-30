read("veins/v1_law/law.gp");
read("veins/v1_law/run.gp");
print("F2 n=2: ", runone("F2", 2, 6, Gt, 0)); print("F2 n=8: ", runone("F2", 8, 6, Gt, 0)); print("F3 n=9: ", runone("F3", 9, 36, z->Bpiece(1,9,z), 0));
quit;
