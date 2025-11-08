`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:29 04/09/2021
// Design Name:   MIPS_Pipelined_Processor
// Module Name:   C:/Users/amitk/OneDrive/Documents/verilog/MIP_Pipelined_Processor/test.v
// Project Name:  MIP_Pipelined_Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_Pipelined_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;
	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	MIPS_Pipelined_Processor uut (
		.Clk(Clk), 
		.Reset(Reset)
	);

	initial begin
		Clk = 0;
		Reset = 0;
		forever #10 Clk = ~Clk;
	end
	initial begin
		#20 Reset = 1;// nothing executed until now as reset was equal to 0 before
		#10		// only 1 clock cycle completed until now, PC is taken to be 0,instruction is fetched
		#20		//2nd clock cycle, ID stage, PC=4
		#20		//3rd clock cycle, EX stage, PC=8	
		#20		//4th clock cycle, MEM stage PC=12
		#20		//5th, last clock cycle, WB stage
		//5 clock cycle ends first instructions is executed
		#20	// after 6 clock cycles first 2 instructions are executed
		#20	// after 7 clock cycles first 3 instructions are executed
		
		$dumpfile("dump.vcd");
		$dumpvars;
		$finish;
	end
endmodule

