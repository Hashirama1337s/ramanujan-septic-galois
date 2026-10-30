# run_m2.py -- BAR-M2 driver. Runs the SEALED certmin.py (v1.2, imported unchanged from ../certmin.py, sha256 checked
# before import) so that its outputs land in m2/ and no file in v5_method/ is touched or overwritten.
# Only two module-level names are re-pointed after import (no code of certmin.py is changed):
#   certmin.HERE  -> this folder (certG_p<p>.txt files are written here)
#   certmin.DISK / DISK2 entries -> absolute paths of the same disk files the sealed script names relative to v5_method/
# Usage: py -3.11 -I run_m2.py <p> [<p> ...] --ctrl
import sys, os, time, hashlib

sys.dont_write_bytecode = True          # do not write a .pyc into v5_method/__pycache__
M2 = os.path.dirname(os.path.abspath(__file__))
V5 = os.path.dirname(M2)
SEALED = 'e13c0223a4fc3ea3ed9ddc56c8ddbeabdb61a40ef8966b390e87086fc1a81fa1'   # certmin.py v1.2 (SEALS.txt, 2026-10-28 14:57:10)

def sha(path):
    return hashlib.sha256(open(path, 'rb').read()).hexdigest()

h = sha(os.path.join(V5, 'certmin.py'))
print('certmin.py sha256 =', h, '(sealed v1.2 match)' if h == SEALED else 'MISMATCH - ABORT', flush=True)
if h != SEALED:
    sys.exit(2)

sys.path.insert(0, V5)
import certmin
import flint
certmin.ctx.threads = 1
print('python-flint', flint.__version__, '| flint ctx.threads =', certmin.ctx.threads, '| python', sys.version.split()[0], flush=True)

certmin.HERE = M2
for q in list(certmin.DISK):
    certmin.DISK[q] = os.path.normpath(os.path.join(V5, certmin.DISK[q]))
for q in list(certmin.DISK2):
    certmin.DISK2[q] = os.path.normpath(os.path.join(V5, certmin.DISK2[q]))

args = sys.argv[1:]
ctrl = '--ctrl' in args
ps = [int(a) for a in args if not a.startswith('--')]
tag = '_'.join(str(p) for p in ps)
T0 = time.time()
for p in ps:
    r = certmin.certify(p, ctrl)
    mine = os.path.join(M2, f'certG_p{p}.txt')
    if os.path.exists(mine):
        certmin.out(f'   M2 file certG_p{p}.txt sha256 = {sha(mine)}')
    stored = os.path.join(V5, f'certG_p{p}.txt')
    if os.path.exists(stored):
        same = open(mine, 'rb').read() == open(stored, 'rb').read() if os.path.exists(mine) else False
        certmin.out(f'   POSITIVE CONTROL: stored v5_method/certG_p{p}.txt sha256 = {sha(stored)}; byte-identical to the M2 re-certification: {same}')
    certmin.out(f'   WALL p = {p}: {r["t"]:.1f} s' if r else f'   WALL p = {p}: no result (NOT CERTIFIED)')
certmin.out(f'\nTOTAL WALL {time.time() - T0:.1f} s')
with open(os.path.join(M2, f'certmin_out_{tag}{"_ctrl" if ctrl else ""}.txt'), 'w') as f:
    f.write('\n'.join(certmin.LOG) + '\n')
