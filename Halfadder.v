//===========================================================
// Company       : VLSI Design Hub
// File          : half_adder.v
// Description   : Implementation of a Half Adder
// Author        : Karthiswaran.R
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
module half_adder(
    input A,          // Input bit A
    input B,          // Input bit B
    output Sum,       // Sum output
    output Carry      // Carry output
);
    // Logic for Half Adder
    xor(Sum, A, B);    // XOR gate for Sum
    and(Carry, A, B);  // AND gate for Carry
endmodule
// Testbench for Half Adder
module half_adder_tb;
    reg A, B;          // Inputs for testbench
    wire Sum, Carry;   // Outputs to monitor
    // Instantiate the Half Adder module
    half_adder uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );
    // Testbench logic
    initial begin
        $display("A B | Sum Carry");
        $monitor("%b %b |  %b    %b", A, B, Sum, Carry);
        // Apply test vectors
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule
