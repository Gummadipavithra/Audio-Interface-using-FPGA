module noise_filter(
    input wire clk,
    input wire reset,
    input wire [bit_depth-1:0] audio_sample_in,  // Input binary sample (bit_depth wide)
    output reg [bit_depth-1:0] audio_sample_out  // Output filtered sample
);
    parameter bit_depth = 8; // Bit depth (e.g., 8, 16)
    reg [bit_depth-1:0] buffer[2:0];  // Buffer to store samples for averaging

    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 3; i = i + 1)
                buffer[i] <= 0;
            audio_sample_out <= 0;
        end
        else begin
            // Shift the buffer values
            buffer[2] <= buffer[1];
            buffer[1] <= buffer[0];
            buffer[0] <= audio_sample_in;

            // Compute the mean of the 3 samples
            audio_sample_out <= (buffer[0] + buffer[1] + buffer[2]) / 3;
        end
    end
endmodule
