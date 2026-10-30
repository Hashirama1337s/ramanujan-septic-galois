\\ run_w1b.gp -- remainder of the BAR-W1 sealed list (run 1 skipped this block on a parenthesis typo) + the wrong-action nulls
\\ (run 1 crashed in wnull on bestappr's empty return; wnull now measures distance to integers). No prediction changed.
read("vectors/v1_wall/wall.gp");
print("=== nulls (wrong action)");
wnull(3, 3); wnull(3, 9); wnull(5, 5); wnull(5, 15);
print("=== extras");
L3B = [63, 81, 99, 117, 153, 225, 243, 333, 441, 729, 765];
L3W = [81, 85];
L5B = [75, 125, 175, 225, 325, 625, 1225];
for(i = 1, #L3W, iferr(wone("W1", L3W[i], 3, "W", 0), E, print("W1 l=3 fam=W m=", L3W[i], " ERROR ", E)));
for(i = 1, #L3B, iferr(wone("W1", L3B[i], 3, "B", 0), E, print("W1 l=3 fam=B m=", L3B[i], " ERROR ", E)));
for(i = 1, #L5B, iferr(wone("W1", L5B[i], 5, "B", 0), E, print("W1 l=5 fam=B m=", L5B[i], " ERROR ", E)));
quit;
