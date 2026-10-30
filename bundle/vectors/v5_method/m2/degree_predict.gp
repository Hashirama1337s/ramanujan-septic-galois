\\ BAR-M2 degree prediction (P3): d = h(-4p)(p-1)/2 from PARI qfbclassno, before any certified run at 47, 61, 67.
default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
{
foreach([43, 47, 61, 67], p,
  my(h = qfbclassno(-4*p));
  my(e = if(p % 8 == 7, 0, if(p % 8 == 3, p*h*(p-1)/6, p*h*(p-1)/4)));
  print("p = ", p, "  p mod 8 = ", p % 8, "  h(-4p) = ", h, "  predicted degree d = h(p-1)/2 = ", h*(p-1)/2,
        "  C3 constant-term 2-exponent e = ", e));
}
quit;
