module VGA_CONTROL(counter, counter2, 
							data_in2, data_in, 
							led_r, led_g, 
							sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9, 
							but0, but1, but2, but3, 
							secunde, clk_50, x_pos, y_pos, display_zone, culoare_pixel, adresa_pixel,
							cs, we, oe, mask0, mask1, 
							red, green, blue);
	
	input [3:0] counter;
	input [3:0] counter2;
	
	input [3:0] data_in;
	input [3:0] data_in2;
	
	input sw9;
	input sw8;
	input sw7;
	input sw6;
	input sw5;
	input sw4;
	input sw3;
	input sw2;
	input sw1;
	input sw0;
	
	input but0;
	input but1;
	input but2;
	input but3;
	
	input secunde;
	
	input clk_50;
	input [9:0] x_pos;
	input [9:0] y_pos;
	input display_zone;
	input [7:0] culoare_pixel;
	
	output mask1;
	output mask0;
	
	output [9:0] led_r;
	output [7:0] led_g;
	
	
	output  cs;
	output  we;
	output  oe;
	
	output reg [2:0] red;
	output reg [2:0] green;
	output reg [2:0] blue;

	output reg [17:0] adresa_pixel;
		
	reg [7:0] pixel;
	
	parameter offset_x = 0;
	parameter offset_y = 58;
	parameter offset_y_sw = 56;
	
	assign led_g[7:0] = {secunde,secunde,secunde,secunde,secunde,secunde,secunde,secunde};
	assign led_r[9:0] = {secunde,secunde,secunde,secunde,secunde,secunde,secunde,secunde,secunde,secunde};
	assign cs0 = 0;
	assign oe = 0;
	assign we = 1;
	assign mask0 = 0;
	assign mask1 = 0;
	

	always @(*)
	begin
		
		if(but3 == 0 && x_pos >= 260 && x_pos <= 292 && y_pos >= 417 && y_pos <= 449)
		begin
				adresa_pixel = ((y_pos-1 + offset_y) * 512) + x_pos + offset_x;
		end
		else
		if(but2 == 0 && x_pos >= 299 && x_pos <= 332 && y_pos >= 417 && y_pos <= 449)
		begin
				adresa_pixel = ((y_pos-1 + offset_y) * 512) + x_pos + offset_x;
		end
		else
		if(but1 == 0 && x_pos >= 339 && x_pos <= 372 && y_pos >= 417 && y_pos <= 449)
		begin
				adresa_pixel = ((y_pos-1 + offset_y) * 512) + x_pos + offset_x;
		end
		else
		if(but0 == 0 && x_pos >= 379 && x_pos <= 412 && y_pos >= 417 && y_pos <= 449)
		begin
				adresa_pixel = ((y_pos-1 + offset_y) * 512) + x_pos + offset_x;
		end
		//SW
		
		else
		if(sw0 == 1 && x_pos >= 230 && x_pos <= 244 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw1 == 1 && x_pos >= 210 && x_pos <= 224 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw2 == 1 && x_pos >= 190 && x_pos <= 204 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw3 == 1 && x_pos >= 170 && x_pos <= 184 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw4 == 1 && x_pos >= 148 && x_pos <= 162 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw5 == 1 && x_pos >= 128 && x_pos <= 142 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw6 == 1 && x_pos >= 108 && x_pos <= 122 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw7 == 1 && x_pos >= 86 && x_pos <= 100 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw8 == 1 && x_pos >= 66 && x_pos <= 80 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		if(sw9 == 1 && x_pos >= 46 && x_pos <= 60 && y_pos >= 417 && y_pos <= 451)
		begin
				adresa_pixel = ((y_pos-1 + offset_y_sw) * 512) + x_pos + offset_x;
				
		end
		else
		
		//led verde
		if(led_g[7] == 0 && x_pos >= 267 && x_pos <= 270 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[6] == 0 && x_pos >= 287 && x_pos <= 290 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[5] == 0 && x_pos >= 309 && x_pos <= 312 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[4] == 0 && x_pos >= 329 && x_pos <= 332 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[3] == 0 && x_pos >= 349 && x_pos <= 352 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[2] == 0 && x_pos >= 369 && x_pos <= 372 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[1] == 0 && x_pos >= 389 && x_pos <= 392 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_g[0] == 0 && x_pos >= 409 && x_pos <= 412 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		
		//rosu
		
		if(led_r[0] == 0 && x_pos >= 235 && x_pos <= 238 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[1] == 0 && x_pos >= 215 && x_pos <= 218 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[2] == 0 && x_pos >= 195 && x_pos <= 198 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[3] == 0 && x_pos >= 175 && x_pos <= 178 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[4] == 0 && x_pos >= 153 && x_pos <= 156 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[5] == 0 && x_pos >= 133 && x_pos <= 136 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[6] == 0 && x_pos >= 113 && x_pos <= 116 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[7] == 0 && x_pos >= 91 && x_pos <= 94 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[8] == 0 && x_pos >= 71 && x_pos <= 74 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		if(led_r[9] == 0 && x_pos >= 51 && x_pos <= 54 && y_pos >= 399 && y_pos <= 406)
		begin
				adresa_pixel = ((y_pos-1 + 65) * 512) + x_pos + offset_x;
				
		end
		else
		
		///HEX3
		if(counter2 == 0 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 206) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 1 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 178) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 2 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 150) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 3 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 122) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 4 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 94) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 5 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 66) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 6 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 38) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 7 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 10) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 8 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 18) * 512) + x_pos + 419;
				
		end else
		if(counter2 == 9 && x_pos >= 47 && x_pos <= 60 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 46) * 512) + x_pos + 419;
				
		end else
		
		//HEX2
		if(counter == 0 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 206) * 512) + x_pos + 397;
				
		end else
		if(counter == 1 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 178) * 512) + x_pos + 397;
				
		end else
		if(counter == 2 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 150) * 512) + x_pos + 397;
				
		end
		else
		if(counter == 3 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 122) * 512) + x_pos + 397;
				
		end else
		if(counter == 4 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 94) * 512) + x_pos + 397;
				
		end else
		if(counter == 5 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 66) * 512) + x_pos + 397;
				
		end else
		if(counter == 6 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 38) * 512) + x_pos + 397;
				
		end else
		if(counter == 7 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 10) * 512) + x_pos + 397;
				
		end else
		if(counter == 8 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 18) * 512) + x_pos + 397;
				
		end else
		if(counter == 9 && x_pos >= 69 && x_pos <= 82 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 46) * 512) + x_pos + 397;
				
		end 
		else
		
		//HEX1
		if(data_in2 == 0 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 206) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 1 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 178) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 2 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 150) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 3 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 122) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 4 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 94) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 5 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 66) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 6 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 38) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 7 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 10) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 8 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 18) * 512) + x_pos + 375;
				
		end else
		if(data_in2 == 9 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 46) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 10 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 74) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 11 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 102) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 12 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 130) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 13 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 234) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 14 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 262) * 512) + x_pos + 375;
				
		end
		else
		if(data_in2 == 15 && x_pos >= 91 && x_pos <= 104 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 290) * 512) + x_pos + 375;
				
		end
		else
		
		//HEX0
		if(data_in == 0 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 206) * 512) + x_pos + 353;
				
		end else
		if(data_in == 1 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 178) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 2 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 150) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 3 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 122) * 512) + x_pos + 353;
				
		end else
		if(data_in == 4 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 94) * 512) + x_pos + 353;
				
		end else
		if(data_in == 5 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 66) * 512) + x_pos + 353;
				
		end else
		if(data_in == 6 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 38) * 512) + x_pos + 353;
				
		end else
		if(data_in == 7 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 10) * 512) + x_pos + 353;
				
		end else
		if(data_in == 8 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 18) * 512) + x_pos + 353;
				
		end else
		if(data_in == 9 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 46) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 10 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 74) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 11 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 102) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 12 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 + 130) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 13 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 234) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 14 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 262) * 512) + x_pos + 353;
				
		end
		else
		if(data_in == 15 && x_pos >= 113 && x_pos <= 126 && y_pos >= 349 && y_pos <= 374)
		begin
				adresa_pixel = ((y_pos-1 - 290) * 512) + x_pos + 353;
				
		end
		else
		
		begin
			if(y_pos == 0)
				adresa_pixel = x_pos;
			else
				adresa_pixel = ((y_pos-1) * 512) + x_pos;
		end
		
		 
		 
		
		if(display_zone == 0)
		begin
		
			blue <=  culoare_pixel[2:0];
			green <=   culoare_pixel[7:5];
			red <= culoare_pixel[4:3];
			
		end
		else
		begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end
	end
	
		
	
endmodule
