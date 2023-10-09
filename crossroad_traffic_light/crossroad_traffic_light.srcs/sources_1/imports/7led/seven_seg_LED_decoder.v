`timescale 1ns / 1ps

module bin2led7(bin_in, led_out);
input[3:0] bin_in;
output reg[6:0] led_out;
always @(*) begin
    case(bin_in)
        4'b0000: led_out = ~7'b0000001; 
        4'b0001: led_out = ~7'b1001111;
        4'b0010: led_out = ~7'b0010010;
        4'b0011: led_out = ~7'b0000110;
        4'b0100: led_out = ~7'b1001100;
        4'b0101: led_out = ~7'b0100100;
        4'b0110: led_out = ~7'b0100000;
        4'b0111: led_out = ~7'b0001111;
        4'b1000: led_out = ~7'b0000000; 
        4'b1001: led_out = ~7'b0000100; 
        4'b1010: led_out = ~7'b0001000;
        4'b1011: led_out = ~7'b1100000;
        4'b1100: led_out = ~7'b0110001;
        4'b1101: led_out = ~7'b1000010;
        4'b1110: led_out = ~7'b0110000;
        default: led_out = ~7'b0111000;
    endcase
end
endmodule
