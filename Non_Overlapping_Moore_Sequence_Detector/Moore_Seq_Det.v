`timescale 1ns / 1ps
//we are trying to detect the sequence-1101 
//with moore non-overlapping model, we need 5 states
//declare module
module Moore_Seq_Det(in,clk,reset,out);
//port declaration
input in,clk,reset;
output reg out;
//parameter declaration, considering each state is 3-bits 
parameter S0=3'b000,
S1=3'b001,
S2=3'b010,
S3=3'b011,
S4=3'b100;
//declare current state and next state 
reg [2:0] state, next_state;

//combinational logic 
always @(*)
begin 
case(state)

S0: 
begin 
if(in)
next_state=S1;
else 
next_state=S0;
end

S1: 
begin 
if(in)
next_state=S2;
else 
next_state=S0;
end

S2:
begin 
if(in)
next_state=S1;
else 
next_state=S3;
end

S3:
begin 
if(in)
next_state=S4;
else 
next_state=S0;
end

S4:
begin 
if(in)
next_state=S1;
else 
next_state=S0;
end

default: next_state=S0;
endcase
end

//sequential logic 
always@(negedge clk)
begin
if(reset)
state<= S0;
else 
state<=next_state;
end

//combinational logic to determine the output 
always @(state)
begin
case(state)
S0: out=1'b0;
S1: out=1'b0;
S2: out=1'b0;
S3: out=1'b0;
S4: out=1'b1;
endcase
end
endmodule
