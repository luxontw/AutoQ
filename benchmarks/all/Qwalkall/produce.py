#!/usr/bin/python3
# Qwalkall: mqt-bench Quantum-Walk, exported for AutoQ `ex` over all basis
# states of the input qubits, ancilla clean (like GroverAll / BVall).
# Simulation only, so no post.hsl.
#     ./build/cli/autoq ex benchmarks/all/Qwalkall/05/pre.hsl \
#                          benchmarks/all/Qwalkall/05/circuit.qasm
#
# qwalk uses multi-controlled `mcx` (up to N-1 controls); AutoQ only knows ccx,
# so each C^kX is lowered to a clean-ancilla Toffoli v-chain (pure {ccx,cx}, no
# phase gates) in ../mqt_autoq.py. Ancilla are appended to the register, so the
# emitted qreg width q = N + max(N-3, 0); the pre.hsl sweeps all 2^N basis
# states of the N circuit qubits and pins the v-chain ancilla to |0>
# (clean-ancilla — the v-chain equals C^kX only on that subspace).
# The benchmark dir name is the mqt-bench size N.
#
# All logic lives in ../mqt_autoq.py; this is a thin wrapper.
# Run `python produce.py [N]` (single N optional).
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("qwalk", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("qwalk", [n for n in sizes if n in valid])
