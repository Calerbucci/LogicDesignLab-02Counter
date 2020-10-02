`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/01 15:35:58
// Design Name: 
// Module Name: lab2_1test
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


module lab2_1test(
       input clk, 
       input rst,
       input en, 
       input dir,
       input load,
       input [5:0] data, 
       output [3:0] out
    );
    
    reg [3:0] out;
    
    always@(negedge clk) begin
       if(rst == 1'b1) begin
      out = 4'b0000;
      end
     else begin
       if(en == 1'b0) begin
      out = out;
      end 
       else if(en == 1'b1) begin
            if(load == 1'b0) begin 
              case(dir) 
                     1'b1: begin
                       if(out < 4'b1100) 
                           out = out + 1;
                       else if(out == 4'b1111)
                           out = 4'b1111;
                       else if(out == 4'b1100) 
                       out = 4'b1100;   
                     end
                     1'b0: begin
                       if(out > 4'b0000) 
                           out = out - 1;
                        else if(out == 4'b1111)
                           out = 4'b1111;
                       else if(out == 4'b0000) 
                           out = 4'b0000;   
                     end
              endcase
            end
            else if(load == 1'b1) begin
                   if(data > 4'b1100)
                          out = 4'b1111;
                   else
                          out = data;
           end
        end      
      end
    end
endmodule
