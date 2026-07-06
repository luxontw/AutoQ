#!/usr/bin/python3
# Multiplierall: schoolbook multiplier |a>|b>|0> -> |a>|b>|a*b>, exported for
# AutoQ `ex` over all basis states of a, b. The out accumulator, help ancilla
# and v-chain ancilla are pinned to |0>: the XOR carry-out accumulate is only
# correct from an empty accumulator. Simulation only, no post.hsl.
#
# NOTE: mqt-bench's default `multiplier` is QFT-based (cp/crz/rz phase gates),
# outside AutoQ's e^(i*pi/4) amplitude ring. This family uses a FUNCTIONALLY
# EQUIVALENT pure-Toffoli cumulative multiplier built in ../mqt_autoq.py:
# per bit a[i], a gate-level-controlled ripple half-add of b into the output
# accumulator (any C^kX lowered via a clean-ancilla Toffoli v-chain). Same
# arithmetic, gate set {cx, ccx}, but NOT the exact mqt-bench circuit.
#
# `size` is the state-qubit count n; emitted qreg q ~= 4n+2 (a, b, out(2n),
# carry/help + v-chain ancilla), capped near 20 so the all-basis set stays
# tractable. Thin wrapper. Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("multiplier", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("multiplier", [n for n in sizes if n in valid])
