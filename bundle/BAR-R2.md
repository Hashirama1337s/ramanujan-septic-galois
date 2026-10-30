# BAR-R2 — degree-11 pieces, corrected shape (sealed after BAR-R1 FAILED; written before any u^p search at p = 11)

## In plain words
BAR-R1 assumed each piece to the power p/2 is a simple algebraic number. That shape came from the septic case only.
The quintic theorem (Berndt-Rebak 2312.15513, Thm mainquintic (iv): u = (alpha p)^{1/5}) shows the general shape is
"piece to the power p". Our p = 5 scan found nothing with the p/2 shape, which fits. New test: is u_k^p algebraic of
moderate degree at p = 11?

## Method (fixed)
Same u_k(q) and point q = e^{-pi/sqrt p} as BAR-R1 Amendment 1. b_k = u_k^p. mpmath findpoly on b_k at 2,000 digits,
degrees 1..30, max coefficient 1e40; verify any polynomial at 3,000 digits.
## Controls (must hold, else no verdict)
- K1: p = 5, both b_k found (degree <= 30) and verified to >= 2,500 digits (quintic theory says they are algebraic).
- K2: p = 7, all three b_k found and verified to >= 2,500 digits.
## Prediction
- Q1 (p = 11): all five b_k satisfy integer polynomials of degree <= 30, coeffs <= 1e40, verified to >= 2,500 digits.
  HOLDS -> the five missing degree-11 terms are identified as explicit algebraic numbers (numerically, not proved).
  FAILED -> at this degree/height the degree-11 pieces are not low-degree algebraic in this shape.
- Prior: ~45%. Reason: X_0(11) has genus 1 (3, 5, 7, 9, 13 are genus 0), so degree-11 modular equations are not
  rationally parametrised; the pieces may be of higher degree.
## Descriptive
Same at p = 13 if time allows; degrees and discriminants found.
