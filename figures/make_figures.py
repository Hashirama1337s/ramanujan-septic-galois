"""Draw the README figures of ramanujan-septic-galois from the data the repository ships.

Usage:  python figures/make_figures.py <repo root>
Needs Python 3.11 and matplotlib 3.11 (standard library otherwise). Writes figures/*.svg next to this script.

Every plotted number is read from shipped files (paths relative to the repository root):
  bundle/vectors/v5_method/certG_p*.txt and bundle/vectors/v5_method/m2/certG_p*.txt
      the certified minimal polynomial G_p of b_1 = u_1^p for every prime 5 <= p <= 97 (coefficients of x^0 .., one
      integer per line). From each file the script takes:
        degree of G_p           = size of the family of "twins" of b_1 (= [F_p : Q], since Q(b_1) = F_p is certified)
        constant term c_0       -> norm of b_1 = (-1)^degree * c_0
The class number h(-4p) is degree / ((p-1)/2) (bundle/STATUS.md, C1); the script recomputes h(-4p) independently by
counting reduced binary quadratic forms and asserts that both agree.
"""
import glob
import os
import re
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.patches
from matplotlib.patches import FancyBboxPatch
from matplotlib.lines import Line2D

sys.set_int_max_str_digits(0)

# ---------------------------------------------------------------- brand style (figures/STYLE.md)
BG, BORDER, GRID, AXC, TXT, ACC = "#1c2026", "#2f353d", "#22272e", "#9aa4ae", "#e8edf2", "#39ff14"
CAT = ["#3987e5", "#d95926", "#199e70", "#c98500", "#d55181", "#0ca30c", "#9085e9", "#e66767"]
W_IN = 12.5  # 900 pt viewBox width

plt.rcParams.update({
    "svg.fonttype": "none", "svg.hashsalt": "moki-julio",
    "font.family": "sans-serif", "font.sans-serif": ["Segoe UI", "Helvetica", "Arial", "DejaVu Sans"],
    "font.size": 16, "axes.labelsize": 17, "xtick.labelsize": 15, "ytick.labelsize": 15,
    "axes.facecolor": BG, "figure.facecolor": "none", "savefig.facecolor": "none",
    "axes.edgecolor": AXC, "axes.labelcolor": TXT, "xtick.color": AXC, "ytick.color": AXC,
    "text.color": TXT, "axes.grid": True, "grid.color": GRID, "grid.linewidth": 1.0,
    "axes.spines.top": False, "axes.spines.right": False, "legend.frameon": False,
    "legend.fontsize": 14, "lines.linewidth": 2.0, "axes.axisbelow": True,
})
SUP = str.maketrans("0123456789", "⁰¹²³⁴⁵⁶⁷⁸⁹")


def new_fig(h_in):
    fig = plt.figure(figsize=(W_IN, h_in))
    fig.patches.append(FancyBboxPatch((0.004, 0.006), 0.992, 0.988, boxstyle="round,pad=0,rounding_size=0.015",
                                      transform=fig.transFigure, facecolor=BG, edgecolor=BORDER, linewidth=1.5,
                                      zorder=-10))
    return fig


def title(fig, main, sub):
    h = fig.get_figheight()
    fig.text(0.035, 1 - 0.33 / h, main, fontsize=21, fontweight="bold", color=TXT, va="top")
    fig.text(0.035, 1 - 0.78 / h, sub, fontsize=15, color=AXC, va="top")


def save(fig, out, name):
    fig.savefig(os.path.join(out, name), format="svg", metadata={"Date": None, "Creator": None})
    plt.close(fig)
    print("wrote figures/" + name)


# ---------------------------------------------------------------- data
def read_poly(path):
    with open(path, encoding="utf-8") as fh:
        return [int(l) for l in fh.read().split("\n") if l.strip() and not l.startswith("#")]


def class_number(D):
    """h(D) for a negative discriminant D: number of reduced primitive forms (a, b, c), b^2 - 4ac = D."""
    from math import gcd
    h, a = 0, 1
    while 3 * a * a <= -D:
        for b in range(-a + 1, a + 1):
            if (b * b - D) % (4 * a):
                continue
            c = (b * b - D) // (4 * a)
            if c < a or (c == a and b < 0) or gcd(gcd(a, abs(b)), c) != 1:
                continue
            h += 1
        a += 1
    return h


def load(root):
    base = os.path.join(root, "bundle", "vectors", "v5_method")
    files = glob.glob(os.path.join(base, "certG_p*.txt")) + glob.glob(os.path.join(base, "m2", "certG_p*.txt"))
    rows = {}
    for f in files:
        p = int(re.search(r"certG_p(\d+)\.txt$", f).group(1))
        c = read_poly(f)
        if p in rows:                                    # p = 53 is shipped twice: both copies must agree
            assert rows[p]["coef"] == c, p
            continue
        deg = len(c) - 1
        assert c[-1] == 1                                # monic
        norm = (-1) ** deg * c[0]
        e = abs(norm).bit_length() - 1
        assert abs(norm) == 1 << e, p                    # the norm is +-2^e (claim C3b)
        assert (2 * deg) % (p - 1) == 0
        h = 2 * deg // (p - 1)
        assert h == class_number(-4 * p), p              # independent class-number check
        assert (e == 0) == (p % 8 == 7), p               # unit iff p = 7 (mod 8) (claim C3c)
        rows[p] = dict(coef=c, deg=deg, sign=1 if norm > 0 else -1, e=e, h=h)
    for r in rows.values():
        del r["coef"]
    primes = sorted(rows)
    assert primes == [q for q in range(5, 98) if all(q % k for k in range(2, q))], primes
    return rows


