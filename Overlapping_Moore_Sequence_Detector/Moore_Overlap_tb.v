`timescale 1ns / 1ps

module Moore_Overlap_tb( );

//port declaration
reg in,clk,reset;
wire out;

//module instantiation 
Moore_Overlap dut(in,clk,reset,out);

//generating clock 
initial begin 
clk=1'b0;
forever #5 clk=~clk;
end

//input stimulus 
initial begin 
reset=1'b1; in=1'b0;
#30 reset=1'b0; in=1'b1;
#10 in=1'b1;
#10 in=1'b0;
#10 in=1'b1;
end
endmodule
