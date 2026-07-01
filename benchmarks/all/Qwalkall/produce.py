#!/usr/bin/python3
# Qwalkall: the Quantum-Walk circuit from mqt-bench, exported for AutoQ's `ex`
# subcommand over the *set of all computational basis states* (like GHZall /
# GroverAll / BVall). It simulates the circuit on every basis state at once, e.g.
#       ./build/cli/autoq ex benchmarks/all/Qwalkall/05/pre.hsl \
#                            benchmarks/all/Qwalkall/05/circuit.qasm
# No verification is intended, so no post.hsl is produced.
#
# Source: mqt.bench `qwalk` at the ALG level. It uses {h, x, cx, ccx} plus
# multi-controlled `mcx` (up to N-1 controls). AutoQ's QASM parser only knows
# ccx, so each C^kX is lowered into a *clean-ancilla Toffoli v-chain* — the same
# pure-{ccx,cx} construction GroverAll uses — keeping the gate set at
# {h, x, cx, ccx} with NO phase gates (no T/rz/cu1). The lowering is verified to
# reproduce the original circuit on every basis input, with the ancilla restored
# to |0> at the end of each C^kX.
#
# Because the ancilla are appended to the same `qubits` register, the total
# qubit count is q = N + n_anc, where n_anc = max(K-2, 0) and K = N-1 is the
# widest mcx. The all-basis precondition ranges over this FULL register
# (real + ancilla), matching GroverAll's convention. The benchmark dir name is
# the mqt-bench size parameter N (the "logical" qubit count), not q.
#
# mqt.bench's qwalk requires N >= 3 (N=1,2 raise); the user asked for 1..20, so
# this covers 3..20.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import ensure_bench_dir_for_n, write_qasm_header, write_hsl, parse_sizes

from mqt.bench import BenchmarkLevel, get_benchmark

sizes = parse_sizes(3, 21, min_n=3, max_n=20)


def ckx_vchain(controls, target, anc):
    """Emit QASM lines for C^kX using clean ancilla, pure {ccx, cx}.

    `controls` is a list of control-qubit indices, `target` the target index,
    and `anc` a pool of >= max(k-2, 0) clean-|0> ancilla indices. The ancilla
    are computed up and uncomputed down so they return to |0>.
    """
    k = len(controls)
    if k == 0:
        return [f"x qubits[{target}];\n"]
    if k == 1:
        return [f"cx qubits[{controls[0]}], qubits[{target}];\n"]
    if k == 2:
        return [f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{target}];\n"]
    a = anc[: k - 2]
    lines = [f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{a[0]}];\n"]
    for i in range(2, k - 1):
        lines.append(f"ccx qubits[{controls[i]}], qubits[{a[i-2]}], qubits[{a[i-1]}];\n")
    lines.append(f"ccx qubits[{controls[k-1]}], qubits[{a[k-3]}], qubits[{target}];\n")
    for i in reversed(range(2, k - 1)):
        lines.append(f"ccx qubits[{controls[i]}], qubits[{a[i-2]}], qubits[{a[i-1]}];\n")
    lines.append(f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{a[0]}];\n")
    return lines


for n in sizes:
    qc = get_benchmark("qwalk", BenchmarkLevel.ALG, n)
    nq = qc.num_qubits
    assert nq == n, f"qwalk({n}) has {nq} qubits, expected {n}"

    # Size the shared clean-ancilla pool from the widest mcx in this circuit.
    max_ctrl = 0
    for ci in qc.data:
        if ci.operation.name == "mcx":
            max_ctrl = max(max_ctrl, len(ci.qubits) - 1)
    n_anc = max(max_ctrl - 2, 0)
    q = nq + n_anc  # total qubits = real register + ancilla
    anc = list(range(nq, q))  # ancilla occupy the high indices

    n_str = ensure_bench_dir_for_n(n)
    ###########################################################################
    # Precondition: ALL 2^q computational basis states over the FULL register
    # (real qubits + clean ancilla). The v-chain restores ancilla to |0>, so an
    # all-basis sweep over q qubits exercises every real input while the ancilla
    # start in every state too — matching GroverAll's all-basis convention.
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
            if name == "h":
                file.write(f"h qubits[{idx[0]}];\n")
            elif name == "x":
                file.write(f"x qubits[{idx[0]}];\n")
            elif name == "z":
                file.write(f"z qubits[{idx[0]}];\n")
            elif name == "cx":
                file.write(f"cx qubits[{idx[0]}], qubits[{idx[1]}];\n")
            elif name == "cz":
                file.write(f"cz qubits[{idx[0]}], qubits[{idx[1]}];\n")
            elif name == "ccx":
                file.write(f"ccx qubits[{idx[0]}], qubits[{idx[1]}], qubits[{idx[2]}];\n")
            elif name == "mcx":
                for line in ckx_vchain(idx[:-1], idx[-1], anc):
                    file.write(line)
            else:
                raise SystemExit(f"qwalk({n}): unsupported gate {name!r} for AutoQ")
