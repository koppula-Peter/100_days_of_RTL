`timescale 100ps / 1ps


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
reg clk_int;

//always @(posedge en or negedge en)    //always @(posedge en or negedge enable)
//    begin
//        if(en==0)
//            clk_out_ref = 0;
//        else 
//        begin
//            //while(en==1) // while loop is a blocking type of construct until this satisfies it does not allow always block to trigger even if the condition for always block was met
//                //begin
//                    #t_off   clk_out_ref = 1;
//                    #t_on    clk_out_ref = 0;
//                //end
//        end
//    end
    
    
    
   initial 
    begin
        clk_out_ref <= 0;
        //clk_out_phase <= 0;
        clk_int <= 0;
    end

  always @ (posedge en or negedge en) begin
    if (en ==1) 
      clk_int = 1;
    else 
        clk_int = 0;
    end


  always @(posedge clk_int) begin
    if (clk_int ==1) begin
        while (clk_int) 
      	 begin
      	         clk_out_ref = 1;
      		#(t_on)  clk_out_ref = 0;
    		#(t_off) clk_out_ref = 1;
         end
        end
      else
      	clk_out_ref = 0;
    end
 
assign  #(theta) clk_out_phase = clk_out_ref;

//always @(*) clk_out_phase = #theta clk_out_ref;
    
endmodule







//`timescale 1ns/1ps

//module clock_gen (	input      enable,
//  					output reg clk);

//  parameter FREQ = 100000;  // in kHZ
//  parameter PHASE = 0; 		// in degrees
//  parameter DUTY = 50;  	// in percentage

//  real clk_pd  		= 1.0/(FREQ * 1e3) * 1e9; 	// convert to ns
//  real clk_on  		= DUTY/100.0 *(1.0/(FREQ * 1e3) * 1e9); //clk_pd;
//  real clk_off 		= (100.0 - DUTY)/100.0 * (1.0/(FREQ * 1e3) * 1e9);
//  real quarter 		= (1.0/(FREQ * 1e3) * 1e9)/4;
//  real start_dly     =((1.0/(FREQ * 1e3) * 1e9)/4) * PHASE/90;

//  reg start_clk;

//  initial begin
//    $display("FREQ      = %0d kHz", FREQ);
//    $display("PHASE     = %0d deg", PHASE);
//    $display("DUTY      = %0d %%",  DUTY);

//    $display("PERIOD    = %0.3f ns", clk_pd);
//    $display("CLK_ON    = %0.3f ns", clk_on);
//    $display("CLK_OFF   = %0.3f ns", clk_off);
//    $display("QUARTER   = %0.3f ns", quarter);
//    $display("START_DLY = %0.3f ns", start_dly);
//  end

//  // Initialize variables to zero
//  initial begin
//    clk <= 0;
//    start_clk <= 0;
//  end

//  // When clock is enabled, delay driving the clock to one in order
//  // to achieve the phase effect. start_dly is configured to the
//  // correct delay for the configured phase. When enable is 0,
//  // allow enough time to complete the current clock period
//  always @ (posedge enable or negedge enable) begin
//    if (enable) begin
//      #(start_dly) start_clk = 1;
//    end else begin
//      #(start_dly) start_clk = 0;
//    end
//  end

//  // Achieve duty cycle by a skewed clock on/off time and let this
//  // run as long as the clocks are turned on.
//  always @(posedge start_clk) begin
//    if (start_clk) begin
//      	clk = 1;

//      	while (start_clk) begin
//      		#(clk_on)  clk = 0;
//    		#(clk_off) clk = 1;
//        end

//      	clk = 0;
//    end
//  end
//endmodule
