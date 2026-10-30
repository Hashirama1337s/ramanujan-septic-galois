# AMENDMENT-SWEEP2-6 (sealed before any F4'' data)

## In plain words
F4' (AMENDMENT-SWEEP2-5) FAILED its own validation at p = 73 (correct 10^34, wrong 10^106) and at 97 (correct 10^91, wrong 10^162):
it measured ABSOLUTE distances at 60 digits, and the conjugates are as large as 10^150, so 60 digits cannot resolve them. Per the
sealed rule, F4' is void. This was the lead's design error (flagged by the scribe). p = 97 still passed the full F4 (wrong convention
rounding error 10^+7220: fails as it should), so 97 is a full PASS. p = 89 needs a valid negative control.

## F4'' (replaces F4')
RELATIVE closure: max over conjugates v of min over w of |conj(v) - w| / max(1, |v|), at 120 digits.
Correct convention must give < 10^-60; wrong convention (conv 2) must give > 10^-3.
Validation first on p = 13, 73, 97 (full F4 already passed there): both inequalities must hold at all three, else F4'' is void too.
Then F4'' on p = 89. Bars F1-F3 unchanged.
