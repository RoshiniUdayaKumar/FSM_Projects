`timescale 1ns / 1ps
//we are trying to detect the sequence-1001 
//with melay overlapping model, we need exactly 4 states
//declare module
module Melay_seq_det(in,clk,reset,out);
//port declaration
input in,clk,reset;
output reg out;
//parameter declaration, considering each state is 3-bits 
parameter S0=3'b000,
S1=3'b001,
S2=3'b010,
S3=3'b011;
//declare current state and next state 
reg [2:0] state, next_state;

//combinational logic 
always @(in or state)//senstivity list is inputs for combinational block
begin 
case(state)

S0: 
begin 
if(in)  begin
next_state=S1;
out=1'b0;
end
else begin  
next_state=S0;
out=1'b0;
end
end

S1: 
begin 
if(in) begin
next_state=S1;
out=1'b0;
end
else begin  
out=1'b0;
next_state=S2;
end
end

S2: 
begin 
if(in) begin
out=1'b0;
next_state=S1;
end
else begin
out=1'b0;  
next_state=S3;
end
end

S3: 
begin 
if(in) begin
out=1'b1; //the sequence is completed 
next_state=S1;
end
else begin 
out=1'b0;
next_state=S0;
end
end

default: begin //for all other states
next_state=S0; //S0 is the initial state 
out=1'b0;
end
endcase
end

//sequential logic 
always@(posedge clk) //synchronous reset 
begin
if(reset)
state<= S0;
else 
state<=next_state;
end

endmodule
