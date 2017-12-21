module lab_dp_tb();
reg clock;
reg reset;
reg [7:0]Input;
reg IRload,JMPmux,PCload,Meminst,MemWr;
reg [1:0]Asel;
reg Aload,Sub;
wire  Aeq0,Apos;
wire [2:0]IR75;
wire [7:0]OUT;
wire [4:0]meminst;
wire [7:0]da70,q70,ir70;
wire [4:0]pc40,a70;
//////////////////////////////////////////
parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b1000,S4=4'b1001,S5=4'b1010,S6=4'b1011,S7=4'b1100,S8=4'b1101,S9=4'b1110,S10=4'b1111;
reg [4:0]expected;
reg [3:0]state;
reg Aeq0reg=0,Aposreg=0;	
reg [2:0]IR75reg=0;
reg [4:0]simulated;


integer errors;
initial begin
	clock=0;
	forever #5 clock=~clock;
	end
	
initial begin
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=0;
	Input=0;
	reset_task();
	errors=0;
	loopKeyin();
	
	
	
	
	#3 $finish;
	end


lab_dp_pro DP2(clock,reset,Input,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,Aeq0,Apos,IR75,OUT,meminst,da70,q70,ir70,pc40,a70);
//////////////////////////////////////////////////////
task loopKeyin;
	begin
	/*
	while(1)begin
	
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=10'b0000001100;
	#500;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=10'b0000000110;
	#500;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=10'b0100000000;
	#500;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=10'b0100000000;
	#500;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=10'b0000000001;
	#500;
	*/
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000000000;  //S0
	#500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b101000000;  //S1
	#500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000100000;  //S2
	#500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000001010;  //S3
	#500;
	reset_task();
  {IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000000010;  //S5	
	#500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000110000;  //S4
	#500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000000011;  //S6
	#1500;
	reset_task();
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000000110;  //S7
	#500;
	reset_task();
	IR75reg=3'b101;
	#2;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b010000000;  //S8
	#500;
	reset_task();
	IR75reg=3'b101;
	#2;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b011000000;  //S8
	#500;
	reset_task();
	IR75reg=3'b110;
	#2;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b010000000;  //S9
	#500;
	reset_task();
	IR75reg=3'b110;
	#2;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b011000000;  //S9
	#500;
	reset_task();
	IR75reg=3'b111;
	#2;
	{IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub}=9'b000000000;  //S10
	#500;
	reset_task();
	
	//end
	end
	endtask
//////////////////////////////////////////////////////
task reset_task;
	begin
	reset=0;
	#1 reset=1;
	end
	endtask
//////////////////////////////////////////////////////
always@({IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub})begin
case({IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub})
	9'b000000000:begin
	             if(IR75reg==3'b111)begin
					   	   state=S10;
					     end
					     else begin
						    state=S0;
					     end
					end
	9'b101000000:state=S1;
	9'b000100000:state=S2;
	9'b000001010:state=S3;
	9'b000110000:state=S4;
	9'b000000010:state=S5;
	9'b000000011:state=S6;
	9'b000000110:state=S7;
	9'b010000000:begin 
					if(IR75reg==3'b101)begin
						state=S8;
						Aeq0reg=0;
					end
					else if(IR75reg==3'b110)begin
						state=S9;
						Aposreg=0;
					end
					end
	9'b011000000:begin 
					if(IR75reg==3'b101)begin
						state=S8;
						Aeq0reg=1;
					end
					else if(IR75reg==3'b110)begin
						state=S9;
						Aposreg=1;
					end
					end
	//9'b000000000:state=S10;
	default:$display("Wrong!!!");
endcase
end
/////////////////////////////////////////////////////////
always@(state)begin
case(state)
  S0:expected=5'bxxxx;
  S1:expected=5'bxxxx;
  S2:expected=5'bxxxx;
	S3:expected={3'b000,Aeq0,Apos};
	S4:expected={3'b001,Aeq0,Apos};
	S5:expected={3'b010,Aeq0,Apos};
	S6:expected={3'b011,Aeq0,Apos};
	S7:expected={3'b100,Aeq0,Apos};
	S8:expected={3'b101,Aeq0,Apos};
	S9:expected={3'b110,Aeq0,Apos};
	S10:expected={3'b111,Aeq0,Apos};
	default:expected=expected+1;
endcase
end


always@(state) begin
    if(state==S8||state==S9)
      simulated={IR75reg,Aeq0reg,Aposreg};
    else if(state==S0||state==S10)
      simulated={IR75reg,Aeq0,Apos};
    else
      simulated={IR75,Aeq0,Apos};
  end
  
    
//////////////////////////////////////////////////////////
always@(simulated,expected)begin
		if(simulated!=expected)begin
			errors=errors+1;
			$display("Simulated Value = %b ,Expected Value = %b ,Errors = %d,At time %d\n",simulated,expected,errors,$time);
			end
		else begin
			//if(StateNo>7)
				$display("Well done! You are good at state %h",state);
			//$monitor("%h            | %h        | %h   ",StateNo,expected,simulated);
			 //if(StateNo>7)
				//$display("Well done! You are good at state %h",StateNo);
			end
	end
endmodule
