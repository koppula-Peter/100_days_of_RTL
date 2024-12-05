module clk_generator #(parameter frequency=8e^12, duty_cycle=50,)(input enable, output clk_out_ref, clk_out_phase);

localparam frequency     = 8e^12;
localparam time_period   = 1/frequency;
localparam duty_cycle    = 50;
localparam t_on          = (time_period * duty_cycle)/100;
localparam t_off         = time_period - t_on;
localparam phase         = time_period/360;
