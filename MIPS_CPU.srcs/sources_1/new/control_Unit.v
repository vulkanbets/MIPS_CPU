`timescale 1ns / 1ps

module control_Unit # ( parameter WL = 32 )
(
    input [WL - 1 : 0] instruction
);
    wire [5 : 0] opcode = instruction[31 : 26];
    wire [4 : 0] rs = instruction[25 : 21];
    wire [4 : 0] rt = instruction[20 : 16];
    wire [4 : 0] rd = instruction[15 : 11];
    wire [15 : 0] Imm = instruction[15 : 0];
    wire [5 : 0] funct = instruction[5 : 0];
    wire [25 : 0] Jaddr = instruction[25 : 0];
    
endmodule