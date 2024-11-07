//--------------------------------gray to binary-------------------------------------

module gray_to_binary #(parameter N=16)(in,out);
input [N-1:0]in;
output [N-1:0]out;

reg [N-1:0] in_reg=0;

always @(in)
    in_reg=in;

//xor_gate g0(.in_1(in[0]),.in_2(0),.out(out[0]));

genvar i;
    generate
        for(i=0; i<N; i=i+1)
            begin
                 if(i==0)
                    //xor_gate g0(.in_1(in[i]),.in_2(1'b0),.out(out[i]));
                    assign out[N-1-i]=in[N-1-i];
                else
                    //xor_gate g0(.in_1(in[i-1]),.in_2(in[i]),.out(out[i]));
                    assign out[N-1-i]=in[N-1-i] ^ out[N-i];
            end
    endgenerate
endmodule
//-----------------------------------------------------------------------------------------

module xor_gate(in_1,in_2,out);
input in_1,in_2;
output out;

assign out=in_1 ^ in_2;

endmodule
