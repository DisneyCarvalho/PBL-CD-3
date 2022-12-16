module principal (temp,echeio,sa,se,acss,clk,saida);
	input echeio,sa,se,clk,temp;
	input [2:0] acss;
	output reg [6:0] saida;
	
	reg [2:0] state;

	
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;  
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110; 
	
	
	initial begin
	state <= S0;
	end
	
	always @ (posedge clk) begin
		case (state)
			S0 : if (!echeio & !sa & !se) state <= S0;
				else if (!echeio & sa & !se) state <= S1;
				else if (echeio) state <= S6;
				
			S1 : if (acss) state <= S2;
				else if (!sa) state <= S0;
			
			S2 : if (!echeio & sa & !se & acss[2] & !acss[1] & !acss[0]) state <= S3;
				else if (!echeio & !acss[2] & !acss[1] & acss[0]) state <= S5;
				else if (!echeio & !acss[2] & acss[1] & !acss[0]) state <= S0;
				
			S3 : if (!echeio & sa & !se) state <= S3;
				else if (!echeio & sa & se) state <= S4;
				else if (!echeio & !sa & !se) state <=S0;
				else if (echeio) state <= S6;
				
			S4 : if (!echeio & sa & se) state <= S4;
				else if (!echeio & !se) state <= S0;
				else if (echeio) state <= S6;
			
			S5 : if (temp) state <= S5;
			else if (!echeio) state <= S0;
			
			S6 : if (echeio) state <= S6;
				else if (!echeio) state <= S0;

		endcase
	end
	
	always @ (state) begin 
		case (state) 
			S0:	saida =	7'b0000000;
			S1:	saida =  7'b1000000;
			S2:	saida =	7'b0000000;
			S3:	saida =	7'b0101011;
			S4:	saida =	7'b0011001;
			S5:	saida =	7'b0010100;
			S6:	saida =	7'b0000010;
		endcase
	end
endmodule 