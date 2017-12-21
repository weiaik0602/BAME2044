module addSub(
	input Cin,
	input [7:0]A,M,
	output [7:0]OUT)
	;
	reg [8:0]ans;
	always begin
		if(Cin)
			ans=A-M;
		else
			ans=A+M;
	end
		
		assign OUT=ans[7:0];		
endmodule
