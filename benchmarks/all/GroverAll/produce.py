#!/usr/bin/python3
# GroverAll: same Grover circuit as benchmarks/all/Grover, but the precondition
# is the *set of all computational basis states* instead of the single |0...0>.
#
# This is meant for *simulation* of the circuit over every basis state via the
# `ex` subcommand (which needs only pre.hsl + circuit.qasm), e.g.
#       ./build/cli/autoq ex benchmarks/all/GroverAll/03/pre.hsl \
#                            benchmarks/all/GroverAll/03/circuit.qasm
# It is not intended for `ver`: an all-basis input does not match the single
# marked-state postcondition of standard Grover, so post.hsl is *not* produced.
import sys
import math
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from common import ensure_bench_dir_for_n, write_qasm_header, write_hsl, parse_sizes

sizes = parse_sizes(3, 22, min_n=3)

for n in sizes:
    q = 2 * n - 1
    n_str = ensure_bench_dir_for_n(n)
    ###########################################################################
    # Precondition: the set of ALL 2^q computational basis states.
    # `i` is a single binary-string variable of length q, so { |i> : |i|=q }
    # ranges over every basis state |0...0> ... |1...1>.
    write_hsl(n_str + '/pre.hsl', "{ |i> : |i|=" + str(q) + " }\n", header="Extended Dirac\n")
    ###########################################################################
    with open(n_str + '/circuit.qasm', 'w') as file:
        w = range(n)
        a = ['nan'] + [i + len(w) for i in range(n-2)]
        t = 2*n - 2
        ###########################################################
        write_qasm_header(file)
        file.write(f'qreg qubits[{q}];\n')
        file.write(f'x qubits[{t}];\n\n')
        for i in w:
            file.write(f'h qubits[{i}];\n')
        file.write(f'h qubits[{t}];\n\n')
        for _ in range(math.floor(math.pi / (4 * math.asin(1 / pow(2, n/2))))):
            for i in range(0, n, 2):
                file.write(f'x qubits[{w[i]}];\n')
            myList = [f'ccx qubits[{w[0]}], qubits[{w[1]}], qubits[{a[1]}];\n']
            for i in range(2, n-1): # 2 <= i <= n-2
                myList.append(f'ccx qubits[{a[i-1]}], qubits[{w[i]}], qubits[{a[i]}];\n')
            for line in myList:
                file.write(line)
            file.write(f'cz qubits[{a[n-2]}], qubits[{w[n-1]}];\n')
            for line in reversed(myList):
                file.write(line)
            for i in range(0, n, 2):
                file.write(f'x qubits[{w[i]}];\n')
            ###################################
            for i in range(n):
                file.write(f'h qubits[{w[i]}];\n')
            for i in range(n):
                file.write(f'x qubits[{w[i]}];\n')
            for line in myList:
                file.write(line)
            file.write(f'cz qubits[{a[n-2]}], qubits[{w[n-1]}];\n')
            for line in reversed(myList):
                file.write(line)
            for i in range(n):
                file.write(f'x qubits[{w[i]}];\n')
            for i in range(n):
                file.write(f'h qubits[{w[i]}];\n')
            file.write(f'x qubits[{t}];\n\n')
        file.write(f'h qubits[{t}];\n')
