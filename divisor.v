module divisor(clock,contar);  
	input clock;  
	output reg [22:0] contar;
	
	initial begin    
	contar = 1'b0;  
	end
	
	always @ (posedge clock) begin    
	contar <= contar + 1'b1;  
	end   

endmodule 