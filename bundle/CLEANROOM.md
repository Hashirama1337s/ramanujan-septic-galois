# Clean-room rebuild of a representative subset

## In plain words
We copied this bundle into an empty folder on the same PC, installed the software fresh, and reran a representative set of the
programs using only the commands in `README.md`. Every output came out the same as the shipped file, except for timing values and one
line that prints a program fingerprint which the redaction changed on purpose (explained below). The three new certified polynomials
(p = 47, 61, 67) and the p = 53 control came out byte for byte identical to the sealed hashes.

## Set-up
- Fresh folder outside the bundle; the final bundle (this folder, before `CLEANROOM.md`, `LINT.txt` and `SHA256SUMS` were added) was
  copied in, then the outputs to be rebuilt were deleted from the copy (`vectors/v5_method/m2/certG_p*.txt`,
  `vectors/v5_method/m2/certmin_out_*.txt`, `vectors/v5_method/stepd/stepd_out.txt`) so they had to be regenerated. Nothing from the
  lab tree was used. Comparison was against this bundle as shipped.
- Python: a new virtual environment (Python 3.11.9) with `pip install python-flint==0.9.0 mpmath==1.3.0` from PyPI (python-flint 0.9.0,
  FLINT 3.6.0; mpmath 1.3.0). No user site-packages; `-I` as in the README. One process at a time; `run_m2.py` sets and prints
  flint `ctx.threads = 1`.
- PARI/GP 2.17.3 (conda-forge build) on Ubuntu 24.04 under WSL2, x86_64, run from the same folder; every gp command with
  `-D nbthreads=1` and pinned to one CPU (`taskset -c 0`). One gp process at a time.
- Before running, the redacted scripts were compared with their lab originals: the only changed lines in `.gp`, `.py` and `.sh` files are
  the substitutions listed in `REDACTIONS.md` (path prefixes P10 x148, shell environment lines P1/P3/P4 x6, the site-packages line P5 x2,
  comment-only name/time edits N1, N2, F3, F5, H3 x5, and the pin R-PIN x1). No statement of program logic changed.

## Commands (README Tier 1, run from the copy's root)
```
python paper/release/verify_deg11.py 1000 > rb/cleanroom.txt
python -I vectors/v5_method/stepd/stepd.py 7 5 13 37
python -I vectors/v5_method/m2/run_m2.py 53 47 61 67 --ctrl > rb/m2_console.txt
python -I vectors/v5_method/m2/score_m2.py certmin_out_53_47_61_67_ctrl.txt > rb/score_m2_out.txt
gp -q -D nbthreads=1 vectors/v9_even/run_u1.gp < /dev/null > rb/run_u1_out.txt
gp -q -D nbthreads=1 vectors/v8_stark/k1.gp < /dev/null > rb/k1_out.txt
echo 'read("vectors/v6_shape/sC.gp"); sc(23, 600);' | gp -q -D nbthreads=1 -D parisizemax=6000000000 > rb/sC_p23.txt
gp -q -D nbthreads=1 -s 2G vectors/v6_shape/repair.gp < /dev/null > rb/repair_out.txt
gp -q -D nbthreads=1 vectors/v9_even/spcount.gp < /dev/null > rb/spcount_out.txt
gp -q -D nbthreads=1 veins/v4_fast/ctrl79.gp < /dev/null > rb/ctrl79_out.txt
gp -q -D nbthreads=1 vectors/v9_even/proof_u1.gp < /dev/null > rb/proof_u1_out.txt
```
All 11 commands exited with code 0. Wall times: `run_m2.py` 20 s (the lab log: 19.7 s), `repair.gp` 18 s, every other command 5 s or less.

## Results
Rule: the README comparison rule (timing values masked, pure timing lines deleted, absolute path prefixes and PARI stack-size warnings
ignored); certified polynomial files must be byte-identical. sha256 values are shortened to 16 hex digits.

