#!/usr/bin/python3
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import ensure_bench_dir_for_n, write_qasm_header, write_hsl, parse_sizes

sizes = parse_sizes(1, 1001, min_n=1)

for n in sizes:
    n_str = ensure_bench_dir_for_n(n)
    ###########################################################################
    # Precondition: the set of ALL computational basis states over n+1 qubits.
    # Used with the `ex` subcommand to simulate the circuit on every basis
    # state at once (no verification, so no post.hsl is needed).
    write_hsl(n_str + '/pre.hsl', f"{{c1 |x> : |x|={n+1}}}\n")
    ###########################################################################
    with open(n_str + '/circuit.qasm', 'w') as file:
        write_qasm_header(file)
        file.write(f'qreg qubits[{n+1}];\n\n')
        for i in range(0, n+1):
            file.write(f'h qubits[{i}];\n')
        file.write(f'z qubits[{n}];\n')
        for i in range(0, n, 2):
            file.write(f'cx qubits[{i}], qubits[{n}];\n')
        for i in range(0, n+1):
            file.write(f'h qubits[{i}];\n')
    ###########################################################################
