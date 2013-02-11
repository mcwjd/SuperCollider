	
	Central_Sequencer{
	
		*load{
	
	
	
	
	//:After_Eisagogi_CENTRAL_SEQUENCER
	//:===================================================================
	
	//Note: All the durations of the Pbinds schould be 1 and then the Ppar can control the duration 		of the all pattern
	
	
	Pdef(\afterEisagogi, 
		Pseq([
			
			Pdef(\x), Pdef(\x1), (1/3) + (1/2) + (1/3) + (1/3) + (1/6 * 6) + (1/6), 
			//Meros_1o
			Pdef(\meros_1)
		
	
	], 1));
	
	//Pdef(\afterEisagogi).quant = 0;
	//Pdef(\afterEisagogi).play;
	
	
	//:Meros_1o_CENTRAL_SEQUENCER  (6:23)
	//:===================================================================
	
	//Sum (148 Metra)
	
	Pdef(\meros_1o, 
		Pseq([
			
		Pseq( [ Pdef(\classic_1_2) ], 25),			//(1) // (50_Metra)
	
		Pseq( [ Pdef(\no_InFast_1_2) ], 4),			//(2) // (8_Metra)
		
		Pseq( [ Pdef(\high_Freq_InFast_1_2) ], 3),	//(3) // (6_Metra)
	
		//(Pappous - Entona)!!!
		Pseq( [ Pdef(\classic2_1_2_3_4) ], 5),		//(4) // (20_Metra)
	
		Pseq( [ Pdef(\no_Noise) ], 4),				//(5) // (8_Metra)
	
			Pseq( [ Pdef(\no_Noise_3) ], 2),			//(5.1) // (2_Metra)
		
		Pseq( [ Pdef(\high_Env) ], 10),				//(6) // (10_Metra)
	
		//Pseq( [ Pdef(\sinFB) ], 1)					
				
			Pseq( [ Pdef(\sinFB_1) ], 3),			//(7.1) // (3_Metra)
		
			Pseq( [ Pdef(\sinFB_2) ], 2),			//(7.2) // (2_Metra)
		
			Pseq( [ Pdef(\sinFB_3) ], 2),			//(7.3) // (2_Metra)
		
			Pseq( [ Pdef(\sinFB_2) ], 2),			//(7.2) // (2_Metra)
			
			Pseq( [ Pdef(\sinFB_4) ], 2),			//(7.4) // (2_Metra)
	
			Pseq( [ Pdef(\sinFB_3) ], 2),			//(7.3) // (2_Metra)
	
			Pseq( [ Pdef(\sinFB_2) ], 3),			//(7.2) // (3_Metra)
			
			Pseq( [ Pdef(\sinFB_4) ], 5),			//(7.4) // (5_Metra)
	
			Pseq( [ Pdef(\sinFB_2) ], 3),			//(7.2) // (3_Metra)
	
			Pseq( [ Pdef(\sinFB_4) ], 15)			//(7.4) // (15_Metra)
	
			Pseq( [ Pdef(\sinFB_5) ], 5)			//(7.5) // (5_Metra)
	
	], 1));
		
	//:
	
	Pdef(\meros_1o).quant = 0;
	//Pdef(\meros_1o).play;
	//Pdef(\meros_1o).stop;
	
		}
	
	}