`timescale 1ns / 1ps

module Secure_Car_Key_tb();

//port declaration 
reg clk,reset,A;
wire R;

//moudle instantiation 
Secure_Car_Key dut(clk,reset,A,R);

//generating clock 
initial begin 
clk=1'b0;
forever #5 clk=~clk;
end

//input stimulus 
initial begin 
reset=1'b1;
#10 reset=1'b0; A=0;
#10 A=1;
end
endmodule
