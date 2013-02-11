
//:
SynthDef(\maxi_Meros_1, {
 	|
 	//Maxi

 	//Drone Envelope
 	at = 1, dec = 2, ss = 1, rel = 0.1,
 	att = 1, dect = 1, relt = 1,
 	fback = 0,
 	ampM = 1
 	|
	
	var sourceM, out = 0, envM;

	sourceM = SinOscFB.ar([
			
			~f_4 * EnvGen.kr(Env([at, dec, ss, rel] * ~f_4, [att, dect, relt], 1, 3, 0), 				doneAction:2), 
			
			~f_5 * EnvGen.kr(Env([at, dec, ss, rel] * ~f_5, [att/1, dect, relt/1], 1, 3, 0), 				doneAction:2)
			
			], fback, 0.1);
	
		
	//envM = EnvGen.ar(Env.perc( at, rel, 1, shape), doneAction:2)!2; //rel 1 nice
	
	Out.ar(out/*Pan*/, sourceM * ampM)
	
}).add;
//:
Synth(\maxi_Meros_1);

//:
Pdef(\x, Ppar([
		
Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 1, 1, 1, Pseq([1, 1, 1, 1, 1, 1], 1), 1], inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 1, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dect, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),
		\rel, Pseq([0.1], inf)
)

	], inf)
);
//:
Pdef(\y).play;
Pdef(\x).stop;

//:
Pdef(\x, Ppar([
		
Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 0, 1, 0, 0], 1), 1], inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 1, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([1, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/10, inf),
		\dect, Pseq([2, 0.02, 0.01, 0.01, Pseq([0.01], 6), 0.01]/10, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),
		\rel, Pseq([0.1], inf)
)

	], inf)
);
//:
Pdef(\y).play;
Pdef(\x).stop;
//: /1
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
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
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 1, 1, 1, 0], 1), 1], inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 1.5, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01, 0.01, 0.01, 0.01, 1.6, 0.01], 1), 0.01]/10, inf),
		\dect, Pseq([0.02, 0.02, 0.01, 0.02, Pseq([0.02, 0.01, 0.02, 0.01, 5, 0.01], 1), 0.01]/10, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.02], 6), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),

	);
	
	
	], inf)
);
//: --- /1
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
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
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 1, 1, 1, 0], 1), 1]*1.6, inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 1.5, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01, 0.01, 0.01, 0.01, 1.6, 0.01], 1), 0.01]/1, inf),
		\dect, Pseq([0.02, 0.02, 0.01, 0.02, Pseq([0.02, 0.01, 0.02, 0.01, 5, 0.01], 1), 0.01]/10, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.02], 6), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),

	);
	
	
	], inf)
);
//:-----------/2

Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
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
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 1, 1, 1, 0], 1), 1], inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 1.5, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([0.01, 0.01, 0.01, 8.6, Pseq([0.01, 0.01, 0.01, 0.01, 1.6, 0.01], 1), 0.01]/1, inf),
		\dect, Pseq([0.02, 0.02, 0.01, 2, Pseq([0.02, 0.01, 0.02, 0.01, 5, 0.01], 1), 0.01]/10, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01, 0.01, 0.01, 0.01, 0.01, 0.01], 1), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.02, 0.02, 0.02, 0.02, 0.02, 0.02], 1), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),

	);
	
	
	], inf)
);

//:/1
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
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
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	),
	
	Pbind(
		\instrument, \maxi_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 1, 1, 1, 0], 1), 1], inf),
		\fback, Pseq([1.3, 0, 2, 0, Pseq([1, 1, 1, 1, 2, 1], 1), 0], inf),
		
		//Maxi Envelope Times
		\att, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01, 0.01, 0.01, 0.01, 1.6, 0.01], 1), 0.01]/10, inf),
		\dect, Pseq([0.02, 0.02, 0.01, 0.02, Pseq([0.02, 0.01, 0.02, 0.01, 5, 0.01], 1), 0.01]/1, inf),
		\relt, Pseq([0.1], inf),
		
		//Maxi Envelope Shape
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01]/100, inf),
		\dec, Pseq([0.02, 0.02, 0.01, 0.01, Pseq([0.02], 6), 0.01]/100, inf),
		\ss, Pseq([0.1], inf),

	);
	
	
	], inf)
);

//:
