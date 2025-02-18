# Set the target device family and part number for your FPGA
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE <your FPGA part number>  # e.g., EP4CE10F17C8

# Assign pins for the noise_filter module
set_location_assignment PIN_<clk_pin> -to clk               # Replace <clk_pin> with actual clock pin
set_location_assignment PIN_<reset_pin> -to reset           # Replace <reset_pin> with the reset pin
set_location_assignment PIN_<audio_sample_in_pin> -to audio_sample_in[#]  # Assign individual pins for each bit of the input
set_location_assignment PIN_<audio_sample_out_pin> -to audio_sample_out[#]  # Assign individual pins for each bit of the output

# Specify I/O standard if required by your board (e.g., 3.3V LVTTL)
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to audio_sample_in
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to audio_sample_out
