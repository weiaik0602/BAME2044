module test_hardware(
 input CLOCK_50,
input [9:0]SW,
input [0:0]KEY,
output [9:0]LEDR
);

wire clkoutput;
lab4B_p2_code clkout(2'b01,CLOCK_50,~reset,clkoutput);
lab_cu CU(clkoutput,KEY,SW[0],SW[1],SW[2],SW[5:3],LEDR[9],LEDR[8],LEDR[7],LEDR[6],LEDR[5],LEDR[4:3],LEDR[2],LEDR[1],LEDR[0]);

endmodule

/* input clock,
 input reset,enter,Aeq0,Apos,
 input [2:0]IR,
 output reg IRload,JMPmux,PCload,Meminst,MemWr,
 output reg [1:0]Asel,
 output reg Aload,Sub,Halt,
 );
 );*/