//===========================================================
// Company       : VLSI Design Hub
// File          : full_adder.v
// Description   : Implementation of a Full Adder
// Author        : Karthiswaran
// Email         : contact@vlsidesignhub.com
// Website       : https://www.vlsidesignhub.app
// Last Updated  : Jan 13, 2025
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

module full_adder(
    input A,          // First input bit
    input B,          // Second input bit
    input Cin,        // Carry-in
    output Sum,       // Sum output
    output Cout       // Carry-out
);
    // Logic for Full Adder
    assign Sum = A ^ B ^ Cin;        // XOR for Sum
    assign Cout = (A & B) | (B & Cin) | (A & Cin);  // Carry-out logic
endmodule

// Testbench for Full Adder
module full_adder_tb;
    reg A, B, Cin;      // Inputs for testbench
    wire Sum, Cout;     // Outputs to monitor
    // Instantiate the Full Adder module
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    // Testbench logic
    initial begin
        $display("A B Cin | Sum Cout");
        $monitor("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        // Apply test vectors
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;
        $finish;
    end
endmodule
