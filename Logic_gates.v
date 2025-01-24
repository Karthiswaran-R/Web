//===========================================================
// Company       : VLSI Design Hub
// File          : Logic_gates.v
// Description   : Implementation of 12 basic logic gates
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

module logic_gates;
    // Inputs
    reg A, B, C;
    // Outputs
    wire AND_Out, OR_Out, NAND_Out, NOR_Out, XOR_Out, XNOR_Out;
    wire BUF_Out, NOT_Out, BUFIF0_Out, BUFIF1_Out, NOTIF0_Out, NOTIF1_Out;
    // Basic Gates
    and u1 (AND_Out, A, B);             // AND Gate
    or  u2 (OR_Out, A, B);              // OR Gate
    nand u3 (NAND_Out, A, B);           // NAND Gate
    nor u4 (NOR_Out, A, B);             // NOR Gate
    xor u5 (XOR_Out, A, B);             // XOR Gate
    xnor u6 (XNOR_Out, A, B);           // XNOR Gate
    buf u7 (BUF_Out, A);                // Buffer
    not u8 (NOT_Out, A);                // NOT Gate
    // Tristate Gates
    bufif0 u9 (BUFIF0_Out, A, C);       // Buffer if Control == 0
    bufif1 u10 (BUFIF1_Out, A, C);      // Buffer if Control == 1
    notif0 u11 (NOTIF0_Out, A, C);      // NOT if Control == 0
    notif1 u12 (NOTIF1_Out, A, C);      // NOT if Control == 1
    // Testbench
    initial begin
        // Display header
        $display("A B C | AND OR NAND NOR XOR XNOR BUF NOT BUFIF0 BUFIF1 NOTIF0 NOTIF1");
        // Monitor all signals
        $monitor("%b %b %b |  %b   %b   %b    %b    %b    %b    %b   %b    %b      %b      %b",
                 A, B, C, AND_Out, OR_Out, NAND_Out, NOR_Out, XOR_Out, XNOR_Out,
                 BUF_Out, NOT_Out, BUFIF0_Out, BUFIF1_Out, NOTIF0_Out, NOTIF1_Out);
        // Test all input combinations
        A = 0; B = 0; C = 0; #10;
        A = 0; B = 1; C = 0; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 1; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 1; #10;
        $finish;
    end
endmodule
