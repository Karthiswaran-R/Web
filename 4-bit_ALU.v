//===========================================================
// Company       : VLSI Design Hub
// File          : ALU_4bit.v
// Description   : 4-bit ALU with various arithmetic and logic operations
// Author        : Karthiswaran
// Email         : contact@vlsidesignhub.com
// Website       : https://www.vlsidesignhub.app
// Last Updated  : 13/01/2025
//===========================================================
// Redistribution and use in source and binary forms are NOT permitted
// except with explicit written permission from VLSI Design Hub.
// All copies or substantial portions of this file must include
// the above copyright notice and this permission notice.
//
// Revision History:
//
// Version | Author       | Date         | Changes Made
// -------------------------------------------------------
// 1.0     | Karthiswaran | Jan 13, 2025 | Initial release
//===========================================================

module alu_4bit (
    input [3:0] A,            // 4-bit Input A
    input [3:0] B,            // 4-bit Input B
    input [2:0] ALU_Control,  // 3-bit control signal to select operation
    output reg [3:0] Result,  // 4-bit ALU result
    output reg CarryOut,      // Carry out flag
    output reg Zero           // Zero flag (set if result is zero)
);
    always @ (A, B, ALU_Control) begin
        case (ALU_Control)
            3'b000: begin  // Addition
                {CarryOut, Result} = A + B;
            end
            3'b001: begin  // Subtraction
                {CarryOut, Result} = A - B;
            end
            3'b010: begin  // AND
                Result = A & B;
                CarryOut = 0;
            end
            3'b011: begin  // OR
                Result = A | B;
                CarryOut = 0;
            end
            3'b100: begin  // XOR
                Result = A ^ B;
                CarryOut = 0;
            end
            3'b101: begin  // NOT A (one's complement of A)
                Result = ~A;
                CarryOut = 0;
            end
            3'b110: begin  // A << 1 (left shift)
                Result = A << 1;
                CarryOut = A[3];  // Store the leftmost bit as CarryOut
            end
            3'b111: begin  // A >> 1 (right shift)
                Result = A >> 1;
                CarryOut = A[0];  // Store the rightmost bit as CarryOut
            end
            default: begin
                Result = 4'b0000;
                CarryOut = 0;
            end
        endcase

        // Set Zero flag if result is zero
        if (Result == 4'b0000)
            Zero = 1;
        else
            Zero = 0;
    end
endmodule

// Testbench for 4-bit ALU
module alu_4bit_tb;

    reg [3:0] A, B;         // 4-bit Inputs
    reg [2:0] ALU_Control;  // Control signal
    wire [3:0] Result;      // Result of ALU
    wire CarryOut, Zero;    // Flags

    // Instantiate the ALU module
    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Control(ALU_Control),
        .Result(Result),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );
    // Testbench logic
    initial begin
        $display("A    B    ALU_Control | Result CarryOut Zero");
        $monitor("%b %b %b      | %b      %b       %b", A, B, ALU_Control, Result, CarryOut, Zero);
        // Apply test vectors
        A = 4'b0011; B = 4'b0001; ALU_Control = 3'b000; #10;  // Addition
        A = 4'b1010; B = 4'b0101; ALU_Control = 3'b001; #10;  // Subtraction
        A = 4'b1100; B = 4'b1010; ALU_Control = 3'b010; #10;  // AND
        A = 4'b1100; B = 4'b1010; ALU_Control = 3'b011; #10;  // OR
        A = 4'b1100; B = 4'b1010; ALU_Control = 3'b100; #10;  // XOR
        A = 4'b1100; B = 4'b0000; ALU_Control = 3'b101; #10;  // NOT A
        A = 4'b1100; B = 4'b0000; ALU_Control = 3'b110; #10;  // Left shift
        A = 4'b1100; B = 4'b0000; ALU_Control = 3'b111; #10;  // Right shift
        $finish;
    end
endmodule
