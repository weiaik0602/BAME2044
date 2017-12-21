module ModuleReg(clock,load,clear,IN,OUT);
  parameter size =8;
	input clock;
	input load,clear;
	input [size-1:0]IN;
	output reg[size-1:0]OUT;
	
	
	always@(posedge clock,negedge clear)
	if(~clear)
		OUT<=0;
	else
		if(load)
			OUT<=IN;
		else
			OUT<=OUT;
			
endmodule
