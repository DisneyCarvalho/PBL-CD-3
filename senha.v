module senha(clk, dcont , bot , temp, sinc, acss);
	input temp , dcont,sinc,clk;
	input [1:0] bot;
	output reg [2:0] acss;
	
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
			S0: if (sinc & temp) state <= S6;
				else if (!dcont & !temp) state <= S0;
				else if (sinc & !temp & !bot[1] & !bot[0] & dcont) state <= S1;
				else state <= S5;
				
			S1: if (sinc & temp) state <= S6;
				else if (!dcont & !temp & sinc) state <= S1;
				else if (sinc & !temp & bot[1] & bot[0] & dcont) state <= S2;
				else state <= S5;
				
			S2: if (sinc & temp) state <= S6;
				else if (!dcont & !temp & sinc) state <= S2;
				else if (sinc & !temp & bot[1] & !bot[0] & dcont) state <= S3;
				else state <= S5;
				
			S3: if (sinc & temp) state <= S6;
				else if (!dcont & !temp & sinc) state <= S3;
				else if (sinc & !temp & !bot[1] & bot[0] & dcont) state <= S4;
				else state <= S5;
				
			S4: if (!sinc) state <= S0;
			
			S5: if (!sinc) state <= S0;
			
			S6: if (!sinc) state <= S0;
			default state = S0;
		endcase
	end	
		
	always @ (state) begin 
		case (state) 
		S0: acss = 3'b000;
		S1: acss = 3'b000;
		S2: acss = 3'b000;
		S3: acss = 3'b000;
		S4: acss = 3'b100;
		S5: acss = 3'b001; 
		S6: acss = 3'b010;
		
		endcase
	end

endmodule