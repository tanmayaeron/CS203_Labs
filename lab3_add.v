module full_adder(sum,cout,p,g,a,b,cin);
	input a,b,cin;
	output sum,cout,p,g;
	and #1 u1(g,a,b);
	or #1 u2(p,a,b);
	xor #4 u3(sum,a,b,cin);
	wire m,n,o;
	and #1 u4(m,a,b);
	and #1 u5(n,a,cin);
	and #1 u6(o,b,cin);
	or #2 u7(cout,m,n,o);
endmodule

module add16_rc(sum16,cout,a16,b16,cin);
	input [15:0] a16,b16;
	input cin;
	output [15:0] sum16;
	output cout;
	wire [14:0] carry;
	full_adder q1(.sum(sum16[0]),.cout(carry[0]),.a(a16[0]),.b(b16[0]),.cin(cin));
	genvar i;
	generate for(i=1;i<=14;i=i+1)
		begin: full_adder_loop
			full_adder q2(.sum(sum16[i]),.cout(carry[i]),.a(a16[i]),.b(b16[i]),.cin(carry[i-1]));
		end
	endgenerate
	full_adder q3(.sum(sum16[15]),.cout(cout),.a(a16[15]),.b(b16[15]),.cin(carry[14]));
endmodule

module carry_generator(couts,p,g,cin);
	input [3:0] p,g;
	input cin;
	output [3:0] couts;
	wire [9:0] temp;
	and #1 s1(temp[0],cin,p[0]);
	or #1 s2(couts[0],temp[0],g[0]);
	and #2 s3(temp[1],cin,p[0],p[1]);
	and #1 s4(temp[2],g[0],p[1]);
	or #2 s5(couts[1],g[1],temp[1],temp[2]);
	and #2 s6(temp[3],cin,p[0],p[1],p[2]);
	and #2 s7(temp[4],p[2],p[1],g[0]);
	and #1 s8(temp[5],p[2],g[1]);
	or #2 s9(couts[2],g[2],temp[5],temp[4],temp[3]);
	and #3 s10(temp[6],p[3],p[2],p[1],p[0],cin);
	and #2 s11(temp[7],p[3],p[2],p[1],g[0]);
	and #2 s12(temp[8],p[3],p[2],g[1]);
	and #1 s13(temp[9],p[3],g[2]);
	or #3 s14(couts[3],g[3],temp[9],temp[8],temp[7],temp[6]);
endmodule

module add4_cla(sum4,gg,gp,cout,a4,b4,cin);
	input [3:0] a4,b4;
	input cin;
	output [3:0] sum4;
	output gg,gp,cout;
	wire [3:0] wp,wg;
	genvar i;
	generate for(i=0;i<4;i=i+1)
		begin: prop_gen_loop
			full_adder q1(.p(wp[i]),.g(wg[i]),.a(a4[i]),.b(b4[i]),.cin(cin));
		end
	endgenerate
	and #2 q7(gp,wp[0],wp[1],wp[2],wp[3]);
	wire [2:0] temporary;
	and #2 q8(temporary[0],wg[0],wp[1],wp[2],wp[3]);
	and #2 q9(temporary[1],wg[1],wp[2],wp[3]);
	and #1 q10(temporary[2],wg[2],wp[3]);
	or #2 q11(gg,wg[3],temporary[2],temporary[1],temporary[0]);
	wire [3:0] couts;
	carry_generator q2(couts,wp,wg,cin);
	assign cout = couts[3];
	full_adder q3(.sum(sum4[0]),.a(a4[0]),.b(b4[0]),.cin(cin));
	full_adder q4(.sum(sum4[1]),.a(a4[1]),.b(b4[1]),.cin(couts[0]));
	full_adder q5(.sum(sum4[2]),.a(a4[2]),.b(b4[2]),.cin(couts[1]));
	full_adder q6(.sum(sum4[3]),.a(a4[3]),.b(b4[3]),.cin(couts[2]));
endmodule

module add16_cla(sum16,cout,a16,b16,cin);
	input [15:0] a16,b16;
	input cin;
	output [15:0] sum16;
	output cout;
	genvar i;
	wire [3:0] gg4,gp4;
	generate for(i=0;i<4;i=i+1)
		begin: groupgenprop_loop
			add4_cla e1(.gg(gg4[i]),.gp(gp4[i]),.a4(a16[4*i+3:4*i]),.b4(b16[4*i+3:4*i]),.cin(cin));
		end	
	endgenerate
	wire [3:0] groupcout;
	carry_generator e2(groupcout,gp4,gg4,cin);
	add4_cla e3(.sum4(sum16[3:0]),.a4(a16[3:0]),.b4(b16[3:0]),.cin(cin));
	add4_cla e4(.sum4(sum16[7:4]),.a4(a16[7:4]),.b4(b16[7:4]),.cin(groupcout[0]));
	add4_cla e5(.sum4(sum16[11:8]),.a4(a16[11:8]),.b4(b16[11:8]),.cin(groupcout[1]));
	add4_cla e6(.sum4(sum16[15:12]),.a4(a16[15:12]),.b4(b16[15:12]),.cin(groupcout[2]));
	assign cout = groupcout[3];
endmodule