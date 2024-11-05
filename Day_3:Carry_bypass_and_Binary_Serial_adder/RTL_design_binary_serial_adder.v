//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05.11.2024 00:46:31
//// Design Name: 
//// Module Name: Binary_serial_adder
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//module  top_binary_serial_adder #(parameter N=16)(clk,rst,a,b,cin,sum,cout);

//input clk,rst;
//input [N-1:0]a,b;
//input cin;
//output [N-1:0]sum;
//output cout;

//wire d_ina,d_inb,d_in_sum,q_outa,q_outb,q_out_sum;
//wire wire_1,wire_2;

//shift_registers #(.N(16)) sf_1(.clk(clk),.rst(rst),.d_ina(d_ina),.d_inb(d_inb),.d_in_sum(d_in_sum),.q_outa(q_outa),.q_outb(q_outb),.q_out_sum(q_out_sum));

//full_adder fa_1(.rst(rst),.a(q_outa),.b(q_outb),.cin(wire_1),.sum(d_in_sum),.cout(wire_2));

//d_ff dff_1(.clk(clk),.rst(rst),.d_in(wire_2),.q_out(wire_1));


//endmodule

//module shift_registers #(parameter N=16)(clk,rst,d_ina,d_inb,d_in_sum,q_outa,q_outb,q_out_sum);

//input clk,rst;
//input d_ina,d_inb,d_in_sum;
//output q_outa,q_outb,q_out_sum;

//wire [N:0] data_line_a,data_line_b;
//wire [N:0] data_line_sum;

//assign data_line_a[0]=d_ina;
//assign data_line_b[0]=d_inb;
//assign data_line_sum[0]=d_in_sum;

//assign q_out_sum=data_line_sum[N];
//assign q_outa=data_line_a[N];
//assign q_outb=data_line_b[N];

//genvar i;
//generate
//    for(i=0; i<N; i=i+1)
//        begin
//            d_ff dff_a(.clk(clk),.rst(rst),.d_in(data_line_a[i]),.q_out(data_line_a[i+1]));
//            d_ff dff_b(.clk(clk),.rst(rst),.d_in(data_line_b[i]),.q_out(data_line_b[i+1]));
//            d_ff dff_sum(.clk(clk),.rst(rst),.d_in(data_line_sum[i]),.q_out(data_line_sum[i+1]));
//        end
//endgenerate

//endmodule


////---------------------------------------------- D Flip-Flop ----------------------------------------
//module d_ff(clk,rst,d_in,q_out);
//input clk,rst,d_in;
//output reg q_out;

//always @(posedge clk or posedge rst)
//    begin
//        if(rst==0)
//            q_out<=d_in;
//        else
//            q_out<=0;
//    end
//endmodule

////---------------------------------------------- Full Adder module ----------------------------------------
//module full_adder(rst,a,b,cin,sum,cout);
//input rst;
//input a,b,cin;
//output reg sum,cout;

//always @(*)
//    begin
//        if(rst==1)
//          {sum,cout}<=0;
//        else  
//            begin
//                sum<=a^b^cin;
//                cout<=((a&b)|(b&cin)|(a&cin));
//            end
//    end
//endmodule



//----------------------------------------------------------------------------------------------------------------------
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2024 00:46:31
// Design Name: 
// Module Name: Binary_serial_adder
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
module top_binary_serial_adder #(parameter N=16)(clk, rst, a, b, cin, sum, cout);

    input clk, rst;
    input [N-1:0] a, b;
    input cin;
    output [N-1:0] sum;
    output cout;

    wire d_in_sum, q_outa, q_outb, wire_1, wire_2;
    reg [N-1:0] sum_reg; // Register to store the sum
    reg carry_out; // Register to store final carry out

    assign sum = sum_reg;
    assign cout = carry_out;

    // Instantiate shift_registers
    shift_registers #(.N(N)) sf_1(
        .clk(clk),
        .rst(rst),
        .d_ina(a[0]),
        .d_inb(b[0]),
        .d_in_sum(d_in_sum),
        .q_outa(q_outa),
        .q_outb(q_outb),
        .q_out_sum(d_in_sum)
    );

    // Instantiate full_adder
    full_adder fa_1(
        .rst(rst),
        .a(q_outa),
        .b(q_outb),
        .cin(wire_1),
        .sum(d_in_sum),
        .cout(wire_2)
    );

    // Instantiate d_ff for carry storage
    d_ff dff_1(.clk(clk), .rst(rst), .d_in(wire_2), .q_out(wire_1));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_reg <= 0;
            carry_out <= 0;
        end else begin
            sum_reg <= {d_in_sum, sum_reg[N-1:1]}; // Shift in sum bit from adder
            carry_out <= wire_2; // Store the last carry out
        end
    end

endmodule

// Shift Register Module
module shift_registers #(parameter N=16)(clk, rst, d_ina, d_inb, d_in_sum, q_outa, q_outb, q_out_sum);

    input clk, rst;
    input d_ina, d_inb, d_in_sum;
    output q_outa, q_outb, q_out_sum;

    wire [N:0] data_line_a, data_line_b, data_line_sum;

    assign data_line_a[0] = d_ina;
    assign data_line_b[0] = d_inb;
    assign data_line_sum[0] = d_in_sum;

    assign q_out_sum = data_line_sum[N];
    assign q_outa = data_line_a[N];
    assign q_outb = data_line_b[N];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_shift_registers
            d_ff dff_a (.clk(clk), .rst(rst), .d_in(data_line_a[i]), .q_out(data_line_a[i+1]));
            d_ff dff_b (.clk(clk), .rst(rst), .d_in(data_line_b[i]), .q_out(data_line_b[i+1]));
            d_ff dff_sum (.clk(clk), .rst(rst), .d_in(data_line_sum[i]), .q_out(data_line_sum[i+1]));
        end
    endgenerate

endmodule

// D Flip-Flop Module
module d_ff(clk, rst, d_in, q_out);
    input clk, rst, d_in;
    output reg q_out;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q_out <= 0;
        else
            q_out <= d_in;
    end
endmodule

// Full Adder Module
module full_adder(rst, a, b, cin, sum, cout);
    input rst;
    input a, b, cin;
    output reg sum, cout;

    always @(*) begin
        if (rst) begin
            sum <= 0;
            cout <= 0;
        end else begin
            sum <= a ^ b ^ cin;
            cout <= (a & b) | (b & cin) | (a & cin);
        end
    end
endmodule

