OPENQASM 2.0;
include "qelib1.inc";
qreg qubits[4];

ccx qubits[1], qubits[2], qubits[3];
cx qubits[1], qubits[2];
ccx qubits[0], qubits[2], qubits[3];
cx qubits[1], qubits[2];
cx qubits[1], qubits[2];
cx qubits[0], qubits[2];
