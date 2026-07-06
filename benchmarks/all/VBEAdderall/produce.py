#!/usr/bin/python3
# VBEAdderall: mqt-bench vbe_ripple_carry_adder (pure Toffoli, {cx, ccx}),
# exported for AutoQ `ex` over all basis states of cin/a/b/cout (the helper
# ancilla are pinned to |0>). Simulation only,
# no post.hsl. Valid sizes: n >= 4 with (n-1) % 3 == 0. Thin wrapper over
# ../mqt_autoq.py. Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("vbe_ripple_carry_adder", lo=1, hi=34)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("vbe_ripple_carry_adder", [n for n in sizes if n in valid])
