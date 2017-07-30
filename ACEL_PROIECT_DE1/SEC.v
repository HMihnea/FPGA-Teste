module SEC(clk_50, secunde);

	input clk_50;
	output reg secunde;
	
	reg [31:0] cnt;

	always @(posedge clk_50)
	begin
			cnt <= cnt + 1;
			if(cnt == 24_999_999)
			begin
				cnt <= 0;
				secunde = !secunde;
			end
	end
	
endmodule
