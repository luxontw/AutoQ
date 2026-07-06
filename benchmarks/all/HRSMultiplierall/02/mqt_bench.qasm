OPENQASM 2.0;
include "qelib1.inc";
gate mcphase(param0) q0,q1 { cp(-pi/4) q0,q1; }
gate mcphase_133960470234944(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235136(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235232(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235424(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235616(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235712(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470235808(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236096(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236288(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236384(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236480(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236768(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470236960(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470237152(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470237248(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470237440(param0) q0,q1 { cp(pi/4) q0,q1; }
gate ccircuit_19104 q0,q1,q2,q3,q4,q5,q6 { ccx q0,q1,q3; ccx q0,q2,q4; ccx q0,q1,q6; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q3,q1; mcphase(-pi/4) q0,q1; ccx q0,q6,q1; mcphase_133960470234944(pi/4) q0,q1; ccx q0,q3,q1; mcphase(-pi/4) q0,q1; mcphase_133960470235136(pi/4) q0,q3; ccx q0,q6,q1; mcphase_133960470235232(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q2,q1; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q4,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470235424(pi/4) q0,q2; ccx q0,q4,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470235616(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q2,q5; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_133960470235712(pi/4) q0,q4; ccx q0,q1,q4; mcphase_133960470235808(pi/4) q0,q1; mcphase(-pi/4) q0,q4; ccx q0,q1,q4; ccx q0,q4,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470236096(pi/4) q0,q2; ccx q0,q4,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470236288(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_133960470236384(pi/4) q0,q4; ccx q0,q1,q4; mcphase_133960470236480(pi/4) q0,q1; mcphase(-pi/4) q0,q4; ccx q0,q1,q4; ccx q0,q2,q1; ccx q0,q1,q4; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; mcphase_133960470236768(pi/4) q0,q6; ccx q0,q6,q3; ccx q0,q3,q1; mcphase(-pi/4) q0,q1; ccx q0,q6,q1; mcphase_133960470236960(pi/4) q0,q1; ccx q0,q3,q1; mcphase(-pi/4) q0,q1; mcphase_133960470237152(pi/4) q0,q3; ccx q0,q6,q1; mcphase_133960470237248(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; mcphase_133960470237440(pi/4) q0,q6; ccx q0,q6,q3; ccx q0,q1,q6; ccx q0,q6,q3; }
qreg a[2];
qreg b[2];
qreg out[4];
qreg helper[1];
creg meas[9];
ccircuit_19104 a[0],b[0],b[1],out[0],out[1],out[2],helper[0];
ccircuit_19104 a[1],b[0],b[1],out[1],out[2],out[3],helper[0];
barrier a[0],a[1],b[0],b[1],out[0],out[1],out[2],out[3],helper[0];
measure a[0] -> meas[0];
measure a[1] -> meas[1];
measure b[0] -> meas[2];
measure b[1] -> meas[3];
measure out[0] -> meas[4];
measure out[1] -> meas[5];
measure out[2] -> meas[6];
measure out[3] -> meas[7];
measure helper[0] -> meas[8];
