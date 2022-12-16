module bpl3 (chaves,clock,bot,s7,s4,rgb,canc);
	input clock;
	input [2:0] chaves;
	input [3:0] bot;
	output canc;
	output [6:0] s7;
	output [3:0] s4;
	output [2:0] rgb;
	
	assign canc = saida[5];  //cancela
		
	wire dcont,temp,inatv5;
	
	pulse(clk[22],!bot[3],tbot[3]);
	pulse(clk[22],!bot[2],tbot[2]);
	pulse(clk[22],!bot[1],tbot[1]);
	pulse(clk[22],!bot[0],tbot[0]);
	
	wire [3:0] tbot;
	
	wire [22:0] clk;
	divisor(clock,clk);
	divisor20(clk[22],temp, !saida[6],inatv5,!saida[2]);
	wire [1:0] sbot;
	cod(tbot,dcont,sbot);
	
	
	wire [6:0] saida; //saida maquina principal
	wire [2:0] acss; 
   senha(clk[22], dcont , sbot , temp, saida[6], acss);
	
	principal(inatv5,chaves[0],chaves[1],chaves[2],acss,clk[22],saida);
	
	//Fio q vai para ser a seletora do display 7 segmentos
	assign cont[0] = clk[18];
	assign cont[1] = clk[19];
	wire [1:0] cont;

	display(clk[20], cont, saida[2:0],s7,s4);
	
	
	decodrgb(clk[22],saida[4:3],rgb);
	
endmodule 