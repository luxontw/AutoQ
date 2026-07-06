OPENQASM 2.0;
include "qelib1.inc";
gate qft q0,q1,q2,q3,q4,q5,q6,q7 { h q7; cp(pi/2) q7,q6; cp(pi/4) q7,q5; cp(pi/8) q7,q4; cp(pi/16) q7,q3; cp(pi/32) q7,q2; cp(pi/64) q7,q1; cp(0.02454369260617026) q7,q0; h q6; cp(pi/2) q6,q5; cp(pi/4) q6,q4; cp(pi/8) q6,q3; cp(pi/16) q6,q2; cp(pi/32) q6,q1; cp(pi/64) q6,q0; h q5; cp(pi/2) q5,q4; cp(pi/4) q5,q3; cp(pi/8) q5,q2; cp(pi/16) q5,q1; cp(pi/32) q5,q0; h q4; cp(pi/2) q4,q3; cp(pi/4) q4,q2; cp(pi/8) q4,q1; cp(pi/16) q4,q0; h q3; cp(pi/2) q3,q2; cp(pi/4) q3,q1; cp(pi/8) q3,q0; h q2; cp(pi/2) q2,q1; cp(pi/4) q2,q0; h q1; cp(pi/2) q1,q0; h q0; swap q0,q7; swap q1,q6; swap q2,q5; swap q3,q4; }
gate mcphase(param0) q0,q1,q2 { cx q0,q2; rz(-16*pi) q2; cx q1,q2; rz(16*pi) q2; cx q0,q2; rz(-16*pi) q2; cx q1,q2; rz(16*pi) q2; crz(32*pi) q0,q1; p(16*pi) q0; }
gate mcphase_133960471649872(param0) q0,q1,q2 { cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; crz(16*pi) q0,q1; p(8*pi) q0; }
gate mcphase_133960471649104(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471647040(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471649008(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471644832(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471647616(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471648768(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471648192(param0) q0,q1,q2 { cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; crz(16*pi) q0,q1; p(8*pi) q0; }
gate mcphase_133960471655392(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471648480(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471645168(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471647088(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960473364576(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960480435536(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960479736512(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960479743664(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471609072(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471601584(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471595632(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471606864(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471601872(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471607392(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471597888(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471602160(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471593664(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471602880(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471601104(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471601200(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471601392(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471608880(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471602064(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471609216(param0) q0,q1,q2 { cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; cx q0,q2; rz(-8*pi) q2; cx q1,q2; rz(8*pi) q2; crz(16*pi) q0,q1; p(8*pi) q0; }
gate mcphase_133960471593952(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471609120(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471602256(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471596496(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471604944(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471595296(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471601440(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471599424(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471596688(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471593616(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471596640(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471603888(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471603360(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471607152(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471597312(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471595440(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471608400(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471600192(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471598848(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471597216(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471609168(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471597552(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471594432(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471603264(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471595008(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471594096(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471609312(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471600480(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471603456(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471603504(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471606240(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471600720(param0) q0,q1,q2 { cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; cx q0,q2; rz(-4*pi) q2; cx q1,q2; rz(4*pi) q2; crz(8*pi) q0,q1; p(4*pi) q0; }
gate mcphase_133960471594000(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471594816(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471606048(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471594384(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471599280(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471605664(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471605232(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471605040(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471607488(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471593280(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471594720(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471594768(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471596832(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471594960(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471593184(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471594624(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471596784(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471596592(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471594672(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471608592(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471605280(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471604896(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471604992(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471604704(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471604800(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471596304(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471595968(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471602544(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471605568(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471608112(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471607680(param0) q0,q1,q2 { cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; crz(0.02454369260617026) q0,q1; p(0.01227184630308513) q0; }
gate mcphase_133960471607584(param0) q0,q1,q2 { cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; cx q0,q2; rz(-2*pi) q2; cx q1,q2; rz(2*pi) q2; crz(4*pi) q0,q1; p(2*pi) q0; }
gate mcphase_133960471608256(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471608064(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471608304(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471608448(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471328432(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471699552(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471706080(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471692496(param0) q0,q1,q2 { cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; cx q0,q2; rz(-pi) q2; cx q1,q2; rz(pi) q2; crz(2*pi) q0,q1; p(pi) q0; }
gate mcphase_133960471692544(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471696720(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471696624(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471695232(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471700560(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471696864(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471699696(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471706176(param0) q0,q1,q2 { cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; cx q0,q2; rz(-pi/2) q2; cx q1,q2; rz(pi/2) q2; crz(pi) q0,q1; p(pi/2) q0; }
gate mcphase_133960471697536(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471703200(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471697104(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471704736(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471695520(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471699456(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471704112(param0) q0,q1,q2 { cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; crz(0.02454369260617026) q0,q1; p(0.01227184630308513) q0; }
gate mcphase_133960471699648(param0) q0,q1,q2 { cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; cx q0,q2; rz(-pi/4) q2; cx q1,q2; rz(pi/4) q2; crz(pi/2) q0,q1; p(pi/4) q0; }
gate mcphase_133960471703248(param0) q0,q1,q2 { cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; cx q0,q2; rz(-pi/8) q2; cx q1,q2; rz(pi/8) q2; crz(pi/4) q0,q1; p(pi/8) q0; }
gate mcphase_133960471700416(param0) q0,q1,q2 { cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; cx q0,q2; rz(-pi/16) q2; cx q1,q2; rz(pi/16) q2; crz(pi/8) q0,q1; p(pi/16) q0; }
gate mcphase_133960471703056(param0) q0,q1,q2 { cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; cx q0,q2; rz(-pi/32) q2; cx q1,q2; rz(pi/32) q2; crz(pi/16) q0,q1; p(pi/32) q0; }
gate mcphase_133960471702960(param0) q0,q1,q2 { cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; cx q0,q2; rz(-pi/64) q2; cx q1,q2; rz(pi/64) q2; crz(pi/32) q0,q1; p(pi/64) q0; }
gate mcphase_133960471706416(param0) q0,q1,q2 { cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; cx q0,q2; rz(-0.02454369260617026) q2; cx q1,q2; rz(0.02454369260617026) q2; crz(pi/64) q0,q1; p(0.02454369260617026) q0; }
gate mcphase_133960471703920(param0) q0,q1,q2 { cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; cx q0,q2; rz(-0.01227184630308513) q2; cx q1,q2; rz(0.01227184630308513) q2; crz(0.02454369260617026) q0,q1; p(0.01227184630308513) q0; }
gate mcphase_133960471696336(param0) q0,q1,q2 { cx q0,q2; rz(-0.006135923151542565) q2; cx q1,q2; rz(0.006135923151542565) q2; cx q0,q2; rz(-0.006135923151542565) q2; cx q1,q2; rz(0.006135923151542565) q2; crz(0.01227184630308513) q0,q1; p(0.006135923151542565) q0; }
gate qft_dg q0,q1,q2,q3,q4,q5,q6,q7 { swap q3,q4; swap q2,q5; swap q1,q6; swap q0,q7; h q0; cp(-pi/2) q1,q0; h q1; cp(-pi/4) q2,q0; cp(-pi/2) q2,q1; h q2; cp(-pi/8) q3,q0; cp(-pi/4) q3,q1; cp(-pi/2) q3,q2; h q3; cp(-pi/16) q4,q0; cp(-pi/8) q4,q1; cp(-pi/4) q4,q2; cp(-pi/2) q4,q3; h q4; cp(-pi/32) q5,q0; cp(-pi/16) q5,q1; cp(-pi/8) q5,q2; cp(-pi/4) q5,q3; cp(-pi/2) q5,q4; h q5; cp(-pi/64) q6,q0; cp(-pi/32) q6,q1; cp(-pi/16) q6,q2; cp(-pi/8) q6,q3; cp(-pi/4) q6,q4; cp(-pi/2) q6,q5; h q6; cp(-0.02454369260617026) q7,q0; cp(-pi/64) q7,q1; cp(-pi/32) q7,q2; cp(-pi/16) q7,q3; cp(-pi/8) q7,q4; cp(-pi/4) q7,q5; cp(-pi/2) q7,q6; h q7; }
gate gate_Multiplier q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15 { qft q8,q9,q10,q11,q12,q13,q14,q15; mcphase(64*pi) q3,q7,q15; mcphase_133960471649872(32*pi) q3,q7,q14; mcphase_133960471649104(16*pi) q3,q7,q13; mcphase_133960471647040(8*pi) q3,q7,q12; mcphase_133960471649008(4*pi) q3,q7,q11; mcphase_133960471644832(2*pi) q3,q7,q10; mcphase_133960471647616(pi) q3,q7,q9; mcphase_133960471648768(pi/2) q3,q7,q8; mcphase_133960471648192(32*pi) q3,q6,q15; mcphase_133960471655392(16*pi) q3,q6,q14; mcphase_133960471648480(8*pi) q3,q6,q13; mcphase_133960471645168(4*pi) q3,q6,q12; mcphase_133960471647088(2*pi) q3,q6,q11; mcphase_133960473364576(pi) q3,q6,q10; mcphase_133960480435536(pi/2) q3,q6,q9; mcphase_133960479736512(pi/4) q3,q6,q8; mcphase_133960479743664(16*pi) q3,q5,q15; mcphase_133960471609072(8*pi) q3,q5,q14; mcphase_133960471601584(4*pi) q3,q5,q13; mcphase_133960471595632(2*pi) q3,q5,q12; mcphase_133960471606864(pi) q3,q5,q11; mcphase_133960471601872(pi/2) q3,q5,q10; mcphase_133960471607392(pi/4) q3,q5,q9; mcphase_133960471597888(pi/8) q3,q5,q8; mcphase_133960471602160(8*pi) q3,q4,q15; mcphase_133960471593664(4*pi) q3,q4,q14; mcphase_133960471602880(2*pi) q3,q4,q13; mcphase_133960471601104(pi) q3,q4,q12; mcphase_133960471601200(pi/2) q3,q4,q11; mcphase_133960471601392(pi/4) q3,q4,q10; mcphase_133960471608880(pi/8) q3,q4,q9; mcphase_133960471602064(pi/16) q3,q4,q8; mcphase_133960471609216(32*pi) q2,q7,q15; mcphase_133960471593952(16*pi) q2,q7,q14; mcphase_133960471609120(8*pi) q2,q7,q13; mcphase_133960471602256(4*pi) q2,q7,q12; mcphase_133960471596496(2*pi) q2,q7,q11; mcphase_133960471604944(pi) q2,q7,q10; mcphase_133960471595296(pi/2) q2,q7,q9; mcphase_133960471601440(pi/4) q2,q7,q8; mcphase_133960471599424(16*pi) q2,q6,q15; mcphase_133960471596688(8*pi) q2,q6,q14; mcphase_133960471593616(4*pi) q2,q6,q13; mcphase_133960471596640(2*pi) q2,q6,q12; mcphase_133960471603888(pi) q2,q6,q11; mcphase_133960471603360(pi/2) q2,q6,q10; mcphase_133960471607152(pi/4) q2,q6,q9; mcphase_133960471597312(pi/8) q2,q6,q8; mcphase_133960471595440(8*pi) q2,q5,q15; mcphase_133960471608400(4*pi) q2,q5,q14; mcphase_133960471600192(2*pi) q2,q5,q13; mcphase_133960471598848(pi) q2,q5,q12; mcphase_133960471597216(pi/2) q2,q5,q11; mcphase_133960471609168(pi/4) q2,q5,q10; mcphase_133960471597552(pi/8) q2,q5,q9; mcphase_133960471594432(pi/16) q2,q5,q8; mcphase_133960471603264(4*pi) q2,q4,q15; mcphase_133960471595008(2*pi) q2,q4,q14; mcphase_133960471594096(pi) q2,q4,q13; mcphase_133960471609312(pi/2) q2,q4,q12; mcphase_133960471600480(pi/4) q2,q4,q11; mcphase_133960471603456(pi/8) q2,q4,q10; mcphase_133960471603504(pi/16) q2,q4,q9; mcphase_133960471606240(pi/32) q2,q4,q8; mcphase_133960471600720(16*pi) q1,q7,q15; mcphase_133960471594000(8*pi) q1,q7,q14; mcphase_133960471594816(4*pi) q1,q7,q13; mcphase_133960471606048(2*pi) q1,q7,q12; mcphase_133960471594384(pi) q1,q7,q11; mcphase_133960471599280(pi/2) q1,q7,q10; mcphase_133960471605664(pi/4) q1,q7,q9; mcphase_133960471605232(pi/8) q1,q7,q8; mcphase_133960471605040(8*pi) q1,q6,q15; mcphase_133960471607488(4*pi) q1,q6,q14; mcphase_133960471593280(2*pi) q1,q6,q13; mcphase_133960471594720(pi) q1,q6,q12; mcphase_133960471594768(pi/2) q1,q6,q11; mcphase_133960471596832(pi/4) q1,q6,q10; mcphase_133960471594960(pi/8) q1,q6,q9; mcphase_133960471593184(pi/16) q1,q6,q8; mcphase_133960471594624(4*pi) q1,q5,q15; mcphase_133960471596784(2*pi) q1,q5,q14; mcphase_133960471596592(pi) q1,q5,q13; mcphase_133960471594672(pi/2) q1,q5,q12; mcphase_133960471608592(pi/4) q1,q5,q11; mcphase_133960471605280(pi/8) q1,q5,q10; mcphase_133960471604896(pi/16) q1,q5,q9; mcphase_133960471604992(pi/32) q1,q5,q8; mcphase_133960471604704(2*pi) q1,q4,q15; mcphase_133960471604800(pi) q1,q4,q14; mcphase_133960471596304(pi/2) q1,q4,q13; mcphase_133960471595968(pi/4) q1,q4,q12; mcphase_133960471602544(pi/8) q1,q4,q11; mcphase_133960471605568(pi/16) q1,q4,q10; mcphase_133960471608112(pi/32) q1,q4,q9; mcphase_133960471607680(pi/64) q1,q4,q8; mcphase_133960471607584(8*pi) q0,q7,q15; mcphase_133960471608256(4*pi) q0,q7,q14; mcphase_133960471608064(2*pi) q0,q7,q13; mcphase_133960471608304(pi) q0,q7,q12; mcphase_133960471608448(pi/2) q0,q7,q11; mcphase_133960471328432(pi/4) q0,q7,q10; mcphase_133960471699552(pi/8) q0,q7,q9; mcphase_133960471706080(pi/16) q0,q7,q8; mcphase_133960471692496(4*pi) q0,q6,q15; mcphase_133960471692544(2*pi) q0,q6,q14; mcphase_133960471696720(pi) q0,q6,q13; mcphase_133960471696624(pi/2) q0,q6,q12; mcphase_133960471695232(pi/4) q0,q6,q11; mcphase_133960471700560(pi/8) q0,q6,q10; mcphase_133960471696864(pi/16) q0,q6,q9; mcphase_133960471699696(pi/32) q0,q6,q8; mcphase_133960471706176(2*pi) q0,q5,q15; mcphase_133960471697536(pi) q0,q5,q14; mcphase_133960471703200(pi/2) q0,q5,q13; mcphase_133960471697104(pi/4) q0,q5,q12; mcphase_133960471704736(pi/8) q0,q5,q11; mcphase_133960471695520(pi/16) q0,q5,q10; mcphase_133960471699456(pi/32) q0,q5,q9; mcphase_133960471704112(pi/64) q0,q5,q8; mcphase_133960471699648(pi) q0,q4,q15; mcphase_133960471703248(pi/2) q0,q4,q14; mcphase_133960471700416(pi/4) q0,q4,q13; mcphase_133960471703056(pi/8) q0,q4,q12; mcphase_133960471702960(pi/16) q0,q4,q11; mcphase_133960471706416(pi/32) q0,q4,q10; mcphase_133960471703920(pi/64) q0,q4,q9; mcphase_133960471696336(0.02454369260617026) q0,q4,q8; qft_dg q8,q9,q10,q11,q12,q13,q14,q15; }
qreg q[16];
creg meas[16];
gate_Multiplier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
