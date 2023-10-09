`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 03:13:05 PM
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb();
reg clk;
reg rst;
wire led4_r,led4_g,led4_b,led5_r,led5_g,led5_b;
wire [3:0]Count;
wire[2:0] light_A;
wire[2:0] light_B;
   initial 
    begin
    clk = 0;
    forever #4 clk = ~ clk;

    end
    initial
    $monitor("light_A= %b, light_B= %b, count= %b",light_A,light_B,Count);
    initial begin
   rst=1'b1;
   #5;
   rst=1'b0;
   end
    
    traffic_light_module tl(
         clk,
        rst,
        led4_r,led4_g,led4_b,led5_r,led5_g,led5_b,
        Count,
        light_A,
        light_B
        );
endmodule
