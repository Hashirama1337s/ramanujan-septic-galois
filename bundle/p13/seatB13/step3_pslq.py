import sys, time, pickle, json
sys.path.insert(0, r"p13/seatB13")
from mpmath import mp, mpf, pi, cos, pslq, nstr, fabs, log10
D = r"p13/seatB13/"
WORK = int(sys.argv[1]) if len(sys.argv) > 1 else 400
mp.dps = 1750
V = pickle.load(open(D + "vals13.pkl", "rb"))
b_full = [mpf(s) for s in V["b"]]
table = {}
t0 = time.time()
for k in range(6):
    mp.dps = WORK
    bk = +b_full[k]
    basis = [cos(2 * pi * j / 52) for j in range(12)]
    rel = pslq([bk] + basis, maxcoeff=10 ** 60, maxsteps=10 ** 6)
    print("k=%d work=%d rel=%s  (%.1fs)" % (k + 1, WORK, rel, time.time() - t0), flush=True)
    if rel is None:
        continue
    d = rel[0]
    nums = [-c for c in rel[1:]]
    if d < 0:
        d, nums = -d, [-c for c in nums]
    # verify at full precision
    mp.dps = 1750
    val = sum(mpf(nums[j]) * cos(2 * pi * j / 52) for j in range(12)) / d
    err = fabs(val - b_full[k])
    dig = int(-log10(err / fabs(b_full[k]))) if err else 1750
    print("   verify at 1750 dps: digits %d ; maxcoef %d" % (dig, max(abs(c) for c in nums + [d])), flush=True)
    table[k + 1] = {"den": d, "num": nums, "digits_1750": dig}
json.dump(table, open(D + "tableB13.json", "w"), indent=1)
print("time %.1fs" % (time.time() - t0))
