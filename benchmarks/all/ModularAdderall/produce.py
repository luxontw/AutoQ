#!/usr/bin/python3
# ModularAdderall: adder mod 2^n over two n-bit registers, exported for AutoQ
# `ex` over all basis states of a, b (the help ancilla is pinned to |0>).
# Simulation only, no post.hsl.
#
# NOTE: mqt-bench's default `modular_adder` synthesis is a RELATIVE-PHASE circuit
# (rz with pi/8 angles), which is not phase-free and lies outside AutoQ's
# e^(i*pi/4) amplitude ring. This family therefore uses a FUNCTIONALLY EQUIVALENT
# pure-Toffoli ripple-carry adder (adder_ripple_c04, kind='fixed') built in
# ../mqt_autoq.py: same arithmetic |a>|b> -> |a>|(a+b) mod 2^n>, gate set
# {cx, ccx}, but NOT the exact mqt-bench circuit.
#
# `size` here is the state-qubit count n; emitted qreg q = 2n+1 (a, b, help),
# capped so the all-basis set stays tractable. Thin wrapper. Run `python produce.py [N]`.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import parse_sizes
from mqt_autoq import generate, sizes_for

valid = sizes_for("modular_adder", lo=1, hi=20)
sizes = parse_sizes(valid[0], valid[-1] + 1, min_n=valid[0], max_n=valid[-1])
generate("modular_adder", [n for n in sizes if n in valid])
