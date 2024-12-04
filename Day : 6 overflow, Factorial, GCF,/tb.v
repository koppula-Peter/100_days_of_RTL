`timescale 1ns / 1ps

module tb_overflow;
    parameter N = 16;
    reg [N-1:0] a, b;
    wire  res;

    // Instantiate the overflow module
    overflow #(N) uut (
        .a(a),
        .b(b),
        .res(res)
    );

    initial begin
        // Test cases
        $display("Testing Overflow Module");
        a = 16'h7FFF; b = 16'h8000; #10; // Opposite signs (0 expected)
        $display("a = %h, b = %h, res = %b", a, b, res);

        a = 16'h8000; b = 16'hFFFF; #10; // Both negative (1 expected)
        $display("a = %h, b = %h, res = %b", a, b, res);

        a = 16'h7FFF; b = 16'h7FFF; #10; // Both positive (0 expected)
        $display("a = %h, b = %h, res = %b", a, b, res);

        a = 16'hFFFF; b = 16'h8000; #10; // Both negative (1 expected)
        $display("a = %h, b = %h, res = %b", a, b, res);

        $finish;
    end
endmodule


`timescale 1ns / 1ps

module tb_gcf;
    parameter N = 16;
    reg [N-1:0] a, b;
    wire [N-1:0] res;

    // Instantiate the gcf module
    gcf #(N) uut (
        .a(a),
        .b(b),
        .res(res)
    );

    initial begin
        // Test cases
        $display("Testing GCF Module");
        a = 16'd24; b = 16'd36; #10; // GCF = 12
        $display("a = %d, b = %d, res = %d", a, b, res);

        a = 16'd18; b = 16'd48; #10; // GCF = 6
        $display("a = %d, b = %d, res = %d", a, b, res);

        a = 16'd101; b = 16'd303; #10; // GCF = 101
        $display("a = %d, b = %d, res = %d", a, b, res);

        a = 16'd7; b = 16'd3; #10; // GCF = 1
        $display("a = %d, b = %d, res = %d", a, b, res);

        $finish;
    end
endmodule




`timescale 1ns / 1ps

module tb_factorial;
    parameter N = 16;
    reg [N-1:0] data_in;
    wire [N-1:0] data_out;

    // Instantiate the factorial module
    factorial #(N) uut (
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // Test cases
        $display("Testing Factorial Module");
        data_in = 4; #10; // 4! = 24
        $display("data_in = %d, data_out = %d", data_in, data_out);

        data_in = 5; #10; // 5! = 120
        $display("data_in = %d, data_out = %d", data_in, data_out);

        data_in = 6; #10; // 6! = 720
        $display("data_in = %d, data_out = %d", data_in, data_out);

        data_in = 7; #10; // 7! = 5040
        $display("data_in = %d, data_out = %d", data_in, data_out);

        data_in = 0; #10; // 0! = 1
        $display("data_in = %d, data_out = %d", data_in, data_out);

        $finish;
    end
endmodule



