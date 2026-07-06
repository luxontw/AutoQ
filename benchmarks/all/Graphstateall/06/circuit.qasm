OPENQASM 2.0;
include "qelib1.inc";
qreg qubits[6];

h qubits[0];
h qubits[1];
h qubits[2];
h qubits[3];
cz qubits[1], qubits[3];
cz qubits[2], qubits[3];
h qubits[4];
cz qubits[0], qubits[4];
cz qubits[2], qubits[4];
h qubits[5];
cz qubits[0], qubits[5];
cz qubits[1], qubits[5];
