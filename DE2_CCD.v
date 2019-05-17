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
assign	LEDR		=	SW;	// Exposure is toggled through switches

// Assign green LEDs for debugging 
//assign	LEDG[0]	=	calibrate_start;

// Camera module clock and data
always@(posedge CLOCK_50)	CCD_MCLK	<=	~CCD_MCLK;

always@(posedge CCD_PIXCLK)
begin
	rCCD_DATA	<=	CCD_DATA;
	rCCD_LVAL	<=	CCD_LVAL;
	rCCD_FVAL	<=	CCD_FVAL;
end
														
							
// Produces Timings for VGA Monitor
VGA_Controller		u1	(	
							.oRequest(Read),
							.iRed(Read_DATA2[9:0]),
							.iGreen({Read_DATA1[14:10],Read_DATA2[14:10]}),
							.iBlue(Read_DATA1[9:0]),
							.oVGA_R(VGA_R),
							.oVGA_G(VGA_G),
							.oVGA_B(VGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC),
							.oVGA_BLANK(VGA_BLANK),
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
I2C_CCD_Config 		u7	(	
							.iCLK(CLOCK_50),
							.iRST_N(KEY[1]),
							.redG(red_gain),
						   .blueG(blue_gain), 
						   .green1G(green1_gain),
						   .green2G(green2_gain),
							.iExposure(SW[15:0]),
							.I2C_SCLK(GPIO_1[14]),
							.I2C_SDAT(GPIO_1[15])	);

							
// Flips Picture Vertically
Mirror_Col			u8	(	
							.iCCD_R(mCCD_R),
							.iCCD_G(mCCD_G),
							.iCCD_B(mCCD_B),
							.iCCD_DVAL(mCCD_DVAL_d),
							.iCCD_PIXCLK(CCD_PIXCLK),
							.iRST_N(DLY_RST_1),
							.oCCD_R(sCCD_R),
							.oCCD_G(sCCD_G),
							.oCCD_B(sCCD_B),
							.oCCD_DVAL(sCCD_DVAL));

endmodule