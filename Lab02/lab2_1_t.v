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
   
     always @(posedge rst) begin
            if (rst) 
                number_count = 4'b0000;  
     end  
     
     initial begin
       #0 
       pass = 1'b1;
       data = 8'b0;        
       rst = 1'b0;
       dir = 1'b1;
       load = 1'b0;
       en = 1'b0;
       number_count = 4'b0;
        
     
  
     
        #40 
        en=1;
        load =0;
        data =3;
        dir =0;
        #60
        en =1;
        load =1;
        #80
        en =1;
        load =0;
        data= 12;
        dir=1;
        #15
        en =1;
        load =0;
        data= 0;
        dir=0;
        #30
        en=0;
        #50
        en=1;
        load =1;
        data = 14;
        #50
      $display("%g Terminating simulation...", $time);
    if (pass) $display(">>>> [PASS]  Congratulations!");
    else      $display(">>>> [ERROR] Try it again!");
    $finish;
     
     end
     
    always@(posedge clk) begin
        test;
    end
    
    always@(negedge clk) begin
        if(en == 1'b1 && load ==1'b1) begin
            number_count = data;
        end
        else if(en ==1'b1 && load == 1'b0) begin
             case(dir) 
                     1'b1: begin
                       if(number_count < 4'b1100) 
                           number_count = number_count + 1;
                       else if(number_count == 4'b1111)
                           printerror;
                       else if(number_count == 4'b1100) 
                           number_count<= 4'b1100;   
                     end
                     1'b0: begin
                       if(number_count > 4'b0000) 
                           number_count = number_count - 1;
                        else if(number_count == 4'b1111)
                          printerror;
                       else if(number_count == 4'b0000) 
                           number_count = 4'b0000;   
                     end
              endcase
        end
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
      $display($time," This is an incorrect input");
    end
  endtask
    
endmodule
