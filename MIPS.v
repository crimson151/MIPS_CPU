
`include "define.v"
module MIPS(
    input wire clk,
    input wire rst,
    input wire [31:0] instruction,
    output wire romCe,
    output wire [31:0] instAddr
);
    wire [31:0] regaData_regFile, regbData_regFile;
    wire [31:0] regaData_id, regbData_id; 
    wire [31:0] regcData_ex;
    wire [5:0] op;    
    wire regaRd, regbRd;
    wire [4:0] regaAddr, regbAddr;
    wire regcWr_id, regcWr_ex;
    wire [4:0] regcAddr_id, regcAddr_ex;
    wire [31:0] jAddr;
    wire jCe;
    wire [31:0] pc;
    IF if0(
        .clk(clk),
        .rst(rst),
	.jAddr(jAddr),
	.jCe(jCe),
        .romCe(romCe), 
        .pc(instAddr)
    );
    ID id0(
        .rst(rst), 
	.pc(instAddr),     
        .inst(instruction),
        .regaData_i(regaData_regFile),
        .regbData_i(regbData_regFile),
        .op(op),
        .regaData(regaData_id),
        .regbData(regbData_id),
        .regaRd(regaRd),
        .regbRd(regbRd),
        .regaAddr(regaAddr),
        .regbAddr(regbAddr),
        .regcWr(regcWr_id),
        .regcAddr(regcAddr_id),
	.jAddr(jAddr),
	.jCe(jCe)
    );
    EX ex0(
        .rst(rst),
        .op(op),        
        .regaData(regaData_id),
        .regbData(regbData_id),
        .regcWr_i(regcWr_id),
        .regcAddr_i(regcAddr_id),
        .regcData(regcData_ex),
        .regcWr(regcWr_ex),
        .regcAddr(regcAddr_ex)
    );    
    RegFile regfile0(
        .clk(clk),
        .rst(rst),
        .we(regcWr_ex),
        .waddr(regcAddr_ex),
        .wdata(regcData_ex),
        .regaRd(regaRd),
        .regbRd(regbRd),
        .regaAddr(regaAddr),
        .regbAddr(regbAddr),
        .regaData(regaData_regFile),
        .regbData(regbData_regFile)
    );

endmodule