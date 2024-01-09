`define RstEnable       1'b1
`define RstDisable      1'b0
`define RomEnable       1'b1 
`define RomDisable      1'b0
`define RamWrEnable     1'b1
`define RamWrDisable    1'b0
`define Zero	        32'b0
`define Valid	        1'b1
`define Invalid	        1'b0

`define Inst_addi       6'b001000
`define Inst_andi       6'b001100
`define Inst_ori        6'b001101
`define Inst_xori       6'b001110
`define Inst_lui        6'b001111
`define Inst_r		6'b000000
`define Inst_add	6'b100000
`define Inst_sub	6'b100010
`define Inst_and	6'b100100
`define Inst_or		6'b100101
`define Inst_xor	6'b100110
`define Inst_sll	6'b000000
`define Inst_srl	6'b000010
`define Inst_sra	6'b000011
`define Inst_j		6'b000010
`define Inst_jal	6'b000011
`define Inst_jr		6'b001000
`define Inst_beq	6'b000100
`define Inst_bne	6'b000101

`define Nop     	6'b000000
`define Or              6'b000001
`define Add             6'b000010
`define Sub             6'b000011
`define And             6'b000100
`define Xor             6'b000101
`define Sll             6'b000110
`define Srl             6'b000111
`define Sra             6'b001000
`define J		6'b001001
`define Jal		6'b001010
`define Jr		6'b001011
`define Beq		6'b001100
`define Bne		6'b001101
`define Lui		6'b001110


