`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 20:32:54
// Design Name: 
// Module Name: bcd_to_binary
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


module bcd_to_binary #(parameter N=16) (rst,in,out);//N is no of bcd bits
input rst;
input [(N*4)-1:0] in;       //input is binary not a decimal but bcd represented in binary format
output reg [(N*4)-1:0] out; //out is also represented in binary 

//reg [(N*4)-1:0] in_reg;

//wire [3:0] bcd_bit [N-1:0];
reg [3:0] bcd_bit [N-1:0];

integer i;

//always @(*)
//begin
//    in_reg <= in;
//    for (i=0; i<N; i=i+1)
//        begin
//            out <= out + ((in_reg[(i*4)+3 : i*4]) * (10**i));
//        end
//end

genvar j;
    generate
        for(j=0; j<N; j=j+1)
            begin
                always @(*)
                //try always @(j)
                //if j; no change in j @ initially it is 0 and after that it is not changed hence out will not change
                    
                    bcd_bit[j] = in[(j*4)+3 : j*4];
                    
                //assign bcd_bit[j] = in_reg[(j*4)+3 : j*4];
            end
    endgenerate

 always @(*)
    begin 
        out=0;//try out removing this out=0;
         if(rst==1)
            begin
                out=0;
                for(i=0; i<N; i=i+1)
                    bcd_bit[i]=0;
            end
       else 
           begin    
               //reset all the registers in your design as they may cause problems
                for(i=0; i<N; i=i+1)
                    out = out + (bcd_bit[i] * (10**i));  
           end
    end   
    
endmodule
