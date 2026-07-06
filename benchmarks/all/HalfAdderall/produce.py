#!/usr/bin/python3
# HalfAdderall: mqt-bench half_adder (Toffoli-based). At n>=9 it uses a
# multi-controlled mcx internally, which ../mqt_autoq.py lowers to a
# clean-ancilla Toffoli v-chain (so the emitted qreg may exceed the dir number).
# Exported for AutoQ `ex` over all basis states of the n circuit qubits (the
# v-chain ancilla are pinned to |0>); simulation only,
# no post.hsl. Valid sizes are odd, >= 3. Thin wrapper. Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("half_adder", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("half_adder", [n for n in sizes if n in valid])
