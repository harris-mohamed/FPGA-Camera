/* ----------------------------------------------------------
       Color Mapper module 
		 
		 Description:
		 - Modified version of Lab 8's color mapper 
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input              is_ball,            // Whether current pixel belongs to ball 
                                                              //   or background (computed in ball.sv)
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [9:0] VGA_R, VGA_G, VGA_B, // VGA RGB output
							  
							  input 	logic [9:0] iRed, iGreen, iBlue,
							  input	logic SHOW_BALL, SHOW_BOX, FLAG, ABOVE_T,
							  input	logic [9:0] tlx, brx, tly, bry,
							  input	logic [9:0] topx, topy, bottomx, bottomy,
							  input  logic traced
                     );
    
    logic [9:0] Red, Green, Blue;
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
    // Assign color based on is_ball signal
    always_comb
    begin
		  //white ball for mouse cursor
        if (is_ball == 1'b1 && SHOW_BALL == 1'b1) 
        begin
            Red = 10'hfff;
            Green = 10'hfff;
            Blue = 10'hfff;
        end
		  //red dots for top and bottom of box
		  else if ((SHOW_BOX == 1'b1) && ((DrawX == topx && DrawY == topy) || (DrawX == bottomx && DrawY == bottomy)))
		  begin
				Red = 10'hfff;
				Green = 10'h000;
				Blue = 10'h000;
		  end
		  //yellow trace shows path of ball
		  else if ((SHOW_BOX == 1'b1) && (traced == 1'b1))
		  begin
				Red = 10'hfff;
				Green = 10'hfff;
				Blue = 10'h032;
		  end
		  //blue shows what is within color threshold
		  else if ((SHOW_BOX == 1'b1) && (ABOVE_T == 1'b1))
		  begin
				Red = 10'h000;
				Green = 10'h000;
				Blue = 10'hfff;
		  end
		  //box boundary
		  else if ((SHOW_BOX == 1'b1) && (((DrawX >= tlx) && (DrawX <= brx) && (DrawY == tly)) || ((DrawX >= tlx) && (DrawX <= brx) && (DrawY == bry)) || ((DrawY >= tly) && (DrawY <= bry) && (DrawX == tlx)) || ((DrawY >= tly) && (DrawY <= bry) && (DrawX == brx))))
		  begin
				Red = 10'h000;
				Green = 10'hfff;
				Blue = 10'h000;
		  end
		  //camera output
        else
        begin
				Red = iRed[9:0];
				Green = iGreen[9:0];
				Blue = iBlue[9:0];
        end
    end 
    
endmodule
