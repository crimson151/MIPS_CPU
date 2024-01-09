
`include "define.v"
module EX(
    input wire rst,
    input wire [5:0] op,    
    input wire [31:0] regaData,
    input wire [31:0] regbData,
    input wire regcWr_i,
    input wire [4:0]regcAddr_i,
    output reg [31:0] regcData,
    output wire regcWr,
    output wire [4:0] regcAddr
);    
    always@(*)
        if(rst == `RstEnable)
            regcData = `Zero;
        else
          begin
            case(op)
                `Add:
                    regcData = regaData + regbData;
		`Sub:
		    regcData = regaData - regbData;
                `And:
                    regcData = regaData & regbData;
                `Or:
                    regcData = regaData | regbData;
                `Xor:
                    regcData = regaData ^ regbData;
		`Lui:
		    regcData = regaData;
		`Sll:
		    regcData = regbData << regaData;
		`Srl:
		    regcData = regbData >> regaData;
		`Sra:
		    regcData = regbData >>> regaData;
		`Jal:
		    regcData = regaData;
                default:
                    regcData = `Zero;
            endcase
          end
    assign regcWr = regcWr_i;
    assign regcAddr = regcAddr_i;
endmodule
