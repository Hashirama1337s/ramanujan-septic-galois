# c_mapcheck.py -- compare every MAP line "b_j = image of b_1 under (P -> root r, a = A)" in sweep/galois_p*.txt
# with the derived rule (Theorem B): sigma_a(b_1) = b_t, t^2 = eps(a) a (mod p), b_t = b_{-t}.
# run from the sweep/ folder:  python -I ../proof/checks/c_mapcheck.py
import re, glob
def leg(a, p):
    return 1 if pow(a % p, (p - 1) // 2, p) == 1 else -1
tot = bad = 0
for f in sorted(glob.glob('galois_p*.txt')):
    p = int(re.search(r'p(\d+)', f).group(1)); n = 0
    for line in open(f):
        m = re.match(r'b_(\d+) = image of b_1 under \(P -> root \d+, a = (\d+)\)', line)
        if not m: continue
        j, a = int(m.group(1)), int(m.group(2))
        eps = leg(a, p) if p % 4 == 3 else (-1) ** ((a - 1) // 2)
        target = (eps * a) % p
        ok = any(min(t, p - t) == j for t in range(1, p) if (t * t - target) % p == 0)
        tot += 1; n += 1
        if not ok: bad += 1; print('MISMATCH', f, line.strip())
    print(f, 'lines', n)
print('total', tot, 'mismatches', bad)
