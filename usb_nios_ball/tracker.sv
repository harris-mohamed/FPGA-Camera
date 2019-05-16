/* ----------------------------------------------------------
       Tracker module 
		 
		 Description:
		 - Defines the tracker module for the actual motion tracking
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module tracker
(
	input logic [9:0] DrawX, DrawY,
	input logic [9:0] Tlx, Brx, Tly, Bry,
	input logic [9:0] VGA_R, VGA_G, VGA_B,
	input logic CLK, RESET,
	
	output logic [9:0] Topx, Topy, Bottomx, Bottomy,
	output logic [9:0] Tracktlx, Trackbrx, Tracktly, Trackbry,
	output logic writeT, writeB, Flag, Trtlxw, Trtlyw, Trbrxw, Trbryw
);

logic [9:0] toptempx, toptempy, bottomtempx, bottomtempy;

always_ff @ (posedge CLK)
begin
	if (RESET || ((DrawX == 10'b0) && (DrawY == 10'b0)))
	begin
		Flag <= 1'b0;
		toptempx <= 10'b0;
		toptempy <= 10'b0;
		bottomtempx <= 10'b0;
		bottomtempy <= 10'b0;
	end
		
	else if ((Flag == 1'b0) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)) && ((DrawX >= (Tlx-10'd5)) && (DrawX <= (Brx+10'd5)) && (DrawY >= (Tly-10'd5)) && (DrawY <= (Bry+10'd5))))
	begin
		Flag <= 1'b1;
		toptempx <= DrawX;
		toptempy <= DrawY;
	end
	
	else if ((Flag == 1'b1) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)) && ((DrawX >= (Tlx-10'd5)) && (DrawX <= (Brx+10'd5)) && (DrawY >= (Tly-10'd5)) && (DrawY <= (Bry+10'd5))))
	begin
		bottomtempx <= DrawX;
		bottomtempy <= DrawY;
	end
	
	else if ((DrawX == (Brx+10'd5+1)) && (DrawY == (Bry+10'd5)))
	begin
		Topx <= toptempx;
		Topy <= toptempy;
		Bottomx <= bottomtempx;
		Bottomy <= bottomtempy;
	end
	
	else if ((DrawX == 10'd639) && (DrawY == 10'd479))
	begin
		Tracktlx <= Topx - ((Bottomy - Topy)/(10'd2));
		Trackbrx <= Bottomx + ((Bottomy - Topy)/(10'd2));
		Tracktly <= Topy;
		Trackbry <= Bottomy;
	end
end

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


module threshold_checker
(
	input logic [9:0] VGA_R, VGA_G, VGA_B,
	input logic [9:0] DrawX, DrawY, TLX, TLY, BRX, BRY,
	output logic ABOVE_T

);

always_comb
begin
	if (((DrawX >= (TLX-10'd5)) && (DrawX <= (BRX+10'd5)) && (DrawY >= (TLY-10'd5)) && (DrawY <= (BRY+10'd5))) && ((VGA_R >= 10'd254) && (VGA_G >= 10'd254) && (VGA_B >= 10'd254)))
		ABOVE_T = 1'b1;
	else
		ABOVE_T = 1'b0;
end

endmodule



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
