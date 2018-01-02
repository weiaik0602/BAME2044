module lab_cu(
 input clock,
 input reset,enter,Aeq0,Apos,
 input [2:0]IR,
 output reg IRload,JMPmux,PCload,Meminst,MemWr,
 output reg [1:0]Asel,
 output reg Aload,Sub,Halt,
 output  [3:0]StateNo
 );

reg [3:0]state,n_state;
reg [9:0]temp;
wire clkoutput;
parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b1000,S4=4'b1001,S5=4'b1010,S6=4'b1011,S7=4'b1100,S8=4'b1101,S9=4'b1110,S10=4'b1111;



always @ (posedge clock, negedge reset) begin
	if(reset==0) 
		state<=S0;
	else
		state<=n_state;
	end
	
always@(state,enter)
	case(state)
	S0:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000000000;
		n_state=S1;
		end
	S1:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b1010000000;
		n_state=S2;
		end
	S2:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0001000000;
		case(IR)
		3'b000:n_state=S3;
		3'b001:n_state=S4;
		3'b010:n_state=S5;
		3'b011:n_state=S6;
		3'b100:n_state=S7;
		3'b101:n_state=S8;
		3'b110:n_state=S9;
		3'b111:n_state=S10;
		endcase
		end
	S3:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000010100;
		n_state=S0;
		end
	S4:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0001100000;
		n_state=S0;
		end
	S5:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000000100;
		n_state=S0;
		end
	S6:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000000110;
		n_state=S0;
		end
	S7:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000001100;
		if(enter==1)
			n_state=S0;
		else
			n_state=S7;
		end
	S8:begin
		if(Aeq0==0)
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0100000000;
		else
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0110000000;
		n_state=S0;
		end
	S9:begin
		if(Apos==0)
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0100000000;
		else
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0110000000;
		n_state=S0;
		end
	S10:begin
		{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Halt}=10'b0000000001;
		n_state=S10;
		end
	default:n_state=S0;
	endcase
	
 assign StateNo=state;
endmodule
