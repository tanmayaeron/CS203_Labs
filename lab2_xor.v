module xor2(out,in1,in2);
	input in1,in2;
	output out;
	wire p,q,r,s;
	not u1(p,in1);
	not u2(q,in2);
	and u3(r,in1,q);
	and u4(s,in2,p);
	or u5(out,r,s);
endmodule

module xor3(out,in1,in2,in3);
	input in1,in2,in3;
	output out;
	wire w;
	xor2 u5(w,in1,in2);
	xor2 u6(out,w,in3);
endmodule

module xor3_b(out,in1,in2,in3);
	input in1,in2,in3;
	output out;
	wire a,b,c,d,e,f,g,h,i;
	assign a = ~in1;
	assign b = ~in2;
	assign c = in1&b;
	assign d = in2&a;
	assign e = c|d;
	assign f = ~e;
	assign g = ~in3;
	assign h = e&g;
	assign i = f&in3;
	assign out = h|i;
endmodule