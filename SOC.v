module SOC(
    input wire clk,
    input wire rst
);
    wire [31:0] instAddr;
    wire [31:0] instruction;
    wire romCe;    
    MIPS mips0(
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .instAddr(instAddr),
        .romCe(romCe)
    );    
    InstMem instrom0(
        .ce(romCe),
        .addr(instAddr),
        .data(instruction)
    );
endmodule

