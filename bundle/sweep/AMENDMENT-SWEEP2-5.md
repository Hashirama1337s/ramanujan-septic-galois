# AMENDMENT-SWEEP2-5 (sealed before the 89 rerun and the 97 run)

## In plain words
The fast run hit its 3-hour cap during p = 89's negative control (the wrong-convention polynomial at full precision, ~90 more
minutes), after F1-F3 had passed (degree 528, rounding error 10^-4240, constant term 2^23496 = prediction, irreducible), and before
saving G_89 (the script saved only after the controls). Changes:
1. G_p is written to disk immediately after F1 (before any control).
2. New cheap negative control F4' (all remaining primes): the analytic conjugates must form a multiset closed under complex
   conjugation for the correct convention (they are the roots of a real polynomial), and must NOT for the wrong convention (conv 2).
   Tested at 60 digits: max over conjugates v of min over conjugates w of |conj(v) - w| must be < 10^-40 (correct) and > 10^-5 (wrong).
3. F4' is validated first on p = 13 and 73 (where the full F4 already passed): correct < 10^-40, wrong > 10^-5, else F4' is void.
4. p = 97 (degree 192) runs F1-F4 in full plus F4'. p = 89 reruns F1-F3 in full plus F4' (full F4 skipped for cost).
Bars F1-F3 unchanged.
