OPENQASM 2.0;
include "qelib1.inc";
qreg qubits[7];

ccx qubits[2], qubits[4], qubits[5];
cx qubits[2], qubits[4];
ccx qubits[1], qubits[3], qubits[6];
cx qubits[1], qubits[3];
ccx qubits[0], qubits[3], qubits[6];
ccx qubits[6], qubits[4], qubits[5];
cx qubits[2], qubits[4];
cx qubits[2], qubits[4];
cx qubits[6], qubits[4];
ccx qubits[0], qubits[3], qubits[6];
cx qubits[1], qubits[3];
ccx qubits[1], qubits[3], qubits[6];
cx qubits[1], qubits[3];
cx qubits[0], qubits[3];
