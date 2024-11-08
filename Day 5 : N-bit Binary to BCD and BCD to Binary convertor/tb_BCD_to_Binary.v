`timescale 1ns / 1ps

module tb_B2BCD_BCD2B;

    // Parameter for the number of BCD digits
    parameter N = 4; // Adjust N as needed

    // Inputs
    reg rst;
    reg [(N*4)-1:0] in;

    // Outputs
    wire [(N*4)-1:0] out;

    // Instantiate the DUT
    bcd_to_binary #(N) dut (
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Test procedure
    initial begin
        // Initialize input
        in = 0;
        rst =1;

        // Wait for global reset
        #10;
        rst=0;

        // Test case 1: BCD input 0001 (1)
        in = 16'b0000_0000_0000_0001; // BCD for 1
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 2: BCD input 0010 (2)
        in = 16'b0000_0000_0000_0010; // BCD for 2
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 3: BCD input 1001 (9)
        in = 16'b0000_0000_0000_1001; // BCD for 9
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 4: BCD input 0010_0101 (25)
        in = 16'b0000_0000_0010_0101; // BCD for 25
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 5: BCD input 1001_1001 (99)
        in = 16'b0000_0000_1001_1001; // BCD for 99
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 6: BCD input 0001_0000_0000 (100)
        in = 16'b0000_0001_0000_0000; // BCD for 100
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 7: BCD input 0010_0101_1001 (259)
        in = 16'b0010_0101_1001_0000; // BCD for 259
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 8: BCD input 1001_1001_1001 (999)
        in = 16'b1001_1001_1001_0000; // BCD for 999
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 9: BCD input 0001_0000_0000_0000 (1000)
        in = 16'b0001_0000_0000_0000; // BCD for 1000
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 10: BCD input 0010_0101_1001_1001 (2599)
        in = 16'b0010_0101_1001_1001; // BCD for 2599
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // Test case 11: BCD input 1001_1001_1001_1001 (9999)
        in = 16'b1001_1001_1001_1001; // BCD for 9999
        #10;
        $display("BCD Input: %b, Binary Output: %d", in, out);

        // End simulation
        $finish;
    end

endmodule
