module add16_tb();
	reg [15:0] num1,num2;
	reg carryin;
	wire [15:0] sumrc,sumcla;
	wire carryoutrc,carryoutcla;
	add16_rc rc_inst(.sum16(sumrc),.cout(carryoutrc),.a16(num1),.b16(num2),.cin(carryin));
	add16_cla cla_inst(.sum16(sumcla),.cout(carryoutcla),.a16(num1),.b16(num2),.cin(carryin));
	
	initial
		begin
			num1 = 16 'b0000000000000000; num2 = 16 'b1111111111111110; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0101010101010101; num2 = 16 'b1010101010101010; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0111111111111111; num2 = 16 'b0000000000000001; carryin = 1 'b0;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0000000000000000; num2 = 16 'b1111111111111111; carryin = 1 'b0;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b1000010010010010; num2 = 16 'b0111101010011110; carryin = 1 'b0;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0111111010111100; num2 = 16 'b1101100101110110; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0100000110110011; num2 = 16 'b1010101000001110; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b1001011000100000; num2 = 16 'b0010111101011111; carryin = 1 'b0;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0111110011101001; num2 = 16 'b1101010111100001; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);
			num1 = 16 'b0001100011010111; num2 = 16 'b0001111010100111; carryin = 1 'b1;
			#60
		    $display("num1: %b ,num2: %b, carry_in: %b, sum_ripple_carry: %b, sum_cla_adder: %b, carry_rc: %b, carry_cla: %b",num1,num2,carryin,sumrc,sumcla,carryoutrc,carryoutrc);			
		end
		
	initial
		begin
			$dumpfile("adder.vcd");
			$dumpvars;
		end
		
endmodule
