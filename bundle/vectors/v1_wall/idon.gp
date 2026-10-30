read("veins/v1_law/law.gp");
L = select(m -> iselem2(-4*m), vector(924, i, 2*i - 1)); L = select(m -> m >= 3, L);
print("odd idoneal m in [3, 1847]: ", #L, " : ", L);
quit;
