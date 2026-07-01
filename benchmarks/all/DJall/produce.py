#!/usr/bin/python3
# DJall: the Deutsch-Jozsa circuit from mqt-bench, exported for AutoQ's `ex`
# subcommand over the *set of all computational basis states* (like GHZall /
# GroverAll / BVall). It is meant for *simulation* of the circuit on every basis
# state at once, e.g.
#       ./build/cli/autoq ex benchmarks/all/DJall/06/pre.hsl \
#                            benchmarks/all/DJall/06/circuit.qasm
# No verification is intended, so no post.hsl is produced.
#
# Source: mqt.bench `dj` at the ALG level. Its only non-primitive gate is the
# "Oracle" wrapper, which decomposes into {h, x, cx} — already inside AutoQ's
# QASM gate set. Measurement/barrier are dropped (AutoQ `ex` simulates the pure
# unitary). The circuit uses N qubits for parameter N, so the benchmark dir name
# equals the qubit count directly.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import ensure_bench_dir_for_n, write_qasm_header, write_hsl, parse_sizes

from mqt.bench import BenchmarkLevel, get_benchmark

# DJ is defined for N >= 1 qubit; the user asked for 1..20.
sizes = parse_sizes(1, 21, min_n=1, max_n=20)

# Gates that map 1:1 onto AutoQ's QASM parser after decompose('Oracle').
_EMIT = {
    "h": lambda q: f"h qubits[{q[0]}];\n",
    "x": lambda q: f"x qubits[{q[0]}];\n",
    "z": lambda q: f"z qubits[{q[0]}];\n",
    "cx": lambda q: f"cx qubits[{q[0]}], qubits[{q[1]}];\n",
    "cz": lambda q: f"cz qubits[{q[0]}], qubits[{q[1]}];\n",
    "ccx": lambda q: f"ccx qubits[{q[0]}], qubits[{q[1]}], qubits[{q[2]}];\n",
}

for n in sizes:
    qc = get_benchmark("dj", BenchmarkLevel.ALG, n).decompose("Oracle")
    q = qc.num_qubits
    assert q == n, f"dj({n}) has {q} qubits, expected {n}"

    n_str = ensure_bench_dir_for_n(n)
    ###########################################################################
    # Precondition: the set of ALL 2^q computational basis states over the q
    # circuit qubits. `i` is one binary-string variable of length q, so
    # { |i> : |i|=q } ranges over |0...0> .. |1...1>.
    write_hsl(n_str + "/pre.hsl", f"{{ |i> : |i|={q} }}\n", header="Extended Dirac\n")
    ###########################################################################
    with open(n_str + "/circuit.qasm", "w") as file:
        write_qasm_header(file)
        file.write(f"qreg qubits[{q}];\n\n")
        for ci in qc.data:
            name = ci.operation.name
            if name in ("measure", "barrier"):
                continue
            idx = [qc.find_bit(b).index for b in ci.qubits]
            if name not in _EMIT:
                raise SystemExit(f"dj({n}): unsupported gate {name!r} for AutoQ")
            file.write(_EMIT[name](idx))
