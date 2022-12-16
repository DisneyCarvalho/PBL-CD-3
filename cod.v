module cod(bot,digit,sbot);  
	input [3:0] bot;  
	output digit;  
	output [1:0] sbot;    
	
	
	wire fio1,fio2,fio3;
	
	or (digit, bot[3],bot[2],bot[1],bot[0]);    
	
	and(fio1,!bot[3],bot[2],!bot[1],!bot[0]);    
	and(fio2,bot[3],!bot[2],!bot[1],!bot[0]);  
	and(fio3,!bot[3],!bot[2],bot[1],!bot[0]);     
	or (sbot[1],fio1,fio2);  
	or(sbot[0],fio2,fio3);   
	
endmodule