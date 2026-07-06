OPENQASM 2.0;
include "qelib1.inc";
gate mcphase(param0) q0,q1 { cp(-pi/4) q0,q1; }
gate mcphase_133960470729200(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470729056(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728768(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728624(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728336(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728720(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728384(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727904(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470728144(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727808(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727712(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727424(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727472(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470727136(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470726944(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470726560(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470726800(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470726464(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470726272(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470640112(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470641696(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470641264(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470640016(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470639488(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470638912(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470638672(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470631808(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470631616(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470631472(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470631280(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470630992(param0) q0,q1 { cp(pi/4) q0,q1; }
gate mcphase_133960470631232(param0) q0,q1 { cp(pi/4) q0,q1; }
gate ccircuit_19192 q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10 { ccx q0,q1,q5; ccx q0,q2,q6; ccx q0,q3,q7; ccx q0,q4,q8; ccx q0,q1,q10; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q5,q1; mcphase(-pi/4) q0,q1; ccx q0,q10,q1; mcphase_133960470729200(pi/4) q0,q1; ccx q0,q5,q1; mcphase(-pi/4) q0,q1; mcphase_133960470729056(pi/4) q0,q5; ccx q0,q10,q1; mcphase_133960470728768(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q2,q1; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q6,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470728624(pi/4) q0,q2; ccx q0,q6,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470728336(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q3,q2; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_133960470728720(pi/4) q0,q6; ccx q0,q1,q6; mcphase_133960470728384(pi/4) q0,q1; mcphase(-pi/4) q0,q6; ccx q0,q1,q6; ccx q0,q7,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470727904(pi/4) q0,q3; ccx q0,q7,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470728144(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q4,q3; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_133960470727808(pi/4) q0,q7; ccx q0,q2,q7; mcphase_133960470727712(pi/4) q0,q2; mcphase(-pi/4) q0,q7; ccx q0,q2,q7; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_133960470727424(pi/4) q0,q4; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_133960470727472(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; ccx q0,q4,q9; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_133960470727136(pi/4) q0,q8; ccx q0,q3,q8; mcphase_133960470726944(pi/4) q0,q3; mcphase(-pi/4) q0,q8; ccx q0,q3,q8; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_133960470726560(pi/4) q0,q4; ccx q0,q8,q4; mcphase(-pi/4) q0,q4; ccx q0,q3,q4; mcphase_133960470726800(pi/4) q0,q4; s q4; h q4; t q4; cx q0,q4; tdg q4; h q4; sdg q4; mcphase_133960470726464(pi/4) q0,q8; ccx q0,q3,q8; mcphase_133960470726272(pi/4) q0,q3; mcphase(-pi/4) q0,q8; ccx q0,q3,q8; ccx q0,q4,q3; ccx q0,q3,q8; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; ccx q0,q7,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470640112(pi/4) q0,q3; ccx q0,q7,q3; mcphase(-pi/4) q0,q3; ccx q0,q2,q3; mcphase_133960470641696(pi/4) q0,q3; s q3; h q3; t q3; cx q0,q3; tdg q3; h q3; sdg q3; mcphase_133960470641264(pi/4) q0,q7; ccx q0,q2,q7; mcphase_133960470640016(pi/4) q0,q2; mcphase(-pi/4) q0,q7; ccx q0,q2,q7; ccx q0,q3,q2; ccx q0,q2,q7; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; ccx q0,q6,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470639488(pi/4) q0,q2; ccx q0,q6,q2; mcphase(-pi/4) q0,q2; ccx q0,q1,q2; mcphase_133960470638912(pi/4) q0,q2; s q2; h q2; t q2; cx q0,q2; tdg q2; h q2; sdg q2; mcphase_133960470638672(pi/4) q0,q6; ccx q0,q1,q6; mcphase_133960470631808(pi/4) q0,q1; mcphase(-pi/4) q0,q6; ccx q0,q1,q6; ccx q0,q2,q1; ccx q0,q1,q6; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; mcphase_133960470631616(pi/4) q0,q10; ccx q0,q10,q5; ccx q0,q5,q1; mcphase(-pi/4) q0,q1; ccx q0,q10,q1; mcphase_133960470631472(pi/4) q0,q1; ccx q0,q5,q1; mcphase(-pi/4) q0,q1; mcphase_133960470631280(pi/4) q0,q5; ccx q0,q10,q1; mcphase_133960470630992(pi/4) q0,q1; s q1; h q1; t q1; cx q0,q1; tdg q1; h q1; sdg q1; ccx q0,q10,q5; mcphase(-pi/4) q0,q5; mcphase_133960470631232(pi/4) q0,q10; ccx q0,q10,q5; ccx q0,q1,q10; ccx q0,q10,q5; }
qreg a[4];
qreg b[4];
qreg out[8];
qreg helper[1];
creg meas[17];
ccircuit_19192 a[0],b[0],b[1],b[2],b[3],out[0],out[1],out[2],out[3],out[4],helper[0];
ccircuit_19192 a[1],b[0],b[1],b[2],b[3],out[1],out[2],out[3],out[4],out[5],helper[0];
ccircuit_19192 a[2],b[0],b[1],b[2],b[3],out[2],out[3],out[4],out[5],out[6],helper[0];
ccircuit_19192 a[3],b[0],b[1],b[2],b[3],out[3],out[4],out[5],out[6],out[7],helper[0];
barrier a[0],a[1],a[2],a[3],b[0],b[1],b[2],b[3],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],helper[0];
measure a[0] -> meas[0];
measure a[1] -> meas[1];
measure a[2] -> meas[2];
measure a[3] -> meas[3];
measure b[0] -> meas[4];
measure b[1] -> meas[5];
measure b[2] -> meas[6];
measure b[3] -> meas[7];
measure out[0] -> meas[8];
measure out[1] -> meas[9];
measure out[2] -> meas[10];
measure out[3] -> meas[11];
measure out[4] -> meas[12];
measure out[5] -> meas[13];
measure out[6] -> meas[14];
measure out[7] -> meas[15];
measure helper[0] -> meas[16];
