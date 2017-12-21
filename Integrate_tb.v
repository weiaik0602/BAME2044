module integrate_tb();
reg clock;
reg reset,enter;
reg [7:0]Nin;
wire halt;
wire [7:0]Nout;

	
initial begin
	forever #5 enter=~enter;
	end
	
initial begin
	clock=0;
	forever #5 clock=~clock;
	end
		
	initial begin
	{reset,enter,Nin}=0;
	#2 reset=1;
	#2 Nin=9;
	
	#700 reset=0;
	
	
	#1500 $finish;
	end
	Integrate lmao(clock,reset,enter,Nin,halt,Nout);
	endmodule
	