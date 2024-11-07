`timescale 1ns / 1ps

module tb_binary_to_gray;

    // Parameter
    parameter N = 4;

    // Inputs
    reg [N-1:0] in;

    // Outputs
    wire [N-1:0] out;

//    // Instantiate the binary_to_gray module
//    binary_to_gray #(.N(N)) uut (
//        .in(in),
//        .out(out)
//    );  
    
      gray_to_binary #(.N(N)) uut_1 (
        .in(in),
        .out(out)
    );

    // Stimulus
    initial begin
        // Monitor the input and output signals
        $monitor("Time=%0t | Binary Input = %b | Gray Output = %b", $time, in, out);

        // Test Case 1: Zero input
        in = 'b0;
        #10;

        // Test Case 2: All ones
        in = 'b1111111111111111;
        #10;

        // Test Case 3: Alternate bits
        in = 'b1010101010101010;
        #10;

        // Test Case 4: Random value 1
        in = 'b1101100110011011;
        #10;

        // Test Case 5: Random value 2
        in = 'b0011010101111001;
        #10;
        
        // Test Case 6: Edge case with only the MSB set
        in = 'b1000000000000000;
        #10;

        // Test Case 7: Edge case with only the LSB set
        in = 'b0000000000000001;
        #10;

        // Finish the simulation
        $finish;
    end

endmodule
