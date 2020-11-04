module mux4(out,in,c1,c0);
	input [3:0] in;
	input c0,c1;
	output out;
	wire c0neg,c1neg;
  	assign c0neg=~c0;
        assign c1neg=~c1;
        assign out = (c0neg&c1neg&in[0]) | (c0&c1neg&in[1]) | (c0neg&c1&in[2]) | (c0&c1&in[3]);
endmodule

module flipflop(q,qneg,d,clock);
	output q,qneg;
	input d,clock;
	reg q,qneg;
	always@(posedge clock)
	begin
		q<=d;
		qneg=!d;
	end
endmodule

module logic_tile(out,clock,in1,in2,in3,in4,in5);
	input clock,in1,in2,in3,in4,in5;
	output out;
	wire [9:0] temp;
	reg result,out;
	reg [32:0] mem;
	genvar i;
	generate for(i=0;i<=7;i=i+1)
	    begin: level1mux
			mux4 m1(temp[i],mem[4*i+3:4*i],in2,in1);
            end
	endgenerate
	mux4 m2(temp[8],temp[3:0],in4,in3);
	mux4 m3(temp[9],temp[7:4],in4,in3);
	always@(*)
		begin
			if(in5)
			result = temp[9];
			else
			result = temp[8];
		end
	wire syncresult,syncresultneg;
	flipflop f1(syncresult,syncresultneg,result,clock);
	always@(*)
		begin
			if(mem[32])
			out=syncresult;
			else
			out=result;
		end
endmodule
	
module switch_box_4x4(out,in);
	input [3:0] in;
	output [3:0] out;
	reg [15:0] configure;
	assign out[0]=(configure[0]&in[0])|(configure[1]&in[1])|(configure[2]&in[2])|(configure[3]&in[3]);
	assign out[1]=(configure[4]&in[0])|(configure[5]&in[1])|(configure[6]&in[2])|(configure[7]&in[3]);
	assign out[2]=(configure[8]&in[0])|(configure[9]&in[1])|(configure[10]&in[2])|(configure[11]&in[3]);
	assign out[3]=(configure[12]&in[0])|(configure[13]&in[1])|(configure[14]&in[2])|(configure[15]&in[3]);
endmodule
