#!/usr/bin/python3
# HRSMultiplierall: Häner-Roetteler-Svore cumulative multiplier, exported for
# AutoQ `ex` over all basis states of a, b (out accumulator, help and v-chain
# ancilla pinned to |0>, as in Multiplierall). Simulation only, no post.hsl.
#
# NOTE: mqt-bench's default `hrs_cumulative_multiplier` carries QFT/relative-phase
# gates (rz/rx with pi/2^k angles), outside AutoQ's e^(i*pi/4) amplitude ring.
# HRS is itself the cumulative-multiplier scheme, so this family reuses the same
# FUNCTIONALLY EQUIVALENT pure-Toffoli cumulative multiplier as Multiplierall
# (../mqt_autoq.py): |a>|b>|0> -> |a>|b>|a*b>, gate set {cx, ccx}, but NOT the
# exact mqt-bench circuit.
#
# `size` is the state-qubit count n; emitted qreg q = 4n+2, capped at 38.
# Thin wrapper. Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("hrs_cumulative_multiplier", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("hrs_cumulative_multiplier", [n for n in sizes if n in valid])
