//:	Last - Last
//:=========================

Pdef(\x, Ppar([
		
	Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], 1),
		\harm, Pseq([1], inf),
		\ampB, Pseq([1, 0, 0, 0, Pseq([0, 1, 0, 1, 0, 1], 1), 1]/4*0 , inf),
		\freq, Pseq([~fD2], inf),
		//Bota Envelope
		\at, Pseq([0.01], inf), 
		\rel, Pseq([0.2], inf),
		\shape, Pseq([4], inf)
		
	),

	Pbind(
		\instrument, \Drone_Glitch,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 3/2], 1), 
		\ampD, Pseq([5, 5, 5, 0.2], inf), 
		\harm, Pseq([80], inf), 
		\freq, Pseq([ [[~fD7, ~f_7], [~e_2, ~c_2]]*2 ], inf),
		//Drone Envelope
		//\at, Pseq([(1/3) + (1/2) + (1/3) + (1/3) + (1/6 * 6) + (1/6)]*2, inf), 
		//\rel, Pseq([(1/3) + (1/2) + (1/3) + (1/3) + (1/6 * 6) + (1/6)]/100, inf),
		\at, Pseq([0.04, 0.04, 0.04, 1.2], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.3], inf),
		\shape, Pseq([-4], inf)
		
	)

	
	], 1 )
);

//:

Pdef(\x).play;