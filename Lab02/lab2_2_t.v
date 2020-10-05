`timescale 1ns / 1ps
module exam1_B_t;
    reg clk,rst;
    wire [7:0] fn;
    reg pass = 1;
    lab_2_2fib counter(.clk(clk), .rst(rst), .fn(fn));
    
   initial begin
      clk = 0;
      rst = 1;
      #12
      rst = 0;
      #8
      if(fn!==1) pass = 0;
      #80
      if(fn!==35) pass = 0;
      #100
      if(fn!=110) pass=0;
      #200
      if(fn!==233) pass = 0;
      #100
      if(fn!==200) pass = 0;
      #80
      if(fn!== 1) pass=0;
      #220
      if(fn!==167) pass=0;
      #200
      if(pass==1) $display("PASS!");
      else $display(" Something wrong!");
      $finish;
     end
    
    always begin
       #5    clk = ~clk;
    end
    always@(posedge clk)begin
        if(!rst) $display("%d",fn);
    end
endmodule
