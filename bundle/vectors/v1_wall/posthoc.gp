\\ posthoc.gp -- POST HOC (after scoring BAR-W1): m = 1 by algdep; larger idoneal m (both sides of the law)
read("vectors/v1_wall/wall.gp");
read("veins/v1_law/run.gp");
print("=== m = 1 (D = -4, outside KSY25 Thm 6.2): algdep; here W_1(i) = B_1(i) since S fixes i");
runalg("PH l=3", 1, z -> Bv(3, 1, z));
runalg("PH l=5", 1, z -> Bv(5, 1, z));
print("=== larger odd idoneal m");
L3 = [57, 93, 105, 165, 177, 273, 345, 357, 1365, 85, 133, 253, 385];
L5 = [85, 105, 165, 345, 385, 1365, 57, 93, 133];
for(i = 1, #L3, iferr(wone("PH", L3[i], 3, "B", 0), E, print("PH l=3 m=", L3[i], " ERROR ", E)));
for(i = 1, #L5, iferr(wone("PH", L5[i], 5, "B", 0), E, print("PH l=5 m=", L5[i], " ERROR ", E)));
quit;
