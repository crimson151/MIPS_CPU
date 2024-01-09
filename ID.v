`include "define.v"
module  ID (
    input wire rst,  
    input wire [31:0] pc,
    input wire [31:0] inst,
    input wire [31:0] regaData_i,
    input wire [31:0] regbData_i,
    output reg [5:0] op,
    output reg [4:0] regaAddr,
    output reg [4:0] regbAddr,    
    output reg [4:0] regcAddr,    
    output reg [31:0] regaData,
    output reg [31:0] regbData,
    output reg regaRd,
    output reg regbRd,
    output reg regcWr,
    output reg [31:0] jAddr,
    output reg jCe
);
    wire [5:0] inst_op = inst[31:26];
    wire [5:0] func = inst[5:0]; 
    wire [31:0] npc = pc + 4;
    reg [31:0] imm;
    always@(*)
        if(rst == `RstEnable)
          begin
            op = `Nop;
            regaRd = `Invalid;
            regbRd = `Invalid;
            regcWr = `Invalid;
            regaAddr = `Zero;
            regbAddr = `Zero;
            regcAddr = `Zero;
            imm = `Zero;
	    jCe = `Invalid;
	    jAddr = `Zero;
          end
        else 
	  begin
	    jCe = `Invalid;
	    jAddr = `Zero;
            case(inst_op)
                `Inst_ori:
                  begin
                    op = `Or;
                    regaRd = `Valid;
                    regbRd = `Invalid;
                    regcWr = `Valid;
                    regaAddr = inst[25:21];
                    regbAddr = `Zero;
                    regcAddr = inst[20:16];
                    imm = {16'h0, inst[15:0]};
                  end
                `Inst_addi:
                    begin
                        op = `Add;
                        regaRd = `Valid;
                        regbRd = `Invalid;
                        regcWr = `Valid;
                        regaAddr = inst[25:21];
                        regbAddr = `Zero;
                        regcAddr = inst[20:16];
                        imm = {16'b0,inst[15:0]};
                    end
                `Inst_andi:
                    begin
                        op = `And;
                        regaRd = `Valid;
                        regbRd = `Invalid;
                        regcWr = `Valid;
                        regaAddr = inst[25:21];
                        regbAddr = `Zero;
                        regcAddr = inst[20:16];
                        imm = {16'b0,inst[15:0]};
                    end
                `Inst_xori:
                    begin
                        op = `Xor;
                        regaRd = `Valid;
                        regbRd = `Invalid;
                        regcWr = `Valid;
                        regaAddr = inst[25:21];
                        regbAddr = `Zero;
                        regcAddr = inst[20:16];
                        imm = {16'b0,inst[15:0]};
                    end
		`Inst_lui:
		    begin
			op = `Lui;
                        regaRd = `Invalid;
                        regbRd = `Invalid;
                        regcWr = `Valid;
                        regaAddr = `Zero;
                        regbAddr = `Zero;
                        regcAddr = inst[20:16];
                        imm = {inst[15:0],16'b0};
                    end
		`Inst_r:
		    case(func)
			`Inst_add:
			    begin
                        	op = `Add;
                        	regaRd = `Valid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = `Zero;
                    	    end
			`Inst_sub:
			    begin
                        	op = `Sub;
                        	regaRd = `Valid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = `Zero;
                    	    end
			`Inst_and:
			    begin
                        	op = `And;
                        	regaRd = `Valid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = `Zero;
                    	    end
			`Inst_or:
			    begin
                        	op = `Or;
                        	regaRd = `Valid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = `Zero;
                    	    end
			`Inst_xor:	
			    begin
                        	op = `Xor;
                        	regaRd = `Valid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = `Zero;
                    	    end
			`Inst_sll:
			    begin
                        	op = `Sll;
                        	regaRd = `Invalid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = {inst[10:6]};
                    	    end
			`Inst_srl:
			    begin
                        	op = `Srl;
                        	regaRd = `Invalid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = {inst[10:6]};
                    	    end
			`Inst_sra:
			    begin
                        	op = `Sra;
                        	regaRd = `Invalid;
                        	regbRd = `Valid;
                        	regcWr = `Valid;
                        	regaAddr = inst[25:21];
                        	regbAddr = inst[20:16];
                        	regcAddr = inst[15:11];
                        	imm = {inst[10:6]};
                    	    end
			`Inst_jr:
                  	    begin
                    		op = `Jr;
                    		regaRd = `Valid;
                    		regbRd = `Invalid;
                    		regcWr = `Invalid;
                    		regaAddr = inst[25:21];
                    		regbAddr = `Zero;
                    		regcAddr = `Zero;
                    		jAddr = regaData_i;
		    		jCe = `Valid;
		    		imm = `Zero;
                  	    end
			default:
                  	    begin
                    		op = `Nop;
                    		regaRd = `Invalid;
                    		regbRd = `Invalid;
                    		regcWr = `Invalid;
                    		regaAddr = `Zero;
                    		regbAddr = `Zero;
                    		regcAddr = `Zero;
                    		imm = `Zero;
                  	    end
		    	endcase
		`Inst_j:
                    begin
                    	op = `J;
                    	regaRd = `Invalid;
                    	regbRd = `Invalid;
                    	regcWr = `Invalid;
                    	regaAddr = `Zero;
                    	regbAddr = `Zero;
                    	regcAddr = 5'b11111;
                    	jAddr = {npc[31:28],inst[25:0],2'b00};
		    	jCe = `Valid;
		    	imm = `Zero;
                    end
		`Inst_jal:
                    begin
                    	op = `Jal;
                    	regaRd = `Invalid;
                    	regbRd = `Invalid;
                    	regcWr = `Valid;
                    	regaAddr = `Zero;
                    	regbAddr = `Zero;
                    	regcAddr = 5'b11111;
                    	jAddr = {npc[31:28],inst[25:0],2'b00};
		    	jCe = `Valid;
		    	imm = npc;
                    end
		`Inst_beq:
                    begin
                    	op = `Beq;
                    	regaRd = `Valid;
                    	regbRd = `Valid;
                    	regcWr = `Invalid;
                    	regaAddr = inst[25:21];
                    	regbAddr = inst[20:16];
                    	regcAddr = 5'b11111;
                    	if (regaData_i == regbData_i)
		    		jAddr = npc + {{14{inst[15]}},inst[15:0],2'b00};
		    	else
				jAddr = npc;
		    	jCe = `Valid;
		    	imm = npc;
                    end
		`Inst_bne:
                    begin
                    	op = `Bne;
                    	regaRd = `Valid;
                    	regbRd = `Valid;
                    	regcWr = `Invalid;
                    	regaAddr = inst[25:21];
                    	regbAddr = inst[20:16];
                    	regcAddr = 5'b11111;
                    	if (regaData_i != regbData_i)
		    		jAddr = npc + {{14{inst[15]}},inst[15:0],2'b00};
		    	else
				jAddr = npc;
		    	jCe = `Valid;
		    	imm = npc;
                    end
                default:
                    begin
                    	op = `Nop;
                    	regaRd = `Invalid;
                    	regbRd = `Invalid;
                    	regcWr = `Invalid;
                    	regaAddr = `Zero;
                    	regbAddr = `Zero;
                    	regcAddr = `Zero;
                    	imm = `Zero;
                    end
            	endcase
	  end
    always@(*)
      if(rst == `RstEnable)
          regaData = `Zero;
      else if(regaRd == `Valid)
          regaData = regaData_i;
      else
          regaData = imm;
    always@(*)
      if(rst == `RstEnable)
          regbData = `Zero;      
      else if(regbRd == `Valid)
          regbData = regbData_i;
      else
          regbData = imm; 
endmodule

