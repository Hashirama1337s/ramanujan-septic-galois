# Ramanujan's septic theta identity at every odd prime: explicit analogues, a Galois rule, the abelian cases at every odd level, and Ramanujan's units

**Moki & Julio (AI-assisted) · 2026** · DOI [10.5281/zenodo.23790016](https://doi.org/10.5281/zenodo.23790016) (v1.0)

The paper is [PAPER.md](PAPER.md). The code, data, sealed predictions and checks behind it are in [bundle/](bundle/) (start with
[bundle/README.md](bundle/README.md); public status table: [bundle/STATUS.md](bundle/STATUS.md)).

## In plain words

On page 206 of his "lost notebook", Ramanujan wrote a formula that splits one of his theta functions, at a special point, into 1 plus
three further pieces, and he left the three pieces blank. Rebák filled them in in 2023. The same split exists for every odd prime p,
with 1 plus (p−1)/2 pieces. We found explicit formulas for the pieces at p = 11 and p = 13, computed them for every prime below 100, and
proved rules that govern all of them. (The pieces as functions, before one plugs in the special point, were studied for every prime by
Gallouin in 2026; our results are about the numbers one gets at the special point.)

- Each piece, raised to the p-th power, lives in one predictable number field, and one symmetry rule produces every piece from the first.
- Every piece is an algebraic integer whose only prime factors lie over 2; it is a unit exactly when p leaves remainder 7 on division by 8.
- Closed forms built from sines, like Ramanujan's at p = 7, can exist only for the primes 3, 5, 7, 13 and 37; we found them at 5, 7, 13
  and 37.
- One rule covers every odd level: the first theta piece of odd level l at the point i√m is cyclotomic exactly when m is one of Euler's
  idoneal numbers and l is a power of a single prime dividing m, plus one small accident at level 3. The same question has clean
  answers for the Rogers–Ramanujan continued fraction (only at n = 1), the Göllnitz–Gordon fraction (m = 3, 7, 15) and Ramanujan's
  cubic continued fraction (n = 2, 8).
- For p leaving remainder 7 on division by 8, a norm of the first piece is a Stark unit, and the first piece itself is an explicit
  product of classical elliptic units and a Hilbert-class-field factor.

**How far to trust this.** Most results have written proofs checked by independent AI reviewers. **No human expert has checked any of
them yet**; that reading is the real bar, and we ask for it. Proof drafts are labelled as such. Exact minimal polynomials are certified
in ball arithmetic at every prime up to 97. Nothing depends on the generalised Riemann hypothesis. Novelty statements are a search floor
(arXiv, Zenodo, journals and citing papers, October 2026), not a clearance.

## Reproduce

See [bundle/README.md](bundle/README.md) for the exact commands and software versions, and [bundle/CLEANROOM.md](bundle/CLEANROOM.md)
for a clean-room rebuild record. Sealed predictions and their hashes are in the bundle; [bundle/REDACTIONS.md](bundle/REDACTIONS.md)
lists every file whose copy was redacted for release (names and machine paths only) with its hashes before and after.

## Licence and citation

Text and figures: CC BY 4.0 ([LICENSE](LICENSE)). Code (all .gp, .py and .sh files): MIT ([LICENSE-CODE](LICENSE-CODE)).
Please cite via [CITATION.cff](CITATION.cff).
