

	
//:SendTags (Den Xreiazetai dio SendTags)
//:===================================================================
~ena = SendTags.new;
~ena.dests = [Dests.mineAddr, ~aris = NetAddr("192.168.1.67", 57120), ~alex = NetAddr("169.254.145.99", 57120)];
~ena.title = '/tags';
~ena.tags = [1,2,3,4,5,6,7,8,9,10,11];
~ena.step = [1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6];
~ena.times = inf;
//:
~dio = SendTags.new;
~dio.dests = [Dests.mineAddr];
~dio.title = '/tags2';
~dio.tags = [1, 2, 3, 4, 5];
~dio.step = [1];
~dio.times = inf;


//:Responders
//:===================================================================

~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);
~a5 = RespTags.do('/tags', 5, nil);
~a6 = RespTags.do('/tags', 6, nil);
~a7 = RespTags.do('/tags', 7, nil);
~a8 = RespTags.do('/tags', 8, nil);
~a9 = RespTags.do('/tags', 9, nil);
~a10 = RespTags.do('/tags', 10, nil);
~a11 = RespTags.do('/tags', 11, nil);


~counter1 = 0;
~counter2 = 0;
~counter3 = 0;
~counter4 = 0;
~counter5 = 0;

/*
~b1 = RespTags.do('/tags2', 1, nil);
~b2 = RespTags.do('/tags2', 2, nil);
~b3 = RespTags.do('/tags2', 3, nil);
~b4 = RespTags.do('/tags2', 4, nil);
~b5 = RespTags.do('/tags2', 5, nil);

*///:Actions of Responders
//:===================================================================

////////////a
//~aris.sendMsg("eisagogi"); ~alex.sendMsg("eisagogi"); Pdef(\import).play;
//:
~a1.action = {'1'.postln; Pdef(\x).play; ~counter1 = ~counter1 + 1; 
	
		("Metro: ").post; ~counter1.postln;
	
		if (~counter1 == 1) { Pdef(\x).play; ~aris.sendMsg("afterEisagogi"); }
		
	
	
				};

~a2.action = {'2'.postln; ~counter2 = ~counter2 + 1; };

~a3.action = {'3'.postln;};

~a4.action = {'4'.postln;};
~a5.action = {'5'.postln;};
~a6.action = {'6'.postln;};
~a7.action = {'7'.postln;};
~a8.action = {'8'.postln;};
~a9.action = {'9'.postln;};
~a10.action = {'10'.postln;};
~a11.action = {'11'.postln;};


//:The SYNTHS
//:===================================================================


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
	) * LFPulse.kr(1000).range(0, 1);
	
	//Envelopes
	envN = EnvGen.ar(Env.perc(at, rel, 1, shape),/*, levelscale: 1, timescale: 1,*/ doneAction:2)!2;
	
	Out.ar(out, sourceN * envN * ampN )
	
}).add;

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

///////////////////////
//:
Pdef(\x, Ppar([
		

Pbind(
		\instrument, \Noise,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf),
		\ampN, Pseq([0.5, 0.1, 0.2, 0.2, Pseq([0], 6), 0]*40, inf),
		\nMul, Pseq([1e40, 1e40, 1e40, Prand([1e4, 1e40], 1), Pseq([0.001], 6), 1e40], inf),
		//\nAdd, Pseq([1e40, 1e40, 1e40, 1e40, Pseq([1e4], 6), 1e40], inf),
		\nAdd, Pseq([1e40, 1e40, 1e40, Prand([1e4, 1e40], 1), Pseq([1e4], 6), 1e40], inf),
		//Noise Envelope
		\at, Pseq([0.08, 0.08, 0.08, 0.08, Pseq([0.08], 6), 0.08], inf), 
		\rel, Pseq([0.02, 0.02, 0.02, 0.02, Pseq([0.02], 6), 0.02], inf),
		\shape, Pseq([-8, -8, -8, -18, Pseq([8], 6), 8], inf)
),
	
	
Pbind(
		\instrument, \Drone_Glitch,
		//All
		\dur, Pseq([1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6], inf), 
		\ampD, Pseq([0, 0, 0, 0, Pseq([0, 0, 0.6 ,0, 0, 0], 1), 0.6], inf), 
		\ampG, Pseq([0, 0, 0, 0, Pseq([4], 6), 0]*0, inf), 
		\harm, Pseq([5, 0.5, 0.5, 0.5, Pseq([0.5, 0.5, 20, 0.5, 0.5, 0.5], 1), 0.5], inf), 
		\freq, Pseq([~fD2, 0, 0, 0, Pseq([4, 4, [~fD7, ~f_7], 4, 4, 4], 1), ~fD2], inf),
		//Drone Envelope
		\at, Pseq([0.008, 0.08, 0.08, 0.08, Pseq([0.8, 0.8, 1/3, 0.8, 0.8, 0.8], 1), 0.05], inf), 
		\rel, Pseq([1.5, 0.2, 0.2, 0.2, Pseq([0.2, 0.2, 1/6, 0.2, 0.2, 0.2], 1), 1.5], inf),
		\shape, Pseq([8, 8, 8, 8, Pseq([8, 8, 8, 8, 8, 8], 1), 8], inf)
		
);
	
	], inf)
);

Pdef(\x).quant = 0;

//:START !!!
//:===================================================================

~ena.loop;

/*
Pdef(\a).play;
Pdef(\b).play;
//
Notialb.start;
Notialb.play;


MasterEQ(2);
*/




