
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2024 18:08:05
// Design Name: 
// Module Name: Flip_Flops
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


module sr_ff(input clk,rst,s,r, output reg sr_q);

always @(posedge clk , negedge rst)
begin
    if(rst)
        sr_q=0;
    else
      begin
          case({s,r})
            2'b00 : sr_q <= sr_q;
            2'b01 : sr_q <= 1'b0;
            2'b00 : sr_q <= 1'b1;
            2'b00 : sr_q <= 1'bx;
        endcase
      end
end
endmodule


module jk_ff(input clk,rst,j,k, output reg jk_q);

always @(posedge clk , negedge rst)
begin
    if(rst)
        jk_q=0;
    else
      begin
          case({j,k})
            2'b00 : jk_q <= jk_q;
            2'b01 : jk_q <= 1'b0;
            2'b10 : jk_q <= 1'b1;
            2'b11 : jk_q <= ~jk_q;
        endcase
      end
end
endmodule

module dff(input clk,rst,d, output reg d_q);
always @(posedge clk, negedge rst)
begin
    if(rst)
        d_q=0;
    else
      begin
      
        d_q<=d;
//          case(d)
//            1'b0 : d_q <= 0;
//            1'b1 : d_q <= 1;
//        endcase
      end
end
endmodule

module t_ff(input clk,rst,t,output reg t_q);
always @(posedge clk , negedge rst)
begin
    if(rst)
        t_q=0;
    else
      begin
          case(t)
            1'b0 : t_q <= t_q;
            1'b1 : t_q <= !t_q;
        endcase
      end
end
endmodule
