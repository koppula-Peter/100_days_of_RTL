
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2024 18:45:23
// Design Name: 
// Module Name: tb_updown_counters
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_updown_counters();

    // Parameters
    parameter N = 8;
    parameter mode = 0; // mode = 1 for up-counter, 0 for down-counter

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [N-1:0] count;

    // Instantiate the Unit Under Test (UUT)
    Up_down_counters #(N, mode) uut (
        .rst(rst),
        .clk(clk),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with a period of 10ns
    end

    // Test stimulus
    initial begin
        $monitor($time, " clk = %b, rst = %b, count = %b", clk, rst, count);
        
        rst = 1; // Reset the counter
        #7;

        rst = 0; // Release reset
        #100;

        // Stop simulation
        $stop;
    end

endmodule
