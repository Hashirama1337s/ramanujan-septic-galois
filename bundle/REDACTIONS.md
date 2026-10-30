# Redactions: what was changed in this bundle, and why

## In plain words
The lab files behind the paper mentioned the AI products used as reviewers, the folder paths of our machine, one personal first
name and a few hand-typed clock times. Before release, those words were replaced in copies of the files (the lab originals are
unchanged). Nothing mathematical was changed: no number, formula, program step or output value. Paths inside programs became paths
relative to the bundle root, so the programs now run from the root of this folder.

**154 of 594 files** were changed (263 substitutions). The other 440 files are byte-identical to the
lab originals. **Seal hashes:** the sealed hash lists inside the lab files (`SEALS*.txt`, and hashes quoted in `BAR-*`, `RESULT-*` and
`AMENDMENT-*` files) were computed on the ORIGINAL bytes. For a changed file, its sealed hash matches the "original sha256" column
below, not the shipped file; `SHA256SUMS` lists the shipped (redacted) bytes. Anyone holding the originals can apply the rules below
and obtain the shipped bytes exactly.

Notation. Names are not reproduced in this file. `<A>` and `<a>` stand for the capitalised and lower-case forms of the product
name replaced by "reviewer A" (6 letters; sha256 of the lower-case word: c857d09db23e6822e3600bc06ad8d58f92ed62bc8efd81c753f77048662cb97d);
`<B>` and `<b>` for the product name replaced by "reviewer B" (4 letters; sha256: add92b9cde2bdbf3daaf65a0db79e9b1a7fa428b71b4d6ce38c742eb6dca0c1c);
`<P>` and `<p>` for a personal first name (5 letters; not reproduced and not hashed, for privacy; it occurs once in the text, at
`veins/v23/RESULT-V23.md` line 230, and as a user-folder name in two machine paths; the original-file hashes below pin those bytes).
A character in
square brackets stands for itself (`[D]:` is a drive letter D followed by a colon); this escaping keeps the release checker from
flagging the list itself. The rules are Python regular expressions (module `re`), written exactly as applied with these two
conventions undone.

## How the rules were applied
- Every text file (UTF-8) was processed line by line; on each line the rules were applied in the order of the table below, each
  rule replacing all of its matches. Line endings (LF or CRLF) were kept as they were.
- One binary file (`p13/seatB13/vals13.pkl`) and one non-UTF-8 text file (`paper/table.md`, Latin-1) were copied unchanged; both were
  checked and contain none of the patterns.
- Rule R-PIN (one substitution): `vectors/v5_method/m2/run_m2.py` refuses to run unless `../certmin.py` has a pinned sha256. Rule P5
  changed one line of `certmin.py` (a machine path), so the pin in the shipped `run_m2.py` is the sha256 of the shipped `certmin.py`;
  the original pin (the sealed v1.2 hash) is recorded below. The program logic is otherwise identical; its console line still
  says "sealed v1.2 match", which now means "matches the shipped, path-redacted v1.2".
- File renames (BUNDLE-PLAN section 2, same as rules F1-F10 applied to names): listed in the rename table.

