//:SynthDefs_After_Eisagogi
//:===================================================================
//TODO Na kopso tags apo tin Bota	
//freq : 1
	
	SynthDef(\Bota1_Meros_1, {
	 	|
	 	//Bota
	 	harm = 1, freq = 90, ampB = 0.1,
	 	
	 	//Bota Envelope
	 	at = 0.01, rel = 0.2 , shape = -200 
	 	| 
	
		var bota, envB, out = 0;
	
		//Bota
		bota = 
		
		
		Mix.fill(2, {|i| i = i * harm; SinOsc.ar(freq) * LFPulse.ar(1, 0, 0.01).range(0, 1)!2}); 	
		
		
		//Envelopes
		envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
		
		Out.ar(out, bota * envB)
		
	}).add;
	
//freq:2
	
	SynthDef(\Bota2_Meros_1, {
	 	|
	 	//Bota
	 	harm = 1, freq = 90, ampB = 0.1,
	 	
	 	//Bota Envelope
	 	at = 0.01, rel = 0.2 , shape = -200 
	 	| 
	
		var bota, envB, out = 0;
	
		//Bota
		bota = 
		
		
		Mix.fill(2, {|i| i = i * harm; SinOsc.ar(freq) * LFPulse.ar(2, 0, 0.01).range(0, 1)!2}); 
		
		
		//Envelopes
		envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
		
		Out.ar(out, bota * envB)
		
	}).add;
	
//
	
	SynthDef(\Noise_Meros_1, {
	 	|
	 	
	 	//Noise
	 	freq = 5, ampN = 0.5, ttur = 1e40, nMul = 1e40, nAdd = 1e40,	
	 	 	
	 	//Noise Envelope
	 	at = 1, rel = 2 , shape = -4
	 	
	 	| 
	
		var sourceN, envN, out = 0;
	
		//Drone
		sourceN = 
	
		LinCongN.ar(
		LFNoise2.kr(0.5, nMul, nAdd), //(1e40, 1e40) - fisima . 1e4 - ligo pio skliro .  1 mono glitch
		Dust.kr(2, 0.5, 10.4), 
		SinOsc.kr(1, 0.1, 10.1),
		SinOsc.kr(2)
		);
		
		//Envelopes
		envN = EnvGen.ar(Env.perc(at, rel, 1, shape),/*, levelscale: 1, timescale: 1,*/ doneAction:2)!2;
		
		Out.ar(out, sourceN * envN * ampN)
		
	}).add;
	
//
	
	SynthDef(\Drone_Glitch_Meros_1, {
	 	|
	 	//Drone
	 	freq = 43, ampD = 0.5, fback = 0, ampsin = 0.4, 
	 	maxdel = 0.4, decTime = 0.2, delt = 0.2, num = 0.4, harm = 1,
	 	
	 	//Glitch
	 	pfreq = 0.2, range1 = 6, range2 = 0.2, ampG = 1
	 	
	 	//Drone Envelope
	 	at = 1, rel = 2, shape = -4
	 	|
	
		
		var sourceD, out = 0, envD;
	
		sourceD = 
		
		//Drone
		AllpassC.ar(								/*WARNING kr - ar*/			
		Mix.fill(2, { |i| i = i * harm; SinOscFB.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range			(1, 2.1)*/, fback, ampsin).tanh}),
						maxdel, delt, decTime, ampD)					
		+	
	
	
		//Glitch
		Pan2.ar(LFPulse.ar(LFPulse.kr(pfreq).range(range1, range2), 
					LFNoise0.kr(10).range(0, pi), 0.0001, 0.4), 
							PinkNoise.kr(10).range(-1, 1), ampG);
							
		
		envD = EnvGen.ar(Env.perc( at, rel, 1, shape), doneAction:2)!2; //rel 1 nice
		
		Out.ar(out, sourceD * envD)
		
	}).add;


//:	
//VARIATIONS_Meros_1o (Krataei ? Metra)
//===================================================================
//Notes: needs Meros_1 EQ
//========================================
//:	1 - Classic
//=========================	1-2_Meros_1
	
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
		
	)
	
	
	
	], inf)
);

//:
Pdef(\y).quant = 0;
Pdef(\y).play;


//:	2 - In-Fast-No-Bota
//=========================
//Notes : In Variations 2 - (aeroma) Sta grigora No-Bota
//=========================	1-2_Meros_1.2

Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([0], 6), 3]/2, inf), //Sta grigora ampB [3] 
		\freq, Pseq([~f_2, ~f_2, ~f_2, ~f_2, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 0.02, 0.02, Pseq([0.02], 6), 0.02], inf),
		\shape, Pseq([-4, -4, -4, -4, 20, 20, 20, 20, 20, 20, -4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0], 6), 0]*1.2, inf), //def xoris *1.4
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
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.3]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	

	
	], inf)
);	

