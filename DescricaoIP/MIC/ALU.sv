					/*********************************************
					 *	   UNIVERSIDADE  FEDERAL  DA  PARAIBMA    *
					 *		 ARQUITETURA DE COMPUTADORES II      *
					 *	    	        						 *
					 *                   MIC				     *
					 *											 *
					 *	  ALUNO: LUCAS GAMBMARRA  MAT:10711005    *
					 *********************************************/
 
 /**********
  *  ALU: - logica combinacional. Os sinais(SigALU) estao de acordo com a tabela apresentada na pag. 136  
  *			do Livra de arquitetura.									  
  **********/  
	
	module ALU(	/**/
		input  wire unsigned [5:0]SigALU, /*SigAlu = {F_0,F_1,ENA,ENB,INVA,INC}*/
		input  wire signed[31:0] A,
		input  wire signed[31:0] B,
		input  wire reset,
		
		output logic N,/*Sinaliza se a saida da ALU contem um valor negativo*/
		output logic Z,/*Sinaliza se a saida da ALU contem um valor nulo*/
		output logic signed[31:0] R
	);/*end interface ALU*/



always_comb begin	
	   if(reset)begin 
			R = 32'b0;
	   end else begin 
		   case(SigALU)
				(6'b011000 ): R = A;//24
					
				(6'b010100) : R = B;//20
					
				(6'b011010) : R = ~A;//26 *Complemento Unario
					
				(6'b101100) : R = ~B;//44
					
				(6'b111100) : R = A+B;//60

				(6'b111101) : R = A + B + 32'b00000000000000000000000000000001;//61
					
				(6'b111001) : R = A + 32'b00000000000000000000000000000001;//57
						
				(6'b110101) : R = B + 32'b00000000000000000000000000000001;//53
				
				(6'b110111) : R = B - 32'b00000000000000000000000000000001;//54
					
				(6'b111111) : R = B - A;//63
					
				(6'b111011) : R = -A;//59 Complemanto de dois
				
				(6'b001100):  R = A & B;//12
				
				(6'b011100):  R = A | B;//28
				
				(6'b101010):  R = A * B;
				
				(6'b101011):  R = A / B;
				
				(6'b010001):  R = 32'b00000000000000000000000000000001;//49
				
				(6'b010010):  R = 32'b11111111111111111111111111111111;//50  
				
				default :     R = 32'b00000000000000000000000000000000;//6�b010000 (16 )ou outro		
		   endcase		   
		end   
		N = R[31];
		Z = (R==32'b00000000000000000000000000000000)?1'b1:1'b0;
	end	
endmodule			