module ACEL_PROIECT_DE1(scl, sda, hex0, hex1, hex2, hex3, led_r, led_g, sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9, clk_50, red, green, blue, h_synk, v_synk, adresa_pixel, date_ram, cs, oe, we, mask0, mask1, but0, but1, but2, but3);

	input scl;
	input sda;
	
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
	input [7:0] date_ram;
	
	input but0;
	input but1;
	input but2;
	input but3;
	input clk_50;
	
	output [6:0] hex0;
	output [6:0] hex1;
	output [6:0] hex2;
	output [6:0] hex3;
	
	output [7:0] led_g;
	output [9:0] led_r;
	
	output [3:0] red;
	output [3:0] green;
	output [3:0] blue;
	output h_synk;
	output v_synk;
	
	output [17:0] adresa_pixel;
	
	output cs;
	output we;
	output oe;
	output mask0;
	output mask1;
	
	wire secunde;
	wire [9:0] x_pos;
	wire [9:0] y_pos;
	wire display_zone;
	
	SEC s0(.clk_50(clk_50), .secunde(secunde));
	
	VGA_50MHZ VGA(.clk_50(clk_50), .h_synk(h_synk), .v_synk(v_synk), .x_pos(x_pos), .y_pos(y_pos), .display_zone(display_zone));
	
	VGA_CONTROL VGA_C(.counter(counter), .counter2(counter2), .data_in2(date_transcodor_1), .data_in(date_transcodor_0), .led_r(led_r), .led_g(led_g), .sw0(sw0), .sw1(sw1), .sw2(sw2), .sw3(sw3), .sw4(sw4), .sw5(sw5), .sw6(sw6), .sw7(sw7), .sw8(sw8), .sw9(sw9), .but0(but0), .but1(but1), .but2(but2), .but3(but3), .secunde(secunde), .clk_50(), .x_pos(x_pos), .y_pos(y_pos), .display_zone(display_zone), .culoare_pixel(date_ram), .adresa_pixel(adresa_pixel), 
							.cs(cs), .we(we), .oe(oe), .mask0(mask0), .mask1(mask1), .red(red), .green(green), .blue(blue));
	
	reg [3:0] counter;
	reg [3:0] counter2;
	
	always @(posedge secunde)
	begin
	
		counter <= counter + 1;
		
		if(counter == 9)
		begin
		counter <= 0;
		counter2 <= counter2 + 1;
		end
		
		if(counter2 == 9)
		counter2 <= 0;
		
	end
	
	TRANSCODOR tr0(.data_in(date_transcodor_0), .data_out(hex0));
	TRANSCODOR tr1(.data_in(date_transcodor_1), .data_out(hex1));
	TRANSCODOR tr2(.data_in(counter), .data_out(hex2));
	TRANSCODOR tr3(.data_in(counter2), .data_out(hex3));
	
	wire data_valid;
	
	wire [7:0] date_tastatura;
	reg  [3:0] date_transcodor_0;
	reg  [3:0] date_transcodor_1;
	
	PS2(.clk(clk_50), .RST(but0), .SCL(scl), .SDA(sda), .data_valid(data_valid), .data_out(date_tastatura));
	
	always @(posedge clk_50)
	begin
				date_transcodor_0 <= date_tastatura[3:0];
				date_transcodor_1 <= date_tastatura[7:4];
	end
	
endmodule
