
module on_chip_with_keyboard_pio (
	clk_clk,
	mouse_click_export,
	mouse_x_export,
	mouse_y_export,
	otg_hpi_address_export,
	otg_hpi_cs_export,
	otg_hpi_data_in_port,
	otg_hpi_data_out_port,
	otg_hpi_r_export,
	otg_hpi_reset_export,
	otg_hpi_w_export,
	reset_reset_n,
	exposure_export,
	green1_export,
	green2_export,
	red_export,
	blue_export);	

	input		clk_clk;
	output		mouse_click_export;
	output	[11:0]	mouse_x_export;
	output	[11:0]	mouse_y_export;
	output	[1:0]	otg_hpi_address_export;
	output		otg_hpi_cs_export;
	input	[15:0]	otg_hpi_data_in_port;
	output	[15:0]	otg_hpi_data_out_port;
	output		otg_hpi_r_export;
	output		otg_hpi_reset_export;
	output		otg_hpi_w_export;
	input		reset_reset_n;
	output	[31:0]	exposure_export;
	output	[31:0]	green1_export;
	output	[31:0]	green2_export;
	output	[31:0]	red_export;
	output	[31:0]	blue_export;
endmodule
