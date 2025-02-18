`timescale 1ns / 1ps

module noise_filter_tb;

    parameter bit_depth = 8;
    reg clk;
    reg reset;
    reg [bit_depth-1:0] audio_sample_in;
    wire [bit_depth-1:0] audio_sample_out;

    // Instantiate the noise_filter module
    noise_filter #(bit_depth) uut (
        .clk(clk),
        .reset(reset),
        .audio_sample_in(audio_sample_in),
        .audio_sample_out(audio_sample_out)
    );

    // Open file for writing
    integer file;
    initial begin
        file = $fopen("C:/Users/hp/Desktop/project/audio_output.txt", "w");
        if (file == 0) begin
            $display("Error: Could not open file.");
            $finish;
        end
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period (100MHz)
    end

    // Test sequence
    initial begin
        // Apply reset
        reset = 1;
        audio_sample_in = 0;
        #10;
        
        reset = 0;  // Deassert reset
        
        // Apply test values to audio_sample_in
        #10 audio_sample_in = 8'd50;
        #10 audio_sample_in = 8'd100;
        #10 audio_sample_in = 8'd150;
        #10 audio_sample_in = 8'd200;
        #10 audio_sample_
