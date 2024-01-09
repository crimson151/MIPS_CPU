
`include "define.v"
module RegFile(
    input wire clk,
    input wire rst,
    input wire we,
    input wire [4:0] waddr,
    input wire [31:0] wdata,
    input wire regaRd,
    input wire regbRd,
    input wire [4:0] regaAddr,
    input wire [4:0] regbAddr,
    output reg [31:0] regaData,
    output reg [31:0] regbData
);


    reg [31:0] reg32 [31 : 0];    
    always@(*)
        if(rst == `RstEnable)
            regaData = `Zero;
        else if(regaAddr == `Zero)
            regaData = `Zero;
        else
            regaData = reg32[regaAddr];
    always@(*)
        if(rst == `RstEnable)          
            regbData = `Zero;
        else if(regbAddr == `Zero)
            regbData = `Zero;
        else
            regbData = reg32[regbAddr];

    always@(*)
        if(we == `RamWrEnable)
            reg32[waddr] = wdata;
        else
            reg32[waddr] = `Zero;

    initial
        begin
            reg32[1] = 32'h00000001; 
            reg32[2] = 32'h00000011; 
            reg32[4] = 32'h00000101; 
            reg32[6] = 32'h00000011;
	    reg32[7] = 32'h00000011;
        end  
endmodule
