OPENQASM 2.0;
include "qelib1.inc";
gate mcphase(param0) q0,q1 { cp(-pi/4) q0,q1; }
gate mcphase_131209279061744(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279061936(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279176784(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279176976(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177168(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177264(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177360(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177648(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177840(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279177936(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178032(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178320(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178512(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178608(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178704(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279178992(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179184(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179280(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179376(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179664(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179856(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279179952(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279180048(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279180336(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279180528(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279180624(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279180720(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181008(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181200(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181296(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181392(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181680(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181872(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279181968(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279182064(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279182352(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279182544(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279182640(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279182736(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183024(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183216(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183312(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183408(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183696(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279183888(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279184080(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279184176(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_131209279184368(param0) q0,q1 { cp(pi/4) q0,q1; }
gate ccircuit_120 q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14 { ccx q0,q1,q7; ccx q0,q2,q8; ccx q0,q3,q9; ccx q0,q4,q10; ccx q0,q5,q11; ccx q0,q6,q12; ccx q0,q1,q14; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q7,q1; mcphase(-pi/4) q0,q1; ccx q0,q14,q1; mcphase_131209279061744(pi/4) q0,q1; ccx q0,q7,q1; mcphase(-pi/4) q0,q1; mcphase_131209279061936(pi/4) q0,q7; ccx q0,q14,q1; mcphase_131209279176784(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q2,q1; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q8,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209279176976(pi/4) q0,q2; ccx q0,q8,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209279177168(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q3,q2; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_131209279177264(pi/4) q0,q8; ccx q0,q1,q8; mcphase_131209279177360(pi/4) q0,q1; mcphase(-pi/4) q0,q8; ccx q0,q1,q8; ccx q0,q9,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209279177648(pi/4) q0,q3; ccx q0,q9,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209279177840(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q4,q3; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_131209279177936(pi/4) q0,q9; ccx q0,q2,q9; mcphase_131209279178032(pi/4) q0,q2; mcphase(-pi/4) q0,q9; ccx q0,q2,q9; ccx q0,q10,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209279178320(pi/4) q0,q4; ccx q0,q10,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209279178512(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; ccx q0,q5,q4; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; mcphase_131209279178608(pi/4) q0,q10; ccx q0,q3,q10; mcphase_131209279178704(pi/4) q0,q3; mcphase(-pi/4) q0,q10; ccx q0,q3,q10; ccx q0,q11,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209279178992(pi/4) q0,q5; ccx q0,q11,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209279179184(pi/4) q0,q5; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; ccx q0,q6,q5; s q6; h q6; t q6; cx q0,q6; tdg q6; h q6; sdg q6; mcphase_131209279179280(pi/4) q0,q11; ccx q0,q4,q11; mcphase_131209279179376(pi/4) q0,q4; mcphase(-pi/4) q0,q11; ccx q0,q4,q11; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; ccx q0,q5,q6; mcphase_131209279179664(pi/4) q0,q6; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; ccx q0,q5,q6; mcphase_131209279179856(pi/4) q0,q6; s q6; h q6; t q6; cx q0,q6; tdg q6; h q6; sdg q6; ccx q0,q6,q13; s q6; h q6; t q6; cx q0,q6; tdg q6; h q6; sdg q6; mcphase_131209279179952(pi/4) q0,q12; ccx q0,q5,q12; mcphase_131209279180048(pi/4) q0,q5; mcphase(-pi/4) q0,q12; ccx q0,q5,q12; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; ccx q0,q5,q6; mcphase_131209279180336(pi/4) q0,q6; ccx q0,q12,q6; mcphase(-pi/4) q0,q6; ccx q0,q5,q6; mcphase_131209279180528(pi/4) q0,q6; s q6; h q6; t q6; cx q0,q6; tdg q6; h q6; sdg q6; mcphase_131209279180624(pi/4) q0,q12; ccx q0,q5,q12; mcphase_131209279180720(pi/4) q0,q5; mcphase(-pi/4) q0,q12; ccx q0,q5,q12; ccx q0,q6,q5; ccx q0,q5,q12; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; ccx q0,q11,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209279181008(pi/4) q0,q5; ccx q0,q11,q5; mcphase(-pi/4) q0,q5; ccx q0,q4,q5; mcphase_131209279181200(pi/4) q0,q5; s q5; h q5; t q5; cx q0,q5; tdg q5; h q5; sdg q5; mcphase_131209279181296(pi/4) q0,q11; ccx q0,q4,q11; mcphase_131209279181392(pi/4) q0,q4; mcphase(-pi/4) q0,q11; ccx q0,q4,q11; ccx q0,q5,q4; ccx q0,q4,q11; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; ccx q0,q10,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209279181680(pi/4) q0,q4; ccx q0,q10,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_131209279181872(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_131209279181968(pi/4) q0,q10; ccx q0,q3,q10; mcphase_131209279182064(pi/4) q0,q3; mcphase(-pi/4) q0,q10; ccx q0,q3,q10; ccx q0,q4,q3; ccx q0,q3,q10; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q9,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209279182352(pi/4) q0,q3; ccx q0,q9,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_131209279182544(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_131209279182640(pi/4) q0,q9; ccx q0,q2,q9; mcphase_131209279182736(pi/4) q0,q2; mcphase(-pi/4) q0,q9; ccx q0,q2,q9; ccx q0,q3,q2; ccx q0,q2,q9; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q8,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209279183024(pi/4) q0,q2; ccx q0,q8,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_131209279183216(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_131209279183312(pi/4) q0,q8; ccx q0,q1,q8; mcphase_131209279183408(pi/4) q0,q1; mcphase(-pi/4) q0,q8; ccx q0,q1,q8; ccx q0,q2,q1; ccx q0,q1,q8; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q14,q7; mcphase(-pi/4) q0,q7; mcphase_131209279183696(pi/4) q0,q14; ccx q0,q14,q7; ccx q0,q7,q1; mcphase(-pi/4) q0,q1; ccx q0,q14,q1; mcphase_131209279183888(pi/4) q0,q1; ccx q0,q7,q1; mcphase(-pi/4) q0,q1; mcphase_131209279184080(pi/4) q0,q7; ccx q0,q14,q1; mcphase_131209279184176(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q14,q7; mcphase(-pi/4) q0,q7; mcphase_131209279184368(pi/4) q0,q14; ccx q0,q14,q7; ccx q0,q1,q14; ccx q0,q14,q7; }
qreg a[6];
qreg b[6];
qreg out[12];
qreg helper[1];
creg meas[25];
ccircuit_120 a[0],b[0],b[1],b[2],b[3],b[4],b[5],out[0],out[1],out[2],out[3],out[4],out[5],out[6],helper[0];
ccircuit_120 a[1],b[0],b[1],b[2],b[3],b[4],b[5],out[1],out[2],out[3],out[4],out[5],out[6],out[7],helper[0];
ccircuit_120 a[2],b[0],b[1],b[2],b[3],b[4],b[5],out[2],out[3],out[4],out[5],out[6],out[7],out[8],helper[0];
ccircuit_120 a[3],b[0],b[1],b[2],b[3],b[4],b[5],out[3],out[4],out[5],out[6],out[7],out[8],out[9],helper[0];
ccircuit_120 a[4],b[0],b[1],b[2],b[3],b[4],b[5],out[4],out[5],out[6],out[7],out[8],out[9],out[10],helper[0];
ccircuit_120 a[5],b[0],b[1],b[2],b[3],b[4],b[5],out[5],out[6],out[7],out[8],out[9],out[10],out[11],helper[0];
barrier a[0],a[1],a[2],a[3],a[4],a[5],b[0],b[1],b[2],b[3],b[4],b[5],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],helper[0];
measure a[0] -> meas[0];
measure a[1] -> meas[1];
measure a[2] -> meas[2];
measure a[3] -> meas[3];
measure a[4] -> meas[4];
measure a[5] -> meas[5];
measure b[0] -> meas[6];
measure b[1] -> meas[7];
measure b[2] -> meas[8];
measure b[3] -> meas[9];
measure b[4] -> meas[10];
measure b[5] -> meas[11];
measure out[0] -> meas[12];
measure out[1] -> meas[13];
measure out[2] -> meas[14];
measure out[3] -> meas[15];
measure out[4] -> meas[16];
measure out[5] -> meas[17];
measure out[6] -> meas[18];
measure out[7] -> meas[19];
measure out[8] -> meas[20];
measure out[9] -> meas[21];
measure out[10] -> meas[22];
measure out[11] -> meas[23];
measure helper[0] -> meas[24];
