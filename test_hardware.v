module test_hardware(
 input CLOCK_50,
input [9:0]SW,
input [0:0]KEY,
output [9:0]LEDR,
output [7:0]LEDG,

output [6:0]HEX0

);

wire [7:0]OUT;
wire [2:0]IR75out;
wire [3:0]StateOUT;
	Integrate lmao(CLOCK_50,KEY[0],SW[0],3,LEDR[0],OUT,LEDR[9:7],LEDG[3:0]);
	decoder decode(OUT[3:0],HEX0);
endmodule

//	Integrate lmao(clock,reset,enter,Nin,halt,Nout,IR75out,StateNoout);
