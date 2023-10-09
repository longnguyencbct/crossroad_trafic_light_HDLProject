//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 03:11:57 PM
// Design Name: 
// Module Name: bitcounter27
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bitcounter27(input clk, output onesecond);
reg [26:0] counter_up = 0;
reg one_second;
reg dispsec;
always @(posedge clk)
begin
if(counter_up==27'b111011100110101100100111111) begin
 counter_up <= 27'b000000000000000000000000000; 
 //if(counter_up==7'b1111100) begin
  //counter_up <= 7'b0000000; 
 one_second<=1'b1;
 end
else begin
 counter_up <= counter_up + 27'b000000000000000000000000001;
 //counter_up <= counter_up + 7'b0000001;
 one_second<=1'b0;
 end
end


assign onesecond = one_second;
endmodule
