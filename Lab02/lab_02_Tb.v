`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/03 00:12:24
// Design Name: 
// Module Name: lab2_1_testbench
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

module lab2_1_testbench;
    reg clk, rst, en, dir, load; 
    reg pass;
    reg [5:0] data; 
    reg [3:0] out;
    integer number_count;
  lab2_1test counter (.clk(clk), .rst(rst), .en(en), .dir(dir), .load(load),.data(data), .out(out));
  initial clk = 0;
   always #5 clk = ~clk;
    // add your testbench here
    // add more parameters if you need 
     always @(posedge rst) begin
            if (rst) 
                number_count <= 4'b0000;  
     end  
     
     initial begin
         clk = 1'b0;
         pass = 1'b1;
         data = 8'b0;
         rst = 1'b0;
         dir = 1'b1;
         load = 1'b0;
         en = 1'b0;
     
     $display("Starting the simulation");
     
     
     
     
      $display("%g Terminating simulation...", $time);
    if (pass) $display(">>>> [PASS]  Congratulations!");
    else      $display(">>>> [ERROR] Try it again!");
    $finish;
     
     end
     
    always@(posedge clk) begin
        test;
    end
    
    always@(negedge clk) begin
        
    end
     
     
task test; 
    begin
      if (number_count != out) begin
        printerror;
      end
    end
  endtask

  task printerror;
    begin
      pass = 1'b0;
      $display($time," Error");
    end
  endtask
    
endmodule
