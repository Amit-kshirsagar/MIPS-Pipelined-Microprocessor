`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:08 04/09/2021 
// Design Name: 
// Module Name:    MIPS_Pipelined_Processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


// add, sub, and, or, lw, sw, slt, beq only these 8 instructions have been implemented


/*the module takes PC and fetches the Instruction and gives it as output*/
module Instruction_Fetch(Instruction, PC, Reset);
output reg [31:0] Instruction;		//stores the Instruction in it
input [31:0] PC;							//stores the value of program counter
input Reset;								//reset input
reg [7:0] Inst_Memory [127:0]; 		// Instruction Memory Size 1024 bits

always@(*)
begin
	if(Reset==0)
	begin
		Inst_Memory[0]=8'b00100000;	// add s1 s2 s3
		Inst_Memory[1]=8'b10001000;
		Inst_Memory[2]=8'b01010011;
		Inst_Memory[3]=8'b00000010;
		
		Inst_Memory[4]=8'b00100101;	// or s4 s1 s2
		Inst_Memory[5]=8'b10100000;
		Inst_Memory[6]=8'b00110010;
		Inst_Memory[7]=8'b00000010;
		
		/*Inst_Memory[4]=8'b00100101;	// or s1 s1 s2
		Inst_Memory[5]=8'b10001000;
		Inst_Memory[6]=8'b00110010;
		Inst_Memory[7]=8'b00000010;*/
		
		/*Inst_Memory[4]=8'b00100010;	// sub s5 s2 s4	
		Inst_Memory[5]=8'b10101000;
		Inst_Memory[6]=8'b01010100;
		Inst_Memory[7]=8'b00000010;*/
		
		/*Inst_Memory[8]=8'b00100010;	// sub s5 s2 s1
		Inst_Memory[9]=8'b10101000;
		Inst_Memory[10]=8'b01010001;
		Inst_Memory[11]=8'b00000010;*/
		
		Inst_Memory[8]=8'b00100010;	// sub s6 s1 s2
		Inst_Memory[9]=8'b10110000;
		Inst_Memory[10]=8'b00110010;
		Inst_Memory[11]=8'b00000010;
		
		Inst_Memory[12]=8'b00100100;	// and s6 s4 s2
		Inst_Memory[13]=8'b10110000;
		Inst_Memory[14]=8'b10010010;
		Inst_Memory[15]=8'b00000010;
		
		Inst_Memory[16]=8'b00000010;	// beq s1 s2 0x2	//current PC is 16 so after beq true PC=16+4+8=28
		Inst_Memory[17]=8'b00000000;
		Inst_Memory[18]=8'b00110010;
		Inst_Memory[19]=8'b00010010;
		
		Inst_Memory[20]=8'b00000010;	// lw s1 0x2(s2)
		Inst_Memory[21]=8'b00000000;
		Inst_Memory[22]=8'b01010001;
		Inst_Memory[23]=8'b10001110;
		
		Inst_Memory[24]=8'b00100101;	// or s4 s1 s2
		Inst_Memory[25]=8'b10100000;
		Inst_Memory[26]=8'b00110010;
		Inst_Memory[27]=8'b00000010;
		
		Inst_Memory[28]=8'b00100000;	// and s6 s4 s1
		Inst_Memory[29]=8'b10110000;
		Inst_Memory[30]=8'b10010001;
		Inst_Memory[31]=8'b00000010;
		
		/*Inst_Memory[24]=8'b00000010;	// sw s1 0x2(s2)
		Inst_Memory[25]=8'b00000000;
		Inst_Memory[26]=8'b01010001;
		Inst_Memory[27]=8'b10101110;*/
		
		/*Inst_Memory[28]=8'b00101010;	// slt s4 s2 s1
		Inst_Memory[29]=8'b10100000;
		Inst_Memory[30]=8'b01010001;
		Inst_Memory[31]=8'b00000010;*/
		
		Inst_Memory[32]=8'b00000000;	//nop
		Inst_Memory[33]=8'b00000000;
		Inst_Memory[34]=8'b00000000;
		Inst_Memory[35]=8'b00000000;
		
		Inst_Memory[36]=8'b00000000;	//nop
		Inst_Memory[37]=8'b00000000;
		Inst_Memory[38]=8'b00000000;
		Inst_Memory[39]=8'b00000000;
		
		Inst_Memory[40]=8'b00000000;	//nop
		Inst_Memory[41]=8'b00000000;
		Inst_Memory[42]=8'b00000000;
		Inst_Memory[43]=8'b00000010;
		
		Inst_Memory[44]=8'b00000000;	//nop
		Inst_Memory[45]=8'b00000000;
		Inst_Memory[46]=8'b00000000;
		Inst_Memory[47]=8'b00000000;
		
		Inst_Memory[48]=8'b00000000;	//nop
		Inst_Memory[49]=8'b00000000;
		Inst_Memory[50]=8'b00000000;
		Inst_Memory[51]=8'b00000000;
		
		Inst_Memory[52]=8'b00000000;	//nop
		Inst_Memory[53]=8'b00000000;
		Inst_Memory[54]=8'b00000000;
		Inst_Memory[55]=8'b00000000;
		
		Inst_Memory[56]=8'b00000000;	//nop
		Inst_Memory[57]=8'b00000000;
		Inst_Memory[58]=8'b00000000;
		Inst_Memory[59]=8'b00000000;
		
		Inst_Memory[60]=8'b00000000;	//nop
		Inst_Memory[61]=8'b00000000;
		Inst_Memory[62]=8'b00000000;
		Inst_Memory[63]=8'b00000000;
		
		Inst_Memory[64]=8'b00000000;	//nop
		Inst_Memory[65]=8'b00000000;
		Inst_Memory[66]=8'b00000000;
		Inst_Memory[67]=8'b00000000;
		
		Inst_Memory[68]=8'b00000000;	//nop
		Inst_Memory[69]=8'b00000000;
		Inst_Memory[70]=8'b00000000;
		Inst_Memory[71]=8'b00000000;
		
		Inst_Memory[72]=8'b00000000;	//nop
		Inst_Memory[73]=8'b00000000;
		Inst_Memory[74]=8'b00000000;
		Inst_Memory[75]=8'b00000000;
		
		Inst_Memory[76]=8'b00000000;	//nop
		Inst_Memory[77]=8'b00000000;
		Inst_Memory[78]=8'b00000000;
		Inst_Memory[79]=8'b00000000;
		
		Inst_Memory[80]=8'b00000000;	//nop
		Inst_Memory[81]=8'b00000000;
		Inst_Memory[82]=8'b00000000;
		Inst_Memory[83]=8'b00000000;
		
		Inst_Memory[84]=8'b00000000;	//nop
		Inst_Memory[85]=8'b00000000;
		Inst_Memory[86]=8'b00000000;
		Inst_Memory[87]=8'b00000000;
		
		Inst_Memory[88]=8'b00000000;	//nop
		Inst_Memory[89]=8'b00000000;
		Inst_Memory[90]=8'b00000000;
		Inst_Memory[91]=8'b00000000;
		
		Inst_Memory[92]=8'b00000000;	//nop
		Inst_Memory[93]=8'b00000000;	
		Inst_Memory[94]=8'b00000000;
		Inst_Memory[95]=8'b00000000;
		  
 		Inst_Memory[96]=8'b00000000;	//nop			
		Inst_Memory[97]=8'b00000000;
		Inst_Memory[98]=8'b00000000;
		Inst_Memory[99]=8'b00000000;
		
		Inst_Memory[100]=8'b00000000;	//nop
		Inst_Memory[101]=8'b00000000;
		Inst_Memory[102]=8'b00000000;
		Inst_Memory[103]=8'b00000000;
		
		Inst_Memory[104]=8'b00000000;	//nop
		Inst_Memory[105]=8'b00000000;
		Inst_Memory[106]=8'b00000000;
		Inst_Memory[107]=8'b00000000;
		
		Inst_Memory[108]=8'b00000000;	//nop
		Inst_Memory[109]=8'b00000000;
		Inst_Memory[110]=8'b00000000;
		Inst_Memory[111]=8'b00000000;
	
		Inst_Memory[112]=8'b00000000;	//nop
		Inst_Memory[113]=8'b00000000;
		Inst_Memory[114]=8'b00000000;
		Inst_Memory[115]=8'b00000000;
		
		Inst_Memory[116]=8'b00000000;	//nop
		Inst_Memory[117]=8'b00000000;
		Inst_Memory[118]=8'b00000000;
		Inst_Memory[119]=8'b00000000;
		
		Inst_Memory[120]=8'b00000000;	//nop
		Inst_Memory[121]=8'b00000000;
		Inst_Memory[122]=8'b00000000;
		Inst_Memory[123]=8'b00000000;
		
		Inst_Memory[124]=8'b00000000;	//nop		
		Inst_Memory[125]=8'b00000000;
		Inst_Memory[126]=8'b00000000;
		Inst_Memory[127]=8'b00000000;
	end
end

always@(PC)
begin
	Instruction[31:0] = {Inst_Memory[PC+3], Inst_Memory[PC+2], Inst_Memory[PC+1], Inst_Memory[PC]};//Instruction fetch
end 
endmodule

/*used to update the value of PC to PC+4*/
module PC_Adder_1(PC, PC_4);
output reg [31:0] PC_4;
input [31:0] PC;
always@(PC)
begin
	PC_4 = PC + 4;		//used in case of non-branch instruction
end
endmodule	

/*used to select appropriate value of PC, by checking if branch is taken or not*/
module Mux_PCSrc(PCSrc, PC_4, PC_Add, PC_final);
input PCSrc;
input [31:0] PC_4, PC_Add;
output reg [31:0] PC_final;
always@(PCSrc, PC_4, PC_Add)
begin
	if(PCSrc==1)
		PC_final = PC_Add;
	else
		PC_final = PC_4;
end
endmodule


/*This is the hazard detection unit, load use hazard test*/
module Hazard_detection_unit(IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_MemRead, control_line, IF_ID_Write, PCWrite);
input [4:0] IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt;
input ID_EX_MemRead;
output reg control_line, IF_ID_Write, PCWrite;
always@(IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_MemRead)
begin
	if(ID_EX_MemRead)			//if hazard occurs make all the control signals = 0  
	begin
		if(ID_EX_RegisterRt == IF_ID_RegisterRs || ID_EX_RegisterRt == IF_ID_RegisterRt)
		begin
			control_line = 1'b0;	//used for making all other control lines 0 in case of hazard
			IF_ID_Write = 1'b0;	//used to preserve the IF/ID pipeline registers data in case of hazard
			PCWrite = 1'b0;		//used to preserve the value of PC in case of hazard
		end
	end
	else							//if hazard doesnot occurs make all the control signals = 1 
	begin
			control_line = 1'b1;
			IF_ID_Write = 1'b1;
			PCWrite = 1'b1;
	end
end
endmodule

/*This is the mux to select the control lines after testing the hazard unit control_line*/
module Mux_Control(control_line, RegDst_ip, Branch_ip, MemRead_ip, MemtoReg_ip, MemWrite_ip, RegWrite_ip, ALUSrc_ip, ALUOp_ip, RegDst_op, Branch_op, MemRead_op, MemtoReg_op, MemWrite_op, RegWrite_op, ALUSrc_op, ALUOp_op);
input RegDst_ip, Branch_ip, MemRead_ip, MemtoReg_ip, MemWrite_ip, RegWrite_ip, ALUSrc_ip;
input [1:0] ALUOp_ip;
input control_line;
output reg RegDst_op, Branch_op, MemRead_op, MemtoReg_op, MemWrite_op, RegWrite_op, ALUSrc_op;
output reg [1:0] ALUOp_op;
always@(RegDst_ip, Branch_ip, MemRead_ip, MemtoReg_ip, MemWrite_ip, RegWrite_ip, ALUSrc_ip, ALUOp_ip, control_line)
begin
	if(control_line == 1'b0)	//hazard has occured so make all other control signals to be 0
	begin
		RegWrite_op = 1'b0;
		ALUSrc_op = 1'b0;
		ALUOp_op = 2'b00;
		RegDst_op = 1'b0;
		Branch_op = 1'b0;
		MemWrite_op = 1'b0;
		MemRead_op = 1'b0;
		MemtoReg_op = 1'b0;
	end
	else
	begin
		RegWrite_op = RegWrite_ip;
		ALUSrc_op = ALUSrc_ip;
		ALUOp_op = ALUOp_ip;
		RegDst_op = RegDst_ip;
		Branch_op = Branch_ip;
		MemWrite_op = MemWrite_ip;
		MemRead_op = MemRead_ip;
		MemtoReg_op = MemtoReg_ip;
	end
end
endmodule

/*This is the control unit that generates all the control lines required by the processor, the names of the lines are standard names and have 
their usual task. */
module Control_Unit(Inst_31_26, RegDst, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUOp, ALUSrc, IF_Flush, Zero);
input [5:0] Inst_31_26;		//op code
output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc;
output reg [1:0] ALUOp;
input Zero;
output reg IF_Flush;
always@(Inst_31_26, Zero)
begin
	if(Inst_31_26==6'b000000)				//R-type inst
	begin
		RegWrite=1'b1;
		ALUSrc=1'b0;
		ALUOp=2'b10;
		RegDst=1'b1;
		Branch=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		MemtoReg=1'b0;
		end
	else if(Inst_31_26==6'b100011)		//LW inst
	begin
		RegWrite=1'b1;
		ALUSrc=1'b1;
		ALUOp=2'b00;
		RegDst=1'b0;
		Branch=1'b0;
		MemWrite=1'b0;
		MemRead=1'b1;
		MemtoReg=1'b1;
	end
	else if(Inst_31_26==6'b101011)		//SW inst
	begin
		RegWrite=1'b0;
		ALUSrc=1'b1;
		ALUOp=2'b00;
		RegDst=1'bx;
		Branch=1'b0;
		MemWrite=1'b1;
		MemRead=1'b0;
		MemtoReg=1'bx;
	end
	else if(Inst_31_26==6'b000100)		//BEQ inst
	begin
		RegWrite=1'b0;
		ALUSrc=1'b0;
		ALUOp=2'b01;
		RegDst=1'bx;
		Branch=1'b1;
		MemWrite=1'b0;
		MemRead=1'b0;
		MemtoReg=1'bx;
	end
	else if(Inst_31_26==6'b000101)		//BNE inst// not used in this processor, additional condition can be checked to implement this 
	begin
		RegWrite=1'b0;
		ALUSrc=1'b0;
		ALUOp=2'b01;
		RegDst=1'bx;
		Branch=1'b1;
		MemWrite=1'b0;
		MemRead=1'b0;
		MemtoReg=1'bx;
	end
	if(Zero == 1'b1)			// in case the result is 0 the IF/ID reg is flushed
		IF_Flush = 1'b0;
	else 
		IF_Flush = 1'b1;
end
endmodule

/*This module is the Register file which has a size of 1024 bits. 
the register file consists of 32 registers, and the data can be read as well as written in the registers*/
module Register_file(Read_Reg_1, Read_Reg_2, Write_Reg, Write_Data, Read_Data_1,Read_Data_2, RegWrite, Reset, Zero);
input [4:0] Read_Reg_1,Read_Reg_2,Write_Reg;
input [31:0] Write_Data;
input RegWrite,Reset;
output reg[31:0] Read_Data_1, Read_Data_2;
output reg Zero;

reg [31:0] Reg_Memory [31:0];		// Register memory

initial
	begin
		Reg_Memory[0]=32'b0;			//zero, hard wired to ground 
		Reg_Memory[1]=32'b0;			//at
		Reg_Memory[2]=32'b0;			//v0
		Reg_Memory[3]=32'b0;			//v1
		Reg_Memory[4]=32'b0;			//a0
		Reg_Memory[5]=32'b0;			//a1
		Reg_Memory[6]=32'b0;			//a2
		Reg_Memory[7]=32'b0;			//a3
		Reg_Memory[8]=32'b0;			//t0
		Reg_Memory[9]=32'd0;			//t1
		Reg_Memory[10]=32'b0;		//t2
		Reg_Memory[11]=32'b0;		//t3
		Reg_Memory[12]=32'b0;		//t4
		Reg_Memory[13]=32'b0;		//t5
		Reg_Memory[14]=32'b0;		//t6
		Reg_Memory[15]=32'b0;		//t7	
		Reg_Memory[16]=32'b0;		//s0
		Reg_Memory[17]=32'b0;		//s1	
		Reg_Memory[18]=32'b1001;	//s2	
		Reg_Memory[19]=32'd1;		//s3	
		Reg_Memory[20]=32'd0;		//s4	
		Reg_Memory[21]=32'b0;		//s5
		Reg_Memory[22]=32'b0;		//s6
		Reg_Memory[23]=32'b0;		//s7
		Reg_Memory[24]=32'b0;		//t8	
		Reg_Memory[25]=32'b0;		//t9	
		Reg_Memory[26]=32'b0;		//k0
		Reg_Memory[27]=32'b0;		//k1
		Reg_Memory[28]=32'b0;		//gp
		Reg_Memory[29]=32'b0;		//sp
		Reg_Memory[30]=32'b0;		//fp
		Reg_Memory[31]=32'b0;		//ra
end

always@(Read_Reg_1, Read_Reg_2)				// read data when there is change in the read_reg values
begin
	Read_Data_1=Reg_Memory[Read_Reg_1];
	Read_Data_2=Reg_Memory[Read_Reg_2];
	if(Read_Data_1 == Read_Data_2)
		Zero =1'b1;
	else 
		Zero =1'b0;
end

always @(RegWrite, Write_Reg, Write_Data)	//write data to the dest reg if RegWrite==1
begin
	if(RegWrite==1)
		Reg_Memory[Write_Reg] = Write_Data;
	Reg_Memory[0] = 32'b0;						// REG 0 is hard wired to ground
end
endmodule

/*This module sign extends the input*/
module Sign_Extend(sign_ext_ip, sign_ext_op);
input [15:0] sign_ext_ip;
output reg[31:0] sign_ext_op;
always@(sign_ext_ip)
begin
	if(sign_ext_ip[15]==0)			
	begin
		sign_ext_op[15:0]=sign_ext_ip[15:0];
		sign_ext_op[31:16]=16'b0;
	end
	else
	begin
		sign_ext_op[15:0]=sign_ext_ip[15:0];
		sign_ext_op[31:16]=16'b1111_1111_1111_1111;
	end
end
endmodule

/*this is the forwarding unit, detects type 1 and type 2 data hazard*/
module Forwarding_unit(Rs, Rt, EX_MEM_RegisterRd, EX_MEM_RegWrite, MEM_WB_RegisterRd, MEM_WB_RegWrite, forwardA, forwardB);
input [4:0] Rs, Rt, EX_MEM_RegisterRd, MEM_WB_RegisterRd;
input  EX_MEM_RegWrite, MEM_WB_RegWrite;
output reg[1:0] forwardA, forwardB;

always@(Rs, Rt, EX_MEM_RegisterRd, MEM_WB_RegisterRd,EX_MEM_RegWrite, MEM_WB_RegWrite)
begin 
//Rs
	if(EX_MEM_RegWrite && EX_MEM_RegisterRd!=0 && EX_MEM_RegisterRd == Rs)
		forwardA = 2'b10;
	else if(MEM_WB_RegWrite && MEM_WB_RegisterRd!=0 && MEM_WB_RegisterRd == Rs)
	begin
		if(!(EX_MEM_RegWrite && EX_MEM_RegisterRd!=0 && EX_MEM_RegisterRd == Rs))
			forwardA = 2'b01;
	end
	else
		forwardA = 2'b00;
//Rt
	if(EX_MEM_RegWrite && EX_MEM_RegisterRd!=0 && EX_MEM_RegisterRd == Rt)
		forwardB = 2'b10;
	else if(MEM_WB_RegWrite && MEM_WB_RegisterRd!=0 && MEM_WB_RegisterRd == Rt)
	begin
		if(!(EX_MEM_RegWrite && EX_MEM_RegisterRd!=0 && EX_MEM_RegisterRd == Rt))
			forwardB = 2'b01;
	end
	else
		forwardB = 2'b00;
end
endmodule

/* mux forwardA*/
module Mux_forwardA(Read_Data_1, Write_Data, ALU_Result, forwardA, ALU_inp_1);
input [31:0] Read_Data_1, Write_Data, ALU_Result;
input [1:0] forwardA;
output reg[31:0] ALU_inp_1;
always@(Read_Data_1, Write_Data, ALU_Result, forwardA)
begin
	if(forwardA == 00)
	begin
		ALU_inp_1 = Read_Data_1;
	end
	else if(forwardA == 2'b10)
	begin
		ALU_inp_1 = ALU_Result;
	end
	else if(forwardA == 2'b01)
	begin	
		ALU_inp_1 =  Write_Data;
	end
end
endmodule

/* mux forwardB*/
module Mux_forwardB(Read_Data_2, Write_Data, ALU_Result, forwardB, ALU_inp_mid_2);
input [31:0] Read_Data_2, Write_Data, ALU_Result;
input [1:0] forwardB;
output reg[31:0] ALU_inp_mid_2;
always@(Read_Data_2, Write_Data, ALU_Result, forwardB)
begin
	if(forwardB == 00)
		ALU_inp_mid_2 = Read_Data_2;
	else if(forwardB == 2'b10)
		ALU_inp_mid_2 = ALU_Result;
	else if(forwardB == 2'b01)
		ALU_inp_mid_2 =  Write_Data;
end
endmodule


/*this module shifts the input left by 2 bits, both input and output are 32 bits, used in case of branch Instruction*/
module Shift_left_2(sign_ext_op, shift_left_op);
input [31:0] sign_ext_op;
output reg[31:0] shift_left_op;
always@(sign_ext_op)
begin
	shift_left_op = sign_ext_op<<32'd2;
end
endmodule

/*used to update the value of PC*/
module PC_Adder_2(PC_4, PC_Add, shift_left_op);
input [31:0] shift_left_op, PC_4;
output reg [31:0] PC_Add;
always@(PC_4,shift_left_op)
begin
	PC_Add = PC_4 + shift_left_op;	//used in case of branch instruction
end
endmodule	

/*this module is used to select the 2nd input of the ALU*/
module Mux_ALUSrc (ALUSrc, Read_Data_2, Sign_extended_data, ALU_Inp_2);
input ALUSrc;
input [31:0] Read_Data_2,Sign_extended_data;
output reg[31:0] ALU_Inp_2;
always@(ALUSrc, Read_Data_2, Sign_extended_data)
begin
	if(ALUSrc==0)
		ALU_Inp_2 = Read_Data_2;
	else
		ALU_Inp_2 = Sign_extended_data;
end
endmodule
	
/*this module is used to generate ALU_control_op that helps the ALU decide which arithmetic operation to perform*/
module ALU_Control(ALU_control_op, ALUOp, Inst_5_0);
output reg[3:0] ALU_control_op;
input [1:0] ALUOp;
input [5:0] Inst_5_0;

always@(ALUOp, Inst_5_0)
begin
	case(ALUOp)
		2'd0: ALU_control_op = 4'b0010;		// LW,SW inst
		2'd1:	ALU_control_op = 4'b0110;		// BEQ inst
		2'd2:	
			if(Inst_5_0 == 6'b100000)			//	R-type add
				ALU_control_op = 4'b0010;			
			else if( Inst_5_0 == 6'b100010)	// R-type sub
				ALU_control_op = 4'b0110;
			else if( Inst_5_0 == 6'b100100)	// R-type and 
				ALU_control_op = 4'b0000;	
			else if( Inst_5_0 == 6'b100101)	//	R-type or 
				ALU_control_op = 4'b0001;
			else if( Inst_5_0 == 6'b101010)	// R-type slt
				ALU_control_op = 4'b0111;		
		default: $display ("Invalid ALUOp Signal");
	endcase
end
endmodule

/*this module does all the arithmetic operations specified/involved in the instructions.*/
module ALU (Read_Data_1, ALU_Inp_2, ALU_control_op, ALU_Result);
input [31:0] Read_Data_1;
input [31:0] ALU_Inp_2;
input [3:0] ALU_control_op;
output reg[31:0] ALU_Result;

always@(Read_Data_1, ALU_Inp_2, ALU_control_op)
begin
	case(ALU_control_op)
		4'd0 : ALU_Result = Read_Data_1 & ALU_Inp_2;			//and
		4'd1 : ALU_Result = Read_Data_1 | ALU_Inp_2;			//or
		4'd2 : ALU_Result = Read_Data_1 + ALU_Inp_2;			//add
		4'd6 : ALU_Result = Read_Data_1 - ALU_Inp_2;			//sub
		4'd7 : ALU_Result = (Read_Data_1 - ALU_Inp_2)>>31;	//slt
		default: $display ("Invalid ALU Control Signal");
	endcase
end
endmodule

/*this module decides the destination regiter number*/
module Mux_RegDst(Inst_20_16, Inst_15_11, RegDst, Write_Reg);
input [4:0] Inst_20_16, Inst_15_11;
input RegDst;
output reg [4:0]Write_Reg;
always@(Inst_20_16, Inst_15_11, RegDst)
begin
	if(RegDst==1)
	begin
		Write_Reg = Inst_15_11;
	end
	else
	begin
		Write_Reg = Inst_20_16;
	end
end
endmodule

/*used to 'and' Zero and Branch control line*/
module PCSrc_And(Zero, Branch, PCSrc);
input Branch,Zero;
output reg PCSrc;
always@(Branch, Zero)
begin
	PCSrc = Branch & Zero;
end
endmodule
	
/*this module contains the 4096 bits data memory. it includes operations wherein data is read/stored in the data memory*/
module Data_Memory(ALU_Result, MemWrite, Write_Data, Read_Data, MemRead);
input MemWrite, MemRead;
input [31:0] ALU_Result, Write_Data;
output reg [31:0] Read_Data;
reg [7:0] DatMem [511:0];				//data memory is 512*8bits=1024*4bits=4kilobits
initial begin
		DatMem[0]=8'b0;
		DatMem[1]=8'b0;
		DatMem[2]=8'b0;
		DatMem[3]=8'b0;
		
		DatMem[4]=8'b0;
		DatMem[5]=8'b0;
		DatMem[6]=8'b0;
		DatMem[7]=8'b0;
		
		DatMem[8]=8'b0;
		DatMem[9]=8'b0;
		DatMem[10]=8'b0;
		DatMem[11]=8'b1000;
	
		DatMem[12]=8'b1000;
		DatMem[13]=8'b1000;
		DatMem[14]=8'b1000;
		DatMem[15]=8'b0;
		
		DatMem[16]=8'b0;
		DatMem[17]=8'b0;
		DatMem[18]=8'b0;
		DatMem[19]=8'b0;
		
		DatMem[20]=8'b0;
		DatMem[21]=8'b0;
		DatMem[22]=8'b0;
		DatMem[23]=8'b0;
		
		DatMem[24]=8'b0;
		DatMem[25]=8'b0;
		DatMem[26]=8'b0;
		DatMem[27]=8'b0;
		
		DatMem[28]=8'b0;
		DatMem[29]=8'b0;
		DatMem[30]=8'b0;
		DatMem[31]=8'b0;
		
		DatMem[32]=8'b0;
		DatMem[33]=8'b0;
		DatMem[34]=8'b0;
		DatMem[35]=8'b0;
		
		DatMem[36]=8'b0;
		DatMem[37]=8'b0;
		DatMem[38]=8'b0;
		DatMem[39]=8'b0;
		
		DatMem[40]=8'b0;
		DatMem[41]=8'b0;
		DatMem[42]=8'b0;
		DatMem[43]=8'b0;
		
		DatMem[44]=8'b0;
		DatMem[45]=8'b0;
		DatMem[46]=8'b0;
		DatMem[47]=8'b0;
		
		DatMem[48]=8'b0;
		DatMem[49]=8'b0;
		DatMem[50]=8'b0;
		DatMem[51]=8'b0;
		
		DatMem[52]=8'b0;
		DatMem[53]=8'b0;
		DatMem[54]=8'b0;
		DatMem[55]=8'b0;
		
		DatMem[56]=8'b0;
		DatMem[57]=8'b0;
		DatMem[58]=8'b0;
		DatMem[59]=8'b0;
		
		DatMem[60]=8'b0;
		DatMem[61]=8'b0;
		DatMem[62]=8'b0;
		DatMem[63]=8'b0;
		
		DatMem[64]=8'b0;
		DatMem[65]=8'b0;
		DatMem[66]=8'b0;
		DatMem[67]=8'b0;
		
		DatMem[68]=8'b0;
		DatMem[69]=8'b0;
		DatMem[70]=8'b0;
		DatMem[71]=8'b0;
		
		DatMem[72]=8'b0;
		DatMem[73]=8'b0;
		DatMem[74]=8'b0;
		DatMem[75]=8'b0;
		
		DatMem[76]=8'b0;
		DatMem[77]=8'b0;
		DatMem[78]=8'b0;
		DatMem[79]=8'b0;
		
		DatMem[80]=8'b0;
		DatMem[81]=8'b0;
		DatMem[82]=8'b0;
		DatMem[83]=8'b0;
		
		DatMem[84]=8'b0;
		DatMem[85]=8'b0;
		DatMem[86]=8'b0;
		DatMem[87]=8'b0;
		
		DatMem[88]=8'b0;
		DatMem[89]=8'b0;
		DatMem[90]=8'b0;
		DatMem[91]=8'b0;
		
		DatMem[92]=8'b0;
		DatMem[93]=8'b0;
		DatMem[94]=8'b0;
		DatMem[95]=8'b0;
		
		DatMem[96]=8'b0;
		DatMem[97]=8'b0;
		DatMem[98]=8'b0;
		DatMem[99]=8'b0;
		
		DatMem[100]=8'b0;
		DatMem[101]=8'b0;
		DatMem[102]=8'b0;
		DatMem[103]=8'b0;
		
		DatMem[104]=8'b0;
		DatMem[105]=8'b0;
		DatMem[106]=8'b0;
		DatMem[107]=8'b0;
		
		DatMem[108]=8'b0;
		DatMem[109]=8'b0;
		DatMem[110]=8'b0;
		DatMem[111]=8'b0;
		
		DatMem[112]=8'b0;
		DatMem[113]=8'b0;
		DatMem[114]=8'b0;
		DatMem[115]=8'b0;
		
		DatMem[116]=8'b0;
		DatMem[117]=8'b0;
		DatMem[118]=8'b0;
		DatMem[119]=8'b0;
		
		DatMem[120]=8'b0;
		DatMem[121]=8'b0;
		DatMem[122]=8'b0;
		DatMem[123]=8'b0;
		
		DatMem[124]=8'b0;
		DatMem[125]=8'b0;
		DatMem[126]=8'b0;
		DatMem[127]=8'b0;
		
		DatMem[128]=8'b0;
		DatMem[129]=8'b0;
		DatMem[130]=8'b0;
		DatMem[131]=8'b0;
		
		DatMem[132]=8'b0;
		DatMem[133]=8'b0;
		DatMem[134]=8'b0;
		DatMem[135]=8'b0;
		
		DatMem[136]=8'b0;
		DatMem[137]=8'b0;
		DatMem[138]=8'b0;
		DatMem[139]=8'b0;
		
		DatMem[140]=8'b0;
		DatMem[141]=8'b0;
		DatMem[142]=8'b0;
		DatMem[143]=8'b0;
		
		DatMem[144]=8'b0;
		DatMem[145]=8'b0;
		DatMem[146]=8'b0;
		DatMem[147]=8'b0;
		
		DatMem[148]=8'b0;
		DatMem[149]=8'b0;
		DatMem[150]=8'b0;
		DatMem[151]=8'b0;
		
		DatMem[152]=8'b0;
		DatMem[153]=8'b0;
		DatMem[154]=8'b0;
		DatMem[155]=8'b0;
		
		DatMem[156]=8'b0;
		DatMem[157]=8'b0;
		DatMem[158]=8'b0;
		DatMem[159]=8'b0;
		
		DatMem[160]=8'b0;
		DatMem[161]=8'b0;
		DatMem[162]=8'b0;
		DatMem[163]=8'b0;
		
		DatMem[164]=8'b0;
		DatMem[165]=8'b0;
		DatMem[166]=8'b0;
		DatMem[167]=8'b0;
		
		DatMem[168]=8'b0;
		DatMem[169]=8'b0;
		DatMem[170]=8'b0;
		DatMem[171]=8'b0;
		
		DatMem[172]=8'b0;
		DatMem[173]=8'b0;
		DatMem[174]=8'b0;
		DatMem[175]=8'b0;
		
		DatMem[176]=8'b0;
		DatMem[177]=8'b0;
		DatMem[178]=8'b0;
		DatMem[179]=8'b0;
		
		DatMem[180]=8'b0;
		DatMem[181]=8'b0;
		DatMem[182]=8'b0;
		DatMem[183]=8'b0;
		
		DatMem[184]=8'b0;
		DatMem[185]=8'b0;
		DatMem[186]=8'b0;
		DatMem[187]=8'b0;
		
		DatMem[188]=8'b0;
		DatMem[189]=8'b0;
		DatMem[190]=8'b0;
		DatMem[191]=8'b0;
		
		DatMem[192]=8'b0;
		DatMem[193]=8'b0;
		DatMem[194]=8'b0;
		DatMem[195]=8'b0;
		
		DatMem[196]=8'b0;
		DatMem[197]=8'b0;
		DatMem[198]=8'b0;
		DatMem[199]=8'b0;
		
		DatMem[200]=8'b0;
		DatMem[201]=8'b0;
		DatMem[202]=8'b0;
		DatMem[203]=8'b0;
		
		DatMem[204]=8'b0;
		DatMem[205]=8'b0;
		DatMem[206]=8'b0;
		DatMem[207]=8'b0;
		
		DatMem[208]=8'b0;
		DatMem[209]=8'b0;
		DatMem[210]=8'b0;
		DatMem[211]=8'b0;
		
		DatMem[212]=8'b0;
		DatMem[213]=8'b0;
		DatMem[214]=8'b0;
		DatMem[215]=8'b0;
		
		DatMem[216]=8'b0;
		DatMem[217]=8'b0;
		DatMem[218]=8'b0;
		DatMem[219]=8'b0;
		
		DatMem[220]=8'b0;
		DatMem[221]=8'b0;
		DatMem[222]=8'b0;
		DatMem[223]=8'b0;
		
		DatMem[224]=8'b0;
		DatMem[225]=8'b0;
		DatMem[226]=8'b0;
		DatMem[227]=8'b0;
		
		DatMem[228]=8'b0;
		DatMem[229]=8'b0;
		DatMem[230]=8'b0;
		DatMem[231]=8'b0;
		
		DatMem[232]=8'b0;
		DatMem[233]=8'b0;
		DatMem[234]=8'b0;
		DatMem[235]=8'b0;
		
		DatMem[236]=8'b0;
		DatMem[237]=8'b0;
		DatMem[238]=8'b0;
		DatMem[239]=8'b0;
		
		DatMem[240]=8'b0;
		DatMem[241]=8'b0;
		DatMem[242]=8'b0;
		DatMem[243]=8'b0;
		
		DatMem[244]=8'b0;
		DatMem[245]=8'b0;
		DatMem[246]=8'b0;
		DatMem[247]=8'b0;
		
		DatMem[248]=8'b0;
		DatMem[249]=8'b0;
		DatMem[250]=8'b0;
		DatMem[251]=8'b0;
		
		DatMem[252]=8'b0;
		DatMem[253]=8'b0;
		DatMem[254]=8'b0;
		DatMem[255]=8'b0;
		
		DatMem[256]=8'b0;
		DatMem[257]=8'b0;
		DatMem[258]=8'b0;
		DatMem[259]=8'b0;
		
		DatMem[260]=8'b0;
		DatMem[261]=8'b0;
		DatMem[262]=8'b0;
		DatMem[263]=8'b0;
		
		DatMem[264]=8'b0;
		DatMem[265]=8'b0;
		DatMem[266]=8'b0;
		DatMem[267]=8'b0;
		
		DatMem[268]=8'b0;
		DatMem[269]=8'b0;
		DatMem[270]=8'b0;
		DatMem[271]=8'b0;
		
		DatMem[272]=8'b0;
		DatMem[273]=8'b0;
		DatMem[274]=8'b0;
		DatMem[275]=8'b0;
		
		DatMem[276]=8'b0;
		DatMem[277]=8'b0;
		DatMem[278]=8'b0;
		DatMem[279]=8'b0;
		
		DatMem[280]=8'b0;
		DatMem[281]=8'b0;
		DatMem[282]=8'b0;
		DatMem[283]=8'b0;
	
		DatMem[284]=8'b0;
		DatMem[285]=8'b0;
		DatMem[286]=8'b0;
		DatMem[287]=8'b0;

		DatMem[288]=8'b0;
		DatMem[289]=8'b0;
		DatMem[290]=8'b0;
		DatMem[291]=8'b0;
	
		DatMem[292]=8'b0;
		DatMem[293]=8'b0;
		DatMem[294]=8'b0;
		DatMem[295]=8'b0;
		
		DatMem[296]=8'b0;
		DatMem[297]=8'b0;
		DatMem[298]=8'b0;
		DatMem[299]=8'b0;
		
		DatMem[300]=8'b0;
		DatMem[301]=8'b0;
		DatMem[302]=8'b0;
		DatMem[303]=8'b0;
		
		DatMem[304]=8'b0;
		DatMem[305]=8'b0;
		DatMem[306]=8'b0;
		DatMem[307]=8'b0;
		
		DatMem[308]=8'b0;
		DatMem[309]=8'b0;
		DatMem[310]=8'b0;
		DatMem[311]=8'b0;
		
		DatMem[312]=8'b0;
		DatMem[313]=8'b0;
		DatMem[314]=8'b0;
		DatMem[315]=8'b0;
	
		DatMem[316]=8'b0;
		DatMem[317]=8'b0;
		DatMem[318]=8'b0;
		DatMem[319]=8'b0;
		
		DatMem[320]=8'b0;
		DatMem[321]=8'b0;
		DatMem[322]=8'b0;
		DatMem[323]=8'b0;
		
		DatMem[324]=8'b0;
		DatMem[325]=8'b0;
		DatMem[326]=8'b0;
		DatMem[327]=8'b0;
		
		DatMem[328]=8'b0;
		DatMem[329]=8'b0;
		DatMem[330]=8'b0;
		DatMem[331]=8'b0;
	
		DatMem[332]=8'b0;
		DatMem[333]=8'b0;
		DatMem[334]=8'b0;
		DatMem[335]=8'b0;
	
		DatMem[336]=8'b0;
		DatMem[337]=8'b0;
		DatMem[338]=8'b0;
		DatMem[339]=8'b0;
		
		DatMem[340]=8'b0;
		DatMem[341]=8'b0;
		DatMem[342]=8'b0;
		DatMem[343]=8'b0;
		
		DatMem[344]=8'b0;
		DatMem[345]=8'b0;
		DatMem[346]=8'b0;
		DatMem[347]=8'b0;
		
		DatMem[348]=8'b0;
		DatMem[349]=8'b0;
		DatMem[350]=8'b0;
		DatMem[351]=8'b0;
		
		DatMem[352]=8'b0;
		DatMem[353]=8'b0;
		DatMem[354]=8'b0;
		DatMem[355]=8'b0;
		
		DatMem[356]=8'b0;
		DatMem[357]=8'b0;
		DatMem[358]=8'b0;
		DatMem[359]=8'b0;
		
		DatMem[360]=8'b0;
		DatMem[361]=8'b0;
		DatMem[362]=8'b0;
		DatMem[363]=8'b0;
		
		DatMem[364]=8'b0;
		DatMem[365]=8'b0;
		DatMem[366]=8'b0;
		DatMem[367]=8'b0;
		
		DatMem[368]=8'b0;
		DatMem[369]=8'b0;
		DatMem[370]=8'b0;
		DatMem[371]=8'b0;
		
		DatMem[372]=8'b0;
		DatMem[373]=8'b0;
		DatMem[374]=8'b0;
		DatMem[375]=8'b0;
		
		DatMem[376]=8'b0;
		DatMem[377]=8'b0;
		DatMem[378]=8'b0;
		DatMem[379]=8'b0;
		
		DatMem[380]=8'b0;
		DatMem[381]=8'b0;
		DatMem[382]=8'b0;
		DatMem[383]=8'b0;
		
		DatMem[384]=8'b0;
		DatMem[385]=8'b0;
		DatMem[386]=8'b0;
		DatMem[387]=8'b0;
		
		DatMem[388]=8'b0;
		DatMem[389]=8'b0;
		DatMem[390]=8'b0;
		DatMem[391]=8'b0;
		
		DatMem[392]=8'b0;
		DatMem[393]=8'b0;
		DatMem[394]=8'b0;
		DatMem[395]=8'b0;
		
		DatMem[396]=8'b0;
		DatMem[397]=8'b0;
		DatMem[398]=8'b0;
		DatMem[399]=8'b0;
		
		DatMem[400]=8'b0;
		DatMem[401]=8'b0;
		DatMem[402]=8'b0;
		DatMem[403]=8'b0;
	
		DatMem[404]=8'b0;
		DatMem[405]=8'b0;
		DatMem[406]=8'b0;
		DatMem[407]=8'b0;
	
		DatMem[408]=8'b0;
		DatMem[409]=8'b0;
		DatMem[410]=8'b0;
		DatMem[411]=8'b0;
		
		DatMem[412]=8'b0;
		DatMem[413]=8'b0;
		DatMem[414]=8'b0;
		DatMem[415]=8'b0;
		
		DatMem[416]=8'b0;
		DatMem[417]=8'b0;
		DatMem[418]=8'b0;
		DatMem[419]=8'b0;
		
		DatMem[420]=8'b0;
		DatMem[421]=8'b0;
		DatMem[422]=8'b0;
		DatMem[423]=8'b0;
		
		DatMem[424]=8'b0;
		DatMem[425]=8'b0;
		DatMem[426]=8'b0;
		DatMem[427]=8'b0;
		
		DatMem[428]=8'b0;
		DatMem[429]=8'b0;
		DatMem[430]=8'b0;
		DatMem[431]=8'b0;
		
		DatMem[432]=8'b0;
		DatMem[433]=8'b0;
		DatMem[434]=8'b0;
		DatMem[435]=8'b0;
		
		DatMem[436]=8'b0;
		DatMem[437]=8'b0;
		DatMem[438]=8'b0;
		DatMem[439]=8'b0;
	
		DatMem[440]=8'b0;
		DatMem[441]=8'b0;
		DatMem[442]=8'b0;
		DatMem[443]=8'b0;
		
		DatMem[444]=8'b0;
		DatMem[445]=8'b0;
		DatMem[446]=8'b0;
		DatMem[447]=8'b0;
		
		DatMem[448]=8'b0;
		DatMem[49]=8'b0;
		DatMem[450]=8'b0;
		DatMem[451]=8'b0;
		
		DatMem[452]=8'b0;
		DatMem[453]=8'b0;
		DatMem[454]=8'b0;
		DatMem[455]=8'b0;
		
		DatMem[456]=8'b0;
		DatMem[457]=8'b0;
		DatMem[458]=8'b0;
		DatMem[459]=8'b0;
		
		DatMem[460]=8'b0;
		DatMem[461]=8'b0;
		DatMem[462]=8'b0;
		DatMem[463]=8'b0;
		
		DatMem[464]=8'b0;
		DatMem[465]=8'b0;
		DatMem[466]=8'b0;
		DatMem[467]=8'b0;
		
		DatMem[468]=8'b0;
		DatMem[469]=8'b0;
		DatMem[470]=8'b0;
		DatMem[471]=8'b0;
		
		DatMem[472]=8'b0;
		DatMem[473]=8'b0;
		DatMem[474]=8'b0;
		DatMem[475]=8'b0;
		
		DatMem[476]=8'b0;
		DatMem[477]=8'b0;
		DatMem[478]=8'b0;
		DatMem[479]=8'b0;
		
		DatMem[480]=8'b0;
		DatMem[481]=8'b0;
		DatMem[482]=8'b0;
		DatMem[483]=8'b0;
	
		DatMem[484]=8'b0;
		DatMem[485]=8'b0;
		DatMem[486]=8'b0;
		DatMem[487]=8'b0;
		
		DatMem[488]=8'b0;
		DatMem[489]=8'b0;
		DatMem[490]=8'b0;
		DatMem[491]=8'b0;
	
		DatMem[492]=8'b0;
		DatMem[493]=8'b0;
		DatMem[494]=8'b0;
		DatMem[495]=8'b0;
		
		DatMem[496]=8'b0;
		DatMem[497]=8'b0;
		DatMem[498]=8'b0;
		DatMem[499]=8'b0;	
		
		DatMem[500]=8'b0;
		DatMem[501]=8'b0;
		DatMem[502]=8'b0;
		DatMem[503]=8'b0;
	
		DatMem[504]=8'b0;
		DatMem[505]=8'b0;
		DatMem[506]=8'b0;
		DatMem[507]=8'b0;
	
		DatMem[508]=8'b0;
		DatMem[509]=8'b0;
		DatMem[510]=8'b0;
		DatMem[511]=8'b0;
end

always@(MemWrite, MemRead, ALU_Result, Write_Data)
begin 
	if(MemWrite==1)												// if MemWrite is 1, then write data in memeory else read data
	begin
			DatMem[ALU_Result] = Write_Data[7:0];			// ALU Result is the address of data memory location
			DatMem[ALU_Result+1] = Write_Data[15:8];	
			DatMem[ALU_Result+2] = Write_Data[23:16];	
			DatMem[ALU_Result+3] = Write_Data[31:24];		
	end
	else
	begin
			Read_Data = {DatMem[ALU_Result+3],DatMem[ALU_Result+2],DatMem[ALU_Result+1],DatMem[ALU_Result]};
	end
end
endmodule
	
/*this module decides what data will be written in register file*/
module Mux_MemtoReg(Read_Data, ALU_Result, MemtoReg, Write_Data); 
input [31:0] Read_Data, ALU_Result;
input MemtoReg;
output reg [31:0]Write_Data;
always@(Read_Data, ALU_Result, MemtoReg)
begin
	if(MemtoReg==1)
	begin
		Write_Data = Read_Data;
	end
	else
	begin
		Write_Data = ALU_Result;
	end
end
endmodule
	
/*main module wherein all the above mentioned modules are called.*/
module MIPS_Pipelined_Processor(Clk, Reset);
	input Reset, Clk;				//inputs
	wire [31:0] Instruction;	//wire for storing the instructions
	reg [31:0] PC_initial;
	wire [31:0]PC_4, PC_final;
	wire PCSrc, PCWrite;
	wire [31:0]	PC_Add;
	always@(posedge Clk)			//PC is updated only on positive edge of clock
	begin
		if(Reset==0)
			PC_initial <= 32'd00;
		else if(PCWrite == 1'b0)	//checking if hazard has occured or not
			PC_initial <= PC_initial;
		else 
			PC_initial <= PC_final;
	end
	
	//IF stage
	Instruction_Fetch u1(Instruction, PC_initial, Reset);			//inst fetched only on positive edge of clk
	PC_Adder_1 u2(PC_initial, PC_4);										//executes only when PC_initial changes
	Mux_PCSrc u3(PCSrc, PC_4, PC_Add, PC_final);						//when PCSrc, PC_4, PC_Add change
	
	// pipelined registers IF/ID
	reg [31:0] IF_ID_PC;
	reg [31:0] IF_ID_Instruction;
	
	wire IF_Flush, Zero;
	always@(posedge Clk)
	begin
		if(IF_Flush == 1'b0)				//if branch has occured then flush the current value stored in IF/ID pipeline registers
		begin
			IF_ID_PC <= 0;
			IF_ID_Instruction <= 0;
		end
		else if(IF_ID_Write == 1'b0)	//if lw hazard then preserve the data
		begin
			IF_ID_PC <= IF_ID_PC;
			IF_ID_Instruction <= IF_ID_Instruction;
		end
		else									//else update the values
		begin
			IF_ID_PC <= PC_4;
			IF_ID_Instruction <= Instruction;
		end
		
	end
	
	//ID stage
	wire RegDst, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc;	//control lines
	wire [1:0] ALUOp;																		//contol lines
	wire [4:0] Write_Reg;
	wire [31:0] Write_Data;
	wire [31:0] Read_Data_1,Read_Data_2;
	wire [31:0] sign_ext_op;
	Control_Unit u4(IF_ID_Instruction[31:26], RegDst, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUOp, ALUSrc, IF_Flush, Zero);//executes only when IF_ID changes
	
	//for hazard detection
	wire RegDst_op, Branch_op, MemRead_op, MemtoReg_op, MemWrite_op, RegWrite_op, ALUSrc_op;	//control lines
	wire [1:0] ALUOp_op;																								//contol line
	wire control_line, IF_ID_Write;																				//control lines for hazard unit
	reg [4:0] ID_EX_Inst_20_16;
	reg ID_EX_MemRead;
	Hazard_detection_unit u19(IF_ID_Instruction[25:21], IF_ID_Instruction[20:16], ID_EX_Inst_20_16, ID_EX_MemRead, control_line, IF_ID_Write, PCWrite);
	Mux_Control u20(control_line, RegDst, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc, ALUOp, RegDst_op, Branch_op, MemRead_op, MemtoReg_op, MemWrite_op, RegWrite_op, ALUSrc_op, ALUOp_op);
	
	//for other ID modules
	reg [4:0] MEM_WB_Write_Reg;
	wire [31:0] MEM_WB_Write_Data;
	reg MEM_WB_RegWrite;
	wire [31:0] shift_left_op;
	Register_file u5(IF_ID_Instruction[25:21], IF_ID_Instruction[20:16], MEM_WB_Write_Reg, MEM_WB_Write_Data, Read_Data_1, Read_Data_2, MEM_WB_RegWrite, Reset, Zero);
	Sign_Extend u6(IF_ID_Instruction[15:0], sign_ext_op);			// executes only when IF_ID changes
	
	Shift_left_2 u7(sign_ext_op, shift_left_op);						// executes only when ID_EX changes
	PC_Adder_2 u8(IF_ID_PC, PC_Add, shift_left_op);					// executes only when ID_EX changes
	PCSrc_And u13(Zero, Branch_op, PCSrc); 							//executes only when EX_MEM changes
	
	// pipelined registers ID/EX
	reg [31:0] ID_EX_Read_Data_1, ID_EX_Read_Data_2, ID_EX_sign_ext_op;
	reg [4:0] ID_EX_Inst_15_11, ID_EX_Inst_25_21;
	reg ID_EX_RegDst, ID_EX_MemtoReg, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_ALUSrc;//control lines
	reg [1:0] ID_EX_ALUOp;		//contol line
	
	always@(posedge Clk)
	begin
			ID_EX_Read_Data_1 <= Read_Data_1;
			ID_EX_Read_Data_2 <= Read_Data_2;
			ID_EX_sign_ext_op <= sign_ext_op;
			ID_EX_Inst_25_21 <= IF_ID_Instruction[25:21];
			ID_EX_Inst_20_16 <= IF_ID_Instruction[20:16];
			ID_EX_Inst_15_11 <= IF_ID_Instruction[15:11];
			ID_EX_RegDst <= RegDst_op;
			ID_EX_MemRead <= MemRead_op;
			ID_EX_MemtoReg <= MemtoReg_op; 
			ID_EX_MemWrite <= MemWrite_op;
			ID_EX_RegWrite <= RegWrite_op;
			ID_EX_ALUSrc <= ALUSrc_op;
			ID_EX_ALUOp <= ALUOp_op;
	end
	
	//EX stage
	wire [1:0] forwardA, forwardB;
	wire [31:0] ALU_inp_1, ALU_inp_mid_2;
	
	//defining EX/MEM pipeline register needed in EX stage
	reg [31:0] EX_MEM_ALU_Result;
	reg EX_MEM_RegWrite;
	reg [4:0] EX_MEM_Write_Reg;
		
	//forwarding unit
	Forwarding_unit u16(ID_EX_Inst_25_21 , ID_EX_Inst_20_16 , EX_MEM_Write_Reg , EX_MEM_RegWrite, MEM_WB_Write_Reg, MEM_WB_RegWrite,forwardA, forwardB);
	//muxforwardA
	Mux_forwardA u17(ID_EX_Read_Data_1, MEM_WB_Write_Data, EX_MEM_ALU_Result, forwardA, ALU_inp_1);
	//muxforwardB
	Mux_forwardB u18(ID_EX_Read_Data_2, MEM_WB_Write_Data, EX_MEM_ALU_Result, forwardB, ALU_inp_mid_2);
	
	wire [31:0] ALU_Inp_2, ALU_Result;
	wire [3:0] ALU_control_op;
	
	Mux_ALUSrc u9(ID_EX_ALUSrc, ALU_inp_mid_2, ID_EX_sign_ext_op, ALU_Inp_2);// when ID_EX changes
	ALU_Control u10(ALU_control_op, ID_EX_ALUOp, ID_EX_sign_ext_op[5:0]);// when ID_EX changes
	ALU u11(ALU_inp_1, ALU_Inp_2, ALU_control_op, ALU_Result);// when ID_EX changes
	Mux_RegDst u12(ID_EX_Inst_20_16, ID_EX_Inst_15_11, ID_EX_RegDst, Write_Reg);// when ID_EX changes
	
	// pipelined registers EX/MEM
	reg [31:0] EX_MEM_Read_Data_2;
	reg EX_MEM_MemRead, EX_MEM_MemtoReg, EX_MEM_MemWrite;
	
	always@(posedge Clk)
	begin
		EX_MEM_ALU_Result <= ALU_Result;
		EX_MEM_Read_Data_2 <= ID_EX_Read_Data_2;
		EX_MEM_Write_Reg <= Write_Reg;
		EX_MEM_MemRead <= ID_EX_MemRead;
		EX_MEM_MemtoReg <= ID_EX_MemtoReg; 
		EX_MEM_MemWrite <= ID_EX_MemWrite; 
		EX_MEM_RegWrite <= ID_EX_RegWrite;
	end
	
	//MEM stage
	wire [31:0] Mem_Read_Data;
	Data_Memory u14(EX_MEM_ALU_Result, EX_MEM_MemWrite, EX_MEM_Read_Data_2, Mem_Read_Data, EX_MEM_MemRead);//when EX_MEM changes
	
	// pipelined registers MEM/WB
	reg [31:0] MEM_WB_Read_Data, MEM_WB_ALU_Result;
	reg MEM_WB_MemtoReg;
	
	always@(posedge Clk)
	begin
		MEM_WB_Read_Data <= Mem_Read_Data;
		MEM_WB_ALU_Result <= EX_MEM_ALU_Result;
		MEM_WB_Write_Reg <= EX_MEM_Write_Reg;
		MEM_WB_RegWrite <= EX_MEM_RegWrite;
		MEM_WB_MemtoReg <= EX_MEM_MemtoReg;
	end
	//WB stage
	Mux_MemtoReg u15(MEM_WB_Read_Data, MEM_WB_ALU_Result, MEM_WB_MemtoReg, MEM_WB_Write_Data); //when MEM_WB changes
	
endmodule
