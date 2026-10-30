# Supplementary code and data: Ramanujan's septic theta identity at every odd prime

Moki & Julio (AI-assisted). Bundle for release version 1 of the paper, October 2026.

## In plain words
This folder holds everything behind the paper's results: the written proofs, the programs, what the programs printed, the
predictions we wrote down and fingerprinted (hashed) before each test, and the replies of the AI referees. You can rerun the programs
yourself and check that they print the same thing. Nothing here has been checked by a human expert yet; the proofs were checked by
independent AI reviewers only. `STATUS.md` says, for every claim, how far it has been checked.

Three files explain how the bundle was made:
- `REDACTIONS.md`: before release we removed the names of the AI products used as reviewers, our machine's folder paths and one
  personal name, in 154 of the 594 files. Every change is listed there, line by line, with the file's fingerprint before and after.
  This matters because the sealed fingerprints inside the lab files (`SEALS*.txt`) were taken on the original bytes.
- `LINT.txt`: the output of the pre-release checker on this folder (0 findings).
- `CLEANROOM.md`: a rebuild of a representative subset in a fresh folder using only the commands below, and how the outputs compared.

`SHA256SUMS` lists the SHA-256 of every file in the bundle as shipped (check with `sha256sum -c SHA256SUMS`).

## What each folder is
Group IDs are those of the paper's Appendix B. Status words are the paper's (section 7.7); `STATUS.md` has the full table.

| group | folders | contents | status (paper section 7.7) |
|---|---|---|---|
| S-T | `.` (root `*.py`, `BAR-R*.md`, `SEALS.txt`), `seatB/`, `p13/`, `p13/seatB13/`, `paper/`, `whereelse/` | Degree 11 and 13: two independent implementations (seat A at the root and `p13/`, seat B in `seatB/` and `p13/seatB13/`), PSLQ outputs, table sources, the clean-room script `paper/release/verify_deg11.py` | NUMERICAL (two implementations) |
| S-SW | `sweep/`, `sweep/seatB/`, `veins/v4_fast/` | The sweep p = 11-79 (lattice reduction, Galois transport), the fast method, minimal polynomials G_59 ... G_97 | NUMERICAL; G_p certified in S-M |
| S-C13 | `proof/`, `proof/checks/`, `proof/lead/`, `structure/` | Proof of C1, C2, C3a, C3b (`proof/proof-C1-C3-v4.md`), check scripts, referee rounds | PROVED (AI-refereed) |
| S-C4 | `proof/v5/` | Proof of C3c, Prop D, C4 (`proof/v5/proof-C3c-C4-v5.1.md`), checks, two referee rounds | PROVED (AI-refereed) |
| S-CERT | `proof/cert/`, `vectors/v5_method/stepd/` | Sine forms at 5, 7, 13, 37: certificates; ball-arithmetic step D (sealed) | RIGOROUS (ball arithmetic) |
| S-C5 | `veins/v23/`, `idoneal/` | C5 (composite n): proof v3, sealed composite run, G_n; the refuted idoneal bar (R1) | PROVED (AI-refereed); R1 REFUTED |
| S-V3 | `veins/v3b/`, `veins/v3c/`, `vectors/v2_index/` | Ramanujan units V3, the L-value identity V3C, the index C8 and its sealed test | PROVED (AI-refereed) |
| S-W | `vectors/v1_wall/` | C6 cubic and quintic analogues: write-up, sealed run, referee rounds 1-4 | PROVED (AI-refereed) |
| S-R | `vectors/v3_rr/` | C7 Rogers-Ramanujan: write-up, sealed run, referee round | PROVED (AI-refereed) |
| S-G | `vectors/vG_level/` | Theorem G and the stabiliser frame: write-up, sealed bars, outputs, referee rounds 1-3 | PROVED (AI-refereed) |
| S-GD, S-SA | `vectors/v6_shape/` | Case-(D) repair of Theorem G; Theorem S-A, C7 real count, C9 corrected residue-degree law; the fixed counting routine `clustfix.gp` | repair: PROVED (AI-refereed, two referees); S-A and C9 corrected law: PROOF DRAFT (one round) |
| S-F | `vectors/v4_factor/` | C9 valuation law: write-up and sealed test | PROVED (AI-refereed) |
| S-M | `vectors/v5_method/`, `vectors/v5_method/m2/` | C10: Theorem M, the ball-arithmetic program `certmin.py`, certified G_p for every prime 5 <= p <= 97 (`m2/` adds 47, 61, 67 under the sealed bar BAR-M2) | PROVED (AI-refereed); certificates RIGOROUS (ball arithmetic) |
| S-U | `vectors/v9_even/` | Even levels U-GG, U-CF: sealed bar and run, proof and its exact computations, referee scripts | PROOF DRAFT (one round, CORRECT WITH FIXES) |
| S-K | `vectors/v8_stark/` | Stark dictionary: sealed tests at p = 7, 23, scripts, outputs, two referee reports, prior-art notes | PROOF DRAFT (one round each) |
| S-SIDE | `rcft/`, `veins/v1_law/`, `side/` | Side folders: the RCFT remark, the early abelian-test bar, a negative finding of Gross-Zagier type | side observations, not claims |

