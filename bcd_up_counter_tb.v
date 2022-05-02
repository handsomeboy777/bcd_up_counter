`timescale 1ns/1ps
module RTL_tb;
    reg clk;
    reg rst_asyn;
	wire  [3:0] Q_out;
    parameter OFFSET = 0;
// clock process
initial
begin
    #OFFSET;
    forever
    begin
        clk = 1'b0;
        #2 clk = 1'b1;
        #2;
    end
end

initial
begin
    #OFFSET;
    forever
    begin
        rst_asyn = 1'b1;
        #5   rst_asyn = 1'b0;
        #50;
    end
end

initial begin
        #60 $finish;
end

initial
	begin
		$dumpfile("RTL.vcd");
		$dumpvars(0, RTL_tb);
	end

	BCD RTL_tb(.clk, .rst_asyn, .Q_out);
endmodule


