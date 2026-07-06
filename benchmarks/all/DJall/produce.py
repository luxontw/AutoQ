#!/usr/bin/python3
# DJall: mqt-bench Deutsch-Jozsa, exported for AutoQ `ex` over the set of ALL
# computational basis states (like GHZall / GroverAll / BVall). Simulation only,
# so no post.hsl. Its only non-primitive gate is the "Oracle" wrapper, which
# decomposes into {h, x, cx} — already inside AutoQ's gate set.
#     ./build/cli/autoq ex benchmarks/all/DJall/06/pre.hsl \
#                          benchmarks/all/DJall/06/circuit.qasm
#
# All the mqt-load / lowering / emission logic lives in ../mqt_autoq.py; this is
# a thin wrapper. Run `python produce.py [N]` (single N optional).
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("dj", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("dj", [n for n in sizes if n in valid])
