OPENQASM 2.0;
include "qelib1.inc";
gate mcphase(param0) q0,q1 { cp(-pi/4) q0,q1; }
gate mcphase_133960470390416(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470390608(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470390704(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470390896(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391088(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391184(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391280(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391568(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391760(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391856(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470391952(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470392240(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470392432(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470392528(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470392624(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470392912(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393104(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393200(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393296(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393584(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393776(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470393968(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470394064(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470394256(param0) q0,q1 { cp(pi/4) q0,q1; }
gate ccircuit_19141 q0,q1,q2,q3,q4,q5,q6,q7,q8 { ccx q0,q1,q4; ccx q0,q2,q5; ccx q0,q3,q6; ccx q0,q1,q8; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q4,q1; mcphase(-pi/4) q0,q1; ccx q0,q8,q1; mcphase_133960470390416(pi/4) q0,q1; ccx q0,q4,q1; mcphase(-pi/4) q0,q1; mcphase_133960470390608(pi/4) q0,q4; ccx q0,q8,q1; mcphase_133960470390704(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q2,q1; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q5,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470390896(pi/4) q0,q2; ccx q0,q5,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470391088(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q3,q2; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_133960470391184(pi/4) q0,q5; ccx q0,q1,q5; mcphase_133960470391280(pi/4) q0,q1; mcphase(-pi/4) q0,q5; ccx q0,q1,q5; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470391568(pi/4) q0,q3; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470391760(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q3,q7; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_133960470391856(pi/4) q0,q6; ccx q0,q2,q6; mcphase_133960470391952(pi/4) q0,q2; mcphase(-pi/4) q0,q6; ccx q0,q2,q6; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470392240(pi/4) q0,q3; ccx q0,q6,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470392432(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_133960470392528(pi/4) q0,q6; ccx q0,q2,q6; mcphase_133960470392624(pi/4) q0,q2; mcphase(-pi/4) q0,q6; ccx q0,q2,q6; ccx q0,q3,q2; ccx q0,q2,q6; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q5,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470392912(pi/4) q0,q2; ccx q0,q5,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470393104(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_133960470393200(pi/4) q0,q5; ccx q0,q1,q5; mcphase_133960470393296(pi/4) q0,q1; mcphase(-pi/4) q0,q5; ccx q0,q1,q5; ccx q0,q2,q1; ccx q0,q1,q5; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; mcphase_133960470393584(pi/4) q0,q8; ccx q0,q8,q4; ccx q0,q4,q1; mcphase(-pi/4) q0,q1; ccx q0,q8,q1; mcphase_133960470393776(pi/4) q0,q1; ccx q0,q4,q1; mcphase(-pi/4) q0,q1; mcphase_133960470393968(pi/4) q0,q4; ccx q0,q8,q1; mcphase_133960470394064(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; mcphase_133960470394256(pi/4) q0,q8; ccx q0,q8,q4; ccx q0,q1,q8; ccx q0,q8,q4; }
qreg a[3];
qreg b[3];
qreg out[6];
qreg helper[1];
creg meas[13];
ccircuit_19141 a[0],b[0],b[1],b[2],out[0],out[1],out[2],out[3],helper[0];
ccircuit_19141 a[1],b[0],b[1],b[2],out[1],out[2],out[3],out[4],helper[0];
ccircuit_19141 a[2],b[0],b[1],b[2],out[2],out[3],out[4],out[5],helper[0];
barrier a[0],a[1],a[2],b[0],b[1],b[2],out[0],out[1],out[2],out[3],out[4],out[5],helper[0];
measure a[0] -> meas[0];
measure a[1] -> meas[1];
measure a[2] -> meas[2];
measure b[0] -> meas[3];
measure b[1] -> meas[4];
measure b[2] -> meas[5];
measure out[0] -> meas[6];
measure out[1] -> meas[7];
measure out[2] -> meas[8];
measure out[3] -> meas[9];
measure out[4] -> meas[10];
measure out[5] -> meas[11];
measure helper[0] -> meas[12];
