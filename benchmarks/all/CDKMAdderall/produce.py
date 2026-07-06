#!/usr/bin/python3
# CDKMAdderall: mqt-bench cdkm_ripple_carry_adder (pure Toffoli, {cx, ccx}),
# exported for AutoQ `ex` over ALL computational basis states. Simulation only,
# no post.hsl. Valid sizes are even, >= 4. Thin wrapper over ../mqt_autoq.py.
# Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("cdkm_ripple_carry_adder", lo=1, hi=30)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("cdkm_ripple_carry_adder", [n for n in sizes if n in valid])
