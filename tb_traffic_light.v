`timescale 1ns / 1ps

module tb_traffic_light;
    reg clk;
    reg rst_n;
    wire [2:0] light;

    // Instantiate the Unit Under Test (UUT)
    traffic_light_fsm uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .light(light)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;

        // Apply Reset
        #20 rst_n = 1;

        // Observe simulation for enough time to see state changes
        #400;
        $finish;
    end
endmodule
