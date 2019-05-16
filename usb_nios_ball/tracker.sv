/* ----------------------------------------------------------
       Tracker module 
		 
		 Description:
		 - Defines the tracker module for the actual motion tracking
		 - Real-time 2D motion tracking of white ball
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module tracker
(
	input logic [9:0] DrawX, DrawY, 				// Current pixel being drawn
	input logic [9:0] Tlx, Brx, Tly, Bry,		// Box edge values
	input logic [9:0] VGA_R, VGA_G, VGA_B,		// Current camera color
	input logic CLK, RESET,							// VGA clock and reset
	
	output logic [9:0] Topx, Topy, Bottomx, Bottomy,						// Top and bottom coordinates of box
	output logic [9:0] Tracktlx, Trackbrx, Tracktly, Trackbry,			//	Top left and bottom right coordinates of box
	output logic writeT, writeB, Flag, Trtlxw, Trtlyw, Trbrxw, Trbryw	// Write variables for registers in top level
);

logic [9:0] toptempx, toptempy, bottomtempx, bottomtempy; // Temp registers for top and bottom of box


// Sequential logic to find the top left and bottom right of the box every frame of the monitor
always_ff @ (posedge CLK)
begin
	// At beginning of frame, flag and temp register values are reset
	if (RESET || ((DrawX == 10'b0) && (DrawY == 10'b0)))
	begin
		Flag <= 1'b0;
		toptempx <= 10'b0;
		toptempy <= 10'b0;
		bottomtempx <= 10'b0;
		bottomtempy <= 10'b0;
	end
		
	// If flag is not set, the current pixel being drawn is white, and the pixel is within the a 5 pixel radius of the current box, then it has found the top of the box
	else if ((Flag == 1'b0) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)) && ((DrawX >= (Tlx-10'd5)) && (DrawX <= (Brx+10'd5)) && (DrawY >= (Tly-10'd5)) && (DrawY <= (Bry+10'd5))))
	begin
		Flag <= 1'b1; // flag is set to denote that top of box was found
		toptempx <= DrawX;
		toptempy <= DrawY;
	end
	
	// If flag is set, the current pixel being drawn is white, and the pixel is within the a 5 pixel radius of the current box, then it has found the new bottom of the box
	else if ((Flag == 1'b1) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)) && ((DrawX >= (Tlx-10'd5)) && (DrawX <= (Brx+10'd5)) && (DrawY >= (Tly-10'd5)) && (DrawY <= (Bry+10'd5))))
	begin
		bottomtempx <= DrawX;
		bottomtempy <= DrawY;
	end
	
	// Once the draw X/Y coordinates leave the box radius, the top and bottom registers get the new value of the current frame
	else if ((DrawX == (Brx+10'd5+1)) && (DrawY == (Bry+10'd5)))
	begin
		Topx <= toptempx;
		Topy <= toptempy;
		Bottomx <= bottomtempx;
		Bottomy <= bottomtempy;
	end
	
	// Near the end of the frame, the top left and bottom right registers get their new value for the frame
	else if ((DrawX == 10'd639) && (DrawY == 10'd479))
	begin
		Tracktlx <= Topx - ((Bottomy - Topy)/(10'd2));
		Trackbrx <= Bottomx + ((Bottomy - Topy)/(10'd2));
		Tracktly <= Topy;
		Trackbry <= Bottomy;
	end
end

// Combinational logic for writing to registers in top level
always_comb
begin
	if ((DrawX == 10'd640) && (DrawY == 10'd479))
	begin
		Trtlxw = 1'b1;
		Trtlyw = 1'b1;
		Trbrxw = 1'b1;
		Trbryw = 1'b1;
	end
	else
	begin
		Trtlxw = 1'b0;
		Trtlyw = 1'b0;
		Trbrxw = 1'b0;
		Trbryw = 1'b0;
	end
end

endmodule


/* ----------------------------------------------------------
       Threshold_checker module 
		 
		 Description:
		 - Identifies whether or not the current pixel being drawn is being detected by the tracker module
		 - Helpful for debugging
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module threshold_checker
(
	input logic [9:0] VGA_R, VGA_G, VGA_B,
	input logic [9:0] DrawX, DrawY, TLX, TLY, BRX, BRY,
	output logic ABOVE_T // Output logic that goes to color mapper to produce blue color for pixels being detected

);

always_comb
begin
	if (((DrawX >= (TLX-10'd5)) && (DrawX <= (BRX+10'd5)) && (DrawY >= (TLY-10'd5)) && (DrawY <= (BRY+10'd5))) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)))
		ABOVE_T = 1'b1;
	else
		ABOVE_T = 1'b0;
end

endmodule


/* ----------------------------------------------------------
       Register10 module 
		 
		 Description:
		 - 10 bit register
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */
	
module register10
(
	input logic CLK,
	input logic RESET,
	input logic write,
	input logic [9:0] dataIn,
	output logic [9:0] dataOut
);

	logic [9:0] data;
	
	always_ff @ (posedge CLK)
	begin
		if (RESET)
			data <= 10'b0;
		else if (write)
			data <= dataIn;
	end
	
	assign dataOut = data;

endmodule
