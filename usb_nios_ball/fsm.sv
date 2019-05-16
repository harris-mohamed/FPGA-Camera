/* ----------------------------------------------------------
       FSM module
		 
		 Description:
		 - State machine to control flow for the project
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module fsm
(
	input	 logic CLK,
	input  logic RESET,
	input  logic CAL_START,
	input  logic CLICK,
	input  logic [11:0] TLX, TLY, BRX, BRY,
	output logic SHOW_BALL, SHOW_BOX,
	output logic Tlxw, Brxw, Tlyw, Bryw,
	output logic resetTraced, writeTraced,
	output logic showGain
);

	logic tlxw, brxw, tlyw, bryw;
	
	assign Tlxw = tlxw; 
	assign Brxw = brxw;
	assign Tlyw = tlyw;
	assign Bryw = bryw;

	enum logic [2:0] {SetCam, Cal, Click1, Click1_1, Click2, Track} State, Next_State;

	always_ff @ (posedge CLK)
	begin
		if (RESET)
			State <= SetCam;
		else
			State <= Next_State;
	end
	
	always_comb
	begin
		Next_State = State;
		
		//DEFAULT OUTPUT SIGNALS
		SHOW_BALL = 1'b0;
		SHOW_BOX = 1'b0;
		tlxw = 1'b0;
		brxw = 1'b0;
		tlyw = 1'b0;
		bryw = 1'b0;
		resetTraced = 1'b1;
		writeTraced = 1'b0;
		showGain = 1'b1;
		
		
		//Assign next state
		unique case (State)
			SetCam :
				if (CAL_START)
					Next_State = Cal;
			Cal :
				if (CLICK)
					Next_State = Click1;
			Click1 :
				if (!CLICK)
					Next_State = Click1_1;
			Click1_1 :
				if (CLICK)
					Next_State = Click2;
			Click2 :
				Next_State = Track;
			Track :
				if (TLX == 11'b0 && TLY == 11'b0 && BRX == 11'b0 && BRY == 11'b0)
					Next_State = Cal;
				else
					Next_State = Track;
			default : ;
		endcase
		
		case (State)
			SetCam : ;
			
			Cal :
			begin
				showGain = 1'b0;
				SHOW_BALL = 1'b1;
			end
			
			Click1 :
			begin
				showGain = 1'b0;
				SHOW_BALL = 1'b1;
				tlxw = 1'b1;
				tlyw = 1'b1;
			end
			
			Click1_1 :
			begin
				showGain = 1'b0;
				SHOW_BALL = 1'b1;
			end
			
			Click2 :
			begin
				showGain = 1'b0;
				SHOW_BALL = 1'b1;
				brxw = 1'b1;
				bryw = 1'b1;
			end
			
			Track :
			begin
				resetTraced = 1'b0;
				writeTraced = 1'b1;
				SHOW_BOX = 1'b1;
			end
		
			default : ;
		endcase
	end

endmodule


/* ----------------------------------------------------------
       register12 module
		 
		 Description:
		 - 12 bit register
		 
		 Authors:
       - Harris M
		 - Neeloy C
		 
		 Last Modified: May 16, 2019
   ---------------------------------------------------------- */

module register12
(
	input logic CLK,
	input logic RESET,
	input logic write,
	input logic [11:0] dataIn,
	output logic [11:0] dataOut
);

	logic [11:0] data;
	
	always_ff @ (posedge CLK)
	begin
		if (RESET)
			data <= 12'b0;
		else if (write)
			data <= dataIn;
	end
	
	assign dataOut = data;

endmodule
