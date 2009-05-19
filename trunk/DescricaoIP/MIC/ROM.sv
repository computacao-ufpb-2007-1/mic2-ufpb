					/*********************************************S
					 *	   UNIVERSIDADE  FEDERAL  DA  PARAIBMA    *
					 *		 ARQUITETURA DE COMPUTADORES II      *
					 *	    	        						 *
					 *                   MIC				     *
					 *											 *
					 *	  ALUNO: LUCAS GAMBMARRA  MAT:10711005    *
					 *********************************************/
 
 /**********
  *  ROM:  apenas simula uma memoria para ROM
  *												  
  **********/ 
module ROM(
//	input  logic unsigned [38:0]  MICRO,
	input [8:0] address,
	input clk,
	input logic reset,
	input logic READ,/*Nesse caso vai estar sempre ativo*/	
		
	/****
	 Cada uma das saidas seguintes definram o funcionamento da proxima
	 */
	output logic [8:0]Next_ADDR,
	output logic [2:0]JAM,
	output logic [5:0]ALU,
	output logic [1:0]DESL_R,
	output logic [3:0]A,
	output logic [2:0]B,
	output logic enaMAR,
	output logic enaMDR,
	output logic enaPC,
	output logic enaSP,
	output logic enaLV,
	output logic enaCPP,
	output logic enaTOS,
	output logic enaOPC,
	output logic enaH,
	output logic [2:0]MEM,
	output logic [38:0] q1	//so para testes
);

	wire [38:0] sub_wire0;
	wire [38:0] q = sub_wire0[38:0];

	altsyncram	altsyncram_component (
				.clock0 (clk),
				.address_a (address),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({39{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = "instrucoes.mif",
		altsyncram_component.intended_device_family = "Stratix II",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO, INSTANCE_NAME=NONE",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 512,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "CLOCK0",
		altsyncram_component.widthad_a = 9,
		altsyncram_component.width_a = 39,
		altsyncram_component.width_byteena_a = 1;


//essa parte sera apagada
	logic [511:0][38:0] MICROPROGRAMA = {
	/*	511*/	39'b000000000000000000000000000000000000000,
	/*	510*/	39'b000000000000000000000000000000000000000,
	/*	509*/	39'b000000000000000000000000000000000000000,
	/*	508*/	39'b000000000000000000000000000000000000000,
	/*	507*/	39'b000000000000000000000000000000000000000,
	/*	506*/	39'b000000000000000000000000000000000000000,
	/*	505*/	39'b000000000000000000000000000000000000000,
	/*	504*/	39'b000000000000000000000000000000000000000,
	/*	503*/	39'b000000000000000000000000000000000000000,
	/*	502*/	39'b000000000000000000000000000000000000000,
	/*	501*/	39'b000000000000000000000000000000000000000,
	/*	500*/	39'b000000000000000000000000000000000000000,
	/*	499*/	39'b000000000000000000000000000000000000000,
	/*	498*/	39'b000000000000000000000000000000000000000,
	/*	497*/	39'b000000000000000000000000000000000000000,
	/*	496*/	39'b000000000000000000000000000000000000000,
	/*	495*/	39'b000000000000000000000000000000000000000,
	/*	494*/	39'b000000000000000000000000000000000000000,
	/*	493*/	39'b000000000000000000000000000000000000000,
	/*	492*/	39'b000000000000000000000000000000000000000,
	/*	491*/	39'b000000000000000000000000000000000000000,
	/*	490*/	39'b000000000000000000000000000000000000000,
	/*	489*/	39'b000000000000000000000000000000000000000,
	/*	488*/	39'b000000000000000000000000000000000000000,
	/*	487*/	39'b000000000000000000000000000000000000000,
	/*	486*/	39'b000000000000000000000000000000000000000,
	/*	485*/	39'b000000000000000000000000000000000000000,
	/*	484*/	39'b000000000000000000000000000000000000000,
	/*	483*/	39'b000000000000000000000000000000000000000,
	/*	482*/	39'b000000000000000000000000000000000000000,
	/*	481*/	39'b000000000000000000000000000000000000000,
	/*	480*/	39'b000000000000000000000000000000000000000,
	/*	479*/	39'b000000000000000000000000000000000000000,
	/*	478*/	39'b000000000000000000000000000000000000000,
	/*	477*/	39'b000000000000000000000000000000000000000,
	/*	476*/	39'b000000000000000000000000000000000000000,
	/*	475*/	39'b000000000000000000000000000000000000000,
	/*	474*/	39'b000000000000000000000000000000000000000,
	/*	473*/	39'b000000000000000000000000000000000000000,
	/*	472*/	39'b000000000000000000000000000000000000000,
	/*	471*/	39'b000000000000000000000000000000000000000,
	/*	470*/	39'b000000000000000000000000000000000000000,
	/*	469*/	39'b000000000000000000000000000000000000000,
	/*	468*/	39'b000000000000000000000000000000000000000,
	/*	467*/	39'b000000000000000000000000000000000000000,
	/*	466*/	39'b000000000000000000000000000000000000000,
	/*	465*/	39'b000000000000000000000000000000000000000,
	/*	464*/	39'b000000000000000000000000000000000000000,
	/*	463*/	39'b000000000000000000000000000000000000000,
	/*	462*/	39'b000000000000000000000000000000000000000,
	/*	461*/	39'b000000000000000000000000000000000000000,
	/*	460*/	39'b000000000000000000000000000000000000000,
	/*	459*/	39'b000000000000000000000000000000000000000,
	/*	458*/	39'b000000000000000000000000000000000000000,
	/*	457*/	39'b000000000000000000000000000000000000000,
	/*	456*/	39'b000000000000000000000000000000000000000,
	/*	455*/	39'b000000000000000000000000000000000000000,
	/*	454*/	39'b000000000000000000000000000000000000000,
	/*	453*/	39'b000000000000000000000000000000000000000,
	/*	452*/	39'b000000000000000000000000000000000000000,
	/*	451*/	39'b000000000000000000000000000000000000000,
	/*	450*/	39'b000000000000000000000000000000000000000,
	/*	449*/	39'b000000000000000000000000000000000000000,
	/*	448*/	39'b000000000000000000000000000000000000000,
	/*	447*/	39'b000000000000000000000000000000000000000,
	/*	446*/	39'b000000000000000000000000000000000000000,
	/*	445*/	39'b000000000000000000000000000000000000000,
	/*	444*/	39'b000000000000000000000000000000000000000,
	/*	443*/	39'b000000000000000000000000000000000000000,
	/*	442*/	39'b000000000000000000000000000000000000000,
	/*	441*/	39'b000000000000000000000000000000000000000,
	/*	440*/	39'b000000000000000000000000000000000000000,
	/*	439*/	39'b000000000000000000000000000000000000000,
	/*	438*/	39'b000000000000000000000000000000000000000,
	/*	437*/	39'b000000000000000000000000000000000000000,
	/*	436*/	39'b000000000000000000000000000000000000000,
	/*	435*/	39'b000000000000000000000000000000000000000,
	/*	434*/	39'b000000000000000000000000000000000000000,
	/*	433*/	39'b000000000000000000000000000000000000000,
	/*	432*/	39'b000000000000000000000000000000000000000,
	/*	431*/	39'b000000000000000000000000000000000000000,
	/*	430*/	39'b000000000000000000000000000000000000000,
	/*	429*/	39'b000000000000000000000000000000000000000,
	/*	428*/	39'b000000000000000000000000000000000000000,
	/*	427*/	39'b000000000000000000000000000000000000000,
	/*	426*/	39'b000000000000000000000000000000000000000,
	/*	425*/	39'b000000000000000000000000000000000000000,
	/*	424*/	39'b000000000000000000000000000000000000000,
	/*	423*/	39'b000000000000000000000000000000000000000,
	/*	422*/	39'b000000000000000000000000000000000000000,
	/*	421*/	39'b000000000000000000000000000000000000000,
	/*	420*/	39'b000000000000000000000000000000000000000,
	/*	419*/	39'b000000000000000000000000000000000000000,
	/*	418*/	39'b000000000000000000000000000000000000000,
	/*	417*/	39'b000000000000000000000000000000000000000,
	/*	416*/	39'b000000000000000000000000000000000000000,
	/*	415*/	39'b000000000000000000000000000000000000000,
	/*	414*/	39'b000000000000000000000000000000000000000,
	/*	413*/	39'b000000000000000000000000000000000000000,
	/*	412*/	39'b000000000000000000000000000000000000000,
	/*	411*/	39'b000000000000000000000000000000000000000,
	/*	410*/	39'b000000000000000000000000000000000000000,
	/*	409*/	39'b000000000000000000000000000000000000000,
	/*	408*/	39'b000000000000000000000000000000000000000,
	/*	407*/	39'b000000000000000000000000000000000000000,
	/*	406*/	39'b000000000000000000000000000000000000000,
	/*	405*/	39'b000000000000000000000000000000000000000,
	/*	404*/	39'b000000000000000000000000000000000000000,
	/*	403*/	39'b000000001000110101000001110001000000001,/*110010011 F1     000000001 000 110101 00 0001 110 001000000 001 PC = PC+1 FETCH;GOTO(MBR1)*/
	/*	402*/	39'b110010011000110101000001110001000000000,/*110010010 F      110010011 000 110101 00 0001 110 001000000 000 PC=  PC+1;*/
	/*	401*/	39'b000000000000000000000000000000000000000,
	/*	400*/	39'b000000000000000000000000000000000000000,
	/*	399*/	39'b000000000000000000000000000000000000000,
	/*	398*/	39'b000000000000000000000000000000000000000,
	/*	397*/	39'b000000000000000000000000000000000000000,
	/*	396*/	39'b000000000000000000000000000000000000000,
	/*	395*/	39'b000000000000000000000000000000000000000,
	/*	394*/	39'b000000000000000000000000000000000000000,
	/*	393*/	39'b000000000000000000000000000000000000000,
	/*	392*/	39'b000000000000000000000000000000000000000,
	/*	391*/	39'b000000000000000000000000000000000000000,
	/*	390*/	39'b000000000000000000000000000000000000000,
	/*	389*/	39'b000000000000000000000000000000000000000,
	/*	388*/	39'b000000000000000000000000000000000000000,
	/*	387*/	39'b000000000000000000000000000000000000000,
	/*	386*/	39'b000000000000000000000000000000000000000,
	/*	385*/	39'b000000000000000000000000000000000000000,
	/*	384*/	39'b000000000000000000000000000000000000000,
	/*	383*/	39'b000000000000000000000000000000000000000,
	/*	382*/	39'b000000000000000000000000000000000000000,
	/*	381*/	39'b000000000000000000000000000000000000000,
	/*	380*/	39'b000000000000000000000000000000000000000,
	/*	379*/	39'b000000000000000000000000000000000000000,
	/*	378*/	39'b000000000000000000000000000000000000000,
	/*	377*/	39'b000000000000000000000000000000000000000,
	/*	376*/	39'b000000000000000000000000000000000000000,
	/*	375*/	39'b000000000000000000000000000000000000000,
	/*	374*/	39'b000000000000000000000000000000000000000,
	/*	373*/	39'b000000000000000000000000000000000000000,
	/*	372*/	39'b000000000000000000000000000000000000000,
	/*	371*/	39'b000000000000000000000000000000000000000,
	/*	370*/	39'b000000000000000000000000000000000000000,
	/*	369*/	39'b000000000000000000000000000000000000000,
	/*	368*/	39'b000000000000000000000000000000000000000,
	/*	367*/	39'b000000000000000000000000000000000000000,
	/*	366*/	39'b000000000000000000000000000000000000000,
	/*	365*/	39'b000000000000000000000000000000000000000,
	/*	364*/	39'b000000000000000000000000000000000000000,
	/*	363*/	39'b000000000000000000000000000000000000000,
	/*	362*/	39'b000000000000000000000000000000000000000,
	/*	361*/	39'b000000000000000000000000000000000000000,
	/*	360*/	39'b000000000000000000000000000000000000000,
	/*	359*/	39'b000000000000000000000000000000000000000,
	/*	358*/	39'b000000000000000000000000000000000000000,
	/*	357*/	39'b000000000000000000000000000000000000000,
	/*	356*/	39'b000000000000000000000000000000000000000,
	/*	355*/	39'b000000000000000000000000000000000000000,
	/*	354*/	39'b000000000000000000000000000000000000000,
	/*	353*/	39'b000000000000000000000000000000000000000,
	/*	352*/	39'b000000000000000000000000000000000000000,
	/*	351*/	39'b000000000000000000000000000000000000000,
	/*	350*/	39'b000000000000000000000000000000000000000,
	/*	349*/	39'b000000000000000000000000000000000000000,
	/*	348*/	39'b000000000000000000000000000000000000000,
	/*	347*/	39'b000000000000000000000000000000000000000,
	/*	346*/	39'b000000000000000000000000000000000000000,
	/*	345*/	39'b000000000000000000000000000000000000000,
	/*	344*/	39'b000000000000000000000000000000000000000,
	/*	343*/	39'b000000000000000000000000000000000000000,
	/*	342*/	39'b000000000000000000000000000000000000000,
	/*	341*/	39'b000000000000000000000000000000000000000,
	/*	340*/	39'b000000000000000000000000000000000000000,
	/*	339*/	39'b000000000000000000000000000000000000000,
	/*	338*/	39'b000000000000000000000000000000000000000,
	/*	337*/	39'b000000000000000000000000000000000000000,
	/*	336*/	39'b000000000000000000000000000000000000000,
	/*	335*/	39'b000000000000000000000000000000000000000,
	/*	334*/	39'b000000000000000000000000000000000000000,
	/*	333*/	39'b000000000000000000000000000000000000000,
	/*	332*/	39'b000000000000000000000000000000000000000,
	/*	331*/	39'b000000000000000000000000000000000000000,
	/*	330*/	39'b000000000000000000000000000000000000000,
	/*	329*/	39'b000000000000000000000000000000000000000,
	/*	328*/	39'b000000000000000000000000000000000000000,
	/*	327*/	39'b000000000000000000000000000000000000000,
	/*	326*/	39'b000000000000000000000000000000000000000,
	/*	325*/	39'b000000000000000000000000000000000000000,
	/*	324*/	39'b000000000000000000000000000000000000000,
	/*	323*/	39'b000000000000000000000000000000000000000,
	/*	322*/	39'b000000000000000000000000000000000000000,
	/*	321*/	39'b000000000000000000000000000000000000000,
	/*	320*/	39'b000000000000000000000000000000000000000,
	/*	319*/	39'b000000000000000000000000000000000000000,
	/*	318*/	39'b000000000000000000000000000000000000000,
	/*	317*/	39'b000000000000000000000000000000000000000,
	/*	316*/	39'b000000000000000000000000000000000000000,
	/*	315*/	39'b000000000000000000000000000000000000000,
	/*	314*/	39'b000000000000000000000000000000000000000,
	/*	313*/	39'b000000000000000000000000000000000000000,
	/*	312*/	39'b000000000000000000000000000000000000000,
	/*	311*/	39'b000000000000000000000000000000000000000,
	/*	310*/	39'b000000000000000000000000000000000000000,
	/*	309*/	39'b000000000000000000000000000000000000000,
	/*	308*/	39'b000000000000000000000000000000000000000,
	/*	307*/	39'b000000000000000000000000000000000000000,
	/*	306*/	39'b000000000000000000000000000000000000000,
	/*	305*/	39'b000000000000000000000000000000000000000,
	/*	304*/	39'b000000000000000000000000000000000000000,
	/*	303*/	39'b000000000000000000000000000000000000000,
	/*	302*/	39'b000000000000000000000000000000000000000,
	/*	301*/	39'b000000000000000000000000000000000000000,
	/*	300*/	39'b000000000000000000000000000000000000000,
	/*	299*/	39'b000000000000000000000000000000000000000,
	/*	298*/	39'b000000000000000000000000000000000000000,
	/*	297*/	39'b000000000000000000000000000000000000000,
	/*	296*/	39'b000000000000000000000000000000000000000,
	/*	295*/	39'b000000000000000000000000000000000000000,
	/*	294*/	39'b000000000000000000000000000000000000000,
	/*	293*/	39'b000000000000000000000000000000000000000,
	/*	292*/	39'b000000000000000000000000000000000000000,
	/*	291*/	39'b000000000000000000000000000000000000000,
	/*	290*/	39'b000000000000000000000000000000000000000,
	/*	289*/	39'b000000000000000000000000000000000000000,
	/*	288*/	39'b000000000000000000000000000000000000000,
	/*	287*/	39'b000000000000000000000000000000000000000,
	/*	286*/	39'b000000000000000000000000000000000000000,
	/*	285*/	39'b000000000000000000000000000000000000000,
	/*	284*/	39'b000000000000000000000000000000000000000,
	/*	283*/	39'b000000000000000000000000000000000000000,
	/*	282*/	39'b000000000000000000000000000000000000000,
	/*	281*/	39'b000000000000000000000000000000000000000,
	/*	280*/	39'b000000000000000000000000000000000000000,
	/*	279*/	39'b000000000000000000000000000000000000000,
	/*	278*/	39'b000000000000000000000000000000000000000,
	/*	277*/	39'b000000000000000000000000000000000000000,
	/*	276*/	39'b000000000000000000000000000000000000000,
	/*	275*/	39'b000000000000000000000000000000000000000,
	/*	274*/	39'b000000000000000000000000000000000000000,
	/*	273*/	39'b000000000000000000000000000000000000000,
	/*	272*/	39'b000000000000000000000000000000000000000,
	/*	271*/	39'b000000000000000000000000000000000000000,
	/*	270*/	39'b000000000000000000000000000000000000000,
	/*	269*/	39'b000000000000000000000000000000000000000,
	/*	268*/	39'b000000000000000000000000000000000000000,
	/*	267*/	39'b000000000000000000000000000000000000000,
	/*	266*/	39'b000000000000000000000000000000000000000,
	/*	265*/	39'b000000000000000000000000000000000000000,
	/*	264*/	39'b000000000000000000000000000000000000000,
	/*	263*/	39'b000000000000000000000000000000000000000,
	/*	262*/	39'b000000000000000000000000000000000000000,
	/*	261*/	39'b000000000000000000000000000000000000000,
	/*	260*/	39'b000000000000000000000000000000000000000,
	/*	259*/	39'b000000000000000000000000000000000000000,
	/*	258*/	39'b000000000000000000000000000000000000000,
	/*	257*/	39'b000000000000000000000000000000000000000,
	/*	256*/	39'b000000000000000000000000000000000000000,
	/*	255*/	39'b000000000000000000000000000000000000000,
	/*	254*/	39'b000000000000000000000000000000000000000,
	/*	253*/	39'b000000000000000000000000000000000000000,
	/*	252*/	39'b000000000000000000000000000000000000000,
	/*	251*/	39'b000000000000000000000000000000000000000,
	/*	250*/	39'b000000000000000000000000000000000000000,
	/*	249*/	39'b000000000000000000000000000000000000000,
	/*	248*/	39'b000000000000000000000000000000000000000,
	/*	247*/	39'b000000000000000000000000000000000000000,
	/*	246*/	39'b000000000000000000000000000000000000000,
	/*	245*/	39'b000000000000000000000000000000000000000,
	/*	244*/	39'b000000000000000000000000000000000000000,
	/*	243*/	39'b000000000000000000000000000000000000000,
	/*	242*/	39'b000000000000000000000000000000000000000,
	/*	241*/	39'b000000000000000000000000000000000000000,
	/*	240*/	39'b000000000000000000000000000000000000000,
	/*	239*/	39'b000000000000000000000000000000000000000,
	/*	238*/	39'b000000000000000000000000000000000000000,
	/*	237*/	39'b000000000000000000000000000000000000000,
	/*	236*/	39'b000000000000000000000000000000000000000,
	/*	235*/	39'b000000000000000000000000000000000000000,
	/*	234*/	39'b000000000000000000000000000000000000000,
	/*	233*/	39'b000000000000000000000000000000000000000,
	/*	232*/	39'b000000000000000000000000000000000000000,
	/*	231*/	39'b000000000000000000000000000000000000000,
	/*	230*/	39'b000000000000000000000000000000000000000,
	/*	229*/	39'b000000000000000000000000000000000000000,
	/*	228*/	39'b000000000000000000000000000000000000000,
	/*	227*/	39'b000000000000000000000000000000000000000,
	/*	226*/	39'b000000000000000000000000000000000000000,
	/*	225*/	39'b000000000000000000000000000000000000000,
	/*	224*/	39'b000000000000000000000000000000000000000,
	/*	223*/	39'b000000000000000000000000000000000000000,
	/*	222*/	39'b000000000000000000000000000000000000000,
	/*	221*/	39'b000000000000000000000000000000000000000,
	/*	220*/	39'b000000000000000000000000000000000000000,
	/*	219*/	39'b000000000000000000000000000000000000000,
	/*	218*/	39'b000000000000000000000000000000000000000,
	/*	217*/	39'b000000000000000000000000000000000000000,
	/*	216*/	39'b000000000000000000000000000000000000000,
	/*	215*/	39'b000000000000000000000000000000000000000,
	/*	214*/	39'b000000000000000000000000000000000000000,
	/*	213*/	39'b000000000000000000000000000000000000000,
	/*	212*/	39'b000000000000000000000000000000000000000,
	/*	211*/	39'b000000000000000000000000000000000000000,
	/*	210*/	39'b000000000000000000000000000000000000000,
	/*	209*/	39'b000000000000000000000000000000000000000,
	/*	208*/	39'b000000000000000000000000000000000000000,
	/*	207*/	39'b000000000000000000000000000000000000000,
	/*	206*/	39'b000000000000000000000000000000000000000,
	/*	205*/	39'b000000000000000000000000000000000000000,
	/*	204*/	39'b000000000000000000000000000000000000000,
	/*	203*/	39'b000000000000000000000000000000000000000,
	/*	202*/	39'b000000000000000000000000000000000000000,
	/*	201*/	39'b000000000000000000000000000000000000000,
	/*	200*/	39'b000000000000000000000000000000000000000,
	/*	199*/	39'b000000000000000000000000000000000000000,
	/*	198*/	39'b000000000000000000000000000000000000000,
	/*	197*/	39'b000000000000000000000000000000000000000,
	/*	196*/	39'b000000000000000000000000000000000000000,
	/*	195*/	39'b000000000000000000000000000000000000000,
	/*	194*/	39'b000000000000000000000000000000000000000,
	/*	193*/	39'b000000000000000000000000000000000000000,
	/*	192*/	39'b000000000000000000000000000000000000000,
	/*	191*/	39'b000000000000000000000000000000000000000,
	/*	190*/	39'b000000000000000000000000000000000000000,
	/*	189*/	39'b000000000000000000000000000000000000000,
	/*	188*/	39'b000000000000000000000000000000000000000,
	/*	187*/	39'b000000000000000000000000000000000000000,
	/*	186*/	39'b000000000000000000000000000000000000000,
	/*	185*/	39'b000000000000000000000000000000000000000,
	/*	184*/	39'b000000000000000000000000000000000000000,
	/*	183*/	39'b000000000000000000000000000000000000000,
	/*	182*/	39'b000000000000000000000000000000000000000,
	/*	181*/	39'b000000000000000000000000000000000000000,
	/*	180*/	39'b000000000000000000000000000000000000000,
	/*	179*/	39'b000000000000000000000000000000000000000,
	/*	178*/	39'b000000000000000000000000000000000000000,
	/*	177*/	39'b000000000000000000000000000000000000000,
	/*	176*/	39'b000000000000000000000000000000000000000,
	/*	175*/	39'b000000000000000000000000000000000000000,
	/*	174*/	39'b000000000000000000000000000000000000000,
	/*	173*/	39'b000000000000000000000000000000000000000,
	/*	172*/	39'b000000000000000000000000000000000000000,
	/*	171*/	39'b000000000000000000000000000000000000000,
	/*	170*/	39'b000000000000000000000000000000000000000,
	/*	169*/	39'b000000000000000000000000000000000000000,
	/*	168*/	39'b000000000000000000000000000000000000000,
	/*	167*/	39'b000000000000000000000000000000000000000,
	/*	166*/	39'b000000000000000000000000000000000000000,
	/*	165*/	39'b000000000000000000000000000000000000000,
	/*	164*/	39'b000000000000000000000000000000000000000,
	/*	163*/	39'b000000000000000000000000000000000000000,
	/*	162*/	39'b000000000000000000000000000000000000000,
	/*	161*/	39'b000000000000000000000000000000000000000,
	/*	160*/	39'b000000000000000000000000000000000000000,
	/*	159*/	39'b000000000000000000000000000000000000000,
	/*	158*/	39'b000000000000000000000000000000000000000,
	/*	157*/	39'b000000000000000000000000000000000000000,
	/*	156*/	39'b000000000000000000000000000000000000000,
	/*	155*/	39'b000000000000000000000000000000000000000,
	/*	154*/	39'b000000000000000000000000000000000000000,
	/*	153*/	39'b000000000000000000000000000000000000000,
	/*	152*/	39'b000000000000000000000000000000000000000,
	/*	151*/	39'b000000000000000000000000000000000000000,
	/*	150*/	39'b000000000000000000000000000000000000000,
	/*	149*/	39'b000000000000000000000000000000000000000,
	/*	148*/	39'b000000000000000000000000000000000000000,
	/*	147*/	39'b000000000000000000000000000000000000000,
	/*	146*/	//39'b000010011000110110000000110000000010000,	/*010010010  T       000010011 000 110110 00 0000 110 000000010 000  OPC=PC+1;FETCH*/
	/*	146*/	39'b000000001000110101000001110001000000001, 	/*010010010	 T(MAIN) 000000001 000 110101 00 0001 110 001000000 001
	/*	145*/	39'b000000000000000000000000000000000000000,                      
	/*	144*/	39'b000000000000000000000000000000000000000,
	/*	143*/	39'b000000000000000000000000000000000000000,
	/*	142*/	39'b000000000000000000000000000000000000000,
	/*	141*/	39'b000000000000000000000000000000000000000,
	/*	140*/	39'b000000000000000000000000000000000000000,
	/*	139*/	39'b000000000000000000000000000000000000000,
	/*	138*/	39'b000000000000000000000000000000000000000,
	/*	137*/	39'b000000000000000000000000000000000000000,
	/*	136*/	39'b000000000000000000000000000000000000000,
	/*	135*/	39'b000000000000000000000000000000000000000,
	/*	134*/	39'b000000000000000000000000000000000000000,
	/*	133*/	39'b000000000000000000000000000000000000000,
	/*	132*/	39'b000000000000000000000000000000000000000,
	/*	131*/	39'b000000000000000000000000000000000000000,
	/*	130*/	39'b000000000000000000000000000000000000000,
	/*	129*/	39'b000000000000000000000000000000000000000,
	/*	128*/	39'b000000000000000000000000000000000000000,
	/*	127*/	39'b000000000000000000000000000000000000000,
	/*	126*/	39'b000000000000000000000000000000000000000,
	/*	125*/	39'b000000000000000000000000000000000000000,
	/*	124*/	39'b000000000000000000000000000000000000000,
	/*	123*/	39'b000000000000000000000000000000000000000,
	/*	122*/	39'b000000000000000000000000000000000000000,
	/*	121*/	39'b000000000000000000000000000000000000000,
	/*	120*/	39'b000000000000000000000000000000000000000,
	/*	119*/	39'b000000000000000000000000000000000000000,
	/*	118*/	39'b000000000000000000000000000000000000000,
	/*	117*/	39'b000000000000000000000000000000000000000,
	/*	116*/	39'b000000000000000000000000000000000000000,
	/*	115*/	39'b000000000000000000000000000000000000000,
	/*	114*/	39'b000000000000000000000000000000000000000,
	/*	113*/	39'b000000000000000000000000000000000000000,
	/*	112*/	39'b000000000000000000000000000000000000000,
	/*	111*/	39'b000000000000000000000000000000000000000,
	/*	110*/	39'b000000000000000000000000000000000000000,
	/*	109*/	39'b000000000000000000000000000000000000000,
	/*	108*/	39'b000000000000000000000000000000000000000,
	/*	107*/	39'b000000000000000000000000000000000000000,
	/*	106*/	39'b000000000000000000000000000000000000000,
	/*	105*/	39'b000000000000000000000000000000000000000,
	/*	104*/	39'b000000000000000000000000000000000000000,
	/*	103*/	39'b000000000000000000000000000000000000000,
	/*	102*/	39'b000000000000000000000000000000000000000,
	/*	101*/	39'b000000000000000000000000000000000000000,
	/*	100*/	39'b000000000000000000000000000000000000000,
	/*	99*/	39'b000000000000000000000000000000000000000,
	/*	98*/	39'b000000000000000000000000000000000000000,
	/*	97*/	39'b000000000000000000000000000000000000000,
	/*	96*/	39'b000000000000000000000000000000000000000,
	/*	95*/	39'b000000000000000000000000000000000000000,
	/*	94*/	39'b000000000000000000000000000000000000000,
	/*	93*/	39'b000000000000000000000000000000000000000,
	/*	92*/	39'b000000000000000000000000000000000000000,
	/*	91*/	39'b000000000000000000000000000000000000000,
	/*	90*/	39'b000000000000000000000000000000000000000,
	/*	89*/	39'b000000000000000000000000000000000000000,
	/*	88*/	39'b000000000000000000000000000000000000000,
	/*	87*/	39'b000000000000000000000000000000000000000,
	/*	86*/	39'b000000000000000000000000000000000000000,
	/*	85*/	39'b000000000000000000000000000000000000000,
	/*	84*/	39'b000000000000000000000000000000000000000,
	/*	83*/	39'b000000000000000000000000000000000000000,
	/*	82*/	39'b000000000000000000000000000000000000000,
	/*	81*/	39'b000000000000000000000000000000000000000,
	/*	80*/	39'b000000000000000000000000000000000000000,
	/*	79*/	39'b000000000000000000000000000000000000000,
	/*	78*/	39'b000000000000000000000000000000000000000,
	/*	77*/	39'b000000000000000000000000000000000000000,
	/*	76*/	39'b000000000000000000000000000000000000000,
	/*	75*/	39'b000000000000000000000000000000000000000,
	/*	74*/	39'b000000000000000000000000000000000000000,
	/*	73*/	39'b000000000000000000000000000000000000000,
	/*	72*/	39'b000000000000000000000000000000000000000,
	/*	71*/	39'b000000000000000000000000000000000000000,
	/*	70*/	39'b000000000000000000000000000000000000000,
	/*	69*/	39'b000000000000000000000000000000000000000,
	/*	68*/	39'b000000000000000000000000000000000000000,
	/*	67*/	39'b000000000000000000000000000000000000000,
	/*	66*/	39'b000000000000000000000000000000000000000,
	/*	65*/	39'b000000000000000000000000000000000000000,
	/*	64*/	39'b000000000000000000000000000000000000000,
	/*	63*/	39'b000000000000000000000000000000000000000,
	/*	62*/	39'b000000000000000000000000000000000000000,
	/*	61*/	39'b000000000000000000000000000000000000000,
	/*	60*/	39'b000000000000000000000000000000000000000,
	/*	59*/	39'b000000000000000000000000000000000000000,
	/*	58*/	39'b000000000000000000000000000000000000000,
	/*	57*/	39'b000000000000000000000000000000000000000,
	/*	56*/	39'b000000000000000000000000000000000000000,
	/*	55*/	39'b000000000000000000000000000000000000000,
	/*	54*/	39'b000000000000000000000000000000000000000,
	/*	53*/	39'b000000000000000000000000000000000000000,
	/*	52*/	39'b000000000000000000000000000000000000000,
	/*	51*/	39'b000000000000000000000000000000000000000,
	/*	50*/	39'b000000000000000000000000000000000000000,
	/*	49*/	39'b000000000000000000000000000000000000000,
	/*	48*/	39'b000000000000000000000000000000000000000,
	/*	47*/	39'b000000000000000000000000000000000000000,
	/*	46*/	39'b000000000000000000000000000000000000000,
	/*	45*/	39'b000000000000000000000000000000000000000,
	/*	44*/	39'b000000000000000000000000000000000000000,
	/*	43*/	39'b000000000000000000000000000000000000000,
	/*	42*/	39'b000000000000000000000000000000000000000,
	/*	41*/	39'b000000000000000000000000000000000000000,
	/*	40*/	39'b000000000000000000000000000000000000000,
	/*	39*/	39'b000000000000000000000000000000000000000,
	/*	38*/	39'b000000000000000000000000000000000000000,
	/*	37*/	39'b000000000000000000000000000000000000000,
	/*	36*/	39'b000000000000000000000000000000000000000,
	/*	35*/	39'b000000000000000000000000000000000000000,
	/*	34*/	39'b000000000000000000000000000000000000000,
	/*	33*/	39'b000000000000000000000000000000000000000,
	/*	32*/	39'b000000000000000000000000000000000000000,
	/*	31*/	39'b000000000000000000000000000000000000000,
	/*	30*/	39'b000000000000000000000000000000000000000,
	/*	29*/	39'b000000000000000000000000000000000000000,    /*11101*/
	/*	28*/	39'b010010010010111111000000001000000000000,    /*11100    if_eq6  010010010 010 111111 00 0000 001 000000000 000 		Z=OPC-H;if(Z)GOTO F; else GOTO T*/
	/*	27*/	39'b000011100000011000001010000000000100000,	/*11011    if_eq5  000011100 000 011000 00 1010 000 000000100 000 		TOS=MDR*/
	/*	26*/	39'b000011011000011000000010000000000010000,	/*11010    if_eq4  000011011 000 011000 00 0010 000 000000010 000 		OPC=TOS*/
	/*	25*/	39'b000011010000011000001010000000000001010,	/*11001    if_eq3  000011010 000 011000 00 1010 000 000000001 010 		H=MDR;rd*/
	/*	24*/	39'b000011001000110110000001101100100000000,	/*11000    if_eq2  000011001 000 110110 00 0001 101 100100000 000 		MAR = SP =SP-1*/
	/*	23*/	39'b000011000000110110000001101100100000010,	/*10111    if_eq1  000011000 000 110110 00 0001 101 100100000 010	 	MAR = SP =SP-1; rd*/
	
	/*	22*/	39'b000000001000110101000001000001000000001,  	/*10110 	goto5  000000001 000 110101 00 0001 000 001000000 001       PC=OPC+H;fetch;GOTO(MBR1)*/
	/*	21*/	39'b000010110000011100001001000000000001000,	/*10101 	goto4  000010110 000 011100 00 1001 000 000000001 000		H=MBRU OR H;*/
	/*	20*/	39'b000010101000011000011000110000000001000,	/*10100 	goto3  000010101 000 011000 01 1000 110 000000001 000		H=MBR<<8;*/
	/*	19*/	39'b000010100000110101000001110001000000001,	/*10011 	goto2  000010100 000 110101 00 0001 110 001000000 001       PC=PC+1;FETCH*/
	/*	18*/	39'b000010011000110110000000110000000010000,	/*10010 	goto1  000010011 000 110110 00 0000 110 000000010 000       OPC=PC-1;*/
	
	/*	17*/	39'b000000010000111001000101100100100000100,	/*10001	    lnext6 	000000010 000 111001 00 0101 100 100100000 100      MAR = SP =SP+1; rw;goto(MBR2)*/
	/*	16*/	39'b000010001000011000001010100000000100000,	/*10000	    lnext5 	000010001 000 011000 00 1010 100 000000100 000      TOS = MDR*/
	/*	15*/	39'b000010000000110101000001110001000000001,	/*01111    	lnext4  000010000 000 110101 00 0001 110 001000000 001  	PC=PC+1;FETCH*/
	/*	14*/	39'b000001111000111100001000100100000000010,	/*01110	    lnext3 	000001111 000 111100 00 1000 100 100000000 010   	MAR = LV+MBRU RD*/
	/*	13*/	39'b000001110000000000000001111000000000000,	/*01101		lnext2  000001110 000 000000 00 0001 111 000000000 000   	NOP*/
	/*	12*/	39'b000001101000110101000001110001000000001,	/*01100		lnext1 	000001101 000 110101 00 0001 110 001000000 001    	PC= PC + 1; FETCH*/

    /*	11*/ 	39'b000000000000001100000000111010000100100,	/*01011		iand3 	000000000 000 001100 00 0000 111 010000100 100		MDR=TOS=MDR AND H;wr;goto(MAIN)*/
	/*	10*/	39'b000001011000011000000010000000000001000,	/*01010  	iand2 	000001011 000 011000 00 0010 000 000000001 000		H=TOS*/
	/*	 9*/	39'b000001010000110110000000101100100000010,	/*01001  	iand1 	000001010 000 110110 00 0000 101 100100000 010		MAR=SP=SP-1;rd*/
		
	
	/*	 8*/	39'b000000000000111111000000111010000100100,	/*01000   	isub3 	000000000 000 111111 00 0000 111 010000100 100      MDR=TOS=MDR-H;wr;goto(MAIN)*/
	/*	 7*/	39'b000001000000011000000010000000000001000,	/*00111   	isub2 	000001000 000 011000 00 0010 000 000000001 000      H=TOS*/
	/*	 6*/	39'b000000111000110110000000101100100000010,	/*00110   	isub1 	000000111 000 110110 00 0000 101 100100000 010      MAR=SP=SP-1;rd*/
		
	
	/*	 5*/	39'b000000000000111100001010000010000100100,	/*00101   	iadd3 	000000000 000 111100 00 1010 000 010000100 100		MDR=TOS=MDR+H;wr;goto(MAIN)*/
	/*	 4*/	39'b000000101000011000000010000000000001000,	/*00100   	iadd2 	000000101 000 011000 00 0010 000 000000001 000		H=TOS*/
	/*	 3*/	39'b000000100000110110000000101100100000010,	/*00011		iadd1 	000000100 000 110110 00 0000 101 100100000 010 		MAR=SP=SP-1;rd*/

	/*	 2*/	39'b000000000001000000000001001000000000000,	/*00010		MBR2  	000000000 001 000000 00 0001 001 000000000 000   	GOTO(MBR)*/
	/*	 1*/	39'b000000010000000000000001111000000000000,	/*00001		MBR1  	000000010 000 000000 00 0001 111 000000000 000   	NOP*/
	/*	 0*/	39'b000000001000110101000001110001000000001 	/*00000		MAIN  	000000001 000 110101 00 0001 110 001000000 001   	PC =PC+1;FETCH**/


		
		
		
		
	//	39'b000000010000111001000101100100100000100,/*10001	    lnext6 	000000010 000 111001 00 0101 100 100100000 100*/
	//	39'b000010001000011000001010100000000100000,/*10000	    lnext5 	000010001 000 011000 00 1010 100 000000100 000*/
	//	39'b 000010000000110101000001110001000000001,/*01111    lnext4  000010000 000 110101 00 0001 110 001000000 001 FETCH*/
	//	39'b000001111000111100001000100100000000010,/*01110	    lnext3 	000001111 000 111100 00 1000 100 100000000 010*/
	////	39'b000001110000000000000001111000000000000,/*01101		lnext2  000001110 000 000000 00 0001 111 000000000 000 NOP*/
	//	39'b000001101000110101000001110001000000001,/*01100		lnext1 	000001101 000 110101 00 0001 110 001000000 001*/

	//    39'b000000000000001100000000111010000100100,/*01011		iand3 	000000000 000 001100 00 0000 111 010000100 100*/
	//	39'b000001011000011000000010000000000001000,/*01010  	iand2 	000001011 000 011000 00 0010 000 000000001 000  */
	//	39'b000001010000110110000000101100100000010,/*01001  	iand1 	000001010 000 110110 00 0000 101 100100000 010   */
			
	//    39'b000000000000111111000000111010000100100,/*01000   isub3 	000000000 000 111111 00 0000 111 010000100 100   MDR=TOS=MDR-H;wr;goto(MAIN)*/
	//	39'b000001000000011000000010000000000001000,/*00111   	isub2 	000001000 000 011000 00 0010 000 000000001 000   H=TOS*/
	//	39'b000000111000110110000000101100100000010,/*00110   	isub1 	000000111 000 110110 00 0000 101 100100000 010   MAR=SP=SP-1;rd*/
		
	//	39'b000000000000111100001010000010000100100,/*00101   	iadd3 	000000000 000 111100 00 1010 000 010000100 100   MDR=TOS=MDR+H;wr;goto(MAIN)*/
	//	39'b000000101000011000000010000000000001000,/*00100   	iadd2 	000000101 000 011000 00 0010 000 000000001 000   H=TOS*/
	//	39'b000000100000110110000000101100100000010,/*00011		iadd1 	000000100 000 110110 00 0000 101 100100000 010   MAR=SP=SP-1;rd*/
		
	//	39'b000000000001000000000001001000000000000,/*00010		MBR2  	000000000 001 000000 00 0001 001 000000000 000   GOTO(MBR)*/
	//	39'b000000010000000000000001111000000000000,/*00001		MBR1  	000000010 000 000000 00 0001 111 000000000 000   NOP*/
	//    39'b000000001000110101000001110001000000001 /*00000	MAIN  	000000001 000 110101 00 0001 110 001000000 001   PC =PC+1;FETCH*/
	};

//essa parte sera apagada															
										
logic [38:0] NEXT_INSTRUCT =39'b0 ;// = 39'b000000000000000000000000000000000000000;


// This construct should be used to infer sequential logic such as
// registers and state machines.
	always_ff@(negedge clk)
	begin
		// Statements
		if(reset)begin //No reset devemos configurar para fazer nada mais ainda falta definir a instrucao
			NEXT_INSTRUCT <= 39'b000000000000000000000000000000000000000;//39'b000000001001000000000001001001000000000;
		end else begin
			if(READ) begin
			    //NEXT_INSTRUCT <= MICROPROGRAMA[MPC][38:0];			    
			    NEXT_INSTRUCT <= q[38:0];			    
			end
		end
	end
	
	// This construct should be used to infer purely combinational logic.
always_comb
begin

		
	// Statements
			    Next_ADDR 	= NEXT_INSTRUCT[38:30];
				JAM 	  	= NEXT_INSTRUCT[29:27];
				ALU 		= NEXT_INSTRUCT[26:21];
				DESL_R 		= NEXT_INSTRUCT[20:19];
				A 			= NEXT_INSTRUCT[18:15];
				B 			= NEXT_INSTRUCT[14:12];
				enaMAR      = NEXT_INSTRUCT[11];
				enaMDR      = NEXT_INSTRUCT[10];
				enaPC      	= NEXT_INSTRUCT[9];
				enaSP      	= NEXT_INSTRUCT[8];
				enaLV     	= NEXT_INSTRUCT[7];
				enaCPP     	= NEXT_INSTRUCT[6];
				enaTOS      = NEXT_INSTRUCT[5];
				enaOPC      = NEXT_INSTRUCT[4];
				enaH      	= NEXT_INSTRUCT[3];			
				MEM 		= NEXT_INSTRUCT[2:0];
				q1          = NEXT_INSTRUCT[38:0];  //so para testes
	
end

	
endmodule