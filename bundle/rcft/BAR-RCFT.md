# BAR-RCFT — one-hour physics test of the RCFT bridge. Sealed 2026-10-27 before any computation.

## In plain words
In rational conformal field theory each model has "characters" (functions of a modular parameter tau) and a Galois
symmetry of its modular data (Coste-Gannon; Harvey-Hu-Wu arXiv:1912.11955 eq.(33): rho(T)^{l^2}_{aa} = rho(T)_{pi_l(a),pi_l(a)}).
Our theta pieces u_k are, up to normalisation, characters of the abelian U(1)-type theory attached to p. We test (1) whether
that Galois symmetry is exactly our observed rule, (2) whether the same mechanism works for a NON-abelian theory, SU(2)
at level 3, evaluated at a CM point, and (3) whether our numbers at 7, 13, 37 are products of quantum dimensions.

## Tests
- R1 (abelian, exact derivation + numeric check): for T-eigenvalues e^{pi i k^2/p} of the pieces, the Galois element
  zeta_{2p} -> zeta_{2p}^l maps piece k to the piece k' with k'^2 = l k^2 (mod p) (up to sign). Prediction: this
  reproduces our sigma_a(b_1) = b_k, k^2 = +-a rule for every a in galois_p31.txt and galois_p29.txt MAP lines. FAILED if
  any MAP entry disagrees.
- R2 (non-abelian, the real test): SU(2)_3 characters chi_j(tau) proportional to sum_n (10n+j+1) q^{(10n+j+1)^2/20},
  j = 0..3, at the CM point tau0 = i (h(-4) = 1). Prediction (a): each ratio r_j = chi_j(tau0)/chi_0(tau0) is algebraic of
  degree <= 16 (PARI algdep at 1,500 digits, verified at 2,000). Prediction (b): at least one root (other than r_j itself)
  of the minimal polynomial of r_1 equals +-chi_a(tau0)/chi_b(tau0) for some a != b to >= 1,800 digits (Galois conjugates
  are again character ratios: the RCFT form of our rule). Negative control: at a non-CM point tau = 1.2345 i, r_1 has no
  algebraic relation of degree <= 16 (coefficients <= 1e40). Positive control: R1.
- R3 (expected tautology, reported as such): at p = 7 (b_k units in Q(cos 2pi/7), class number 1), each b_k is +- a
  product of SU(2)_5 quantum dimensions d_j = sin((j+1)pi/7)/sin(pi/7). This is forced by cyclotomic-unit theory, so a
  HOLD is not evidence of new physics; a FAIL would be a red flag for our numbers.
## Priors
R1 ~90% (derivation), R2 ~60%, R3 ~95%.
