
module decodrgb (clock,bot,rgb);
	input clock;
	input [1:0] bot;
	output [2:0] rgb;
	
	wire fioa,fiob;
	
	not(fioa,bot[1]);
	not(fiob,bot[0]);
	
	
	and(rgb[0],fioa,bot[0]);
	
	and(rgb[1],bot[1],fiob);
	
	and(rgb[2],clock,bot[1],bot[0]);
	
endmodule