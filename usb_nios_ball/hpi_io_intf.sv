// Interface between NIOS II and EZ-OTG chip
/* ----------------------------------------------------------
       HPIO I/O Interface module 
		 
		 Description:
		 - Interfaces the NIOS II with the EZ-OTG chip 
		 - Modified version of Lab 8
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */
module hpi_io_intf( input        Clk, Reset,
                    input [1:0]  from_sw_address,
                    output[15:0] from_sw_data_in,
                    input [15:0] from_sw_data_out,
                    input        from_sw_r, from_sw_w, from_sw_cs, from_sw_reset, // Active low
                    inout [15:0] OTG_DATA,
                    output[1:0]  OTG_ADDR,
                    output       OTG_RD_N, OTG_WR_N, OTG_CS_N, OTG_RST_N // Active low
                   );

logic [15:0] from_sw_data_out_buffer;
 
always_ff @ (posedge Clk)
begin
    if(Reset)
    begin
        from_sw_data_out_buffer <= 16'b0; //default 0
        OTG_ADDR                <= 2'b0; //default 0
        OTG_RD_N                <= 1'b1; //read 1
        OTG_WR_N                <= 1'b1; //write 1
        OTG_CS_N                <= 1'b1; //chip select 1
        OTG_RST_N               <= 1'b1; //rst 1
        from_sw_data_in         <= 16'b0; //default 0
    end
    else 
    begin
        from_sw_data_out_buffer <= from_sw_data_out; //buffer gets data
        OTG_ADDR                <= from_sw_address; //address gets address
        OTG_RD_N                <= from_sw_r; //read to read
        OTG_WR_N                <= from_sw_w; //write to write
        OTG_CS_N                <= from_sw_cs; //chip select to cs
        OTG_RST_N               <= from_sw_reset; //reset
        from_sw_data_in         <= OTG_DATA; //data from OTG bus
    end
end

assign OTG_DATA = ~from_sw_w ? from_sw_data_out_buffer : 16'bZ; 

endmodule 