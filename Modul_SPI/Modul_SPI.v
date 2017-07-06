module Modul_SPI(clk_m, rst, en, CPOL, CPH, clk_div, RX_data, TX_data, SS, SCK, MOSI, MISO, busy);
	//input / output procesor
	input clk_m;
	input rst;
	input en;
	input CPOL;
	input CPH;
	input [7:0] clk_div;
	input [7:0] RX_data;
	
	output reg[7:0] TX_data;
	output reg busy;
	
	//input output SPI

	input MISO;
	output SCK;
	output reg SS, MOSI;
	
	//reg intern
	reg [7:0] data_in;
	reg 		 data_MISO;
	reg [2:0] nr_bit;
	reg [2:0] stare;
	reg [2:0] i;
	
	//parametrii
	parameter reset = 0;
	parameter idle = 1;
	parameter running = 2;
	
	CLOCK clk0(clk_m, clk_div, CPOL, en, clk_SPI);
	
	always @(clk_SPI or en or rst)
	begin
	
		case (stare)
		
			reset: 
			begin
				busy = 0;
				SS = 1;
				MOSI = 1'bz;
				
				if(rst == 0)
					stare = idle;
				else
					stare = stare;
					
			end
			
			idle:
			begin
				busy = 1;
				SS = 1;
				MOSI = 1'bz;
				
				if(en == 0)
				begin
					busy = 0;
					SS = 0;
					data_in = RX_data;
					
					if(CPH == 0)
						MOSI = data_in[7];
					else;
					
					stare = running;
				end
				
			end
			
			running:
			begin
			
				if(nr_bit == 7)//!!
				begin
					stare = idle;//!!
					TX_data = data_in;
				end
				//shift pe neg
				if(CPOL == 0 && CPH == 0)
				begin
					if(clk_SPI == 0)
						begin
						nr_bit = nr_bit + 1;
						for (i = 7; i > 0; i = i - 1) 
						begin
							data_in[i] = data_in[i-1]; 
						end
						data_in[0] = data_MISO;
						end
					else 
						data_MISO = MISO;
				end
				
				//shift pe poz
				if(CPOL == 0 && CPH == 1)
				begin
				
				end
				
				//shift pe poz
				if(CPOL == 1 && CPH == 0)
				begin

				end
				
				//shift pe neg
				if(CPOL == 1 && CPH == 1)
				begin
				
				end
			end
			
			default:
			stare = idle;
		endcase
	end
endmodule


module CLOCK(clk_m, clk_div, CPOL, en, clk_SPI);
	
	input clk_m;
	input en;
	input CPOL;
	input [7:0] clk_div;
	output reg clk_SPI;
	reg [7:0] num;
	
	always @(posedge clk_m)
	begin
		if(en == 0)
		begin
			
			if(CPOL == 0 && clk_SPI == 0)
				clk_SPI <= clk_SPI;
			else
				clk_SPI <= ~clk_SPI;
			
			if(CPOL == 1 && clk_SPI == 1)
				clk_SPI <= clk_SPI;
			else
				clk_SPI <= !clk_SPI;
			
			case (clk_div)
			
				8'b0000_0000 : clk_SPI <= clk_m;
			
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
			
				num <= num + 1;
				
		end
		else
			clk_SPI <= 1'bz;
	end
	
endmodule
