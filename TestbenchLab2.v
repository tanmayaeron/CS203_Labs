module xor3_tb();
	reg ra,rb,rc;
	wire wxor3,wxor3_b;
	
	xor3 inst1(.out(wxor3),.in1(ra),.in2(rb),.in3(rc));
	xor3_b inst2(.out(wxor3_b),.in1(ra),.in2(rb),.in3(rc));
	
	initial
		begin
			ra = 1'b0; rb = 1'b0; rc = 1'b0;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b0; rb = 1'b0; rc = 1'b1;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b0; rb = 1'b1; rc = 1'b0;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b0; rb = 1'b1; rc = 1'b1;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b1; rb = 1'b0; rc = 1'b0;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b1; rb = 1'b0; rc = 1'b1;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b1; rb = 1'b1; rc = 1'b0;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
			ra = 1'b1; rb = 1'b1; rc = 1'b1;
			#10
			$display("in1: %b, in2: %b, in3: %b, output_xor3: %b, output_xor3_b: %b",ra,rb,rc,wxor3,wxor3_b);
		end
	initial
		begin
			$dumpfile("xor3.vcd");
			$dumpvars;
		end
endmodule