/* ----------------------------------------------------------
       Reset Delay module
		 
		 Description:
		 - To avoid glitches, the modules are reset in a particular
		 order:
			(1) SDRAM
			(2) Camera capture and Converting pixels to RGB
			(3) VGA Controller
		- Based on Altera's provided code 
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module	Reset_Delay(iCLK,iRST,oRST_0,oRST_1,oRST_2);
input		iCLK;
input		iRST;
output reg	oRST_0;
output reg	oRST_1;
output reg	oRST_2;

reg	[21:0]	Cont;

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	begin
		Cont	<=	0;
		oRST_0	<=	0;
		oRST_1	<=	0;
		oRST_2	<=	0;
	end
	else
	begin
		if(Cont!=22'h3FFFFF)
		Cont	<=	Cont+1;
		if(Cont>=22'h1FFFFF)
		oRST_0	<=	1;
		if(Cont>=22'h2FFFFF)
		oRST_1	<=	1;
		if(Cont>=22'h3FFFFF)
		oRST_2	<=	1;
	end
end

endmodule