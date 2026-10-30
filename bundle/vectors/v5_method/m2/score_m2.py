# score_m2.py -- BAR-M2 verdict script. Reads the run log and prints HOLDS / FAILED per sealed item, exactly as in BAR-M2.
# Usage: py -3.11 -I score_m2.py certmin_out_53_47_61_67_ctrl.txt
import sys, os

PRED = {47: (5, 115), 61: (6, 180), 67: (3, 99)}    # (h(-4p), degree) from degree_predict.gp (PARI qfbclassno), sealed
CTRL = 53
path = os.path.join(os.path.dirname(os.path.abspath(__file__)), sys.argv[1])
text = open(path).read()
blocks = {}
for chunk in text.split('========== p = ')[1:]:
    p = int(chunk.split(':', 1)[0])
    blocks[p] = chunk

def has(p, s):
    return p in blocks and s in blocks[p]

def line_with(p, s):
    for l in blocks.get(p, '').splitlines():
        if s in l:
            return l.strip()
    return ''

res = {}
void = False
for p in [CTRL] + sorted(PRED):
    if not has(p, 'all overlap'):
        void = True
        print(f'INSTRUMENT p = {p}: Arb theta cross-check did not report all overlap -> RUN VOID')
for p, (h, d) in sorted(PRED.items()):
    wl = [l for l in blocks.get(p, '').splitlines() if l.strip().startswith('W = ')]
    p1 = bool(wl) and 'rounding certified = True, imag parts contain 0 = True' in wl[-1] and has(p, f'VERDICT p = {p}: CERTIFIED')
    p2 = has(p, 'pairwise-disjoint value balls: True') and has(p, 'irreducible (flint factor) True') and has(p, 'squarefree True')
    p3 = has(p, f'h(-4p) = {h} reduced forms') and has(p, f'degree d = {d}') and has(p, f'degree {d} (want {d})') and has(p, 'monic True')
    p3b = has(p, '-> MATCH')
    if has(p, 'NEG CONTROL conv 2: not applicable'):
        nl = 'N/A'
    else:
        nl = 'HOLDS' if (has(p, 'NEG CONTROL conv 2: certified = False') and has(p, '(control passes)')) else 'FAILED'
    res[p] = dict(P1=p1, P2=p2, P3=p3, P3b=p3b, NULL=nl)
    print(f'p = {p}: P1 {"HOLDS" if p1 else "FAILED"} | P2 {"HOLDS" if p2 else "FAILED"} | P3 {"HOLDS" if p3 else "FAILED"} '
          f'| P3b (C3 constant term) {"HOLDS" if p3b else "FAILED"} | NULL {nl}')
    print('      ', line_with(p, 'sha256(certified'), '|', line_with(p, 'M2 file certG'), '|', line_with(p, 'WALL p ='))
pc = (has(CTRL, f'VERDICT p = {CTRL}: CERTIFIED') and has(CTRL, 'identical to floating-point polynomial on disk')
      and line_with(CTRL, 'identical to floating-point polynomial on disk').endswith('True')
      and has(CTRL, 'byte-identical to the M2 re-certification: True'))
pcn = has(CTRL, 'NEG CONTROL conv 2: certified = False') and has(CTRL, '(control passes)')
print(f'POSITIVE CONTROL p = {CTRL}: {"HOLDS" if pc else "FAILED"} (null at control: {"HOLDS" if pcn else "FAILED"})')
tot = [l for l in text.splitlines() if l.startswith('TOTAL WALL')]
print('TIME (descriptive):', tot[0] if tot else 'no total line')
allok = (not void) and pc and all(r['P1'] and r['P2'] and r['P3'] and r['P3b'] and r['NULL'] != 'FAILED' for r in res.values())
print('BAR-M2 OVERALL:', 'VOID (instrument)' if void else ('HOLDS' if allok else 'FAILED (see items)'))
