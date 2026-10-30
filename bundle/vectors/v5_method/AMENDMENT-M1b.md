# AMENDMENT-M1b (sealed after the BAR-M1 run, before any certified run at the extension primes)

## In plain words
The BAR-M1 run certified all four test primes, but its comparison with the disk file at p = 37 printed "not identical". The cause
is in my comparison code, not in either polynomial: that disk file holds the same polynomial twice (two identical lines; the 08:39
re-run appended a second copy), and certmin.py v1.0 glued the two lines into one. Post hoc, each line on its own is identical to the
certified G_37 (posthoc/p37_compare_out.txt). BAR-M1 stays scored as run (M2 at 37 = instrument fault, see RESULT-M1.md).

This amendment (a) fixes the parser (v1.1: all non-empty lines of a disk file must be identical, then one is parsed; a file with
different lines aborts), and (b) extends the certified recomputation to every other floating-point G_p on disk.

## Instrument
certmin.py v1.1, sha256 d2f029f9864aabafe80fd96cfa4adbcf48262f16de13b86acbad18b7d45bbc05 (v1.0 kept as posthoc/certmin_sealed_v1.py).
Command: `py -3.11 -I certmin.py 13 17 19 29 31 41 43 53 71 73 79 83 89 97 --ctrl`.
(29 was a development/timing prime before BAR-M1; its disk comparison was not run then.)

## Predictions (each extension prime)
M1-M5 exactly as in BAR-M1, with M2 against the disk file named in certmin.py DISK (v4_factor for 13-53, veins/v23/G_p31.gp for 31,
veins/v4_fast for 71-97). M6': whole run under 30 minutes; p = 89 (degree 528) the longest, predicted 1 to 15 minutes.
Scoring as in BAR-M1. A disk file with differing lines counts as an M2 FAIL for that prime.
