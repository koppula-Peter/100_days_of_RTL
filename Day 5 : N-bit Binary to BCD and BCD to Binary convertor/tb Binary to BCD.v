module tb_binary_to_bcd;
    parameter BIN_WIDTH = 8;
    reg [BIN_WIDTH-1:0] binary;
    wire [3:0] thousands, hundreds, tens, units;
    
    // Instantiate the Binary to BCD converter
    binary_to_bcd #(.BIN_WIDTH(BIN_WIDTH)) uut (
        .binary(binary),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .units(units)
    );
    
    initial begin
        // Display format
        $display("Binary\tBCD");
        $monitor("%d\t%d%d%d%d", binary, thousands, hundreds, tens, units);
        
        // Test cases
        binary = 8'd0;   #10; // 0 -> 0000
        binary = 8'd5;   #10; // 5 -> 0005
        binary = 8'd10;  #10; // 10 -> 0010
        binary = 8'd99;  #10; // 99 -> 0099
        binary = 8'd100; #10; // 100 -> 0100
        binary = 8'd255; #10; // 255 -> 0255
        $finish;
    end
endmodule