| check | rebuilt file | compared with | rebuilt sha256 | shipped sha256 | result |
|---|---|---|---|---|---|
| BAR-M2 certified G_47 | `vectors/v5_method/m2/certG_p47.txt` | same path | 453e73bd7deec0a6 | 453e73bd7deec0a6 | byte-identical (= sealed hash in SEALS-M2.txt) |
| BAR-M2 certified G_61 | `vectors/v5_method/m2/certG_p61.txt` | same path | c91267695fd1cd13 | c91267695fd1cd13 | byte-identical (= sealed hash) |
| BAR-M2 certified G_67 | `vectors/v5_method/m2/certG_p67.txt` | same path | 6307c5dbce4f953a | 6307c5dbce4f953a | byte-identical (= sealed hash) |
| BAR-M2 control G_53 | `vectors/v5_method/m2/certG_p53.txt` | same path | 6795fd3f1db87ac0 | 6795fd3f1db87ac0 | byte-identical (= sealed hash) |
| BAR-M2 run log | `vectors/v5_method/m2/certmin_out_53_47_61_67_ctrl.txt` | same path | 4b175ce37b0c07f9 | 836c8ec5cca84450 | PASS (timing values and the absolute path prefix differ only) |
| BAR-M2 verdict | `rb/score_m2_out.txt` | `vectors/v5_method/m2/logs/score_out.txt` | 9a056f32f0b93940 | d34675818ea109e4 | PASS ("BAR-M2 OVERALL: HOLDS"; timing values differ only) |
| BAR-M2 console | `rb/m2_console.txt` | `vectors/v5_method/m2/logs/run_console.txt` | 518b04c54a73f5dd | ab1b37e090935018 | PASS except line 1, an expected difference: it prints the sha256 of `certmin.py`, e13c0223... for the shipped (path-redacted) file vs 3473634e... for the lab original (rule R-PIN) |
| U-GG / U-CF sealed verdicts (BAR-U1) | `rb/run_u1_out.txt` | `vectors/v9_even/run_u1_out.txt` | 1f9a05a412545e33 | 1f9a05a412545e33 | byte-identical (= the hash quoted in RESULT-U1) |
| U proof computations | `rb/proof_u1_out.txt` | `vectors/v9_even/proof_u1_out.txt` | d6e9419a96c6b103 | d6e9419a96c6b103 | byte-identical |
| U stabiliser counts | `rb/spcount_out.txt` | `vectors/v9_even/spcount_out.txt` | 2fd30ea8e9fec93f | 2fd30ea8e9fec93f | byte-identical |
| Stark dictionary BAR-K1 (p = 7 and 23; 70/70 as predicted) | `rb/k1_out.txt` | `vectors/v8_stark/k1_out.txt` | e17bedbf879081ff | e17bedbf879081ff | byte-identical |
| Theorem G case (D) repair (BAR-GD) | `rb/repair_out.txt` | `vectors/v6_shape/repair_out.txt` | 0c32fb10ad792573 | c63af290f31b9ae7 | PASS (only the per-item seconds differ) |
| C9 corrected residue-degree law at p = 23 | `rb/sC_p23.txt` | block "C p=23" of `vectors/v6_shape/runC_out.txt` | ab4494f6046c1619 | 3ccf23b900412813 (block) | PASS: J [[1, 3]], F_p [[1, 33]] as predicted; corrected law holds (f_M = 33), literal old law fails (22) |
| fast method control p = 79 | `rb/ctrl79_out.txt` | `veins/v4_fast/ctrl79_out.txt` | 09d3571d07b6ba8d | 09d3571d07b6ba8d | byte-identical |
| Step D sine certificates (p = 5, 7, 13, 37) | `vectors/v5_method/stepd/stepd_out.txt` | same path | cffb896efaf7b753 | cffb896efaf7b753 | byte-identical (4 verdicts RIGOROUS) |
| Degree 11/13 clean-room script | `rb/cleanroom.txt` | `paper/release/cleanroom_out.txt` | 65d5f7ed085ad04e | 65d5f7ed085ad04e | byte-identical |

**Summary: 16 checks; 16 pass (10 byte-identical, 5 identical after timing/path normalisation, 1 identical except the expected
fingerprint line). No mismatch in any mathematical output.**

Known-good anchors also confirmed in the shipped files: `paper/release/verify_deg11.py` sha256 610ba0fd...; `certG_p89.txt` sha256
d7c8d593...; `vectors/v9_even/run_u1_out.txt` sha256 1f9a05a4....

## Notes
- A first attempt of the p = 23 C9 command (without `-D parisizemax=6000000000`) stopped with "the PARI stack overflows" in `polclass`;
  the lab's own run had used that setting (comment in `vectors/v6_shape/runC.gp`). The README command now includes it, and the final
  pass above used the final README. Also from the first attempt: `python -I` cannot see a user-level python-flint install, hence the
  venv advice in the README.
- Not rebuilt here: Tier 2 (the 20 certified G_p of RESULT-M1-v2, `runrest.gp`, the C5, C6, C7, C8, C9-valuation and Theorem G sealed
  runs, the 1,500-2,000-digit degree-11/13 programs) and Tier 3 (the lattice sweep, hours). Their outputs are shipped with their hashes.
- `structure/b_galois.gp` cannot be rerun from this bundle: it reads `structure/tables.gp`, which is not in the bundle's file list.

## Addendum (lead, 2026-10-30)
- Added structure/tables.gp (missing dependency of structure/b_galois.gp; no redaction needed - lint clean). Clean-room: b_galois.gp now runs (gp, nbthreads = 1): rc 0; last line "NC p=13, non-QR a: sigma_a(b_1) coincides with some b_k in 0 cases (expect 0)".
- Added LICENSE (CC BY 4.0, text), LICENSE-CODE (MIT, all .gp/.py/.sh), CITATION.cff - same conventions as the lab's earlier releases.
