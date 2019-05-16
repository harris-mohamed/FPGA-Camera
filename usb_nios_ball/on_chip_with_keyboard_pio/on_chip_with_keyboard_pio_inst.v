	on_chip_with_keyboard_pio u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.mouse_click_export     (<connected-to-mouse_click_export>),     //     mouse_click.export
		.mouse_x_export         (<connected-to-mouse_x_export>),         //         mouse_x.export
		.mouse_y_export         (<connected-to-mouse_y_export>),         //         mouse_y.export
		.otg_hpi_address_export (<connected-to-otg_hpi_address_export>), // otg_hpi_address.export
		.otg_hpi_cs_export      (<connected-to-otg_hpi_cs_export>),      //      otg_hpi_cs.export
		.otg_hpi_data_in_port   (<connected-to-otg_hpi_data_in_port>),   //    otg_hpi_data.in_port
		.otg_hpi_data_out_port  (<connected-to-otg_hpi_data_out_port>),  //                .out_port
		.otg_hpi_r_export       (<connected-to-otg_hpi_r_export>),       //       otg_hpi_r.export
		.otg_hpi_reset_export   (<connected-to-otg_hpi_reset_export>),   //   otg_hpi_reset.export
		.otg_hpi_w_export       (<connected-to-otg_hpi_w_export>),       //       otg_hpi_w.export
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.exposure_export        (<connected-to-exposure_export>),        //        exposure.export
		.green1_export          (<connected-to-green1_export>),          //          green1.export
		.green2_export          (<connected-to-green2_export>),          //          green2.export
		.red_export             (<connected-to-red_export>),             //             red.export
		.blue_export            (<connected-to-blue_export>)             //            blue.export
	);

