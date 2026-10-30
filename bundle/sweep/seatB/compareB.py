"""Seat B: compare own RELB relations with the other seat's TABLE lines (up to overall sign)."""
import ast, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
UP = os.path.dirname(HERE)

for p in (17, 19, 23, 29, 31, 37):
    mine = {}
    with open(os.path.join(HERE, f"outB_p{p}.txt")) as fh:
        for line in fh:
            if line.startswith("RELB"):
                _, pp, k, rest = line.split(" ", 3)
                mine[int(k)] = [int(x) for x in rest.strip().rstrip("~").strip("[]").split(",")]
    other = None
    with open(os.path.join(UP, f"sweep_p{p}.txt")) as fh:
        for line in fh:
            if line.startswith("TABLE"):
                other = ast.literal_eval(line[5:].strip().replace("~", ""))
    if other is None:
        print(f"p={p}: no TABLE line in other seat file"); continue
    m = (p - 1) // 2
    print(f"p={p}: mine {len(mine)} relations, other {len(other)} relations, lengths mine {len(mine.get(1, []))} other {len(other[0])}")
    for k in range(1, m + 1):
        a = mine.get(k)
        b = other[k - 1] if k - 1 < len(other) else None
        if a is None or b is None:
            print(f"  k={k}: MISSING (mine={a is not None}, other={b is not None})"); continue
        if len(a) != len(b):
            print(f"  k={k}: LENGTH DIFFERS {len(a)} vs {len(b)}"); continue
        if a == b:
            st = "SAME"
        elif a == [-x for x in b]:
            st = "SAME (sign flipped)"
        else:
            # proportional?
            from fractions import Fraction
            i0 = next(i for i, x in enumerate(b) if x != 0)
            r = Fraction(a[i0], b[i0]) if b[i0] else None
            prop = r is not None and all(Fraction(x) == r * y for x, y in zip(a, b))
            nd = sum(1 for x, y in zip(a, b) if abs(x) != abs(y))
            st = f"DIFFERENT ({'proportional by ' + str(r) if prop else 'not proportional'}; {nd} entries differ in abs value)"
        print(f"  k={k}: {st}")
