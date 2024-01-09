`include "define.v"
module InstMem(
    input wire ce,
    input wire [31:0] addr,
    output reg [31:0] data
);
    reg [31:0] instmem [1023 : 0];    
    always@(*)      
        if(ce == `RomDisable)
          data = `Zero;
        else
          data = instmem[addr[11 : 2]]; 
    initial
      begin
//        instmem [0] = 32'h3401ff00;//ori:32'h00000000 or 32'h0000ff00 =32'h0000ff00
//        instmem [1] = 32'h20430000;//addi:32'h00000011 add 32'h00000000 = 32'h00000011
//        instmem [2] = 32'h3085000f;//andi:32'h0000000f and 32'h00000101 = 32'h00000001
//        instmem [3] = 32'h38C70001;//xori:32'h00000001 xori 32'h00000011 = 32'h00000010
//	  instmem [4] = 32'h3c03ffff;//lui r3 ffff

//	  instmem [0] = 32'h00221820;//add r1,r2,r3; reg32[3] = reg32[1] + reg32[2]  result:00000012
//	  instmem [1] = 32'h00411822;//sub r2,r1,r3; reg32[3] = reg32[2] - reg32[1]  result:00000010
//	  instmem [2] = 32'h00221825;//or r1,r2,r3; reg32[3] = reg32[2] - reg32[1]  result:00000011
//	  instmem [3] = 32'h00221824;//and r1,r2,r3; reg32[3] = reg32[2] - reg32[1]  result:00000001
//	  instmem [4] = 32'h00221826;//xor r1,r2,r3; reg32[3] = reg32[2] - reg32[1]  result:00000010
//	  instmem [5] = 32'h00011880;//sll r1,2; reg32[1] <<    sa = 2  00000001 -> 00000100
//	  instmem [6] = 32'h00011883;//sra r1,2; reg32[1] >>>   sa = 2  00000001 -> 00000000
//	  instmem [7] = 32'h00021842;//srl r2,2; reg32[1] <<    sa = 2  00000011 -> 00000000

	  instmem [0] = 32'h0c000002;//jal 2;
	  instmem [1] = 32'h00221820;//add r1,r2,r3; reg32[3] = reg32[1] + reg32[2]  result:00000012
	  instmem [2] = 32'h00411822;//sub r2,r1,r3; reg32[3] = reg32[2] - reg32[1]  result:00000010
	  instmem [3] = 32'h10c70002;//beq r6,r7,2;
	  instmem [4] = 32'h00011880;//sll r1,2; reg32[1] <<    sa = 2  00000001 -> 00000100
	  instmem [5] = 32'h00011883;//sra r1,2; reg32[1] >>>   sa = 2  00000001 -> 00000000
	  instmem [6] = 32'h08000008;//j   8;
	  instmem [7] = 32'h00011880;//sll r1,2; reg32[1] <<    sa = 2  00000001 -> 00000100
	  instmem [8] = 32'h00241820;//add r1,r4,r3; reg32[3] = reg32[1] + reg32[4]  result:00000102


      end
endmodule

