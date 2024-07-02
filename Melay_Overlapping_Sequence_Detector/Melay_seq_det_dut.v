`timescale 1ns / 1ps

module Melay_seq_det_tb( );

//port declaration
reg in,clk,reset;
wire out;

//module instantiation 
Melay_seq_det dut(in,clk,reset,out);

//generating clock 
initial begin 
clk=1'b0;
forever #5 clk=~clk;
end

//input stimulus 
initial begin 
reset=1'b1; in=1'b0;
#30 reset=1'b0;
#10 in=1'b1;//1
#10 in=1'b0;//10
#10 in=1'b0;//100
#10 in=1'b1;//1001-->sequence detected and the output should go high
end
endmodule
