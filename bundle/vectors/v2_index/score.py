# score.py -- compares idx_out.txt (unit side) with the sealed predict_out.txt (formula side), BAR-I1.
# Replaces idx.gp's SUMMARY block, which did not parse (multi-line foreach without braces; logged in RESULT-I1.md).
import re, sys
from math import prod

here = sys.argv[1] if len(sys.argv) > 1 else "."
pred = open(f"{here}/predict_out.txt", encoding="utf8").read()
meas = open(f"{here}/idx_out.txt", encoding="utf8").read()

def facval(s):
    s = s.strip()
    m = re.fullmatch(r"Mat\(\[(\d+), (\d+)\]\)", s)
    if m:
        return int(m.group(1)) ** int(m.group(2))
    m = re.fullmatch(r"\[(.*)\]", s)
    rows = [r.split(",") for r in m.group(1).split(";")]
    return prod(int(a) ** int(b) for a, b in rows)

P = {}
for blk in re.split(r"\n(?=p = )", pred):
    m = re.match(r"p = (\d+)\s+m = (\d+)\s+f = ord\(2\) = (\d+)", blk)
    if not m:
        continue
    p, mm, f = map(int, m.groups())
    PX = int(re.search(r"PX = (\d+)", blk).group(1))
    PW = int(re.search(r"PW = PX / p\^\(r-1\) = (\d+)", blk).group(1))
    cor2 = facval(re.search(r"COR2 null value .*? = (\[[^\]]*\]|Mat\(\[[^\]]*\]\))", blk).group(1))
    AC = int(re.search(r"AC null value .*? = (\d+)", blk).group(1))
    r = int(re.search(r"r = m - m/f = (\d+)", blk).group(1))
    P[p] = dict(m=mm, f=f, r=r, PX=PX, PW=PW, COR2=cor2, AC=AC)

allok = True
for blk in re.split(r"\n(?===== p = )", meas):
    m = re.match(r"==== p = (\d+)", blk)
    if not m:
        continue
    p = int(m.group(1)); q = P[p]
    rank = int(re.search(r"P1 rank X = (\d+)", blk).group(1))
    lineX = re.search(r"P2 \[S : X\]: coordinate det = (.*?); Gram ratio sqrt = (.*?); integral coordinates: (\d); Smith form product = (.*)", blk)
    ix, ig, sn = facval(lineX.group(1)), facval(lineX.group(2)), facval(lineX.group(4))
    lineW = re.search(r"\[S : W\]: coordinate det = (.*?); Gram ratio sqrt = (.*?); integral: (\d)", blk)
    iw, iwg = facval(lineW.group(1)), facval(lineW.group(2))
    rankW = int(re.search(r"rank W = (\d+)", blk).group(1))
    p3 = "HNF equal): 1" in blk
    p5 = "sigma_{1/4} beta (sigma_2 - 1): 1" in blk
    satW = "saturation of W = S: 1" in blk
    ok = dict(
        P1=rank == q["r"], P2=(ix == ig == sn == q["PX"]), P3=p3,
        P4=(rankW == q["r"] and satW and iw == iwg == q["PW"]), P5=p5)
    if q["f"] == q["m"]:
        ok["PC"] = (rank == q["m"] - 1 and ix == q["COR2"])
    else:
        ok["N1"] = (rank < q["m"] - 1 and ix != q["COR2"] and ix != q["AC"]
                    and q["AC"] * 2 ** q["r"] == ix * q["f"] ** (q["m"] // q["f"]))
    allok &= all(ok.values())
    print(f"p = {p}: rank {rank} (pred {q['r']}), [S:X] == PX: {ix == q['PX']}, [S:W] == PW: {iw == q['PW']}, "
          + ", ".join(f"{k} {'HOLDS' if v else 'FAILED'}" for k, v in ok.items()))
print("ALL ITEMS HOLD" if allok else "SOME ITEM FAILED")