# ---------------------------------------------------------------- figure 1: the unit column
def fig_units(out, rows):
    cols = [1, 3, 5, 7]
    by = {r: [p for p in sorted(rows) if p % 8 == r] for r in cols}
    nrow = max(len(v) for v in by.values())
    fig = new_fig(8.6)
    title(fig, "Each piece hides only the prime 2, and none at all when p leaves remainder 7",
          "Norm of the first piece b₁ (b₁ times all its twins) for every prime 5 ≤ p ≤ 97, from the certified equations")
    ax = fig.add_axes([0.035, 0.03, 0.93, 0.8])
    ax.set_axis_off()
    ax.set_xlim(0, 4)
    ax.set_ylim(nrow + 0.55, -0.05)
    for j, r in enumerate(cols):
        unit_col = r == 7
        ax.text(j + 0.5, 0.22, "remainder %d on division by 8" % r, ha="center", va="center", fontsize=14,
                color=ACC if unit_col else AXC, fontweight="bold" if unit_col else "normal")
        for i, p in enumerate(by[r]):
            d = rows[p]
            y = i + 0.55
            unit = d["e"] == 0
            ax.add_patch(FancyBboxPatch((j + 0.04, y), 0.92, 0.84, boxstyle="round,pad=0,rounding_size=0.06",
                                        facecolor="#203b24" if unit else "#232930",
                                        edgecolor=ACC if unit else BORDER, lw=1.5 if unit else 1.0))
            ax.text(j + 0.12, y + 0.3, "p = %d" % p, fontsize=17, fontweight="bold", va="center", color=TXT)
            if unit:
                txt = "norm %s1: a unit" % ("" if d["sign"] > 0 else "−")
            else:
                txt = "norm %s2%s" % ("" if d["sign"] > 0 else "−", str(d["e"]).translate(SUP))
            ax.text(j + 0.12, y + 0.62, txt, fontsize=14.5, va="center", color=ACC if unit else TXT)
    save(fig, out, "norms-mod8.svg")


# ---------------------------------------------------------------- figure 2: where sine forms can exist
def fig_classnumber(out, rows):
    primes = sorted(rows)
    hs = [rows[p]["h"] for p in primes]
    small = [p for p in primes if rows[p]["h"] <= 2]
    fig = new_fig(6.6)
    title(fig, "Sine closed forms like Ramanujan's can exist only where this number is 1 or 2",
          "Size of each prime's family of twins, divided by (p − 1)/2: the class number h(−4p)")
    ax = fig.add_axes([0.08, 0.14, 0.89, 0.64])
    xs = list(range(len(primes)))
    ax.bar(xs, hs, width=0.78, color=[ACC if p in small else CAT[0] for p in primes], zorder=2)
    ax.axhline(2.5, color=AXC, lw=1.5, ls=(0, (5, 4)), zorder=3)
    handles = [matplotlib.patches.Patch(color=ACC, label="1 or 2: products of sines, found at p = %s"
                                        % ", ".join(str(p) for p in small)),
               matplotlib.patches.Patch(color=CAT[0], label="3 or more: no sine closed form can exist (not abelian)"),
               Line2D([], [], color=AXC, lw=1.5, ls=(0, (5, 4)), label="the dividing line between 2 and 3")]
    ax.legend(handles=handles, loc="upper left", fontsize=14)
    ax.set_xticks(xs)
    ax.set_xticklabels([str(p) for p in primes], fontsize=13)
    ax.set_xlim(-0.6, len(primes) - 0.4)
    ax.set_ylim(0, max(hs) + 1)
    ax.yaxis.set_major_locator(matplotlib.ticker.MultipleLocator(2))
    ax.grid(axis="x", visible=False)
    ax.set_xlabel("prime p")
    ax.set_ylabel("class number h(−4p)")
    save(fig, out, "class-number-wall.svg")
    return small


def main():
    if len(sys.argv) != 2:
        sys.exit("usage: python make_figures.py <repo root>")
    root = sys.argv[1]
    here = os.path.dirname(os.path.abspath(__file__))
    out = here if os.path.basename(here) == "figures" else os.path.join(here, "figures")
    os.makedirs(out, exist_ok=True)
    rows = load(root)
    fig_units(out, rows)
    small = fig_classnumber(out, rows)
    for p in sorted(rows):
        r = rows[p]
        print("p=%d  p mod 8=%d  degree=%d  h(-4p)=%d  norm=%s2^%d" % (p, p % 8, r["deg"], r["h"],
                                                                       "+" if r["sign"] > 0 else "-", r["e"]))
    print("h(-4p) <= 2 at:", small)


if __name__ == "__main__":
    main()
