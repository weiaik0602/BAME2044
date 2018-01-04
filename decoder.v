module decoder(
	input [3:0]in,
	output reg [6:0]out
	);
	
	reg [6:0]temp;
	always @(in) begin
	case(in)
		4'b0000:temp=7'b1000000;
		4'b0001:temp=7'b1111001;
		4'b0010:temp=7'b0100100;
		4'b0011:temp=7'b0110000;
		4'b0100:temp=7'b0011001;
		4'b0101:temp=7'b0010010;
		4'b0110:temp=7'b0000010;
		4'b0111:temp=7'b1111000;
		4'b1000:temp=7'b0000000;
		4'b1001:temp=7'b0011000;
		default:temp=7'b1111111;
		endcase
		
		out=temp;
		end
		
		endmodule
		
	
		