//:	2.1 - Sta Grigora High-Freq ( Auto kai to apokato ) - 
//========================= 1-2_Meros_1.2.1
//
	
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([0, 3, 0, 3, 0, 3]*6, 1), 3]/2, inf), //Sta grigora ampB [3] 
		\freq, Pseq([~f_2, ~f_2, ~f_2, ~f_2, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 0.02, 0.02, Pseq([0.02], 6), 0.02], inf),
		\shape, Pseq([-4, -4, -4, -4, Pseq([20], 6), -4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0], 6), 0]*1.2, inf), //def xoris *1.4
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
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.3]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	

	
	], inf)
);	

//:	

//:	2.2 - Sta Grigora High-Freq
//:=========================
	
	
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3, 0, 0, 3, 3, 3]*6, 1), 3]/2, inf), //Sta grigora ampB [3] 
		\freq, Pseq([~f_2, ~f_2, ~f_2, ~f_2, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_8, ~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 0.02, 0.02, Pseq([0.02], 6), 0.02], inf),
		\shape, Pseq([-4, -4, -4, -4, 20, 20, 20, 20, 20, 20, -4], inf)
		
	),

	Pbind(
		\instrument, \Noise_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0], 6), 0]*1.2, inf), //def xoris *1.4
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
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0.3]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	

	
	], inf)
);	

//:	3 - Aeromata se Tags tou noise
//=========================
//Notes : Auto tha ginetai sinexeia
//=========================	

//:	3 - Sto 3
//=========================
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
		\ampN, Pseq([0.1, 0.1, 0.2, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e4, 1e40, Pseq([1e4], 6), 1e40], inf),
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
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	
	
	
	], inf)
);


//:	3.1 - Sto 2
//=========================
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
		\nAdd, Pseq([1e40, 1e4, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
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
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	
	
	
	], inf)
);

//:	3.3 - Sto 1
//=========================
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
		\ampN, Pseq([0.2, 0.1, 0.2, 0.1, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
		\nMul, Pseq([1e4, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e4, 1e4, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
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
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	
	
	
	], inf)
);


//:	3.4 - Sto 4
//=========================
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
		\ampN, Pseq([0.1, 0.1, 0.1, 0.2, Pseq([0.1], 6), 0.1]*1.2, inf), //def xoris *1.4
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
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]*1.3, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([  0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	
	
	
	], inf)
);


//:	4 - Aeromata se Noise kai Bota Freq: 2
//=========================
//Notes : 2 Fores
//=========================	
//	(pio ligo i Bota)
Pdef(\y, Ppar([
		
	Pbind(
		\instrument, \Bota1_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([0.1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3, 0, 3, 0, 3, 3], 1), 3]/2, inf), //def /4 
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.001, 0.001, 0.001, 0.001, Pseq([0.001], 6), 0.001], inf),
		\rel, Pseq([0.02, 0.02, 0.02, 0.02, Pseq([0.02], 6), 0.02], inf),
		\shape, Pseq([-4], inf)
		
	),

/*	Pbind(
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
*/
	
	Pbind(
		\instrument, \Drone_Glitch_Meros_1,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 0]/2, inf),  //def /2
		\ampG, Pseq([0], inf), 
		//\harm, Pseq([0.5], inf), 
		\harm, Pseq([0.5, 0.5, 0.5, 0.5, Pseq([0.5], 6), 20], inf), 
		\freq, Pseq([~fD2, ~fD2, ~fD2, ~fD2, Pseq([~fD2], 6), [~fD7, ~f_8]], inf),
		//Drone Envelope
		\at, Pseq([0.5, 0.08, 0.08, 0.08, Pseq([0.08], 6), 1/3], inf), 
		\rel, Pseq([1, 0.2, 0.2, 0.2, Pseq([0.2], 6), 1/12], inf),
		\shape, Pseq([4], inf)
		
	)
	
	
	
	], inf)
);

//:
Pdef(\y).quant = 0;
Pdef(\y).play;	
	

//:	6 - Piknoma me Megalitera Env se Noise
//=========================
//Notes : Sto Telos gia na odigisei se meros_2o
//=========================			
	

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
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1], inf), //def xoris *1.4
		\nMul, Pseq([1e40, 1e40, 0.001, 1e40, Pseq([0.001], 6), 1], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 0.3], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.8, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200, -200, -200, -200, Pseq([-200], 6), -200], inf)
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
		
	)
	
	
	
	], inf)
);	

//:	
	
Pdef(\y).quant = 0;
Pdef(\y).play;	
	

//:	5 - Piknoma me Maxi(SinOscFB_Sounds)
//=========================
//Notes : Prin apo Telos
//=========================		

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
//:
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
//:
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
		\ampM, Pseq([1, 0, 0, 1, Pseq([0, 1, 1, 1, 1, 0], 1), 1]/1.3, inf),
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
