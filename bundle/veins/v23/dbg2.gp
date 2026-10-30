read("veins/v23/run_v3c_defs.gp");
{
  my(S);
  print("== rerun of the POST HOC p-th-root test with relative-tolerance labelling");
  S = fieldsetup(read(Str(DIR, "G_p23.gp")), "F_23"); proottest(S[1], S[2], 23);
  S = fieldsetup(read(Str(DIR, "G_p31.gp")), "F_31"); proottest(S[1], S[2], 31);
}
quit
