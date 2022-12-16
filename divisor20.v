module divisor20(clock,s1,reset,s2,reset2);
	input clock,reset,reset2;
	output reg s1;
	output s2;
	
	reg [5:0] conta;
   reg [3:0] inat;
	reg [3:0] clock2;
	
	initial begin
	conta <= 4'b0000;
	inat <= 4'b0000;
	end
	
	always @ (posedge clock,posedge reset)begin
		if (reset) begin 
		conta <= 4'b0000;
		end
		else begin 
		conta <= conta + 4'b0001;
		end
	end		

	always @ (posedge conta[3],posedge reset) begin 
		if (reset) begin
			s1 <= 1'b0;
			inat <= 4'b0000;
		end
		else if (inat[3]) begin
			s1 <= 1'b1;
		end
		else begin
		inat <= inat + 4'b0001;
		end
	end
	
	
	
	always @ (posedge clock,posedge reset2) begin 
		if (reset2) begin
			clock2	<= 4'b0000;
			end
		else begin
			clock2 <= clock2 + 4'b0001;
		end
	end
	
assign s2 = clock2[3];

endmodule