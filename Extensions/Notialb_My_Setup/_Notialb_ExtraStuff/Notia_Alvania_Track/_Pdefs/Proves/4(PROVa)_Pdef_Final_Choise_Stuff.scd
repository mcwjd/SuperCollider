
/////////////////////////:Drone

SynthDef(\Drone, {
 	|
 	
 	//Drone
 	freq = 43, fback = 0, ampsin = 0.4, maxdel = 0.4, decTime = 0.2, delt = 0.2, ampD = 0.5,	
 	 	
 	//All
 	harm = 1,
 	
 	//Drone Envelope
 	at = 1, rel = 2 , shape = -4
 	| 

	var sourceD, envD, out = 0;

	//Drone
	sourceD = 
	
	AllpassC.ar(												Mix.fill(2, { |i| i = i * harm; SinOscFB.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range(1, 2.1)*/, fback, ampsin).tanh}),
					maxdel, delt, decTime, ampD)		
	+		
		

	Mix.fill(2, { |i| i = i * harm; SinOsc.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range(1, 2.1)*/, fback, ampD/2).tanh});
			
	
	//Envelopes
	envD = EnvGen.ar(Env.perc(at, rel, 1, shape), doneAction:2)!2;
	
	Out.ar(out, sourceD * envD)
	
}).add;

/////////////////////////:Glitch

SynthDef(\Glitch, {
 	|
 	//Glitch 
 	pfreq = 0.2, freq2 = 0.0002, range1 = 6, range2 = 0.2, num = 0.4, ampG = 1, 
 
 	//Glitch Envelope
 	at = 1, rel = 2 , shape = -4
 	| 

	var sourceG, envG, out = 0;

	//Glitch
	sourceG =
	
	Pan2.ar(LFPulse.ar(LFPulse.kr(pfreq).range(range1, range2), 
				LFNoise0.kr(10).range(0, pi), /*LFNoise1.kr(10).range(0.0001, 0.001)*/0.0001, 0.4), 
						PinkNoise.kr(10).range(-1, 1), ampG);
						
	
	//Envelopes
	envG = EnvGen.ar(Env.perc(at, rel, 1, shape), doneAction:2);
	
	Out.ar(out, sourceG * envG)
	
}).add;

/////////////////////////:Bota

SynthDef(\Bota, {
 	|
 	//All
 	harm = 1,
 	
 	//Bota Envelope
 	at = 0.01, rel = 0.2 , shape = -200, ampB = 0.1 
 	| 

	var bota, envB, out = 0;

	//Bota
	bota = 
	
	Mix.fill(20, {|i| i = i * harm/1; SinOscFB.ar(86 + i, 0.8, 1)}) + Mix.fill(10, {|i| i = i * harm/1; SinOscFB.ar(43 + i, 0, 1)});
	
	
	//Envelopes
	envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
	
	Out.ar(out, bota * envB)
	
}).add;