Names used inside the files: "seat A" and "seat B" are two independent implementations or reviewers working blind to each other;
"reviewer A" and "reviewer B" are the two AI reviewers (product names removed); "proof seat", "referee", "lead" and "user seat" are
roles. `BAR-*.md` is a sealed prediction (written and hashed before the run), `AMENDMENT-*.md` a hashed change made before the data it
covers, `RESULT-*.md` the scored outcome, `REFEREE-*.md` and `referee-*-reply.md` referee reports. Some lab files carry the header
"Internal; not for release"; that was the working label before release review and is kept so those files' hashes stay as they were.
A few files mention working files that are not shipped (a referee's private working folder; third-party PDFs under `refs/`, which are
copyrighted). `structure/b_galois.gp` reads `structure/tables.gp`, which is not in this bundle, so it cannot be rerun from here.

## Software
| software | version used for the shipped outputs and the clean-room rebuild |
|---|---|
| PARI/GP | 2.17.3 (conda-forge build, Ubuntu 24.04 under WSL). Always one thread: start gp with `-D nbthreads=1`. |
| Python | 3.11.9 |
| mpmath | 1.3.0 |
| python-flint | 0.9.0 (FLINT 3.6.0, which includes Arb) |

Older runs in the lab may have used an earlier PARI build; equality of outputs is the test. Install python-flint and mpmath normally
(`pip install python-flint==0.9.0 mpmath==1.3.0`), preferably in a fresh virtual environment: several commands use `python -I`,
which ignores user site-packages. No path setup is needed.

## How to rebuild
Work in a copy of the bundle (some programs write their outputs next to themselves and would overwrite the shipped files); keep an
untouched copy as the reference. Run every command from the bundle root in a POSIX shell, with `gp` and `python` (3.11) on the PATH. On
Windows, `python` may be `py -3.11`, and gp may run under WSL from the same folder.

Comparison rule: an output passes when it equals the shipped file after two timing normalisations: every timing value matching
`\[(total )?[0-9.]+ s\]|\([0-9.]+ s\)|[0-9]+ ms|WALL( p = [0-9]+:)? [0-9.]+ s` is masked, and lines matching
`total time|time [0-9]` (pure timing lines) are deleted. Everything else on a line is compared. The certified polynomial files `certG_p*.txt` and `minpoly_p*.gp` must be
byte-identical (compare with `SHA256SUMS`). Some logs print the absolute path of a file they compared against; that path prefix differs
from machine to machine and is ignored, as are PARI's "increasing stack size" warnings. The first console line of `run_m2.py` prints
the sha256 of `certmin.py`; it differs from the lab log by design (see rule R-PIN in `REDACTIONS.md`).

```
mkdir -p rb
```

