OPENQASM 2.0;
include "qelib1.inc";
gate gate_Oracle q0 {  }
qreg q[1];
x q[0];
h q[0];
gate_Oracle q[0];
barrier q[0];
