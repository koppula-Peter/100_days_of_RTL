
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2024 18:19:47
// Design Name: 
// Module Name: Up_down_counters
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


module  Up_down_counters #(parameter N=8,mode=1)(input rst,clk, output reg [N-1:0]count);

//reg [N-1:0] count_temp;


//assign count=count_temp;

always @(posedge clk )//sync
//always @(posedge clk or posedge clk)//async
begin
    if(rst==1)
    begin
        if(mode ==1)
            count =0;//auto padding all elements with 0 for 0,x,z but not for 1
        else 
            count ={N{1'b1}};
            //count ={N{1}}; //try this in multiple simulators and observe it
    
    end
    else 
        begin
            if(mode==1)
            begin
                count = count+1; //cant i use non blocking assignents
            end
            else
            begin
                count = count-1;
            end    
        end
end

endmodule
