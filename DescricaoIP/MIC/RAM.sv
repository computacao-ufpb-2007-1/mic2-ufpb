module RAM(
	input logic [31:0] MAR,/*Endereco da memoria*/
	input logic [31:0] MDR,
	input logic  READ,/*Read,Write,Fetch*/
	input logic  WRITE, 
	input logic  clk,
	input logic  reset,
	output logic [31:0] out_RAM 
);


	logic [32:0][31:0]memoria_Int = {	32'b00000000000000000000000000000000,/*31*/
										32'b00000000000000000000000000000101,/*30*/
										32'b00000000000000000000000000000011,/*29*/
										32'b00000000000000000000000000000000,/*28*/
										32'b00000000000000000000000000000000,/*27*/
										32'b00000000000000000000000000000000,/*26*/
										32'b00000000000000000000000000000000,/*25*/
										32'b00000000000000000000000000000000,/*24*/
										32'b00000000000000000000000001100101,/*23*/
										32'b00000000000000000000000000000000,/*22*/
										32'b00000000000000000000000001100100,/*21*/
										32'b00000000000000000000000000000000,/*20*/
										32'b00000000000000000000000000000000,/*19*/
										32'b00000000000000000000000000000000,/*18*/
										32'b00000000000000000000000000000000,/*17*/
										32'b00000000000000000000000000000000,/*16*/
										32'b00000000000000000000000000000000,/*15*/
										32'b00000000000000000000000000000000,/*14*/
										32'b00000000000000000000000000000000,/*13*/
										32'b00000000000000000000000000000000,/*12*/
										32'b00000000000000000000000000000000,/*11*/
										32'b00000000000000000000000000000000,/*10*/
										32'b00000000000000000000000000000000,/*9*/
										32'b00000000000000000000000000000000,/*8*/
										32'b00000000000000000000000000000000,/*7*/
										32'b00000000000000000000000000000000,/*6*/
										32'b00000000000000000000000000000000,/*5*/
										32'b00000000000000000000000000000000,/*4*/
										32'b00000000000000000000000000000000,/*3*/
										32'b00000000000000000000000000000000,/*2*/
										32'b00000000000000000000000000000000,/*1*/
										32'b00000000000000000000000000000000 /*0*/
										};

	logic [31:0] Reg_Int = 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;

// This construct should be used to infer sequential logic such as
// registers and state machines.
	always_ff@(negedge clk)
	begin
		// Statements
		if(reset)begin
			Reg_Int <= 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
		end else begin    
			if(READ) begin
				Reg_Int <= memoria_Int[MAR];
			end else begin
				if(WRITE) begin
					memoria_Int[MAR][31:0] <= MDR;
				end
			end
			     
		end
		
	end

	// This construct should be used to infer purely combinational logic.
	always_comb
	begin
		// Statements
		if(reset)begin
			out_RAM = 	32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
		end else begin
			out_RAM = Reg_Int;
		end
	end
endmodule