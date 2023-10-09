//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 10:15:00 AM
// Design Name: 
// Module Name: traffic_light_module
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


module traffic_light_module(
    input clk,
    input rst,
    output reg led4_r,led4_g,led4_b,led5_r,led5_g,led5_b,
    output reg [3:0]Count,
    output reg[2:0] light_A,
    output reg[2:0] light_B
    );
    reg[5:0]state;
    
    
    //reg led4_r,led4_g,led4_b,led5_r,led5_g,led5_b
    parameter
    S0=6'b000001,
    S1=6'b000010,
    S2=6'b000100,
    S3=6'b001000,
    S4=6'b010000,
    S5=6'b100000;
    wire second;
    reg[3:0]count;
    wire [6:0]led7dec;
    bitcounter27 secondgen(clk,second);
    always @(posedge second, posedge rst)
        begin
        if(rst==1)begin
            state<=S0;
            count<=5;            
        end else
            case(state)
                S0: if(count>0)begin
                    state<=S0;
                    count=count-1'b1;
                end else begin
                    state<=S1;
                    count<=1;
                end
                S1: if(count>0)begin
                    state<=S1;
                    count=count-1'b1;
                end else begin
                    state<=S2;
                    count<=1;
                end
                S2: if(count>0)begin
                    state<=S2;
                    count=count-1'b1;
                end else begin
                    state<=S3;
                    count<=5;
                end
                S3: if(count>0)begin
                    state<=S3;
                    count=count-1'b1;
                end else begin
                    state<=S4;
                    count<=1;
                end
                S4: if(count>0)begin
                    state<=S4;
                    count=count-1'b1;
                end else begin
                    state<=S5;
                    count<=1;
                end
                S5: if(count>0)begin
                    state<=S5;
                    count=count-1'b1;
                end else begin
                    state<=S0;
                    count<=5;
                end
                default state<=S0;
            endcase
        end
        
            //bin2led7 led7(count[3:0],led7dec[6:0]);//////
    always@(*)
    begin
        case(state)
            S0:begin light_A=3'b001; light_B=3'b100; end
            S1:begin light_A=3'b010; light_B=3'b100; end
            S2:begin light_A=3'b100; light_B=3'b100; end
            S3:begin light_A=3'b100; light_B=3'b001; end
            S4:begin light_A=3'b100; light_B=3'b010; end
            S5:begin light_A=3'b100; light_B=3'b100; end
            default begin light_A=3'b100; light_B=3'b100; end
        endcase
    end
    
    always@(light_A)
        begin
            case(light_A)
            3'b010: begin led4_r = 1'b1; led4_g=1'b1; led4_b=1'b0; end
            3'b100: begin led4_r = 1'b1; led4_g=1'b0; led4_b=1'b0; end 
            3'b001: begin led4_r = 1'b0; led4_g=1'b1; led4_b=1'b0; end
            default: begin led4_r = 1'b0; led4_g=1'b0; led4_b=1'b0; end
            endcase
        end
    always@(light_B)
        begin
            case(light_B)
            3'b010: begin led5_r = 1'b1; led5_g=1'b1; led5_b=1'b0; end
            3'b100: begin led5_r = 1'b1; led5_g=1'b0; led5_b=1'b0; end 
            3'b001: begin led5_r = 1'b0; led5_g=1'b1; led5_b=1'b0; end
            default: begin led5_r = 1'b0; led5_g=1'b0; led5_b=1'b0; end
            endcase
        end
       always@(count)
       begin Count=count; end
    
endmodule
