					/*	   UNIVERSIDADE  FEDERAL  DA  PARAIBA    *
					 *		 ARQUITETURA DE COMPUTADORES II      *
					 *	    	        						 *
					 *                   MIC				     *
					 *											 *
					 *	  ALUNO: LUCAS GAMBARRA  MAT:10711005    *
					 *********************************************/
 
 /**********
  *  MDR(registrador de dados para memoria):      logica sequencial. Responsavel pela leitura de dados ou(exclusivo) do barramento C(
  *											      inputC) ou da memoria principal(inMemPrinc) para registrador interno(guarda). 
  *
  *                                               logica combinacional. Responsavel por dirigir o valor armazenado no registrador 
  *		                                          interno(guarda) para barramento adequado.(A, B ou memoria principal). 
  *												  
  **********/   
module MDR(
		input logic clk,
		input logic reset,
		
		input logic enaOutA,/*Habilita guarda para o barramento A*/
		input logic enaOutB,/*Habilita guarda para o barramento B*/
		input logic enaIn,  /*Habilita barramento C(inputC) para o registrador 'guarda'*/
		
		input logic READ,   /*Habilita entrada da memoria() para o guarda*/
		
		input logic signed[31:0] inputC,
		input logic signed[31:0] inMemPrinc,/*Entrada da memoria principal(inMemPrinc) para o registrador 'guarda'*/
		
		output logic signed[31:0] A, 
		output logic signed[31:0] B,
		output logic signed[31:0] outMemPrinc/*Saida para memoria principal*/
);

	logic signed [31:0]guarda;
	logic entradaNaProxima = 1'b0;/*Quando alto indica que na proxima borda de subida do clock havera um dado valido para ser 
	                                lido chegando da memoria Obs: vai ser retirado*/

    /*Parte sequencial do modulo*/
	always_ff @( posedge clk)begin
			if(reset) begin 
				guarda <= 32'b00000000000000000000000000000000;
				entradaNaProxima <= 1'b0;
			end else begin
				if(enaIn) begin				
					guarda <= inputC;	
				end/*enableIn*/
				
				if(entradaNaProxima)begin //isso vai ser retirado
					guarda <= inMemPrinc;
					if(READ) begin
						entradaNaProxima <= 1'b1;
					end else begin
					    entradaNaProxima <= 1'b0;
					end
				end else begin
					if(READ) begin
						entradaNaProxima <= 1'b1;
					end
				end
			end	
	end
	
	/*Parte combinacional do modulo*/
	always_comb
	begin
	// Statements
			if(reset) begin 
			    A 			= 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
				B 			= 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ; 	
			end else begin
				if(enaOutA)begin
						  A = guarda;	
					end else begin
						  A = 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
				end
			
				if(enaOutB)begin
						B = guarda;	
					end else begin
						B = 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
				end	
			end
			outMemPrinc = guarda;/*A saida para memoria princiapal esta sempre ativa*/
	end
	
endmodule 