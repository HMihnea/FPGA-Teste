module VGA_50MHZ(clk_50, h_synk, v_synk, x_pos, y_pos, display_zone);

	input clk_50;
	output h_synk, v_synk;
	output reg [9:0] x_pos;
	output reg [9:0] y_pos;
	output reg display_zone;
	
	wire [11:0] pixel;
	wire [11:0] line;
	wire clk_40;
	
	Counter SYNK(clk_50, pixel, line);
	
	H_Synk H(.count_pixel(pixel), .synk_h(h_synk));
	V_Synk V(.count_line(line), .synk_v(v_synk));
	
	always @(posedge clk_50) 
	begin
		if(line < 462 && pixel < 460 && line >= 0 && pixel >= 0)
		begin
			x_pos <= pixel;
			y_pos <= line;
			display_zone <= 0;
		end
		else
		begin
			display_zone <= 1;
		end
	end
	
	
endmodule

module Counter(clk, pixel, linie);

	input clk;
	output reg [10:0] linie;
	output reg [10:0] pixel;

	parameter limit_h = 1039;
	parameter limit_v = 665;

	initial pixel = 0;
	initial linie = 0;

	always @(posedge clk)
	begin
		pixel <= pixel + 1;
		if(pixel == limit_h)
		begin
			pixel <= 0;
			linie <= linie + 1;
			
			if(linie == limit_v)
				linie <= 0;
			else ;
		end
		else ;
	end

endmodule


module H_Synk(count_pixel, synk_h);

	input [10:0] count_pixel;
	output reg synk_h;

	parameter h_synk_begin = 855;
	parameter h_synk_end = 975;
	

	always @(*)
	begin
		if(count_pixel >= h_synk_begin && count_pixel <= h_synk_end )
			synk_h <= 0;
		else
			synk_h <= 1;
	end
endmodule

module V_Synk(count_line, synk_v);

	input [10:0] count_line;
	output reg synk_v;

	parameter v_synk_begin = 636;
	parameter v_synk_end = 641;
	
	always @(*)
	begin
		if(count_line >= v_synk_begin && count_line <= v_synk_end )
			synk_v <= 0;
		else
			synk_v <= 1;
		
	end

endmodule
