module lab4_tb();
	reg clock,in1,in2,in3,in4,in5;
	wire out_lt;
	reg [3:0] in_sb;
	wire [3:0] out_sb;
	reg [31:0] memory [2:0];
	
	initial 
		clock = 1'b0;
		
	always
	    #10 clock=~clock;
		
	initial
		#1000 $finish;
	
	logic_tile inst1(.out(out_lt),.clock(clock),.in1(in1),.in2(in2),.in3(in3),.in4(in4),.in5(in5));
	switch_box_4x4 inst2(.out(out_sb),.in(in_sb));
		
	initial
		begin
			$readmemh("lab4_mem.bin",memory);
          	inst1.mem[31:0]=memory[0];
          	inst1.mem[32]=memory[1];
          	inst2.configure=memory[2];
		end
		
	initial
		begin
			in1=1'b0; in2=1'b0; in3=1'b1;in4=1'b1;in5=1'b0;
			#20
			$display("in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, muxcontrol: %b, clock: %b,output: %b",in1,in2,in3,in4,in5,memory[1][0],clock,out_lt);
			in1=1'b1; in2=1'b1; in3=1'b1;in4=1'b1;in5=1'b1;
			#5
			$display("in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, muxcontrol: %b, clock: %b,output: %b",in1,in2,in3,in4,in5,memory[1][0],clock,out_lt);
			#15
			$display("in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, muxcontrol: %b, clock: %b,output: %b",in1,in2,in3,in4,in5,memory[1][0],clock,out_lt);
			in_sb=4'b0101;
			#20
			$display("input: %b, output: %b",in_sb,out_sb);
			in_sb=4'b0011;
			#20
			$display("input: %b, output: %b",in_sb,out_sb);
		end
		
		
	initial
		begin
			$dumpfile("project_1.vcd");
			$dumpvars;
		end
	
endmodule
