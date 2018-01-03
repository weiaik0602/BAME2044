module Integrate(
input clock,
input reset,enter,
input [7:0]Nin,
output halt,
output [7:0]Nout,
output [2:0]IR75out,
output [3:0]StateNoout
);


wire IRload,JMPmux,PCload,Meminst,MemWr;
wire [1:0]Asel;
wire Aload,Sub;
wire  Aeq0,Apos;
wire [2:0]IR75;
wire [3:0]StateNo;
wire [4:0]meminst;
wire [7:0]da70,q70,ir70;
wire [4:0]pc40,a70;

lab_cu CU(clock,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt,StateNo);
lab_dp_pro DP(clock,reset,Nin,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Aeq0,Apos,IR75,Nout,meminst,da70,q70,ir70,pc40,a70);

assign IR75out=IR75;
assign StateNoout=StateNo;
endmodule
