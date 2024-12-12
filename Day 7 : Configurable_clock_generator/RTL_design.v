
module clk_generator #(parameter frequency=1e9, duty_cycle=50, phase=0)
                      (input en, output reg clk_out_ref,output clk_out_phase);

//localparam frequency     = 8e12;
//localparam duty_cycle    = 50;
//localparam phase         = 0;

real time_period  = (1/frequency);
//integer time_period  = (1/frequency)<<power;
//reg [33:0] time_period =  (1/frequency)*power   //Q1.33 format

real theta  = (1/frequency)/360;
real t_on   = ((1/frequency) * duty_cycle)/100;
real t_off  = ((1/frequency) - ((1/frequency) * duty_cycle)/100);//directly cant use other real as error pops up as not a constant


always @(posedge en or negedge en)    //always @(posedge en or negedge enable)
    begin
        if(en==0)
            clk_out_ref = 0;
        else 
        begin
            //while(en==1) // while loop is a blocking type of construct until this satisfies it does not allow always block to trigger even if the condition for always block was met
                //begin
                    #t_off   clk_out_ref = 1;
                    #t_on    clk_out_ref = 0;
                //end
        end
    end
assign #theta clk_out_phase = clk_out_ref;

//always @(*) clk_out_phase = #theta clk_out_ref;
    
endmodule
