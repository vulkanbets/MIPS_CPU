`timescale 1ns / 1ps

module tb_MIPS_CPU;
// Parameters
parameter WL = 32, MEM_Depth = 64;
//Inputs
reg CLK;                                    // Clock
reg DMWE;                                   // Data Memory
reg [WL - 1 : 0] DMA;                       // Data Memory
reg [WL - 1 : 0] DMWD;                      // Data Memory
reg [WL - 1 : 0] addr;                      // Instruction Memory
// Outputs
wire [WL - 1 : 0] DMRD;                     // Data Memory
wire [WL - 1 : 0] instruction;              // Instruction Memory
// Instantiate DUT
    top # ( .WL(WL), .MEM_Depth(MEM_Depth) )
            DUT( .CLK(CLK),                 // Clock
                 .DMWE(DMWE),               // Data Memory
                 .DMA(DMA),                 // Data Memory
                 .DMWD(DMWD),               // Data Memory
                 .DMRD(DMRD),               // Data Memory
                 .addr(addr),               // Instruction Memory
                 .instruction(instruction)  // Instruction Memory
               );
// Clock generation
always #100 CLK <= ~CLK;
initial
    begin
        CLK <= 0;                           // Clock
        addr <= 0;                          // Instruction Memory
        DMWD <= 0;                          // Data Memory
        DMWE <= 0;                          // Data Memory
        DMA  <= 0;                          // Data Memory
        @(posedge CLK);                     // Clock
        DMA  <= 1;                          // Data Memory
        addr <= 1;                          // Instruction Memory
        @(posedge CLK);                     // Clock
        DMA  <= 2;                          // Data Memory
        addr <= 2;                          // Instruction Memory
        @(posedge CLK);                     // Clock
        DMA  <= 3;                          // Data Memory
        addr <= 3;                          // Instruction Memory
        @(posedge CLK);                     // Clock
        DMA  <= 4;                          // Data Memory
        addr <= 4;                          // Instruction Memory
    end
endmodule
