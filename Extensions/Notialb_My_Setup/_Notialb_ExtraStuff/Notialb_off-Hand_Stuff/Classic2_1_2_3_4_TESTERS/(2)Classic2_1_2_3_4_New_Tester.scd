//:TESTER_2

//:

Pdef(\classic2_5, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3, 3, 3, 3, 3, 3], 1), 3]/1.5, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.1, 0.1, 0.2, 0.1, Pseq([0.1, 0.1, 0.1, 0.1, 0.1, 0.1], 1), 0.1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200], inf)
	),

	
	Pbind(
		\instrument, \Drone_Glitch_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.25]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20 ], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
		Pbind(
		\instrument, \Noise3_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0, 0, 0, 0.7, Pseq([0], 6), 0]/3, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		\freq, 0.01,
		//Noise Envelope
		\at, Pseq([2.5], inf), 
		\rel, Pseq([1], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-1], inf)
	),
	
	
	], 1)
);

//- Sto 2

Pdef(\classic2_6, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3, 3, 0, 0, 0, 3], 1), 3]/1.5, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0, 0, 0.1, 0.1, 0.1, 0.1], 1), 0.1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200], inf)
	),

	
	Pbind(
		\instrument, \Drone_Glitch_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.25]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	
	Pbind(
		\instrument, \Noise3_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.7, 0, 0, 0, Pseq([0], 6), 0]/2, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		\freq, 0.1,
		//Noise Envelope
		\at, Pseq([2.5], inf), 
		\rel, Pseq([1], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-1], inf)
	),
	
	Pbind(
		\instrument, \maxi3_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampM, Pseq([0, 0, 0, 0, Pseq([0, 1, 0, 0, 1, 0], 1), 0.1]/5, inf), //def xoris *1.4
		\freq, 0.1,
		\fback, Pseq([2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2]),
		//Noise Envelope
		\att, Pseq([0.01], inf), 
		\relt, Pseq([0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-1], inf)
	)
	
	], 1)
);


//Pdef(\classic2_2).play;

// - Sto 1 ---Evala - 1

Pdef(\classic2_7, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3, 3, 3, 3, 3, 0], 1), 3]/1.4, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.2, 0.1, 0.2, 0.1, Pseq([0, 0, 0.1, 0.1, 0, 0.1], 1), 0.1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([0.001, 0.001, 0.001, 0.001, Pseq([1e40], 6), 1e40], inf),
		\nAdd, Pseq([1e4, 1e4, 1e4, 1e4, Pseq([1e40], 6), 1e40], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200], inf)
	),

	
	Pbind(
		\instrument, \Drone_Glitch_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.25]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \Noise3_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.7, 0, 0, 0, Pseq([0], 6), 0]/3, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		\freq, 200,
		//Noise Envelope
		\at, Pseq([2.5], inf), 
		\rel, Pseq([1], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-1], inf)
	),
	
		Pbind(
		\instrument, \maxi4_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampM, Pseq([1, 1, 1, 1, Pseq([0, 0, 0, 0, 0, 0], 1), 0.1]/3, inf), //def xoris *1.4
		\freq, 0.1,
		\fback, Pseq([2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2]),
		//Noise Envelope
		\att, Pseq([0.001], inf), 
		\relt, Pseq([0.02], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([10], inf)
	)
	
	], 1)
);



// - Sto 4

Pdef(\classic2_8, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 0, 3, Pseq([3, 0, 3, 3, 3, 0], 1), 3]/1.2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.2, Pseq([0.1, 0, 0.1, 0, 0.1, 0], 1), 1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e4, 1e40, 1e4, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e4, 1e40, 1e40, 1e4, Pseq([1e4], 6), 1e40], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200], inf)
	),

	
	Pbind(
		\instrument, \Drone_Glitch_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.25]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]*2], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \Noise3_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\ampN, Pseq([0.7, 0, 0, 0, Pseq([0], 6), 0]/3, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		\freq, 5,
		//Noise Envelope
		\at, Pseq([2.5], inf), 
		\rel, Pseq([1], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-1], inf)
	),

	
	], 1)
);

//:

//:Centrel_Sequencer - classic2_1_2_3_4	
//=============================	

Pdef(\classic2_1_2_3_4, 
	Pseq([
		
		Pdef(\classic2_1), Pdef(\classic2_2), Pdef(\classic2_3), Pdef(\classic2_4),
		Pdef(\classic2_5), Pdef(\classic2_6), Pdef(\classic2_7), Pdef(\classic2_8)

	], 1)
);

//:

Pdef(\classic2_1_2_3_4).quant = 0;
Pdef(\classic2_1).quant = 0;
Pdef(\classic2_2).quant = 0;
Pdef(\classic2_3).quant = 0;
Pdef(\classic2_4).quant = 0;
Pdef(\classic2_5).quant = 0;
Pdef(\classic2_6).quant = 0;
Pdef(\classic2_7).quant = 0;
Pdef(\classic2_8).quant = 0;

//:

Pdef(\classic2_1_2_3_4).play;
Pdef(\classic2_1_2_3_4).stop;



