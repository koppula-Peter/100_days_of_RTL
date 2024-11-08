module binary_to_bcd #(
    parameter BIN_WIDTH = 8
)(
    input  [BIN_WIDTH-1:0] binary,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] units
);
    integer i;
    reg [15:0] shift_reg; // Enough to hold binary and BCD digits

    always @(*) begin
        // Initialize shift register with binary input
        shift_reg = {12'd0, binary};
        
        // Perform Double Dabble
        for (i = 0; i < BIN_WIDTH; i = i + 1) begin
            // Check each BCD digit and add 3 if >=5
            if (shift_reg[15:12] >= 5)
                shift_reg[15:12] = shift_reg[15:12] + 3;
            if (shift_reg[11:8] >= 5)
                shift_reg[11:8] = shift_reg[11:8] + 3;
            if (shift_reg[7:4] >= 5)
                shift_reg[7:4] = shift_reg[7:4] + 3;
            if (shift_reg[3:0] >= 5)
                shift_reg[3:0] = shift_reg[3:0] + 3;
            
            // Shift left by 1
            shift_reg = shift_reg << 1;
        end
        
        // Assign BCD digits
        thousands = shift_reg[15:12];
        hundreds  = shift_reg[11:8];
        tens      = shift_reg[7:4];
        units     = shift_reg[3:0];
    end
endmodule
