`include "define.v"

module IF(clk,rst,jAddr,jCe,romCe,pc);
	input wire clk;
	input wire rst;
	input wire [31:0] jAddr;
	input wire jCe;
	output reg romCe;
	output reg [31:0] pc;
	
	always@(*)
	else if(jCe == `Valid)
	    pc = jAddr;