//:
Synth(\test_2);
//:
Pdef(\x, Ppar([

Pbind(
		\instrument, \Drone,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\harm, Pseq([1, 1, 1, 1], inf),
		//Drone
		\fback, Pseq([0, 0.5, 0, 5000], inf), 
		\freq, Pseq([43, 43, 43, ~f_1/1.5]*1.5, inf),
		\ampD, Pseq([0.5, 0.5, 0.5, 1.8], inf),
		//Drone Envelope
		\at, Pseq([1, 1, 1, 1], inf), //def 1
		\rel, Pseq([2, 2, 2, 0.02], inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([-4, -4, -4, -4], inf),//def -4
		),
		
		

Pbind(
		\instrument, \Glitch,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\harm, Pseq([1, 1, 1, 1], inf),
		//Glitch
		\pfreq, Pseq([[10, 100], 10, 10, 10], inf),
		\range1, Pseq([[200, 1000], 10, 10, 2000], inf),
		\range2, Pseq([[200, 2222], 20, 20, 2000], inf),
		\ampG, Pseq([1.7, 1, 1, 2.7], inf),
		//Glitch Envelope
		\at, Pseq([1.1, 1, 1, 1], inf), //def 1
		\rel, Pseq([0.02, 2, 2, 0.02], inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([6, -4, -4, 4], inf),//def -4
		),		
		
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\harm, Pseq([0.1, 0.1, 1, 0.1], inf),
		\ampB, Pseq([0.1, 0.1, 0.1, 0.1], inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01], inf), //def 1
		\rel, Pseq([0.2, 0.2, 0.2, 0.2], inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([-200, -200, -200, -200], inf),//def -4
		),		

		
		
		], inf)
);
//:

Pdef(\x).play;
Pdef(\x).stop;



//:Example 2

Pdef(\x, Ppar([

Pbind(
		\instrument, \Drone,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1]*2, inf),//12 full wait, kai stin bota kai sto shape at
		\harm, Pseq([1, 1, 1, 1], inf),
		//Drone
		\fback, Pseq([0, 0.5, 0, [5000, 500]], inf), 
		\freq, Pseq([43, 43, ~f_2, [~f_2/1.5, ~f_2]]*1.5, inf),
		\ampD, Pseq([1, 0.5, 0.08, 0.7], inf),
		//Drone Envelope
		\at, Pseq([1, 1, 1, 1]*2, inf), //def 1
		\rel, Pseq([2, 2, 2, 0.002]*2, inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([-4, -4, -4, 4], inf),//def -4
		),
		
		

Pbind(
		\instrument, \Glitch,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1]*2, inf),
		\harm, Pseq([1, 1, 1, 1], inf),
		//Glitch
		\pfreq, Pseq([10, 10, 10, 10], inf),
		\range1, Pseq([200, 10, 10, 2000], inf),
		\range2, Pseq([200, 20, 20, 2000], inf),
		\ampG, Pseq([0, 1.7, 1, 0], inf),
		//Glitch Envelope
		\at, Pseq([1, 1, 1, 1], inf), //def 1
		\rel, Pseq([2, 2, 2, 0.02], inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([-4, -4, -4, -4], inf),//def -4
		),		
		
		
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1, 1/2, 3/2, 1]*2, inf),
		\harm, Pseq([1, 1, 1, 1], inf),
		\ampB, Pseq([0.1, 0.1, 0.1, 0.1]/2, inf),
		//Bota Envelope
		\at, Pseq([0.01, 0.01, 0.01, 0.01]*2, inf), //def 1
		\rel, Pseq([0.2, 0.2, 0.2, 0.2], inf),//def 3 * 2 and the last 0.02
		\shape, Pseq([-200, -200, -200, -200]*2, inf),//def -4
		),		

		
		
		], inf)
);


//:More Heavy Example
Pdef(\x, Ppar([

		Pbind(
		\instrument, \test_2,
		\dur, Pseq([1, 1/2, 3/2, 1, 1, 1/2, 3/2, 1], inf),
		\harm, Pseq([1, 1, 1, 1], inf),
		//Drone
		\fback, Pseq([0, 0.5, 0, 5000], inf), 
		\freq, Pseq([43, 43, 43, ~f_1/1.5]*1.5, inf),
		\rel, Pseq([2, 2, 2, 0.02], inf),
		\ampD, Pseq([0.5, 0.5, 0.5, 1.8], inf),
		//Glitch
		\pfreq, Pseq([10, 10, 10, 10], inf),
		\range1, Pseq([200, 10, 10, 200], inf),
		\range2, Pseq([200, 20, 20, 2000], inf),
		\ampG, Pseq([0.7, 0.7, 0.7, 0.7], inf),
		),
		
/*		Pbind(
		\instrument, \test_2,
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\fback, Pseq([0, 0.5, 10, 10], inf), 
		\ampD, Pseq([0.5, 0.5, 0.1, 0.1], inf),
		\freq, Pseq([43, 43, 43, ~f_1], inf),
		\rel, Pseq([2, 2, 0.02, 0.02], inf)
		)
*/

		], inf)
);


