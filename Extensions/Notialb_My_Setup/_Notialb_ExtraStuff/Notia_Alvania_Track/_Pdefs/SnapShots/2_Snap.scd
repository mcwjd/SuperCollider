//Auto tha kleinei me to Drone tou kai telos tha menei mono to glitch kai meta tha mpainei to meros_2 apo to simeio pou exei sketa glitch
//Dokimi Pio poli freq sto LFPUlse --- me freq:2 GAMATO!! kai 0 ---------> Auto na mpainei anamesa dio fores mexri na ginei o kiklos (Tha vgenei to noise kai freq:2)
//1e4 anti 1e40 sto 3o tag kai dokimi kai se alla tags episis gamata 
////////////////////////////////////////////////Drone
//:
SynthDef(\Drone_Glitch, {
 	|
 	//Drone
 	freq = 43, ampD = 0.5, fback = 0, ampsin = 0.4, maxdel = 0.4, decTime = 0.2, delt = 0.2, num = 0.4, harm = 1,
 	
 	//Glitch
 	pfreq = 0.2, range1 = 6, range2 = 0.2, ampG = 1
 	
 	//Drone Envelope
 	at = 1, rel = 2, shape = -4
 	|

	
	var sourceD, out = 0, envD;

	sourceD = 
	
	//Drone
	AllpassC.ar(								/*WARNING kr - ar*/				Mix.fill(2, { |i| i = i * harm; SinOscFB.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range(1, 2.1)*/, fback, ampsin).tanh}),
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
a = Synth(\Drone_Glitch);
a.free;
////////////////////////////////////////////////Bota
//:
SynthDef(\Bota, {
 	|
 	//Bota
 	harm = 1, freq = 90, ampB = 0.1,
 	
 	//Bota Envelope
 	at = 0.01, rel = 0.2 , shape = -200 
 	| 

	var bota, envB, out = 0;

	//Bota
	bota = 
	
	//SinOsc.ar(90)*LFPulse.ar(1, 0, 0.01).range(0, 1)!2
	//
	Mix.fill(2, {|i| i = i * harm; SinOsc.ar(freq) * LFPulse.ar(1, 0, 0.01).range(0, 1)!2}); //Dokimi Pio poli freq sto LFPUlse 2 GAMATO!! kai 0
	
	
	
	//Envelopes
	envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
	
	Out.ar(out, bota * envB)
	
}).add;
////////////////////////////////////////////////Bota_ME Freq:2 STO LFPulse
//:
SynthDef(\Bota, {
 	|
 	//Bota
 	harm = 1, freq = 90, ampB = 0.1,
 	
 	//Bota Envelope
 	at = 0.01, rel = 0.2 , shape = -200 
 	| 

	var bota, envB, out = 0;

	//Bota
	bota = 
	
	//SinOsc.ar(90)*LFPulse.ar(1, 0, 0.01).range(0, 1)!2
	//
	Mix.fill(2, {|i| i = i * harm; SinOsc.ar(freq) * LFPulse.ar(2, 0, 0.01).range(0, 1)!2}); //Dokimi Pio poli freq sto LFPUlse 2 GAMATO!! kai 0
	
	
	
	//Envelopes
	envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
	
	Out.ar(out, bota * envB)
	
}).add;
//:
//////////////////////////////////////////////Noise
//:
SynthDef(\Noise, {
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

//////////////////////////////////////////////Patterns	(auto thelei opos dipote pauseis) 
//:(Me EQ_Only_Noise_2)
//The first time
Pdef(\x, Ppar([
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/4, inf),
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
),

Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1], inf),
		\nMul, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([0.001], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200], inf)
),

	
Pbind(
		\instrument, \Drone_Glitch,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]/2, inf), 
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
//:Paralagi me freq:2 stop LFPulse kai XORIS Noise Pattern(Me EQ_Only_Noise_2)
//:===================================================================
Pdef(\x, Ppar([
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/4, inf),
		\freq, Pseq([~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
),

/*Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1], inf),
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
		\instrument, \Drone_Glitch,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([1.5, 0, 0, 0, Pseq([0], 6), 1]/2, inf), 
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
Pdef(\x).quant = 0;
Pdef(\x).play;
Pdef(\x).stop;
//:

//////////////////////////////////////////////Patterns -----> Variants
//:The second time (isos kapies akoma allages)
Pdef(\x1, Ppar([
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1/3, /*3/5*/1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([1], inf),
		\ampB, Pseq([3, 3, 0, 3, Pseq([3], 6), 3]/8, inf),
		\freq, Pseq([~fD2], inf),
		//Bota Envelope
		\at, Pseq([0.01], inf), //def 1 -->try 0.02
		\rel, Pseq([0.2], inf),//def 3 * 2 and the last 0.02 -->try 0.03
		\shape, Pseq([-4], inf)//def -4
		
),

Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1/3, /*3/5*/1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		//\harm, Pseq([1, 1, 1, 1], inf),
		\ampN, Pseq([0.1], inf),
		\freq, Pseq([5, 15, 5, 5, 5, 5, 0.1, 5, 5, 150], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.01, 0.08, 0.08, 0.08], inf), //def 0.8, 0.1, 0.8, 0.8, 0.8
		\rel, Pseq([Pseq([0.2], 10)], inf),//def 0.0002
		\shape, Pseq([-200], inf)//def -4
		);
	
	], inf)
);
//:
Pdef(\x1).play;

//:The third time
Pdef(\x, Ppar([
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\harm, Pseq([10], inf),
		\ampB, Pseq([3, 3, 3, 3, Pseq([3], 6), 3]/4, inf),
		\freq, Pseq([~f_2, ~f_2, ~f_2, ~f_2, Pseq([~f_1], 6), ~f_2], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01, Pseq([0.01], 6), 0.01], inf),
		\rel, Pseq([0.02, 0.02, 3, 3, Pseq([3], 6), 3], inf),
		\shape, Pseq([-4], inf)
		
),

Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1], inf),
		\nMul, Pseq([1e40, 1e40, 0.001, 1e40, Pseq([0.001], 6), 1], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 0.3], inf),
		
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.8, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		//\shape, Pseq([-200, -200, -200, -200, -200, -200], inf)
		\shape, Pseq([-200, -200, -200, -200, Pseq([-200], 6), -200], inf)
		),

Pbind(
		\instrument, \Drone,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), //?
		\ampD, Pseq([0.1, 0.1, 0.1, 0.1, Pseq([0.1], 6), 0.1], inf), 
		
		//Drone Envelope
		\at, Pseq([0.08, 0.01, 0.08, 0.08, 0.08, 0.08], inf), 
		\rel, Pseq([0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		\shape, Pseq([-200], inf)
);
	
	
	], inf)
);

//:
//////////////////////////////////////////////Patterns -----> Variants _ Steps
//Tha paizoun etsi --> alla prepei na exoun ta Pdef 1 anti inf
Pdef(\x, Pseq([Pdef(\x), Pdef(\x1)], inf));
Pdef(\x).quant = 0;
Pdef(\x).play;
Pdef(\x).stop;



