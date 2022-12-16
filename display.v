
module display(clock,cont,dis,s7,s4);
	input clock;
	input [2:0] dis;
	input [1:0] cont;
	output reg [3:0] s4;
	output reg [6:0] s7;
	

	

	
	always @ (*)begin 
		case (cont)
			2'b00 : if (dis == 3'b001) s7 = 7'b0011000; //pare
				else if (dis == 3'b010) s7 = 7'b0000001; //ocup
				else if (dis == 3'b100) s7 = 7'b0110000; //erro
				else if (dis == 3'b011) s7 = 7'b0100100; //siga
				else s7 = 7'b1111111; //off
				
			2'b01 : if (dis == 3'b001) s7 = 7'b0001000; //pare
				else if (dis == 3'b010) s7 = 7'b0110001; //ocup
				else if (dis == 3'b100) s7 = 7'b1111010; //erro
				else if (dis == 3'b011) s7 = 7'b1111001; //siga
				else s7 = 7'b1111111; //off
				
			2'b10 : if (dis == 3'b001) s7 = 7'b1111010; //pare
				else if (dis == 3'b010) s7 = 7'b1000001; //ocup
				else if (dis == 3'b100) s7 = 7'b1111010; //erro
				else if (dis == 3'b011) s7 = 7'b0000100; //siga
				else s7 = 7'b1111111; //off
				
			2'b11 : if (dis == 3'b001) s7 = 7'b0110000; //pare
				else if (dis == 3'b010) s7 = 7'b0011000; //ocup
				else if (dis == 3'b100) s7 = 7'b0000001; //erro
				else if (dis == 3'b011) s7 = 7'b0001000; //siga
				else s7 = 7'b1111111; //off
				
		endcase
	end 
	always @ (*)begin 
		case (cont)
			2'b00 :	s4 = 4'b0111;
			2'b01 :  s4 = 4'b1011;
			2'b10 :  s4 = 4'b1101;
			2'b11 :  s4 = 4'b1110;
		endcase 
	end
	
endmodule 