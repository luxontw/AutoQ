OPENQASM 2.0;
include "qelib1.inc";
gate mcphase(param0) q0,q1 { cp(-pi/4) q0,q1; }
gate mcphase_131209278239952(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278240000(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278239568(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278239712(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278239232(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238896(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278239088(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238800(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238848(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238512(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238320(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278238080(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278237936(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209327601536(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131212093943888(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278442672(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443104(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443392(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443680(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278445264(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443872(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443728(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443584(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278443296(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278442864(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278442720(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278442528(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278445600(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278445792(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278445888(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278445984(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278446176(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278446464(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278446272(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278446656(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278446944(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278447040(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278447328(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278447424(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209278447616(param0) q0,q1 { cp(pi/4) q0,q1; }
gate ccircuit_41 q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12 { ccx q0,q1,q6; ccx q0,q2,q7; ccx q0,q3,q8; ccx q0,q4,q9; ccx q0,q5,q10; ccx q0,q1,q12; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q6,q1; mcphase(-pi/4) q0,q1; ccx q0,q12,q1; mcphase_131209278239952(pi/4) q0,q1; ccx q0,q6,q1; mcphase(-pi/4) q0,q1; mcphase_131209278240000(pi/4) q0,q6; ccx q0,q12,q1; mcphase_131209278239568(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q2,q1; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q7,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209278239712(pi/4) q0,q2; ccx q0,q7,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209278239232(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q3,q2; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_131209278238896(pi/4) q0,q7; ccx q0,q1,q7; mcphase_131209278239088(pi/4) q0,q1; mcphase(-pi/4) q0,q7; ccx q0,q1,q7; ccx q0,q8,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209278238800(pi/4) q0,q3; ccx q0,q8,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209278238848(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q4,q3; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_131209278238512(pi/4) q0,q8; ccx q0,q2,q8; mcphase_131209278238320(pi/4) q0,q2; mcphase(-pi/4) q0,q8; ccx q0,q2,q8; ccx q0,q9,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209278238080(pi/4) q0,q4; ccx q0,q9,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209278237936(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; ccx q0,q5,q4; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; mcphase_131209327601536(pi/4) q0,q9; ccx q0,q3,q9; mcphase_131212093943888(pi/4) q0,q3; mcphase(-pi/4) q0,q9; ccx q0,q3,q9; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209278442672(pi/4) q0,q5; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209278443104(pi/4) q0,q5; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; ccx q0,q5,q11; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; mcphase_131209278443392(pi/4) q0,q10; ccx q0,q4,q10; mcphase_131209278443680(pi/4) q0,q4; mcphase(-pi/4) q0,q10; ccx q0,q4,q10; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209278445264(pi/4) q0,q5; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209278443872(pi/4) q0,q5; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; mcphase_131209278443728(pi/4) q0,q10; ccx q0,q4,q10; mcphase_131209278443584(pi/4) q0,q4; mcphase(-pi/4) q0,q10; ccx q0,q4,q10; ccx q0,q5,q4; ccx q0,q4,q10; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; ccx q0,q9,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209278443296(pi/4) q0,q4; ccx q0,q9,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209278442864(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_131209278442720(pi/4) q0,q9; ccx q0,q3,q9; mcphase_131209278442528(pi/4) q0,q3; mcphase(-pi/4) q0,q9; ccx q0,q3,q9; ccx q0,q4,q3; ccx q0,q3,q9; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q8,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209278445600(pi/4) q0,q3; ccx q0,q8,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209278445792(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_131209278445888(pi/4) q0,q8; ccx q0,q2,q8; mcphase_131209278445984(pi/4) q0,q2; mcphase(-pi/4) q0,q8; ccx q0,q2,q8; ccx q0,q3,q2; ccx q0,q2,q8; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q7,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209278446176(pi/4) q0,q2; ccx q0,q7,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209278446464(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_131209278446272(pi/4) q0,q7; ccx q0,q1,q7; mcphase_131209278446656(pi/4) q0,q1; mcphase(-pi/4) q0,q7; ccx q0,q1,q7; ccx q0,q2,q1; ccx q0,q1,q7; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; mcphase_131209278446944(pi/4) q0,q12; ccx q0,q12,q6; ccx q0,q6,q1; mcphase(-pi/4) q0,q1; ccx q0,q12,q1; mcphase_131209278447040(pi/4) q0,q1; ccx q0,q6,q1; mcphase(-pi/4) q0,q1; mcphase_131209278447328(pi/4) q0,q6; ccx q0,q12,q1; mcphase_131209278447424(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; mcphase_131209278447616(pi/4) q0,q12; ccx q0,q12,q6; ccx q0,q1,q12; ccx q0,q12,q6; }
qreg a[5];
qreg b[5];
qreg out[10];
qreg helper[1];
creg meas[21];
ccircuit_41 a[0],b[0],b[1],b[2],b[3],b[4],out[0],out[1],out[2],out[3],out[4],out[5],helper[0];
ccircuit_41 a[1],b[0],b[1],b[2],b[3],b[4],out[1],out[2],out[3],out[4],out[5],out[6],helper[0];
ccircuit_41 a[2],b[0],b[1],b[2],b[3],b[4],out[2],out[3],out[4],out[5],out[6],out[7],helper[0];
ccircuit_41 a[3],b[0],b[1],b[2],b[3],b[4],out[3],out[4],out[5],out[6],out[7],out[8],helper[0];
ccircuit_41 a[4],b[0],b[1],b[2],b[3],b[4],out[4],out[5],out[6],out[7],out[8],out[9],helper[0];
barrier a[0],a[1],a[2],a[3],a[4],b[0],b[1],b[2],b[3],b[4],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],helper[0];
measure a[0] -> meas[0];
measure a[1] -> meas[1];
measure a[2] -> meas[2];
measure a[3] -> meas[3];
measure a[4] -> meas[4];
measure b[0] -> meas[5];
measure b[1] -> meas[6];
measure b[2] -> meas[7];
measure b[3] -> meas[8];
measure b[4] -> meas[9];
measure out[0] -> meas[10];
measure out[1] -> meas[11];
measure out[2] -> meas[12];
measure out[3] -> meas[13];
measure out[4] -> meas[14];
measure out[5] -> meas[15];
measure out[6] -> meas[16];
measure out[7] -> meas[17];
measure out[8] -> meas[18];
measure out[9] -> meas[19];
measure helper[0] -> meas[20];