## Rules (in order of application)
| rule | pattern (Python regex) | replacement | what it covers | substitutions |
|---|---|---|---|---|
| P1 | `^export MAMBA_ROOT_PREFIX=\$HOME/mamba$` | `# (environment line removed for release: gp must be on PATH)` | shell scripts: environment line pointing into the home folder replaced by a comment | 3 |
| P2 | `export MAMBA_ROOT_PREFIX=\$HOME/mamba; ` | (empty) | spec text: environment prefix removed from the example command | 1 |
| P3 | `\$HOME/bin/micromamba run -n pari gp` | `gp` | micromamba wrapper -> plain `gp` | 3 |
| P4 | `\$HOME/mamba/envs/pari/bin/gp` | `gp` | absolute gp binary -> plain `gp` | 2 |
| P5 | `^sys\.path\.append\(r'[C]:\\Users\\[^']*site-packages'\)$` | `# (machine-specific sys.path line removed for release; install python-flint normally)` | Python: machine-specific site-packages path line replaced by a comment (line count kept) | 2 |
| P6 | `<dir under /mnt/d/\.\.\.>` | `<dir under the project folder>` | spec text: machine folder placeholder | 1 |
| P7 | `/mnt/d/\.\.\./` | `<project folder>/` | notes: machine folder placeholder | 1 |
| P8 | `(?:[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/\|[D]:/_LIVE/NEXT-2026-10-27/ramanujan/)(?= \(except)` | `the project folder` | spec text: absolute project folder -> "the project folder" | 3 |
| P9 | `Root for paths: [D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11\.` | `Root for paths: the bundle root.` | notes: absolute root -> "the bundle root" | 1 |
| P10 | `(?:/mnt/d\|[D]:)/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) | absolute project path prefix (WSL or Windows form, forward slashes) -> nothing (path becomes relative to the bundle root) | 150 |
| P11 | `[D]:\\_LIVE\\NEXT-2026-10-27\\ramanujan\\deg11\\` | (empty) | absolute project path prefix (Windows form, backslashes) -> nothing (relative to the bundle root) | 5 |
| P12 | `[C]:/Users/[^/]+/[A]ppData/Local/Temp/[^ ]*?/[s]cratchpad/` | (empty) | a referee's private temporary folder path -> nothing | 1 |
| P13 | `session [s]cratchpad` | `private working folder, not shipped` | private temporary folder, named -> neutral words | 3 |
| P14 | `\b[s]cratchpad\b` | `private working folder` | private temporary folder, named -> neutral words | 2 |
| F1 | `<a>-proof-v5\.1-C4-C3c\.md` | `proof-C3c-C4-v5.1.md` | file name with a product name -> bundle name | 8 |
| F2 | `<a>-proof-v4\.md` | `proof-C1-C3-v4.md` | file name with a product name -> bundle name | 13 |
| F3 | `<a>-proof-v([23])\.md` | `proof-C1-C3-v\1.md` | file name with a product name -> bundle name (versions not shipped) | 1 |
| F4 | `<a>-proof\.md` | `proof-C1-C3-v1.md` | file name with a product name -> bundle name (version not shipped) | 1 |
| F5 | `proof/<a>/` | `proof/checks/` | folder name with a product name -> bundle folder | 3 |
| F6 | `referee-<a>\.md` | `referee-seatA-round1.md` | file name with a product name -> bundle name | 0 |
| F7 | `panel/<a>-scratch/` | `side/` | folder name with a product name -> bundle folder | 0 |
| F8 | `<b>-referee-?([A-Za-z0-9]*)-reply` | `referee-<tag>-seatB-reply` (tag `r1` when empty) | referee reply file name -> `referee-<tag>-seatB-reply` (tag `r1` when empty) | 17 |
| F9 | `<b>-([A-Za-z0-9_-]+?)-(reply\|brief)` | `external-\1-\2` | other reply/brief file name -> `external-<name>-reply` / `-brief` | 7 |
| F10 | `<b>-\*` | `referee-*-seatB-reply.md` | file-name wildcard with a product name | 1 |
| N1 | `\b(<A>\|<a>)\b` | `reviewer A` | product name -> role "reviewer A" | 1 |
| N2 | `\b(<B>\|<b>)\b` | `reviewer B` | product name -> role "reviewer B" | 3 |
| N3 | `\b[Rr]eferee seat` | `independent AI reviewer` / `Independent AI reviewer` | "referee seat" -> "independent AI reviewer" (capital kept) | 19 |
| I1 | `\b<P>'s\b` | `the coordinating author's` | personal first name (possessive) -> "the coordinating author's" | 1 |
| I2 | `\b<P>\b` | `the coordinating author` | personal first name -> "the coordinating author" | 0 |
| H1 | `\s*\(\d{1,2}:\d?x-\d{1,2}:\d{2}\)` | (empty) | hand-typed clock-time range removed | 1 |
| H2 | ` \d{1,2}:\d?x\b` | (empty) | hand-typed approximate clock time removed | 7 |
| H3 | ` at ~\d{1,2}:\d{2}` | (empty) | hand-typed approximate clock time removed | 1 |
| R-PIN | the sealed sha256 of `certmin.py` v1.2 in `run_m2.py` | sha256 of the shipped `certmin.py` | see above | 1 |

## Renamed files (content hash unchanged unless the file is also listed as changed)
| bundle path | original lab path |
|---|---|
| `proof/proof-C1-C3-v4.md` | `proof/<a>-proof-v4.md` |
| `proof/checks/a_siegel.gp` | `proof/<a>/a_siegel.gp` |
| `proof/checks/a_siegel_out.txt` | `proof/<a>/a_siegel_out.txt` |
| `proof/checks/b_rootcheck.gp` | `proof/<a>/b_rootcheck.gp` |
| `proof/checks/b_rootcheck_out.txt` | `proof/<a>/b_rootcheck_out.txt` |
| `proof/checks/c_mapcheck.py` | `proof/<a>/c_mapcheck.py` |
| `proof/checks/c_mapcheck_out.txt` | `proof/<a>/c_mapcheck_out.txt` |
| `proof/checks/d_units.gp` | `proof/<a>/d_units.gp` |
| `proof/checks/d_units_out.txt` | `proof/<a>/d_units_out.txt` |
| `proof/checks/e2_trules.gp` | `proof/<a>/e2_trules.gp` |
| `proof/checks/e2_trules_out.txt` | `proof/<a>/e2_trules_out.txt` |
| `proof/checks/e_valuations.gp` | `proof/<a>/e_valuations.gp` |
| `proof/checks/e_valuations_out.txt` | `proof/<a>/e_valuations_out.txt` |
| `proof/checks/f_v2checks.gp` | `proof/<a>/f_v2checks.gp` |
| `proof/checks/f_v2checks_out.txt` | `proof/<a>/f_v2checks_out.txt` |
| `proof/referee-r1-seatB-reply.md` | `proof/<b>-referee-reply.md` |
| `proof/referee-2-seatB-reply.md` | `proof/<b>-referee2-reply.md` |
| `proof/referee-3-seatB-reply.md` | `proof/<b>-referee3-reply.md` |
| `proof/referee-seatA-round1.md` | `proof/referee-<a>.md` |
| `proof/v5/proof-C3c-C4-v5.1.md` | `proof/v5/<a>-proof-v5.1-C4-C3c.md` |
| `proof/v5/referee-5-seatB-reply.md` | `proof/v5/<b>-referee5-reply.md` |
| `proof/v5/referee-6-seatB-reply.md` | `proof/v5/<b>-referee6-reply.md` |
| `veins/v23/referee-c5-seatB-reply.md` | `veins/v23/<b>-referee-c5-reply.md` |
| `veins/v23/referee-c5r2-seatB-reply.md` | `veins/v23/<b>-referee-c5r2-reply.md` |
| `veins/v23/referee-c5r3-seatB-reply.md` | `veins/v23/<b>-referee-c5r3-reply.md` |
| `veins/v3b/referee-v3b-seatB-reply.md` | `veins/v3b/<b>-referee-v3b-reply.md` |
| `veins/v3b/referee-v3b2-seatB-reply.md` | `veins/v3b/<b>-referee-v3b2-reply.md` |
| `veins/v3b/referee-v3b3-seatB-reply.md` | `veins/v3b/<b>-referee-v3b3-reply.md` |
| `veins/v3b/referee-v3b4-seatB-reply.md` | `veins/v3b/<b>-referee-v3b4-reply.md` |
| `veins/v3c/referee-v3c-seatB-reply.md` | `veins/v3c/<b>-referee-v3c-reply.md` |
| `veins/v3c/referee-v3c2-seatB-reply.md` | `veins/v3c/<b>-referee-v3c2-reply.md` |
| `veins/v3c/referee-v3c3-seatB-reply.md` | `veins/v3c/<b>-referee-v3c3-reply.md` |
| `vectors/v2_index/referee-i1-seatB-reply.md` | `vectors/v2_index/<b>-referee-i1-reply.md` |
| `vectors/v1_wall/referee-w1-seatB-reply.md` | `vectors/v1_wall/<b>-referee-w1-reply.md` |
| `vectors/v1_wall/referee-w1b-seatB-reply.md` | `vectors/v1_wall/<b>-referee-w1b-reply.md` |
| `vectors/v1_wall/referee-w1c-seatB-reply.md` | `vectors/v1_wall/<b>-referee-w1c-reply.md` |
| `vectors/v1_wall/referee-w1d-seatB-reply.md` | `vectors/v1_wall/<b>-referee-w1d-reply.md` |
| `vectors/v3_rr/referee-r1-seatB-reply.md` | `vectors/v3_rr/<b>-referee-r1-reply.md` |
| `vectors/vG_level/referee-g1-seatB-reply.md` | `vectors/vG_level/<b>-referee-g1-reply.md` |
| `vectors/vG_level/referee-g2-seatB-reply.md` | `vectors/vG_level/<b>-referee-g2-reply.md` |
| `vectors/vG_level/referee-g3-seatB-reply.md` | `vectors/vG_level/<b>-referee-g3-reply.md` |
| `vectors/v6_shape/referee-gd-seatB-reply.md` | `vectors/v6_shape/<b>-referee-gd-reply.md` |
| `vectors/v4_factor/referee-f1-seatB-reply.md` | `vectors/v4_factor/<b>-referee-f1-reply.md` |
| `vectors/v5_method/referee-m1-seatB-reply.md` | `vectors/v5_method/<b>-referee-m1-reply.md` |
| `side/gz_diff_out.txt` | `panel/<a>-scratch/gz_diff_out.txt` |

## Changed files: original and shipped sha256
| bundle path | original sha256 (pre-redaction; matches the seals) | shipped sha256 (post-redaction; in SHA256SUMS) | substitutions |
|---|---|---|---|
| `seatB/SPEC-B.md` | 2947178c48b02e7f5eb8af6cf747a0bbfad105d518484f250cdec82db989b9ad | 1c6a034847395f538b74cea5e499dd899c789729c22df32a742618785d6de103 | 1 |
| `seatB/step1_control.py` | 84dc2eda402a2ba1f723d41fb530fe076c35589065e6f44cb4c8714a9a09aa60 | 4bc472e12d2aab82ae593094984d34af9babf852a9ce58deec6a1dd1745cf709 | 1 |
| `seatB/step2_find.py` | ae29c3bfc3f4eb2b69c74f5ffeeeebfbc233ddc9f354500b666df105d11b6d52 | b2136902d9d44ab82f94ce2f6b77f3f42809f203dd330714de2c8399ada96b12 | 2 |
| `seatB/step3_rebuild.py` | 6eb7a97abe710c71f25f50a195a7a2ef7915b280f7996df106e198ad3e3c333b | 23d6da4a9a602779223e97d7c184be82484c181ecbfe23f4e38b0fe640a3f14c | 2 |
| `seatB/step4_exact.py` | adcfa4bdaf58e445058d33eab484f537ff89c38a2f4c45608d4e81bec0addccf | de1212096c5f52870cf0af16bf00c47ac1769be865b121503e7afb204b8eefd5 | 1 |
| `p13/seatB13/SPEC-B13.md` | 6e962c6b43bb44b3e4092bced6a0c3f6f9711772533a3994284c6dba10bc65de | d087fff6d9abcd1abbd149d9a34023e1cc7b35be46c44c308842d31305ccfc8a | 1 |
| `p13/seatB13/step1_control7.py` | 7ced52e9fd6f00fdb5989cfe1ec4fb1c42f8cbfc52538ace06e316f74f29bf56 | 1f9d5865e177b69e2046ddf98254cfd0bb06b7fb3f5d83ab025a71448dd6b4b2 | 1 |
| `p13/seatB13/step2_compute13.py` | e3a0c289c1739b6daeb63e7b0288c710905f9a3d822a360cb50ff586dd1032f2 | 624cd036ad1287380878b2f854ee5ff295c2175aca4ee7b09b618d82539fb2e4 | 2 |
| `p13/seatB13/step3_pslq.py` | 74a39538d1f5aa961d08817697fa3cb5f47464b12dfe63f4a2d100d2cb1dd762 | afee38a878b85368d23acce3986e758f4bf42e07a7e691e3c215647949b51b36 | 2 |
| `p13/seatB13/step4_checks.py` | afb48d0a294714b1e23e19b9bbb73678157743501ebfb6a7108f1e3806bec9db | 4d6ec27687320014da81f6c870fbbb0b16871e6e0296ab10e0c87d1877391270 | 2 |
| `sweep/AMENDMENT-SWEEP2-4.md` | 1d099ef332505451635fc51760f69c2b413fe14c19d53f1fa4f77ef201ff388c | 68874f3e14719ab4f488e3991c5c540f0d984f12c824ab8e743f74bf67b49e34 | 1 |
| `sweep/laneA.sh` | e8622b54f791f4e4ae798b0a1ee22df84eda97c0c0970b8f3518a109f7e81e31 | 3234c1d7ec2faca9a15de6c119f9d7f111b659cd320c142cba86ceb4fd4bc800 | 1 |
| `sweep/laneB.sh` | 866952d12d24aa487dbe236f48a170387abf12d77ffba5aea8737fef241c66b6 | e941f9da72a82052a5e90fef4d58ce1971883fc5163f4573eb0962e8b09eb306 | 1 |
| `sweep/rung.sh` | 2883eab9651be038612bc4f11849398b0134f74bea8fafcc7c4448a02343749a | d80f37ae516de7047cf78e9700a39f888f9311181b8a90b5b9d694146e62eda3 | 3 |
| `sweep/runp.sh` | 9a9f0cfd5022d45113e0fb779adde498fe13cba4a4ba6ce9d0065a3ec57f1f59 | d23c6ecc9efaceeef86381a1acc46776dfee197461e1b9bb28d012737397e384 | 3 |
| `sweep/runp2.sh` | 6f4aa3dc73353c5a26a103b359301e7be45ac5ec44ee9806a4f54cfbfaaf7f5b | e735afd077098909bd33c184b9ff3be3afcd6ee64881d2ed4908a174d92f51bd | 3 |
| `sweep/seatB/SPEC-SWEEP-B.md` | 0f51711eb609050a143deae17c178eb044c50fa0f692dd69929bb01783f9cc51 | ecb49f62cd2d5249f29f1a7d817e69d9af99c041ea89e878c235f62efe655e42 | 4 |
| `veins/v4_fast/ctrl79.gp` | 99805501ddbbb9214e547e305b208fd079bed1f45546011bb9172990d1cb3eb3 | e2660cf48d3bbb08200510cd0f502059bdce7cd81d624650e534dfb9bee6bb85 | 1 |
| `veins/v4_fast/f4pp.gp` | 195d059e86c4238cf9e64b5d1985e259b9cdd73224d80eff2eccb900b26a9f28 | 5b9bc6ce4656432d9a686ece60a6f35891d18f2feefe477461b265f2809b5c96 | 1 |
| `veins/v4_fast/fastmin.gp` | 5dfbc61038fb77d6392cdbfd77b35ad62ee519d99ccfaecc0b7ba1f267de1dea | f7d016d61629282e6a4c971079886d3dffaff71e77b9771cad82bbc351528b67 | 1 |
| `veins/v4_fast/probe.gp` | 4abbe30289ac95d1514a800891ce4e1996dc169e32cd4e53eeabd25c01552a6d | 605788a8d3372b864caec847f5968233ed2b6879b587d668d170aaa8cb013a87 | 2 |
| `veins/v4_fast/run79.gp` | 3e35e81c030cd6b8956154b4e418027a456424321cd2e3b11c9cd9a34a2d611c | 17fba996cd5ec7a7efd3cf9105d91a474ee1120fb5febf4467b88dab83ba4a19 | 2 |
| `veins/v4_fast/run_89_97.gp` | d84cdb7564d2e50d0b5ad2fd3674360ed2d6cf24effde49a1f0cd85960c6c234 | f7ce6cf95916c0275d4dcb040ff9cfc0971223d70e72ba95f4ddeac05383ed21 | 2 |
| `veins/v4_fast/runrest.gp` | ade517b90934bc8746e381889f68fb7434d5787b8ff0eaaf598f66225e434c42 | 47f4dc12715006f2adcbaeceb10d18e09b32caed54409b45d03c5e12f308d9ab | 2 |
| `proof/proof-C1-C3-v4.md` | 21844d15af8f3473c00520cda0723a03a50b48cdd3be5d714e7d2399b6ada3e4 | 72bae235e532544cf9eed98960243846009c594d72afbeb2eaeb6fd2ef4761bf | 5 |
| `proof/checks/a_siegel.gp` | da5caae06d853eb2f8998a88d7ea8b91e6d249509ed49bea65c548bd4b6ff380 | ea87d7eeac9d99805d45cb22235df3cefdc7ecd2ca06d117c8a5e4a4d45ee328 | 1 |
| `proof/checks/c_mapcheck.py` | 5e0a83735126da99b58e3d56d704241f8c8a6d52f19d34b3e9c305aedd79afdb | cc134db6850aa38ab56a482de9c6d696a1d382b6675780e8e56ef55274dd2deb | 1 |
| `proof/checks/f_v2checks.gp` | 50ef8571d9fbef14f9a74ec7714b4dbb4feb4dd44eb81f088c62eb816b52b316 | 25922bf2cdbb533c271d2e572e19c4005560747739b76eae92db1e187f428600 | 1 |
| `proof/lead/siegel_check.gp` | 06d2c9d10f27cc292f9cd907f1bd5be1fe0d9db72c2d03b7c527af642a61227c | 2020e16aacf21ed3d9819792832e6e66e30b4066dc1fecc5f4b673ac848aa512 | 1 |
| `proof/referee-seatA-round1.md` | ff5a663282e873115ff4d3bbcb38922afa41f93997d203dfc397868e44538261 | c72a8b87f8c4630642b7da7758463ef06590196ad0801607d71abadd44f32f1a | 5 |
| `proof/v5/proof-C3c-C4-v5.1.md` | 5f594895180d095da233e4eab67ab59eae6b8ba9470d994fd7efc481c7cbf90a | 82fc300780826aa17bbc34496ae8f3a0b98c44c0c66334fff0f3b06da6337985 | 3 |
| `proof/cert/CERT-C4-STRONG.md` | ad4c5f8e8d906c4aaab128448e441988ac28159144293a1673abacd5d44cc228 | 307b8fb5053ed2f016a3f059e69225c4908e244471d2047e3070c048f2bbb1de | 3 |
| `vectors/v5_method/stepd/expc1.gp` | 749ea4f84861a11db37493e94127c402ed5e3bbab0c39dbf48d36ac175084eb0 | 7ae6bf9d89c74059dcc77087cc40b8a8e46afb0e537b1f258fee92e33c71d1a6 | 2 |
| `vectors/v5_method/stepd/stepd.py` | 15faf8b45ad7b8b20ec095d9af8b7017f807f4f353800c70d78f6c6426ebdc77 | a758288065fad1f73b10be44af0518eabebf28e65ed78e066af75450b6bdf732 | 1 |
| `veins/v23/C5-proof-v2.md` | 03745587938241159b5bef7ac095585070c744e14d23ac64e8eea6918bcf3d9d | 2e5fbf95903e6f88e2b93532b027284db21542235e3ddd6830d7acd00ed476c4 | 4 |
| `veins/v23/C5-proof-v3.md` | be82d97813379297fbb486264b46256527cf2ba71655f141e6cc4c78afc486d9 | cabbf6b5c2d4c39b6f135c3e9733af9460b80092e2db903be503cc11af7244fd | 1 |
| `veins/v23/RESULT-V23.md` | ba6b8ecec3e8749767bfe9b94cfec05880f4a799780c28c1ee1cca147576d47e | d47b4b512febc9bf2ef552352aab7b5bc150a3e8ef630d7258d257def7f0fa50 | 3 |
| `veins/v23/c5_checks.gp` | de54a263b2ab46c0ea1c9e804afd91df87e441926a5999dd7df3ede40f0c3fd8 | 92e26807e806c1a32afa52256a4e852a9dd2a29c4436bcd9200d812d422d50a8 | 1 |
| `veins/v23/dbg2.gp` | 764fc51414b6b1ecff5d6cdc4d26f8b9d5e14c869569e00046a08211f20f06e9 | e35f6941d7c5dd256667ae6021f4f0ad16fdad0505c8a560ee6464d1459a96e9 | 1 |
| `veins/v23/dbg31.gp` | a2655b1c8abea015a4a3d2e0f88904c909897f914e3319649e519c695d5c6c79 | 8522177b712890f2a881542a841ad6a47aae7c73844745e98da17db495fb870f | 1 |
| `veins/v23/run_v3a.gp` | 527cc33ed512f650c8a1a604393b55fa2a1484cf24077c8a3d8b707ba291d791 | 4f73df47ff49229749f0d6da4095713591bb5377e0736f365917634cdf65c7a7 | 1 |
| `veins/v23/run_v3b.gp` | ecb96d1383f6ed99c1eb3acb7c7cddd8ce0e078d40933030db8e1771993dc22f | 8f8eda768aff34e32c1d713a2428de56e1f7cf77d3743bfcadf18effed998729 | 1 |
| `veins/v23/run_v3c.gp` | 5170f75f40443c6aff48f83da915b02dc47af3af6bfde07b4da767f841e7ab88 | 151dcdae6480f65555a0706502cc0d55f8d217b1ef91d22a8a8d486794068e9e | 1 |
| `veins/v23/run_v3c_defs.gp` | e741e467f7c851eee489071c2709d03aae749ed575a21d13ea8178c641fc0012 | 23533b4339db62b53ab517213e1a847e47c891145a3141280b2eb840f2961181 | 1 |
| `veins/v23/v2.gp` | 6dfca436517e180d34322b320917733100bfb9304898128f466805caf0629b36 | d7b3c254cc4efba18724add0eed28eed9ca0f92bf00057ed69f8d6242150c03b | 2 |
| `veins/v23/v2b.gp` | 469f8cc79de91601f9dc2b9860ca272569219cc8e2628e3f20a6ff81fd33e7c0 | 8ab0d856d5e93e3173145963827382ce55aa0bb92d8f76c27c4c299e5f855ac4 | 1 |
| `veins/v23/v3.gp` | 66653d5a3d995000de3b0d89f9d86538cee9104feb3b925fdc75c10e5719edc9 | f900c4342b76c03c77bf6106cf196543005ce3839a1833ebef2dfa7f571eba00 | 2 |
| `veins/v3b/BAR-V3B.md` | 2b2854616a9e74571bc86c0a17eb8c6535ce2ea52317a4dc3ae4999063949a40 | e74bb97a1c40c47fbd90b70724391435ce49a80dc69cac083066833d89ab1eb0 | 1 |
| `veins/v3b/RESULT-V3B.md` | f1ba848f0e5d67f39cf58d504c536258a28baeea2d11b1ec47bb9ab10559eea3 | 1ed2ce5649a51059474075b6b34addb03dd175be87441f73f7a1465ab8a85562 | 7 |
| `veins/v3b/cert23.gp` | f7aec810a7349594bec13199a3cb54ccd8bc2365708bb2a872e0431971c7c9cc | 44afc0906d791be8a076ca369ff258fdccebe92fb3b7432514d0bb1bb8f02610 | 1 |
| `veins/v3b/referee-v3b-seatB-reply.md` | b268962b8c55c53fe92aee669fdaaf869c5fd5c2595ae4540eb70cadc6c0816c | 42a17a9203fa04560ba37a82842b0a1dc42f47e817c122aac644d13e7e31a655 | 1 |
| `veins/v3b/referee-v3b3-seatB-reply.md` | e8420db87044c523cb025939f08c5a87c984a719da624ef4f76680396f74d77a | be6e4301c149a14ea7951fdf7dfd919866616e2c063b24a01bd302dc5e6a7a1a | 1 |
| `veins/v3b/referee-v3b4-seatB-reply.md` | e020d4f4d9a372d725daa1c4b68ee3a29060c92b2615a2217580cdadd5bee004 | 65eb1b2993e93543d70d3f167be9b7471dc48635782dc1020f5a84351b3bfd0d | 1 |
| `veins/v3b/p127.gp` | cb45679e45b6a6bab05c0351d362a3f623eefb4788f7c75ce65c81995a73fb8c | 89f7c0fc993c050873c98b3fa2b8dc23c1a9d9ce707ac754a5122a30936a6d99 | 1 |
| `veins/v3b/p47.gp` | 0d1a05a3f24d8a66c50b81304a50dcaea61202480d4993c0513529c14691b64d | e0f43e3520e74ffe3517e4911f9d9ea7901cb95c24139edf2eb5544cd229fe3a | 1 |
| `veins/v3b/p7179.gp` | 1fd2d73b76748c78db5aab42551de48757a7d34d3c15908aa28d0e9f650579db | 120b62630cc76934bb75e656673adb1c8d62576653703a44b2abcdaa63b35b01 | 2 |
| `veins/v3b/post.gp` | 90ff009784da72706b10de698b1263971742986d52cc8ae3842af1eca181ff44 | 32fcdf2851e6e9cb53a00f1167fce6be4c273c571054617b16b8794dfe8042c6 | 1 |
| `veins/v3b/run1.gp` | cdb238ef6d30aec0f28c1d4bbcb0c72aa7d391f8c4b53e674d1a89356324ea28 | 797c86f8551e7f1da7974eb5a11e34758811f21a329d94c5efb864ceb95b97d2 | 1 |
| `veins/v3b/run_post.gp` | 2178862b3c0108d9ae430874f44d9eacd1519d55865be11639dcce5af9c0fd45 | e279d1eb8ab6f01afba04a6ac04cfbaf7269a4c9254808cfd01791619facfb64 | 2 |
| `veins/v3b/v3b.gp` | ed9a528c212e08c2f8006a889c00f41cf3402c8dfb30a570316b20d327d151fb | 22e9f3851d399a6f4a004b10ffb0f652e60974467ea3eb93fdcbdcd946ff8ebc | 2 |
| `veins/v3b/verify.gp` | 50a33ea96f400d2ae11156b16a6c0b019fbe8b8c20a9aee329a3a290d0ed8a20 | 3827b6ea434956d25e951bf787b3b29d034fd4856a967ac33907a7c9367bb87e | 1 |
| `veins/v3c/RESULT-V3C.md` | 83a5acfccd0c72733157a07b8900757958c8696a3685174297db40f095310cff | a0710476d8dc12fcbc32678c44f869a6a49f916da59930dfad9c91fcc3b5abe1 | 1 |
| `veins/v3c/check2.gp` | 1590b5078776d4ad0711df0883d8695f430ef42421d03033d4d6d6df71f8bb01 | da05d051fec2cd91a5540198ad06d25a299a90de6abc1093a2c0ba21d9e0a5d3 | 1 |
| `veins/v3c/conv.gp` | 7ca3df14281ab24bb44c8de3cff82dc328d3379471fe9162e2e3501a4cad0520 | 7a6c3fcce5709a6d4451f52c1982713884a6e7f357384745dec994e02093b047 | 1 |
| `veins/v3c/klf.gp` | 7d08b895a1d4fd988040196e07932d718f876175c7b4e9659ee890d2467d381e | a05fe29520205a8242b6fe22054fd617a79baca098ecf52088389c1125310c3f | 1 |
| `veins/v3c/run_klf.gp` | 3aade82273a61d17c86a6157370b19334483a77a90e3b65a949f088ae40c14d4 | fc24220cfe02b146231fcc2b6fd50d8690d497c2906d27ac8ac0ef51d7bb5ff8 | 1 |
| `vectors/v2_index/RESULT-I1.md` | 5932eca1675b3f877b59184c30176cba556ef17c7a4bf03020822f8efd8e007e | 7e982e1c8d478a17091dc77fd98a09ee9b19899f6f963097372144b806d4a595 | 2 |
| `vectors/v2_index/idx.gp` | 81f4b3a170b96fe4fda490448d50ae02326fae53da2778d948c5ebdcb4f9a0f7 | 09944a8b179b99a38947b9435c3ae713da0c89fd133767ead3bb25dfdebef41e | 1 |
| `vectors/v1_wall/RESULT-W1.md` | fe56131bc24e80e39e8f482ed5cca1e87efda0b1823fe64b17f835356c131eee | 86dd38766b23e452ba34af9a564a3eb36d351a592ac857bd0a66be5fd2751068 | 5 |
| `vectors/v1_wall/div5.gp` | d9c28dc7917b308ee9d26a83387c2f5735dc02ab93e42a2003a41bcba55ae5f4 | 5071df6890c6dee1fd39e3faa996c4178bd642c4d2c5b8c68afe5bf8c544c71f | 1 |
| `vectors/v1_wall/hm2.gp` | bf8b3e983a27a8c0d83de9addd1ebb68f0c2f7df1dea07a08d34a266dd679722 | 4c4a77888411d6f8e97f20ea65b2ca6de0cd9d92a35f3edee03de34db7e48f30 | 1 |
| `vectors/v1_wall/idon.gp` | fbebbc2f68f63100d3ac4d73ae926c8ab3c985e18e912bd1a9285cb06daa86fa | ddbca7b62a5d41c12666ab536708abb3f622db31c3951fc4f1a002175b29e2d4 | 1 |
| `vectors/v1_wall/nulldiag.gp` | 4259dee54dbe5347972d20f920bfb2b0251f04d027b13550a3f47525edf53281 | 967afaf522ff5a2d3fd2fd22424ce786e824b1ba38c92f4927121fdaf5814e58 | 1 |
| `vectors/v1_wall/posthoc.gp` | 8e847790a295186d487ce4a5a9a1c0f82cef744c9d0610abed50004319893ac2 | 77ec2fe40314679525c095a8a36caab82cf6c63ae34e3e9d10402a64fd55a5a0 | 2 |
| `vectors/v1_wall/predict.gp` | 5aca422b0f19eb0a4c9e01f146633875b9059c77fe20abf8c9c7bf4e7ef56b3e | 5bacc8d3e765d572ed46138da69ffdbc164ec6def71cdda9b06ffdf015d63d35 | 1 |
| `vectors/v1_wall/presel.gp` | 9e54a1144ba3c16de6f20d7684ec6778569241ed44b0a48c54a57bcf612ad192 | 8aef67c599504d0188675dfa6fac9380c383e7add278330cb94ede23140764af | 1 |
| `vectors/v1_wall/run_w1.gp` | 6a8efbe73e5037d1626d3e018ac82382334190544c95ee5a84892f3b5283325d | 4f29d129667a530d1a0ce6ce20c199e857e6229b5a88b5a192229e5f4c001183 | 1 |
| `vectors/v1_wall/run_w1b.gp` | 3b8074bb4d4a7c0e2a539be0a0395bc556204ffdf9d764ed9dc3fd5c706793d8 | 20068d2b103dbe8e95d5697bec088aa4b9abb7fae9ab6b97fd0f8033cb8bae5d | 1 |
| `vectors/v1_wall/v4.gp` | 42b79b986d1c60f9dcd93e724240417443c8a15eb3c05c9cf0185a715fd778e9 | 7f62b535a04a4ef1fea6fba52c51971ee7058f4785db6238d78c59df04a20576 | 1 |
| `vectors/v1_wall/wall.gp` | 1d3936ee14b0e806c1e9a19b033ffbc66baba8dd747b6b60b11892db78861f1e | 88aef18816bb9b33157a559eaff12ac737cf17f20b5ab2329fc51e02d7ec001c | 1 |
| `vectors/v3_rr/RESULT-R1.md` | 4550ea6445ec76d3da9b1f4e0b2d7f040d2fd851cacfd0abe99ce255cff440d4 | 4c24c010e9ac6c04551f3e9e3351bb70c06fc0915f5dc3d7869faded4cb302e6 | 3 |
| `vectors/v3_rr/diamond.gp` | 1f719580cd36b68f33db88f35fd3bd34d071c9856169e1b5d9e9aed30f955c29 | 53a8906143722cf2647e172b7a4ccba58e53e1f5bbc5f5071c0248548aea363f | 2 |
| `vectors/v3_rr/go_A.gp` | c499b8a442e158f110764598c8b7913c5b87d737e992a3fbe3099228aadbddff | 8178d19295324d87d99de6b104b533097cccc160571f5f078e16f5a9f3d3a7da | 3 |
| `vectors/v3_rr/go_B.gp` | 51e09fa6713faf5ff220ffc7b0259f19bbf9c4bd4a04ec7189f0224b3f1e1f8f | c45e174f463d65aabec74ae8e660998f1eb36fa1c5d8c3888ff705c51e5d8fe7 | 3 |
| `vectors/v3_rr/go_smoke.gp` | ae1f7a9122399777791aa5e708ca5c5b8466b96fc2c912848754cd91f2510c74 | 691628d4b97bbdbe896bf4f5fb28c92e8e7f9d183ff3234f34c0bcdc43f6f210 | 3 |
| `vectors/v3_rr/posthoc.gp` | 049832e9b677404e68a8e6083df933271adae79d67f5620e02fb2e1e60851a94 | 78e97837f284fa1de99462bb15cc0a03d20e4734f5495ee75e003077dbce6206 | 3 |
| `vectors/vG_level/RESULT-G1-v2.md` | 2a9de5ef1d1e1ae149cbe9c96eae3347b0613ad1cafb150d10baa78826a8ae57 | e6c0ea8608d7266ea46ddc6031572a88ff164116986a1b532f750d2ca920f013 | 3 |
| `vectors/vG_level/RESULT-G1.md` | 5923c7b8848a39b827315b8c1083517b7dca7c2e7dd8ca83be2befbf02a6141e | 509d8d6c20b00733dd59eeebd9e1b1dcf33fbe50a25f421b8a8873ca535050e7 | 8 |
| `vectors/vG_level/fix.gp` | 87980592418d15496187d026ad2b644cd4c0f2f7cb4fa4bd1f08da08722a1d71 | 3aa1a00fe697e578bd974f91fdb795f830a2a25d1d9646788cbe0cf9f1fc2e1e | 1 |
| `vectors/vG_level/g2.gp` | af100f14e52e6e11ee84b93e7940cdbfef8035f143dd9e8d158d4630e2ef66fc | ad7eb65744fc9ca7b74ac8da9d9ab3427e0435375b6d309eee33f1890d06a524 | 1 |
| `vectors/vG_level/gl.gp` | d320ce59ef6c5508e33fc5099e10848ca435e429d7f063b8f31a79b5a4230a4f | 24a4050f12872fb683d47725750215f0816cd54185ba358b7e16ac393f418bd8 | 1 |
| `vectors/vG_level/gl2.gp` | 0af6e75cc40c040cdaff7f15faff4727126c19837c01e62627ca285a00cf8fe7 | e569bf20c5610a25c41786f616f404b703af708260327f9f91eadd2795dcd534 | 1 |
| `vectors/vG_level/pchk.gp` | 05c1a3bb680210bb422f9ea4a89d92464005c0f81fda6f205d4757e01c55fc4d | 48decc264ec1d4e884fa959aa7b8dac5152d320ffbab6c04d4211d52bc468ddd | 2 |
| `vectors/vG_level/pd.gp` | 75fbc7d87d73360dbc592f5b8057bc8f914852f8e719e77e101b14b36e02c1a8 | de7c6f3bd981d747669c40b28d36972198f82424617c77bc3471c197c0b3e01f | 1 |
| `vectors/vG_level/post.gp` | 7338299c5de07707794fd35ba4160109511c1c0806d342bdfe3d4d78a5f53f7f | 2f0d92a953553074df7389e2239f8b3b61c5aacb473d266c5340ec01949045ad | 1 |
| `vectors/vG_level/post2.gp` | 399d313907ad6367880dfe02dfcdd2f37ec48bdd3c07587628a5ac73b89fc9d7 | 2980595ef1fe86f78d4669bab2c0a8cb2ed4de6fcd43c8e3d8cd2ee8c76db205 | 1 |
| `vectors/vG_level/predict.gp` | 0dcde77eaf6a5652c86580a5ff2b6f946e061133695854577a052d91001917a5 | 08c244f72b49fb47f12578ece638f31e0d3679294387e0c4816d436a70eb8a27 | 2 |
| `vectors/vG_level/presel.gp` | 745d2f9dd40d63bd2039463bbda45c0538a3ecb761a7071303ba03b5888722f5 | 4f8fdf518ab7e6cecad4a664104264f6bc66a403f4b048f27b9cdb7796102ed7 | 1 |
| `vectors/vG_level/run_g1.gp` | e881f63ecaa8c712df548be8247562f05834ea74fa24bbdc7acf078f4c4e0306 | c1119e6787b5893ad88dced1e5e4d9e998a5f52e2131af39155b90426a0850a5 | 2 |
| `vectors/vG_level/run_g1b.gp` | 4cc9dda93567aa19291a37e34b7c4b10d304773eb75c3e6750a4e390deeb81ae | 69695e380d4de6fc15019086ffd4229e14832c6fa76206f21c599eac2c24aa2f | 2 |
| `vectors/v6_shape/PRIOR-ART-S1.md` | 717ee47b3121f339d8cbf7fd2f05880fdf5da22ddeafab5a707c3ca07aac11b9 | 2525d1349ba667061e759c09762c3f0cadfa7666c3ac4bcadd8dc9bfb6128a96 | 1 |
| `vectors/v6_shape/REFEREE-S1.md` | 6d0b1c4b4418effef731349139df9eb32b4e257eaaaf8cba222ad0fbb19bbc79 | 0407a368b229e1c170bf24c87db9fdf96c73949eabcb05b700702a19b183214c | 2 |
| `vectors/v6_shape/diag_927.gp` | d903e5bb0be1d9091afc6793743d09c6ad0efe8c28930deaefe5aa20aabef831 | 7b4083b35b46188edc407b4ec0ae57ec1d5b1f7601e70551aec4dd6696f1fdf7 | 4 |
| `vectors/v6_shape/repair.gp` | 26f28b7241b4dd4831a1c47c8dba45cbd04a46c824293f53788f6ee5e5345fc7 | db8d79222eb56b768889ec940e80d6a9434d9961424e91c343461ec05df285a2 | 2 |
| `vectors/v6_shape/runA.gp` | 855f3de39112dbd36a508b4f570223db27a10a1622b1e0b785b71fa6779ed7f7 | aa3ee8922d0583b05c1879f1099f02ab561c8ef286839d1622caac4f3f1347e2 | 1 |
| `vectors/v6_shape/runC.gp` | ad68e8724e820828df075573189d9ef8287a09d2e1bd4d0a2cd0b658579c014a | 96b2822c45aa674fcd98677e2b5f8f3417d929a9c5590f55ed34bed0618bfd34 | 1 |
| `vectors/v6_shape/runC2.gp` | eb67d8f94b76d02225492279f0614d377476febb15a36caad7df6c6b3c026e91 | 61356c43268cbb335c27173e19fed5c95dd87376f5e47535d03093e0706cb47f | 1 |
| `vectors/v6_shape/runC3.gp` | ebc9069ce0ad409417828dc45aaea802086dcc3ece012e93fc995d10621aedda | 1d3b6923066e34224eada696b29ab1d7324f91f63f9b373f4c61e1d8bed7d9db | 1 |
| `vectors/v6_shape/runC4.gp` | 378d66376892208e1e4c6e8fc578d91d747c2a452591acf0654360580484099c | 623b624df8998fc344168896565ecd00e02ead42dfbd0baf58b17b96e5e52071 | 1 |
| `vectors/v6_shape/runC5.gp` | 817818de90a712ad92a2a35b9e45fed236393673e725c61d0b3774da39b8c4bf | a7112b164cbe1cc12a4454de57b01a8dca5939ad271b48a39c00cf4f87545c48 | 1 |
| `vectors/v6_shape/s0.gp` | 884c5ee5cee02ddab1c83b0e305c4d812d59f8d8b66f6791aee5323fbf490283 | 5ee10765a647cf60a0a7e3d6d9508f992d8c653ebc33329cb4a4772e33393eab | 2 |
| `vectors/v6_shape/sA.gp` | 5046d44ac96a85acdadfd7a2f2149bc1b82af3a36fed11b10516bfb2a92e51fe | a89b113b3cf083a916c688c944d39f8df9043deb8727f89e23e8e4e2ad5a15e3 | 2 |
| `vectors/v6_shape/sB.gp` | 910c3d0103545fde3d5a9fc0905acebd0af765d83ff9375872d30df50140f07c | 7816fb1a1ed7c221446ec36fce82083f93aca33149546b485622e04da2062818 | 2 |
| `vectors/v6_shape/sC.gp` | acab142eb9cf82e5950bbe01082e86e7809c746d12a1e2f9c51209794808c663 | dc92c98bccd77d5dc8a37b2c0d2968a46a62c6c64a1bb325e48ac61c3a4ca231 | 1 |
| `vectors/v4_factor/f1.gp` | a4960a9a555dd4c8fd8a0cc7fe3c0a2548222d510acc8201744a4e45f4b718c2 | 532f5fdc21ea0a85748ffad8e4f5bb124d35c8c4409fdfe9372d5167f1e45d69 | 2 |
| `vectors/v4_factor/h3.gp` | 189d296d3dd17a7b48cff0508921ffed816bce2632d345ba48cc65e728d4fb7d | 493fb04d991a53798c345e8ca4fa84443b7dd3530ded6594a83b1e9a9757cd65 | 1 |
| `vectors/v4_factor/posthoc.gp` | 000c72f1a929f0a55b5cc1c32733f917d5ccd2a62a811087b6250bfff8ed4cab | 2421c57f45a6801fdfc7663be123e01d84a7de7e81d97cb1e719599283344d2f | 1 |
| `vectors/v4_factor/rerun.gp` | 09122be2b866b939a1344fa4e52d2f48b118a533b81ccb11130adfce793e10c9 | 43caace14294308ca0eab0e425dcce0ae236ca8ce63133a38a45cf3bbeadc91b | 1 |
| `vectors/v4_factor/rerun2.gp` | 2dbbfe5c7a6b4c0bceb8cf7cad6467944c9ba9dba96603ffe310bb7148d2f531 | e4091111ed38c509b81ed515d735159b2704cb485f71f493d9c4951c230ae987 | 1 |
| `vectors/v4_factor/test.gp` | 4bf7b6a68410a59255aec08cbfafe69457527dbfa87744e373b5a895c9088e05 | ca95035afe35727de49cad53e243fed7db8bc31c9fd503e5d9b8ce363c9c027d | 1 |
| `vectors/v4_factor/train.gp` | 63266a7648b8caad36616907d54fe9010b6a0bc5b793518baf6490824d8f89ef | 134ad55b6769b1dbf60b71f9548a150e2338b9935b0e4fc92af95d1587047907 | 1 |
| `vectors/v4_factor/train2.gp` | f3d465479cb3d5c9c892933052b95ea1378b04315dfbf13875fd20f93c5b0283 | bf37e81b3d8a9eec542d2a8a5ac23d37030e856b417ae7c80b3fbf1c6c33d54d | 1 |
| `vectors/v5_method/RESULT-M1-v2.md` | da2b046d8d74e2c50575a6953f6a244914d9efe9c0651640d4a715291740be35 | 985ba932efc6515ec3e15f43fa72cff6684f1ed847fb12165c8356d6f25254e4 | 4 |
| `vectors/v5_method/RESULT-M1.md` | 043a6bc894dba02c03dac579dc3c576ee195e6db2a1c99c7abfd677b8d9b7349 | 75fe014155850084805863927c966d9c9f9946870e24ab2148837f6eee0db44d | 2 |
| `vectors/v5_method/certmin.py` | 3473634e84b2a9de21548a1dfdeac812b90da4185cf6a211b309f706331fd389 | e13c0223a4fc3ea3ed9ddc56c8ddbeabdb61a40ef8966b390e87086fc1a81fa1 | 1 |
| `vectors/v5_method/ext_run_console_13_to_83_crash.txt` | 2b4a6085a5656d6f6453dabc8aa7a123924e9a1d850f37ffe1a9045ed9fe1588 | 67ed6d58dcfdb48c3a800454cd4f5fcfc09d7ad1e73d8821dbacf0a89a7fdce0 | 3 |
| `vectors/v9_even/AUDIT-USE-U.md` | ef8621c165c752f2ad0a7abd82440a52c6dbffcdce6fec0ad4b31904b7532526 | 2b3821428421f22434789fa6c4d5912355c9df97107970d2d462b7df6901b722 | 3 |
| `vectors/v9_even/INSTRUMENT-U1.md` | a9b881f6247913d254d368264ecd4217165d706301189693eecdac52bf57f63e | 452810b8d8eced7021e4a897ac9d47332037497939d452fcbcdbd2bc23e2ca03 | 1 |
| `vectors/v9_even/PLAN-U.md` | 05e4915d73b0678ac246b2c1fa356c3e04c9bea1c6f3bfb0166afc96f6ba100a | b26a1d78532630c85fb3b5214502ddacc03cd2be50fdf021377c2b31b7c21336 | 1 |
| `vectors/v9_even/PRIOR-ART-U2.md` | 9ca9db29060ccb76977046494cd5f1b0c2e235977d54a49ef905a268be92f905 | b13a35c8f9b00d2d5870a0f95bd34e3ca22e410910563d3da56d9eb10f74b556 | 1 |
| `vectors/v9_even/PROOF-U1.md` | afccb2b8af8c9295e0e8c29ffc38a367dbba4cf77cc190006cfec4e5b8505aa0 | 99992d9663f130948fec60652e4991ed8421bfd5dd06a56a3b200fd7904ef4d0 | 2 |
| `vectors/v9_even/RESULT-U1.md` | 178a6777a25229c175fdd555da5a1e816c517cf5eee8e496d3341d6dc95eac83 | 8da91bda1c3589475dd7b967337d5c0ffbddb7978534110bbe50d0436f86b57a | 3 |
| `vectors/v9_even/diag_n1.gp` | 2588745c703fee8fb2f198af16421d7f8198d6d920a66e4e7ac3e4e5449384fb | ff9d3e18ea9bb6b543457212ad501a89ff491f1336ce49294f15816547587d40 | 1 |
| `vectors/v9_even/explore_even.gp` | 3ce7744cc7ba472c0e8018e88048102d167bdd649e1c5a0e1d01cec8e53b54f4 | 1e6363fc45d322eea7eee197ddb206a89c0ca6d65b167c7df88c376542bc4d61 | 1 |
| `vectors/v9_even/proof_u1.gp` | 031d5e8c6214f9e9a77808d1dde4106e2a8f1cf75d26f7cdb775fc9b0d6d9be7 | 89342a38f9068d4d2ab8c92489630b3bf35149cc10c0aa7662330e8e07f5e789 | 1 |
| `vectors/v9_even/ratfix_check.gp` | f4edb979137750fdd991223a9d89b0ebfa04c403d6ccfdf51cdc7b84235b620d | 162d2fdcdb6815bfc3f5069b1605a99f8af1a5d61d766f1bb57651a5288e3800 | 2 |
| `vectors/v9_even/run_u1.gp` | ffe49d6102cab2500c49f0774acad1e5eb70ea11c5195f51cf9fd9d1fd615713 | 2ae8f1d9778a398df108e1c07f52194dbd5018b0bd612637c9c52db0f2407e74 | 1 |
| `vectors/v9_even/smoke_u1.gp` | 511e6a5d2c52ef32c249c7fb54f585e641af7fe8d7e1e97a45e77f93974c9453 | 7828c8a10787c0b8f53c26d8d41620ab4b94ffe8be3d440318d01ee0fb0853b4 | 1 |
| `vectors/v9_even/u1.gp` | 5e67fe27099ef854e902ef35abe9fdc8a4f2c93c2a02e5a1e8077cdef662f81d | 25383bd2e7df8f4265dda0bbbf6ffbb5ce89fe7c9591cc601b75a77af8ad3287 | 2 |
| `vectors/v8_stark/AUDIT-USE.md` | e6fc7add89482b07e1d91012dbba38e2872c43c074038dfc5ef7e9ee2298484c | 8a479be4fec0e9a32643e782683d8ac163c30f9600df6c4c9f1640fe1001daed | 3 |
| `vectors/v8_stark/DICTIONARY-SKELETON.md` | 673d6d1d3838db42b841615f3e6d9374fa1c5fa84e9bb7751d0b5f738f2483b1 | 4a030bd1a0024d1860054683db3c907022c4933ee31e3f03bde83e749c49002c | 3 |
| `vectors/v8_stark/PRIOR-ART-K4-Stark1980.md` | 9555a07f48ff376b416770deedb379658de39844796965a953fe972bb55fa618 | f0334103f286a56a3b6e8769fe1136a04a8b5ca8a25944bdd8fa415d04e4b55d | 1 |
| `vectors/v8_stark/REFEREE-K1.md` | 188711502ff56cc7c4c48e46d6af86c98b9933627579df72fb713add78387a66 | 87946ab08d64d6bb3d431471c51612eb263b5aea95a903ffb6e3ad1c85d47e27 | 3 |
| `vectors/v8_stark/REFEREE-K2.md` | 367f212e3c3e311fe197e24ed38d08b4cfd3cc92dfc2f086e9ce908efcadf7c0 | a3231da6e3dd543f3387160f12081726ed53a4282e998b96a2875c10a2f78cb0 | 1 |
| `vectors/v8_stark/probe2_out.txt` | accc26b86c87ce0c29e3989fb14df30da1d161f5874ec8fe39a36fffe5997cc4 | ba6f9381e7d11c3a97dd5f78dc5f8c8cabcba3440ca2de893c2a0da0d16a3f35 | 1 |
| `veins/v1_law/go_f1.gp` | 616039c8b541bea6cbd7aecd264af624a1e702d528c0c441b32ba6d4386fdb09 | 5e8d403d294a2287020bdef91a6f1e047df9ec3bec4e61badeb97d833a4bcbaf | 2 |
| `veins/v1_law/go_f2.gp` | 8189c469dd456212e65b51a95d9555ef0c613528b97983bf924d1de1e7583e8a | d46582d7137619d469409c6721ac1e832971a92580713f7cbd9d8a8877634f3e | 2 |
| `veins/v1_law/go_f3.gp` | 89d6c32b6e5c7e0870554feb58de62ea946adab36ee2e99b057b8e7d463c7899 | cb8401bceb2e8ca674bbaa83cd08d7bf3779218fbde8c7b72b9466782fccc70a | 2 |
| `veins/v1_law/go_polys.gp` | 67fe7cfe93647444282132612561de206607ef88f26a0f3db20cfd892c10c2a8 | 8a28d049cd7cb9441408a76f178687ab386209ebe63dcc6a6b30f750ffe40ffc | 2 |
| `veins/v1_law/posthoc.gp` | 190ecee5f5e440d7b31f4853f5abdb88df18ffad296375f17f7b481c3924f7cd | 672368e3f8335a52ddf8ad906af05ec87897e9dcbb3a617ebb02518d87031737 | 1 |
| `veins/v1_law/presel.gp` | 979bc8402ef1f33e523d182adf34fdff67ab6f8c997e8b4a7d8018a173090679 | 17690ece3ebae032d51afe8610d5a9f2c886a9b0a113db0dd06378c4350b3b06 | 1 |
| `vectors/v5_method/m2/certmin_out_53_47_61_67_ctrl.txt` | 7f47ec796c8ad70d5e4700be58d38462ab3840389e30c4e47fd50d959b6fbb8b | 836c8ec5cca84450e7ba57605cf7ac0952966786635eb88e9b75cc7de33ef3c6 | 1 |
| `vectors/v5_method/m2/run_m2.py` | e5845cee4c301f239c376c7a92e2b53a049dc3ec0dfba67f7700a40d5e4ced2a | 293e6b0709931495674ef01a3386da91fdc4b1b7029cd7891df3023b6de0eacb | 1 |
| `vectors/v5_method/m2/logs/run_console.txt` | b6d4ddcdd44226e403b5d28f0f80e740fdc7b5a61d82db523c1edfba46509c71 | ab1b37e090935018b985adc29e119e843c845fa71d68485da6e6d06ebb6fda33 | 1 |

## Every substitution (file, line, rule, old -> new)
Line numbers are those of the original file (no rule adds or removes lines).

| bundle path | line | rule | old | new |
|---|---|---|---|---|
| `seatB/SPEC-B.md` | 4 | P8 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | `the project folder` |
| `seatB/step1_control.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `seatB/step2_find.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `seatB/step2_find.py` | 60 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `seatB/step3_rebuild.py` | 3 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `seatB/step3_rebuild.py` | 9 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `seatB/step4_exact.py` | 6 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/SPEC-B13.md` | 4 | P8 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/` | `the project folder` |
| `p13/seatB13/step1_control7.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step2_compute13.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step2_compute13.py` | 17 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step3_pslq.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step3_pslq.py` | 4 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step4_checks.py` | 2 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `p13/seatB13/step4_checks.py` | 7 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/AMENDMENT-SWEEP2-4.md` | 4 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `sweep/laneA.sh` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/laneB.sh` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/rung.sh` | 3 | P1 | `export MAMBA_ROOT_PREFIX=$HOME/mamba` | `# (environment line removed for release: gp must be on PATH)` |
| `sweep/rung.sh` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/rung.sh` | 6 | P4 | `$HOME/mamba/envs/pari/bin/gp` | `gp` |
| `sweep/runp.sh` | 3 | P1 | `export MAMBA_ROOT_PREFIX=$HOME/mamba` | `# (environment line removed for release: gp must be on PATH)` |
| `sweep/runp.sh` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/runp.sh` | 6 | P3 | `$HOME/bin/micromamba run -n pari gp` | `gp` |
| `sweep/runp2.sh` | 3 | P1 | `export MAMBA_ROOT_PREFIX=$HOME/mamba` | `# (environment line removed for release: gp must be on PATH)` |
| `sweep/runp2.sh` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `sweep/runp2.sh` | 6 | P3 | `$HOME/bin/micromamba run -n pari gp` | `gp` |
| `sweep/seatB/SPEC-SWEEP-B.md` | 4 | P8 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/` | `the project folder` |
| `sweep/seatB/SPEC-SWEEP-B.md` | 24 | P2 | `export MAMBA_ROOT_PREFIX=$HOME/mamba; ` | (empty) |
| `sweep/seatB/SPEC-SWEEP-B.md` | 24 | P3 | `$HOME/bin/micromamba run -n pari gp` | `gp` |
| `sweep/seatB/SPEC-SWEEP-B.md` | 24 | P6 | `<dir under /mnt/d/...>` | `<dir under the project folder>` |
| `veins/v4_fast/ctrl79.gp` | 8 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/f4pp.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/fastmin.gp` | 8 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/probe.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/probe.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/run79.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/run79.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/run_89_97.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/run_89_97.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/runrest.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v4_fast/runrest.gp` | 6 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `proof/proof-C1-C3-v4.md` | 2 | F8 | `<b>-referee3-reply` | `referee-3-seatB-reply` |
| `proof/proof-C1-C3-v4.md` | 2 | N2 | `<B>` | `reviewer B` |
| `proof/proof-C1-C3-v4.md` | 3 | F5 | `proof/<a>/` | `proof/checks/` |
| `proof/proof-C1-C3-v4.md` | 312 | F5 | `proof/<a>/` | `proof/checks/` |
| `proof/proof-C1-C3-v4.md` | 337 | N2 | `<B>` | `reviewer B` |
| `proof/checks/a_siegel.gp` | 1 | N1 | `<a>` | `reviewer A` |
| `proof/checks/c_mapcheck.py` | 3 | F5 | `proof/<a>/` | `proof/checks/` |
| `proof/checks/f_v2checks.gp` | 1 | F3 | `<a>-proof-v2.md` | `proof-C1-C3-v2.md` |
| `proof/lead/siegel_check.gp` | 1 | N2 | `<B>` | `reviewer B` |
| `proof/referee-seatA-round1.md` | 1 | F4 | `<a>-proof.md` | `proof-C1-C3-v1.md` |
| `proof/referee-seatA-round1.md` | 1 | N3 | `referee seat` | `independent AI reviewer` |
| `proof/referee-seatA-round1.md` | 2 | P13 | `session [s]cratchpad` | `private working folder, not shipped` |
| `proof/referee-seatA-round1.md` | 2 | F10 | `<b>-*` | `referee-*-seatB-reply.md` |
| `proof/referee-seatA-round1.md` | 3 | P12 | `[C]:/Users/<p>/[A]ppData/Local/Temp/<a>/D--/adc9f0a1-5182-48a2-b359-6728d8777380/[s]cratchpad/` | (empty) |
| `proof/v5/proof-C3c-C4-v5.1.md` | 2 | F8 | `<b>-referee5-reply` | `referee-5-seatB-reply` |
| `proof/v5/proof-C3c-C4-v5.1.md` | 362 | N3 | `referee seat` | `independent AI reviewer` |
| `proof/v5/proof-C3c-C4-v5.1.md` | 371 | N3 | `referee seat` | `independent AI reviewer` |
| `proof/cert/CERT-C4-STRONG.md` | 3 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `proof/cert/CERT-C4-STRONG.md` | 3 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `proof/cert/CERT-C4-STRONG.md` | 199 | P4 | `$HOME/mamba/envs/pari/bin/gp` | `gp` |
| `vectors/v5_method/stepd/expc1.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v5_method/stepd/expc1.gp` | 12 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v5_method/stepd/stepd.py` | 6 | P5 | `sys.path.append(r'[C]:\Users\<p>\[A]ppData\Roaming\Python\Python311\site-packages')` | `# (machine-specific sys.path line removed for release; install python-flint normally)` |
| `veins/v23/C5-proof-v2.md` | 2 | F8 | `<b>-referee-c5-reply` | `referee-c5-seatB-reply` |
| `veins/v23/C5-proof-v2.md` | 42 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v23/C5-proof-v2.md` | 45 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `veins/v23/C5-proof-v2.md` | 45 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v23/C5-proof-v3.md` | 2 | F8 | `<b>-referee-c5r2-reply` | `referee-c5r2-seatB-reply` |
| `veins/v23/RESULT-V23.md` | 163 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `veins/v23/RESULT-V23.md` | 219 | F9 | `<b>-gate-reply` | `external-gate-reply` |
| `veins/v23/RESULT-V23.md` | 230 | I1 | `<P>'s` | `the coordinating author's` |
| `veins/v23/c5_checks.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/dbg2.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/dbg31.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/run_v3a.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/run_v3b.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/run_v3c.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/run_v3c_defs.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/v2.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/v2.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/v2b.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/v3.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v23/v3.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/BAR-V3B.md` | 1 | H2 | ` 00:3[x]` | (empty) |
| `veins/v3b/RESULT-V3B.md` | 35 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/RESULT-V3B.md` | 84 | F8 | `<b>-referee-v3b-reply` | `referee-v3b-seatB-reply` |
| `veins/v3b/RESULT-V3B.md` | 86 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/RESULT-V3B.md` | 132 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `veins/v3b/RESULT-V3B.md` | 145 | F8 | `<b>-referee-v3b2-reply` | `referee-v3b2-seatB-reply` |
| `veins/v3b/RESULT-V3B.md` | 162 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/RESULT-V3B.md` | 225 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/cert23.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/referee-v3b-seatB-reply.md` | 14 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/referee-v3b3-seatB-reply.md` | 5 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/referee-v3b4-seatB-reply.md` | 9 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `veins/v3b/p127.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/p47.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/p7179.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/p7179.gp` | 27 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/post.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/run1.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/run_post.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/run_post.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/v3b.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/v3b.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3b/verify.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3c/RESULT-V3C.md` | 278 | N3 | `referee seat` | `independent AI reviewer` |
| `veins/v3c/check2.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3c/conv.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3c/klf.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v3c/run_klf.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v2_index/RESULT-I1.md` | 6 | F8 | `<b>-referee-i1-reply` | `referee-i1-seatB-reply` |
| `vectors/v2_index/RESULT-I1.md` | 180 | N3 | `Referee seat` | `Independent AI reviewer` |
| `vectors/v2_index/idx.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/RESULT-W1.md` | 183 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v1_wall/RESULT-W1.md` | 187 | F8 | `<b>-referee-w1-reply` | `referee-w1-seatB-reply` |
| `vectors/v1_wall/RESULT-W1.md` | 219 | F8 | `<b>-referee-w1b-reply` | `referee-w1b-seatB-reply` |
| `vectors/v1_wall/RESULT-W1.md` | 248 | F8 | `<b>-referee-w1c-reply` | `referee-w1c-seatB-reply` |
| `vectors/v1_wall/RESULT-W1.md` | 429 | F8 | `<b>-referee-w1d-reply` | `referee-w1d-seatB-reply` |
| `vectors/v1_wall/div5.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/hm2.gp` | 6 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/idon.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/nulldiag.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/posthoc.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/posthoc.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/predict.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/presel.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/run_w1.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/run_w1b.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/v4.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v1_wall/wall.gp` | 12 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/RESULT-R1.md` | 5 | F8 | `<b>-referee-r1-reply` | `referee-r1-seatB-reply` |
| `vectors/v3_rr/RESULT-R1.md` | 87 | F8 | `<b>-referee-r1-reply` | `referee-r1-seatB-reply` |
| `vectors/v3_rr/RESULT-R1.md` | 182 | N3 | `Referee seat` | `Independent AI reviewer` |
| `vectors/v3_rr/diamond.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/diamond.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_A.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_A.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_A.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_B.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_B.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_B.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_smoke.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_smoke.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/go_smoke.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/posthoc.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/posthoc.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v3_rr/posthoc.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/RESULT-G1-v2.md` | 37 | F8 | `<b>-referee-g1-reply` | `referee-g1-seatB-reply` |
| `vectors/vG_level/RESULT-G1-v2.md` | 303 | F9 | `<b>-gate-c6c8-reply` | `external-gate-c6c8-reply` |
| `vectors/vG_level/RESULT-G1-v2.md` | 319 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/vG_level/RESULT-G1.md` | 2 | H2 | ` 22:3[x]` | (empty) |
| `vectors/vG_level/RESULT-G1.md` | 2 | H2 | ` 22:0[x]` | (empty) |
| `vectors/vG_level/RESULT-G1.md` | 41 | F8 | `<b>-referee-g1-reply` | `referee-g1-seatB-reply` |
| `vectors/vG_level/RESULT-G1.md` | 46 | F8 | `<b>-referee-g2-reply` | `referee-g2-seatB-reply` |
| `vectors/vG_level/RESULT-G1.md` | 47 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/vG_level/RESULT-G1.md` | 341 | H1 | ` (16:0[x]-16:20)` | (empty) |
| `vectors/vG_level/RESULT-G1.md` | 369 | F9 | `<b>-gate-c6c8-reply` | `external-gate-c6c8-reply` |
| `vectors/vG_level/RESULT-G1.md` | 385 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/vG_level/fix.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/g2.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/gl.gp` | 8 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/gl2.gp` | 8 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/pchk.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/pchk.gp` | 36 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/pd.gp` | 6 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/post.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/post2.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/predict.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/predict.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/presel.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/run_g1.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/run_g1.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/run_g1b.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/vG_level/run_g1b.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/PRIOR-ART-S1.md` | 67 | F9 | `<b>-gate-c6c8-reply` | `external-gate-c6c8-reply` |
| `vectors/v6_shape/REFEREE-S1.md` | 2 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v6_shape/REFEREE-S1.md` | 3 | P13 | `session [s]cratchpad` | `private working folder, not shipped` |
| `vectors/v6_shape/diag_927.gp` | 1 | H3 | ` at ~21:4[0]` | (empty) |
| `vectors/v6_shape/diag_927.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/diag_927.gp` | 16 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/diag_927.gp` | 17 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/repair.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/repair.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runA.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runC.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runC2.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runC3.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runC4.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/runC5.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/s0.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/s0.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/sA.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/sA.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/sB.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/sB.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v6_shape/sC.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/f1.gp` | 6 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/f1.gp` | 7 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/h3.gp` | 3 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/posthoc.gp` | 7 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/rerun.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/rerun2.gp` | 7 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/test.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/train.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v4_factor/train2.gp` | 4 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v5_method/RESULT-M1-v2.md` | 2 | F8 | `<b>-referee-m1-reply` | `referee-m1-seatB-reply` |
| `vectors/v5_method/RESULT-M1-v2.md` | 13 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `vectors/v5_method/RESULT-M1-v2.md` | 14 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `vectors/v5_method/RESULT-M1-v2.md` | 197 | H2 | ` 22:5[x]` | (empty) |
| `vectors/v5_method/RESULT-M1.md` | 2 | F2 | `<a>-proof-v4.md` | `proof-C1-C3-v4.md` |
| `vectors/v5_method/RESULT-M1.md` | 3 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `vectors/v5_method/certmin.py` | 13 | P5 | `sys.path.append(r'[C]:\Users\<p>\[A]ppData\Roaming\Python\Python311\site-packages')` | `# (machine-specific sys.path line removed for release; install python-flint normally)` |
| `vectors/v5_method/ext_run_console_13_to_83_crash.txt` | 214 | P11 | `[D]:\_LIVE\NEXT-2026-10-27\ramanujan\deg11\` | (empty) |
| `vectors/v5_method/ext_run_console_13_to_83_crash.txt` | 216 | P11 | `[D]:\_LIVE\NEXT-2026-10-27\ramanujan\deg11\` | (empty) |
| `vectors/v5_method/ext_run_console_13_to_83_crash.txt` | 219 | P11 | `[D]:\_LIVE\NEXT-2026-10-27\ramanujan\deg11\` | (empty) |
| `vectors/v9_even/AUDIT-USE-U.md` | 2 | H2 | ` 00:0[x]` | (empty) |
| `vectors/v9_even/AUDIT-USE-U.md` | 3 | P9 | `Root for paths: [D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11.` | `Root for paths: the bundle root.` |
| `vectors/v9_even/AUDIT-USE-U.md` | 40 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `vectors/v9_even/INSTRUMENT-U1.md` | 17 | P7 | `/mnt/d/.../` | `<project folder>/` |
| `vectors/v9_even/PLAN-U.md` | 2 | H2 | ` 00:1[x]` | (empty) |
| `vectors/v9_even/PRIOR-ART-U2.md` | 25 | P14 | `[s]cratchpad` | `private working folder` |
| `vectors/v9_even/PROOF-U1.md` | 33 | F9 | `<b>-even-gate-reply` | `external-even-gate-reply` |
| `vectors/v9_even/PROOF-U1.md` | 113 | F9 | `<b>-even-gate-reply` | `external-even-gate-reply` |
| `vectors/v9_even/RESULT-U1.md` | 2 | H2 | ` 00:4[x]` | (empty) |
| `vectors/v9_even/RESULT-U1.md` | 74 | F9 | `<b>-even-gate-reply` | `external-even-gate-reply` |
| `vectors/v9_even/RESULT-U1.md` | 76 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v9_even/diag_n1.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/explore_even.gp` | 9 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/proof_u1.gp` | 90 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/ratfix_check.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/ratfix_check.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/run_u1.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/smoke_u1.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/u1.gp` | 8 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v9_even/u1.gp` | 9 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v8_stark/AUDIT-USE.md` | 24 | F1 | `<a>-proof-v5.1-C4-C3c.md` | `proof-C3c-C4-v5.1.md` |
| `vectors/v8_stark/AUDIT-USE.md` | 43 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/AUDIT-USE.md` | 50 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/DICTIONARY-SKELETON.md` | 130 | N3 | `Referee seat` | `Independent AI reviewer` |
| `vectors/v8_stark/DICTIONARY-SKELETON.md` | 131 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/DICTIONARY-SKELETON.md` | 136 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/PRIOR-ART-K4-Stark1980.md` | 3 | P10 | `[D]:/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v8_stark/REFEREE-K1.md` | 1 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/REFEREE-K1.md` | 61 | P13 | `session [s]cratchpad` | `private working folder, not shipped` |
| `vectors/v8_stark/REFEREE-K1.md` | 61 | P14 | `[s]cratchpad` | `private working folder` |
| `vectors/v8_stark/REFEREE-K2.md` | 1 | N3 | `referee seat` | `independent AI reviewer` |
| `vectors/v8_stark/probe2_out.txt` | 10 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f1.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f1.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f2.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f2.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f3.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_f3.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_polys.gp` | 1 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/go_polys.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/posthoc.gp` | 5 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `veins/v1_law/presel.gp` | 2 | P10 | `/mnt/d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/` | (empty) |
| `vectors/v5_method/m2/certmin_out_53_47_61_67_ctrl.txt` | 17 | P11 | `[D]:\_LIVE\NEXT-2026-10-27\ramanujan\deg11\` | (empty) |
| `vectors/v5_method/m2/run_m2.py` | 12 | R-PIN | `3473634e84b2a9de21548a1dfdeac812b90da4185cf6a211b309f706331fd389` | `e13c0223a4fc3ea3ed9ddc56c8ddbeabdb61a40ef8966b390e87086fc1a81fa1` |
| `vectors/v5_method/m2/logs/run_console.txt` | 19 | P11 | `[D]:\_LIVE\NEXT-2026-10-27\ramanujan\deg11\` | (empty) |
