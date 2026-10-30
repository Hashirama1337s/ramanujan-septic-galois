default(realprecision, 3000);
read("cert.gp");
\\ p = 37: b_1^4 = 2^74 37^-5 prod_{a<=35} s_a^C_a, s_a = 2 sin(pi a/148), C_a = -e_a with e_a from structure/e_mult_out.txt
e37 = [4,-62,48,12,-60,48,-64,46,-16,174,40,-70,68,152,20,-74,52,2,8,-28,-28,80,-32,58,12,130,-44,-146,56,174,24,22,36,110,72];
c37 = cert(37, 148, 4, 74, -5, -e37);
quit
