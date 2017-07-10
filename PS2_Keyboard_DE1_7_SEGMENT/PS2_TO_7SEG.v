module PS2_TO_7SEG(clk, rst, SCL, SDA, date_7_segment_0, date_7_segment_1);

	input clk;
	input rst;
	input SCL;
	input SDA;
	
	output [6:0] date_7_segment_0;
	output [6:0] date_7_segment_1;
	
	wire 		  data_valid;	
	wire [7:0] date_tastatura;
	reg  [3:0] date_transcodor_0;
	reg  [3:0] date_transcodor_1;
	
	
	Transcodor tr0(.data_in(date_transcodor_0), .data_out(date_7_segment_0));
	Transcodor tr1(.data_in(date_transcodor_1), .data_out(date_7_segment_1));
	Modul_PS2(.clk(clk), .RST(rst), .SCL(SCL), .SDA(SDA), .data_valid(data_valid), .data_out(date_tastatura));
	
	always @(clk)
	begin
		if(data_valid == 1)
		begin
			date_transcodor_0 <= date_tastatura[3:0];
			date_transcodor_1 <= date_tastatura[7:4];
		end
		else
		begin
			date_transcodor_0 <= 8'b0111_1111;
			date_transcodor_1 <= 8'b0111_1111;
		end
	end
	
endmodule