**Tier 1 (minutes in total):**
```
python paper/release/verify_deg11.py 1000 > rb/cleanroom.txt                             # vs paper/release/cleanroom_out.txt
python -I vectors/v5_method/stepd/stepd.py 7 5 13 37                                       # rewrites vectors/v5_method/stepd/stepd_out.txt
python -I vectors/v5_method/m2/run_m2.py 53 47 61 67 --ctrl                                # BAR-M2: rewrites m2/certG_p{53,47,61,67}.txt and m2/certmin_out_53_47_61_67_ctrl.txt
python -I vectors/v5_method/m2/score_m2.py certmin_out_53_47_61_67_ctrl.txt              # BAR-M2 verdict, vs m2/logs/score_out.txt
gp -q -D nbthreads=1 vectors/v9_even/run_u1.gp      < /dev/null > rb/run_u1_out.txt        # U-GG / U-CF sealed verdicts, vs vectors/v9_even/run_u1_out.txt
gp -q -D nbthreads=1 vectors/v9_even/proof_u1.gp    < /dev/null > rb/proof_u1_out.txt      # vs vectors/v9_even/proof_u1_out.txt
gp -q -D nbthreads=1 vectors/v9_even/spcount.gp     < /dev/null > rb/spcount_out.txt       # vs vectors/v9_even/spcount_out.txt
gp -q -D nbthreads=1 vectors/v8_stark/k1.gp         < /dev/null > rb/k1_out.txt            # Stark dictionary BAR-K1 (p = 7, 23), vs vectors/v8_stark/k1_out.txt
gp -q -D nbthreads=1 vectors/v8_stark/k2.gp         < /dev/null > rb/k2_out.txt            # vs vectors/v8_stark/k2_out.txt
gp -q -D nbthreads=1 veins/v4_fast/ctrl79.gp        < /dev/null > rb/ctrl79_out.txt        # vs veins/v4_fast/ctrl79_out.txt
gp -q -D nbthreads=1 -s 2G vectors/v6_shape/repair.gp < /dev/null > rb/repair_out.txt      # Theorem G case (D) repair, vs vectors/v6_shape/repair_out.txt
gp -q -D nbthreads=1 -s 2G vectors/v6_shape/sB.gp     < /dev/null > rb/sB_out.txt          # vs vectors/v6_shape/sB_out.txt
echo 'read("vectors/v6_shape/sC.gp"); sc(23, 600);' | gp -q -D nbthreads=1 -D parisizemax=6000000000 > rb/sC_p23.txt # C9 corrected law at p = 23, vs the "C p=23" block of vectors/v6_shape/runC_out.txt
```
**Tier 2 (about 30-60 minutes in total on one core):**
```
python -I vectors/v5_method/certmin.py 5 7 11 13 17 19 23 29 31 37 41 43 53 59 71 73 79 83 97 --ctrl   # certG_p<p>.txt byte-identical
python -I vectors/v5_method/certmin.py 89                                                    # the logged run took 584 s
gp -q -D nbthreads=1 -s 4G veins/v4_fast/runrest.gp          < /dev/null > rb/runrest_out.txt   # rewrites minpoly_p59/71/83.gp (byte-identical)
gp -q -D nbthreads=1 -s 2G vectors/v1_wall/run_w1.gp         < /dev/null > rb/run_w1_out.txt
gp -q -D nbthreads=1 -s 2G vectors/v3_rr/go_A.gp             < /dev/null > rb/outA.txt
gp -q -D nbthreads=1 -s 2G vectors/vG_level/run_g1b.gp       < /dev/null > rb/run_g1b_out.txt   # compare only the 133 "exact:" lines (paper section 5.7)
gp -q -D nbthreads=1 vectors/v2_index/idx.gp < /dev/null > vectors/v2_index/idx_out.txt; python vectors/v2_index/score.py vectors/v2_index   # C8 sealed index test
gp -q -D nbthreads=1 vectors/v4_factor/test.gp               < /dev/null > rb/test_out.txt      # C9 valuation law
for s in run_a run_b run_c run_d; do gp -q -D nbthreads=1 -s 4G -D path=.:veins/v23 veins/v23/$s.gp < /dev/null > rb/${s}_out.txt; done   # C5 table
python cyclo.py; python field.py; python prod.py; python verify.py; python p13/r13.py      # seat A, p = 11, 13 (1,500-2,000 digits)
```
**Tier 3 (optional; hours):** the lattice sweep per prime, `bash sweep/runp.sh p dP W` (p = 11-43) and `bash sweep/rung.sh p dP W`
(Galois transport, 41-79), with (dP, W) as in the first line of each `sweep/sweep_p*.txt` / `sweep/galois_p*.txt`;
`veins/v4_fast/run_89_97.gp` (logged: 89 in 5,290 s, 97 in 650 s); seat B's independent scripts in `seatB/`, `p13/seatB13/` and
`sweep/seatB/`.

Path convention: every script reads and writes files by paths relative to the bundle root, so run it from the root. Scripts that read
a file by its bare name (`read("v2.gp")`, `read("cert.gp")`, `read("lib.gp")`) are run from the root with gp's search path extended to
their folder, e.g. `gp -q -D nbthreads=1 -D path=.:proof/cert proof/cert/run_11.gp`.
