`timescale 1ns / 1ps

//we assume the car key to be 1101
module Secure_Car_Key(
    input clk,
    input reset,
    input A,
    output reg R
    );
reg [2:0] state, next_state;

//parameter declaration for states 
parameter Wait=3'b000,
K1= 3'b001,
K2= 3'b010,
K3=3'b011, 
K4= 3'b100;

//combinational logic for states 
always @(*)
begin 
case(state)
Wait: 
begin 
R=1'b0;
if(A==0)
next_state=Wait;
else 
next_state=K1;
end

K1: 
begin 
R=1;
next_state=K2;
end

K2: 
begin 
R=1;
next_state=K3;
end

K3: 
begin 
R=0;
next_state=K4;
end

K4: 
begin 
R=1;
next_state=Wait;
end

default: next_state=Wait;
endcase   
end 
//sequential logic 
always @(posedge clk)
begin 
if(reset)
state<= Wait;
else
state<= next_state;
end 
endmodule
