
`include "define.v"
module SOC_tb;
    reg clk;
    reg rst;
    initial
      begin
        clk = 0;
        rst = `RstEnable;
        #50
        rst = `RstDisable;
        #10000 $stop;        
      end
    always #10 clk = ~ clk;
    SOC SOC0(
        .clk(clk), 
        .rst(rst)
    );
endmodule
