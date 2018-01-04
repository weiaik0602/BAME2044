module lab4B_p2(
input [1:0]s,
input clk,reset,
	output reg Q
);


integer counter;
integer temp;

always @(s)begin
	case({s})
			2'b00:temp<=50000000;
			2'b01:temp<=10000000;            //ori is 25000000
			2'b10:temp<=110000000;
			2'b11:temp<=5000000;
	endcase
	end
always @(posedge reset or posedge clk) begin
	if(reset==1)
	begin
	Q<=0;	
	counter<=0;
	end
	else begin
		if(counter<=temp)
			counter<=counter+1;
		else
			begin
			counter<=0;
			Q<=~Q;
			end
      end
end
endmodule




