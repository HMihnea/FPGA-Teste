module Modul_SPI(clk, rst, en, CPOL, CPH, clk_div, RX_data, TX_data, SS, SCK, MOSI, MISO, BUSY);
	
	input clk, rst, en, CPOL, CPH;
	input [7:0] clk_div, RX_data;
	
	input MISO;
	output reg SS, MOSI;
	
	output SCK;
	output reg BUSY;
	output [7:0] TX_data;
	reg [7:0] data_in;
	reg [2:0] bit;
	
	wire clk_SPI;
	reg [2:0] stare;
	
	parameter reset = 0;
	parameter idle = 1;
	parameter running = 2;
	
	Divizor div0(clk, clk_div, clk_SPI);
	
	always @(*) begin
	
    case (stare)
		reset:
		begin
			BUSY = 1;
			SS = 1;
	//		clk_SPI = 1'bz;
			if(rst == 0)
				stare = reset;
			else 
				stare = idle;
		end
		idle:
		begin
			BUSY = 0;
			
			if(rst == 0)
				stare = reset;
			else;
			if(en == 1)
			begin
				data_in = TX_data;
				stare = running;
				SS = 0;
				BUSY = 1;
				if(CPOL == 0 && clk_SPI == 0)
					MOSI = data_in[7];
			end
			else;
		end
		running:
		begin
			//CPOL 0 CPH 0
			if(CPOL == 0 && clk_SPI == 0)
			begin
				MOSI = data_in[7-bit];
				bit = bit + 1;
			end
			
			if(CPOL == 0 && clk_SPI == 1)
			begin
				MOSI = data_in ;
			end
		
			
		end
	endcase
end
endmodule


module Divizor(clk, clk_div, clk_SPI);
	
	input clk;
	input [7:0] clk_div;
	output reg clk_SPI;
	reg [7:0] num;
	
	always @(posedge clk)
	begin
		num <= num + 1;
		case (clk_div)
			8'b0000_0000 : clk_SPI <= clk;
			
			8'b0000_0001 : clk_SPI <= num[0];
			
			8'b0000_0010 : clk_SPI <= num[1];
			
			8'b0000_0100 : clk_SPI <= num[2];
			
			8'b0000_1000 : clk_SPI <= num[3];
			
			8'b0001_0000 : clk_SPI <= num[4];
			
			8'b0010_0000 : clk_SPI <= num[5];
			
			8'b0100_0000 : clk_SPI <= num[6];
			
			8'b1000_0000 : clk_SPI <= num[7];
			
			default: clk_SPI <= 1'bz;
		endcase
	end
	
endmodule
