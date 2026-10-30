\\ AMENDMENT-SWEEP2-6: relative conjugation-closure control F4'' at 120 digits.
read("veins/v4_fast/fastmin.gp");
rclos(V) = vecmax(vector(#V, i, vecmin(vector(#V, j, abs(conj(V[i]) - V[j]))) / max(1, abs(V[i]))));
f4pp(p) = {
  my(cg, cw);
  default(realprecision, 120);
  cg = rclos(conjs(p, 1)[1]); cw = rclos(conjs(p, 2)[1]);
  print("  (F4'') p=", p, " relative closure correct: 10^", if(cg == 0, -999, floor(log(cg)/log(10))), "   wrong: 10^", floor(log(cw)/log(10)),
        "  -> ", if(cg < 1e-60 && cw > 1e-3, "PASS", "FAIL"));
}
print("== F4'' validation (13, 73, 97)");
f4pp(13); f4pp(73); f4pp(97);
print("== F4'' on p = 89");
f4pp(89);
quit
