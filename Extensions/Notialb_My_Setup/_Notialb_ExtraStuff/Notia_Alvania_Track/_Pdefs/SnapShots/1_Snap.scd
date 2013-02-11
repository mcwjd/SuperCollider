// 1_Kathos exelisete na mpainoun pio noise ixoi
// 2_Na mpainei kai na vgenei h bota

//:
SynthDef(\Bota, {
 	|
 	//All
 	harm = 1,
 	
 	//Bota Envelope
 	at = 0.01, rel = 0.2 , shape = -200, ampB = 0.1, freq = 90 
 	| 

	var bota, envB, out = 0;

	//Bota
	bota = 
	
	//SinOsc.ar(90)*LFPulse.ar(1, 0, 0.01).range(0, 1)!2
	//
	Mix.fill(2, {|i| i = i * harm; SinOsc.ar(freq) * LFPulse.ar(1, 0, 0.01).range(0, 1)!2});
	
	
	
	//Envelopes
	envB = EnvGen.ar(Env.perc( at, rel, ampB, shape), doneAction:2)!2; //rel 1 nice
	
	Out.ar(out, bota * envB)
	
}).add;

/////////////////////////:Noise

SynthDef(\Noise, {
 	|
 	
 	//Drone
 	freq = 5, ampN = 0.5,	
 	 	
 	//All
 	harm = 1,
 	
 	//Noise Envelope
 	at = 1, rel = 2 , shape = -4
 	
 	| 

	var sourceN, envN, out = 0;

	//Drone
	sourceN = 
	
	//WhiteNoise.ar(1);
	
	HenonN.ar(
	SampleRate.ir/freq, 
	PinkNoise.kr(10, 1, 1.2), 
	ClipNoise.kr(100, 1, 0.15),
	SinOsc.kr(0.01, 0.1, 0.1)
	);
	
	//Envelopes
	envN = EnvGen.ar(Env.perc(at, rel, 1, shape), levelscale: 1, timescale: 1, doneAction:2)!2;
	
	Out.ar(out, sourceN * envN * ampN)
	
}).add;
//:



Pdef(\x, Ppar([
/*	
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1, 1/2, 1/2, 1/2, 1.6]/2, inf), 
		\harm, Pseq([1, 1, 1, 1], inf),
		\ampB, Pseq([2], inf),
		\freq, Pseq([90, 90, 90, 90], inf),
		//Bota Envelope
		\at, Pseq([0.1], inf), //def 1 -->try 0.02
		\rel, Pseq([0.2], inf),//def 3 * 2 and the last 0.02 -->try 0.03
		\shape, Pseq([-4], inf)//def -4
		
		),

*/
Pbind(
		\instrument, \Bota,
		//All
		\dur, Pseq([1, 1/2, 1/4, 1, 1.5, 1, 1/2, 1/4, 1, 1.5]/2, inf), //1 + (1/2) + (1/4) + 1+ 1.5
		//\dur, ~tagSync,
		\harm, Pseq([1, 1, 1, 1], inf),
		\ampB, Pseq([3, 3, 1, 1, 0, 1, 3, 1, 1, 0]/2, inf), //Pseq([3, 3, 1, 1, 0, 1, 3, 1, 0, 1]/2, inf),
		\freq, Pseq([~fD1, ~fD1, ~fD2, ~fD2, ~fD2, ~fD2, ~fD1, ~fD2, ~fD2, ~fD2], inf), //def all ~fD2
		//Bota Envelope
		\at, Pseq([0.01], inf), //def 0.1
		\rel, Pseq([0.2], inf),//def 0.2
		\shape, Pseq([-4], inf)//def -4
		
		),


Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1, 1/2, 1/4, 1, 1.5, 1/2, 1, 1, 1/4, 1.5]/2, inf), 
		//\harm, Pseq([1, 1, 1, 1], inf),
		\ampN, Pseq([0, 2.5, 0, 0, 0.5, 0, 10, 0, 0, 1], inf),
		\freq, Pseq([5, 15, 5, 5, 5, 5, 0.1, 5, 5, 150], inf),
		//Noise Envelope
		\at, Pseq([0.8, 0.1, 0.8, 0.8, 0.8], inf), //def 0.8, 0.1, 0.8, 0.8, 0.8
		\rel, Pseq([Pseq([0.0002], 10)], inf),//def 0.0002
		\shape, Pseq([-4, -4, -4, -4, -4, -4, -4, -4, -4, 3], inf)//def -4
		
		);


	
	], inf)
);		
//:

Pdef(\x).play;
Pdef(\x).stop;

//:Meta apo auto paei to parakato pou telika to freq tou LFPulse apo 10 ginetai 10000 kai meta to bit ginetai poli pio dinato

p = ProxySpace.push;

~input = {SinOsc.ar(1000).dup(2)};
~input.play;

~ringz = {Ringz.ar(~input.ar, LFPulse.kr(10, 0, 0.05, 20400), 0.05, 0.1)};
~ringz2 = {Ringz.ar(~input.ar, LFPulse.kr(10, 0, 0.5, 700), 0.05, 0.01)};

~ringz.play;
~ringz2.play;Pdef(\x).stop;

~ringz.stop;
~ringz2.stop;


