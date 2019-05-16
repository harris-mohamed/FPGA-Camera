/* ----------------------------------------------------------
       ECE 385 - Top Level for 2D Motion Tracker (Project LD)
		 
		 Description:
		 - Top level for Project LD, which is a dynamic 2D motion
		 tracker that can track position and scale in realtime.
		 - Heavily based on Altera's provided code for the 
		 cyclone II. 
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module DE2_CCD
	(
		// Clocks 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		
		// Pushbuttons
		KEY,							

		// Switches
		SW,								

		// Hex Displays
		HEX0,							
		HEX1,							
		HEX2,							
		HEX3,							
		HEX4,							
		HEX5,							
		HEX6,							
		HEX7,							

		// LEDs
		LEDG,							
		LEDR,							
		
		// SDRAM 
		DRAM_DQ,						   //	Data bus 16 Bits
		DRAM_ADDR,						//	Address bus 12 Bits
		DRAM_LDQM,						//	Low-byte Data Mask 
		DRAM_UDQM,						//	High-byte Data Mask
		DRAM_WE_N,						//	Write Enable
		DRAM_CAS_N,						//	Column Address Strobe
		DRAM_RAS_N,						//	Row Address Strobe
		DRAM_CS_N,						//	Chip Select
		DRAM_BA_0,						//	Bank Address 0
		DRAM_BA_1,						//	Bank Address 0
		DRAM_CLK,						//	Clock
		DRAM_CKE,						//	Clock Enable
		
		// EZ-OTG interface
		OTG_DATA,                  //CY7C67200 Data bus 16 Bits
		OTG_ADDR,                  //CY7C67200 Address 2 Bits
		OTG_CS_N,                  //CY7C67200 Chip Select
		OTG_RD_N,                  //CY7C67200 Write
		OTG_WR_N,                  //CY7C67200 Read
		OTG_RST_N,                 //CY7C67200 Reset
		OTG_INT,                   //CY7C67200 Interrupt 
		
		// I2C
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		
		// VGA
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  					    	//	VGA Blue[9:0]
		
		// GPIO PINS
		GPIO_1							
	);

//Clocks 
input			CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz

// Push Buttons 
input	[3:0]	KEY;					

// SWITCHES
input	[17:0]	SW;			
	
// HEX DISPLAYS
output	[6:0]	HEX0;					   //	Hex Display 0
output	[6:0]	HEX1;					   //	Hex Display 1
output	[6:0]	HEX2;					   //	Hex Display 2
output	[6:0]	HEX3;					   //	Hex Display 3
output	[6:0]	HEX4;					   //	Hex Display 4
output	[6:0]	HEX5;					   //	Hex Display 5
output	[6:0]	HEX6;					   //	Hex Display 6
output	[6:0]	HEX7;					   //	Hex Display 7
   
// LEDs   
output	[8:0]	LEDG;					   //	Green LEDs [8:0]
output	[17:0]	LEDR;				   //	Red LEDs [17:0]

// SDRAM 
inout	[15:0]	DRAM_DQ;				   //	SDRAM Data bus 16 Bits
output [11:0]	DRAM_ADDR;			   //	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable

//	EZ-OTG Interface	
inout  [15:0] OTG_DATA;             //OTG Data bus 16 Bits
output [1:0]  OTG_ADDR;             //OTG Address 2 Bits
output        OTG_CS_N;             //OTG Chip Select
output		  OTG_RD_N;             //OTG Write
output		  OTG_WR_N;             //OTG Read
output		  OTG_RST_N;            //OTG Reset
input         OTG_INT;              //OTG Interrupt 

// I2C
inout			I2C_SDAT;				//	I2C Data
output		I2C_SCLK;				//	I2C Clock

// VGA
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]

// GPIO PINS
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

assign	SRAM_DQ		=	16'hzzzz;
assign	I2C_SDAT	=	1'bz;

//	CCD assignments
wire	[9:0]	CCD_DATA;
wire			CCD_SDAT;
wire			CCD_SCLK;
wire			CCD_FLASH;
wire			CCD_FVAL;
wire			CCD_LVAL;
wire			CCD_PIXCLK;
reg			CCD_MCLK;	            //	CCD Master Clock

// Internal assignments
wire	[15:0]	Read_DATA1;
wire	[15:0]	Read_DATA2;
wire			  VGA_CTRL_CLK;
wire			 AUD_CTRL_CLK;
wire	[9:0]  mCCD_DATA;
wire			 mCCD_DVAL;
wire			 mCCD_DVAL_d;
wire	[10:0] X_Cont;
wire	[10:0] Y_Cont;
wire	[9:0]	 X_ADDR;
wire	[31:0] Frame_Cont;
wire	[9:0]	 mCCD_R;
wire	[9:0]	 mCCD_G;
wire	[9:0]	 mCCD_B;
wire			 DLY_RST_0;
wire			 DLY_RST_1;
wire			 DLY_RST_2;
wire			 Read;
reg	[9:0]	 rCCD_DATA;
reg			 rCCD_LVAL;
reg			 rCCD_FVAL;
wire	[9:0]	 sCCD_R;
wire	[9:0]	 sCCD_G;
wire	[9:0]	 sCCD_B;
wire			 sCCD_DVAL;
wire	[9:0]  DrawX;
wire	[9:0]  DrawY;
wire	[9:0]  color_red;
wire	[9:0]  color_green;
wire	[9:0]  color_blue;

// Internal Tracker assignments
wire [11:0] mousex, mousey;
wire [1:0] hpi_addr;
wire [15:0] hpi_data_in, hpi_data_out;
wire [31:0] blue_gain, red_gain, green1_gain, green2_gain, exposure; 
wire [11:0] tlx, brx, tly, bry;
reg  [11:0] TLXI, BRXI, TLYI, BRYI;
wire [11:0] tracktlx, trackbrx, tracktly, trackbry, topx, topy, bottomx, bottomy;
reg  [9:0]  midX, midY;
reg  [31:0] hexValue;

wire mouseclick;
wire hpi_r, hpi_w, hpi_cs, hpi_reset;
wire isBall;
wire calibrate_start;
wire tlxw, brxw, tlyw, bryw;
wire show_ball, show_box;
wire writetop, writebottom, ball_flag;
wire TRtlxw, TRtlyw, TRbrxw, TRbryw;
wire Above_T;
wire TRACED, writeTraced, resetTraced;
wire SHOW_GAIN;


//	CAMERA SENSOR 
assign	CCD_DATA[0]	=	GPIO_1[0];
assign	CCD_DATA[1]	=	GPIO_1[1];
assign	CCD_DATA[2]	=	GPIO_1[5];
assign	CCD_DATA[3]	=	GPIO_1[3];
assign	CCD_DATA[4]	=	GPIO_1[2];
assign	CCD_DATA[5]	=	GPIO_1[4];
assign	CCD_DATA[6]	=	GPIO_1[6];
assign	CCD_DATA[7]	=	GPIO_1[7];
assign	CCD_DATA[8]	=	GPIO_1[8];
assign	CCD_DATA[9]	=	GPIO_1[9];
assign	GPIO_1[11]	=	CCD_MCLK;
assign	CCD_FVAL	=	GPIO_1[13];
assign	CCD_LVAL	=	GPIO_1[12];
assign	CCD_PIXCLK	=	GPIO_1[10];
assign	VGA_CTRL_CLK=	CCD_MCLK;
assign	VGA_CLK		=	~CCD_MCLK;


// 7 Segment Displays
SEG7_LUT_8 			u5	(	.oSEG0(HEX0),.oSEG1(HEX1),
							.oSEG2(HEX2),.oSEG3(HEX3),
							.oSEG4(HEX4),.oSEG5(HEX5),
							.oSEG6(HEX6),.oSEG7(HEX7),
							.iDIG(hexValue) );

							
// LED assignments							
assign	LEDR		=	SW;
assign	LEDG[0]	=	calibrate_start;
assign	LEDG[1]	=	show_ball;
assign	LEDG[2]	=	show_box;
assign	LEDG[5]	=	writetop;
assign	LEDG[6]	=	writebottom;
assign	LEDG[7]	=	ball_flag;


// State Machine Assignments
always
begin
	// Box edge regster inputs are mouse coordinates
	if (show_ball)
	begin
		TLXI = mousex;
		BRXI = mousex;
		TLYI = mousey;
		BRYI = mousey;
	end
	// Box edge register inputs are from tracking module
	else if (show_box)
	begin
		TLXI = tracktlx;
		BRXI = trackbrx;
		TLYI = tracktly;
		BRYI = trackbry;
	end
	// Satisfies always_comb logic
	else
	begin
		TLXI = 12'bx;
		BRXI = 12'bx;
		TLYI = 12'bx;
		BRYI = 12'bx;
	end
	
	// Middle of box coordinates
	midX = (brx[9:0] - tlx[9:0])/(10'd2);
	midY = (bry[9:0] - tly[9:0])/(10'd2);
	
	// Hex shows exposure, red gain, and frame count when not calibrating
	if (SHOW_GAIN)
		hexValue = {SW[11:4],red_gain[7:0],Frame_Cont[15:0]};
	//if calibrating, hex shows whether or not current object being hovered over will be tracked
	else
		hexValue = {topx[9:2], topy[9:2], bottomx[9:2], bottomy[9:2]};
end


// Camera module clock and data
always@(posedge CLOCK_50)	CCD_MCLK	<=	~CCD_MCLK;

always@(posedge CCD_PIXCLK)
begin
	rCCD_DATA	<=	CCD_DATA;
	rCCD_LVAL	<=	CCD_LVAL;
	rCCD_FVAL	<=	CCD_FVAL;
end


// System on Chip Instantiation
on_chip_fsm			soc (
							.clk_clk(CLOCK_50),         
							.reset_reset_n(1'b1),    // Never reset NIOS								
							.mouse_x_export(mousex), //MOUSE STUFF
							.mouse_y_export(mousey),
							.blue_export(blue_gain), //GAIN AND EXPOSURE
							.red_export(red_gain),
							.green1_export(green1_gain),
							.green2_export(green2_gain),
							.exposure_export(exposure),
							.mouse_click_export(mouseclick),
							.otg_hpi_address_export(hpi_addr), //INTERFACE between ezotg and nios
							.otg_hpi_data_in_port(hpi_data_in),
							.otg_hpi_data_out_port(hpi_data_out),
							.otg_hpi_cs_export(hpi_cs),
							.otg_hpi_r_export(hpi_r),
							.otg_hpi_w_export(hpi_w),
							.otg_hpi_reset_export(hpi_reset),
							.calibrate_start_export(calibrate_start) // calibrate PIO for FSM
							);

							
// Finite State Machine for Calibration and Tracking
fsm					fsm(
							.CLK(CLOCK_50),
							.RESET(~DLY_RST_2),
							.CAL_START(calibrate_start),
							.CLICK(mouseclick),
							.SHOW_BALL(show_ball),
							.SHOW_BOX(show_box),
							.Tlxw(tlxw), .Brxw(brxw), 
							.Tlyw(tlyw), .Bryw(bryw),
							.TLX(tlx), .TLY(tly), .BRX(brx), .BRY(bry),
							.resetTraced(resetTraced), .writeTraced(writeTraced),
							.showGain(SHOW_GAIN)
							);
							
							
// Mouse Coordinate Registers
register12 topLeftX (.CLK(CLOCK_50), .RESET(~DLY_RST_2), .write(tlxw || TRtlxw), .dataIn(TLXI), .dataOut(tlx));
register12 bottomRightX (.CLK(CLOCK_50), .RESET(~DLY_RST_2), .write(brxw || TRbrxw), .dataIn(BRXI), .dataOut(brx));
register12 topLeftY (.CLK(CLOCK_50), .RESET(~DLY_RST_2), .write(tlyw || TRtlyw), .dataIn(TLYI), .dataOut(tly));
register12 bottomRightY (.CLK(CLOCK_50), .RESET(~DLY_RST_2), .write(bryw || TRbryw), .dataIn(BRYI), .dataOut(bry));


// Interface between NIOS II and EZ-OTG chip
hpi_io_intf       hpi_io_inst(
							.Clk(CLOCK_50),
							.Reset(1'b0),
							// signals connected to NIOS II
							.from_sw_address(hpi_addr),
							.from_sw_data_in(hpi_data_in),
							.from_sw_data_out(hpi_data_out),
							.from_sw_r(hpi_r),
							.from_sw_w(hpi_w),
							.from_sw_cs(hpi_cs),
							.from_sw_reset(hpi_reset),
							// signals connected to EZ-OTG chip
							.OTG_DATA(OTG_DATA),    
							.OTG_ADDR(OTG_ADDR),    
							.OTG_RD_N(OTG_RD_N),    
							.OTG_WR_N(OTG_WR_N),    
							.OTG_CS_N(OTG_CS_N),
							.OTG_RST_N(OTG_RST_N)		);

							
// Outputs Current Pixel Color
color_mapper		cm	(
							.is_ball(isBall),
							.DrawX(DrawX),
							.DrawY(DrawY),
							.VGA_R(color_red),
							.VGA_G(color_green),
							.VGA_B(color_blue),
							.iRed(Read_DATA2[9:0]),
							.iGreen({Read_DATA1[14:10],Read_DATA2[14:10]}),
							.iBlue(Read_DATA1[9:0]),
							.SHOW_BALL(show_ball),
							.SHOW_BOX(show_box),
							.FLAG(ball_flag),
							.ABOVE_T(Above_T),
							.tlx(tlx[9:0]), .tly(tly[9:0]), .brx(brx[9:0]), .bry(bry[9:0]),
							.topx(topx), .topy(topy), .bottomx(bottomx), .bottomy(bottomy),
							.traced(TRACED)
							);
							
							
// Mouse Cursor Center
ball					b (
							.Clk(CLOCK_50),
							.Reset(~DLY_RST_2),
							.frame_clk(VGA_CTRL_CLK),
							.DrawX(DrawX),
							.DrawY(DrawY),
							.mousex(mousex[9:0]),
							.mousey(mousey[9:0]),
							.is_ball(isBall)
							);
							
							
// Produces Tracking Box
tracker			track (
							.CLK(VGA_CTRL_CLK),
							.RESET(~DLY_RST_2),
							.DrawX(DrawX), .DrawY(DrawY),
							.Tlx(tlx), .Brx(brx), .Tly(tly), .Bry(bry),
							.VGA_R(Read_DATA2[9:0]), .VGA_G({Read_DATA1[14:10],Read_DATA2[14:10]}), .VGA_B(Read_DATA1[9:0]),
							.Topx(topx), .Topy(topy), .Bottomx(bottomx), .Bottomy(bottomy),
							.Tracktlx(tracktlx), .Trackbrx(trackbrx), .Tracktly(tracktly), .Trackbry(trackbry),
							.writeT(writetop), .writeB(writebottom), .Flag(ball_flag),
							.Trtlxw(TRtlxw), .Trtlyw(TRtlyw), .Trbrxw(TRbrxw), .Trbryw(TRbryw)
							);
							
							
// Outputs Current Pixels Being Tracked
threshold_checker	tc	(
							.VGA_R(Read_DATA2[9:0]), .VGA_G({Read_DATA1[14:10],Read_DATA2[14:10]}), .VGA_B(Read_DATA1[9:0]),
							.DrawX(DrawX), .DrawY(DrawY),
							.TLX(tlx), .BRX(brx), .TLY(tly), .BRY(bry),
							.ABOVE_T(Above_T)
							);


// Produces Timings for VGA Monitor
VGA_Controller		u1	(	//	Host Side
							.oRequest(Read),
							.iRed(color_red),
							.iGreen(color_green),
							.iBlue(color_blue),
							//	VGA Side
							.oVGA_R(VGA_R),
							.oVGA_G(VGA_G),
							.oVGA_B(VGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC),
							.oVGA_BLANK(VGA_BLANK),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST_2),	
							.DrawX(DrawX),
							.DrawY(DrawY)				);

							
// Prevents Glitches
Reset_Delay			u2	(	.iCLK(CLOCK_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2)	);

							
// Transmits Raw CCD Data
CCD_Capture			u3	(	.oDATA(mCCD_DATA),
							.oDVAL(mCCD_DVAL),
							.oX_Cont(X_Cont),
							.oY_Cont(Y_Cont),
							.oFrame_Cont(Frame_Cont),
							.iDATA(rCCD_DATA),
							.iFVAL(rCCD_FVAL),
							.iLVAL(rCCD_LVAL),
							.iSTART(!KEY[3]),
							.iEND(!KEY[2]),
							.iCLK(CCD_PIXCLK),
							.iRST(DLY_RST_1)	);

							
// Converts Raw CCD Data to Readable RGB
RAW2RGB				u4	(	.oRed(mCCD_R),
							.oGreen(mCCD_G),
							.oBlue(mCCD_B),
							.oDVAL(mCCD_DVAL_d),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont),
							.iDATA(mCCD_DATA),
							.iDVAL(mCCD_DVAL),
							.iCLK(CCD_PIXCLK),
							.iRST(DLY_RST_1)	);

							
// Stores Pixels from Camera in SDRAM
Sdram_Control_4Port	u6	(	//	HOST Side
						    .REF_CLK(CLOCK_50),
						    .RESET_N(1'b1),
							//	FIFO Write Side 1
						    .WR1_DATA(	{sCCD_G[9:5],
										 sCCD_B[9:0]}),
							.WR1(sCCD_DVAL),
							.WR1_ADDR(0),
							.WR1_MAX_ADDR(640*512),
							.WR1_LENGTH(9'h100),
							.WR1_LOAD(!DLY_RST_0),
							.WR1_CLK(CCD_PIXCLK),
							//	FIFO Write Side 2
						    .WR2_DATA(	{sCCD_G[4:0],
										 sCCD_R[9:0]}),
							.WR2(sCCD_DVAL),
							.WR2_ADDR(22'h100000),
							.WR2_MAX_ADDR(22'h100000+640*512),
							.WR2_LENGTH(9'h100),
							.WR2_LOAD(!DLY_RST_0),
							.WR2_CLK(CCD_PIXCLK),
							//	FIFO Read Side 1
						    .RD1_DATA(Read_DATA1),
				        	.RD1(Read),
				        	.RD1_ADDR(640*16),
							.RD1_MAX_ADDR(640*496),
							.RD1_LENGTH(9'h100),
				        	.RD1_LOAD(!DLY_RST_0),
							.RD1_CLK(VGA_CTRL_CLK),
							//	FIFO Read Side 2
						    .RD2_DATA(Read_DATA2),
				        	.RD2(Read),
				        	.RD2_ADDR(22'h100000+640*16),
							.RD2_MAX_ADDR(22'h100000+640*496),
							.RD2_LENGTH(9'h100),
				        	.RD2_LOAD(!DLY_RST_0),
							.RD2_CLK(VGA_CTRL_CLK),
							//	SDRAM Side
						    .SA(DRAM_ADDR),
						    .BA({DRAM_BA_1,DRAM_BA_0}),
						    .CS_N(DRAM_CS_N),
						    .CKE(DRAM_CKE),
						    .RAS_N(DRAM_RAS_N),
				            .CAS_N(DRAM_CAS_N),
				            .WE_N(DRAM_WE_N),
						    .DQ(DRAM_DQ),
				            .DQM({DRAM_UDQM,DRAM_LDQM}),
							.SDR_CLK(DRAM_CLK)	);

							
// Configuration Settings for Camera
I2C_CCD_Config 		u7	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(KEY[1]),
							.redG(red_gain),
						   .blueG(blue_gain), 
						   .green1G(green1_gain),
						   .green2G(green2_gain),
							.iExposure(SW[15:0]),
							//	I2C Side
							.I2C_SCLK(GPIO_1[14]),
							.I2C_SDAT(GPIO_1[15])	);

							
// Flips Picture Vertically
Mirror_Col			u8	(	//	Input Side
							.iCCD_R(mCCD_R),
							.iCCD_G(mCCD_G),
							.iCCD_B(mCCD_B),
							.iCCD_DVAL(mCCD_DVAL_d),
							.iCCD_PIXCLK(CCD_PIXCLK),
							.iRST_N(DLY_RST_1),
							//	Output Side
							.oCCD_R(sCCD_R),
							.oCCD_G(sCCD_G),
							.oCCD_B(sCCD_B),
							.oCCD_DVAL(sCCD_DVAL));

endmodule