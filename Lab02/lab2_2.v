`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/03 20:16:24
// Design Name: 
// Module Name: lab_2_2fib
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


module lab_2_2fib(
     input clk, 
     input rst, 
     output [19:0] fn 
    );
    
    reg [7:0] temp;
    reg [7:0] f1 = 8'b00000001;
    reg [7:0] f2 =8'b00000001;
    integer i;
    
    
    always@(posedge clk) begin
        if(rst == 1'b1) temp = 8'b00000001;
        else begin
            for ( i=3; i<=13; i=i+1) begin
                temp = f1+f2;
                f1 = f2;
                f2= temp;
            end
        end
        
    end
    assign fn = temp;
endmodule
