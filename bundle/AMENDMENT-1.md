# BAR-R1 Amendment 1 (after the septic control failed; no p = 11 number computed)

The control run (control_out.txt) FAILED C1/C2: my sealed evaluation point was wrong. At q = e^{-pi sqrt p} the split
gives 1 + sum u_k = p^{1/4} phi(q)/phi(q^p) (1.627 for p = 7), not sqrt(p), and not Ramanujan's bracket.
Correct point (re-derived from Rebak Entry (vi)): q = e^{-pi/sqrt(p)}, so q^p = e^{-pi sqrt p} and
q^{1/p} = e^{-pi/(p sqrt p)}; then 1 + sum u_k = phi(q^{1/p})/phi(q^p) = p^{3/4} phi(e^{-p pi sqrt p}) / phi(e^{-pi sqrt p}),
which is exactly Ramanujan's bracket in (vi). Changes:
- Evaluation point q = e^{-pi/sqrt(p)} for both p = 7 and p = 11.
- C2 becomes: 1 + sum u_k equals p^{3/4} phi(e^{-p pi sqrt p})/phi(e^{-pi sqrt p}) (computed directly) to >= 400 digits.
C1, C3, P1, P2 unchanged. The instrument check did its job.
