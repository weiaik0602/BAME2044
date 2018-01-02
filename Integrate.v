module Integrate(
input clock,
input reset,enter,
input [7:0]Nin,
output halt,
output [7:0]Nout,
output [2:0]IR75out,
output [3:0]StateNoout
);
 /*
 reg Aeq0,Apos;
 wire [2:0]IR75; 

 wire IRload,JMPmux,PCload,Meminst,MemWr;
 wire [1:0]Asel;
 wire Aload,Sub,Halt;
 wire  [3:0]StateNo;*/

wire clkoutput;
wire IRload,JMPmux,PCload,Meminst,MemWr;
wire [1:0]Asel;
wire Aload,Sub;
wire  Aeq0,Apos;
wire [2:0]IR75;
wire [3:0]StateNo;
wire [4:0]meminst;
wire [7:0]da70,q70,ir70;
wire [4:0]pc40,a70;
lab4B_p2_code clkout(2'b01,clock,~reset,clkoutput);

//IR=3'b110; 
lab_cu CU(clkoutput,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt,StateNo);
lab_dp_pro DP(clkoutput,reset,Nin,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Aeq0,Apos,IR75,Nout,meminst,da70,q70,ir70,pc40,a70);

assign IR75out=IR75;
assign StateNoout=StateNo;
endmodule
/*
input clock,
input reset,
input [7:0]Input,
input IRload,JMPmux,PCload,Meminst,MemWr,
input [1:0]Asel,
input Aload,Sub,
output  Aeq0,Apos,
output [2:0]IR75,
output [7:0]OUT,
output [4:0]meminst,
output [7:0]da70,q70,ir70,
output [4:0]pc40,a70

 input clock,
 input reset,enter,Aeq0,Apos,
 input [2:0]IR,
 output reg IRload,JMPmux,PCload,Meminst,MemWr,
 output reg [1:0]Asel,
 output reg Aload,Sub,Halt,
 output  [3:0]StateNo
 );
*/