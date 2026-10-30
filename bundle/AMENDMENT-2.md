# BAR-R2 Amendment 2 (instrument fix)
mpmath findpoly/pslq default maxsteps=100 silently gave up; positive control P^11 (must be cubic) was missed at default and found with maxsteps=1e6 (degree 3, verified 2982 digits).
All earlier 'not found' results at p=11 and p=13 are void. Rerun R2 exactly as sealed with maxsteps=1e6. Bar unchanged.
