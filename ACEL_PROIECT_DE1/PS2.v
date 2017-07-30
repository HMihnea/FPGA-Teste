module PS2(clk, RST, SCL, SDA, data_valid, data_out);

 input clk;
 input RST;
 input SDA;
 input SCL;

 output reg       data_valid;
 output reg [7:0] data_out;

 reg [2:0] stare;
 reg [3:0] nr_bit; 
 reg       bit_stop;
 wire      paritate;
 reg       paritate_in;
 reg		  da;

 parameter running = 1;
 parameter idle = 0;
 parameter reset = 2;

 assign paritate = ( ( (data_out[0] ^ data_out[1] ^ data_out[2] ^ data_out[3] ^ data_out[4] ^ 
		data_out[5] ^ data_out[6] ^ data_out[7]) + 1'b1) && 1'b1 );

 always @(posedge clk)
 begin
    if( (bit_stop == 1) && (paritate == paritate_in) )
    begin
        data_valid <= 1;
    end
    else 
        data_valid <= 0;
 end

 always @(negedge SCL)
 begin
    case(stare)
        reset:
        begin
            if(RST == 0)
                stare = reset;
            else
                stare = idle;
        end

        idle:
        begin
            if(SDA == 0)
            begin
					 
                stare = running;
            end
            nr_bit <= 4'b0000;
				bit_stop = 0;
        end
        
        running:
        begin
            if(nr_bit < 8)
            begin
                data_out[7] <= SDA;
                data_out[0] <= data_out[1];
                data_out[1] <= data_out[2];
                data_out[2] <= data_out[3];
                data_out[3] <= data_out[4];
                data_out[4] <= data_out[5];
                data_out[5] <= data_out[6];
                data_out[6] <= data_out[7];
            end
                
            if(nr_bit == 8)
                paritate_in <= SDA;
            
            if(nr_bit == 9)
            begin
                bit_stop <= SDA;
                stare = idle;
            end

            nr_bit = nr_bit + 1;
            
            if(RST == 0)
                stare = reset;
        end

        default: stare = idle;
    endcase
 end

endmodule