//:
////////////////////////////////////////////////////////////////////////////////To do: Better Drone, Modulations gia kontrol

SynthDef(\test_2, {
 	|freq = 40, amp = 0.5, freq2 = 0.0002, fback = 0, pfreq = 10, ampsin = 0.4, maxdel = 0.4, decTime = 2, num = 1|
	var source, out = 0;
	source = AllpassC.ar(							//~e_2, ~a_2
				SinOscFB.kr([freq,freq+num], fback, ampsin).tanh, //tanh, squared, cubed 
					maxdel,		//max del time
						//SinOsc.ar(freq2, 0, LFPulse.ar(pfreq, 0, 0.5)).range([2e-3,4e-3], [0.1, 0.2]), //More Complex Glitch
							//SinOsc.ar(freq2, 0, LFPulse.ar(pfreq, 0, 0.5).range([2e-3,4e-3], [0.1, 0.2])), //More Complex Glitch_2(.range: Inside)
			/*Pan2 ---->*/			LFPulse.ar(LFPulse.kr(pfreq).range(6, freq2), LFNoise0.kr(10).range(0, pi), LFNoise1.kr(10).range(0.0001, 0.001), 1), PinkNoise.kr(100).range(-1, 1), //Check SinOsc freq	
							decTime, amp);
	
	/*+
	
	Pan2.ar(LFPulse.ar(LFPulse.kr(10).range(6, 15), LFNoise0.kr(10).range(0, pi), LFNoise1.kr(10).range(0.0001, 0.001), 1), PinkNoise.kr(100).range(-1, 1));
*/	
	Out.ar(out, source)
	
}).send(s);


//:

a = Synth(\test_2);
a.free;

a.set(\pfreq, 0.2);//GAMATO!!! Stadiaka Glitch
a.set(\ampsin, 0.8);
a.set(\maxdel, 0.4);

//Diakrotima Change
a.set(\num, 1.5);

//Otan trexei apo megalo se mikro KALOO
a.set(\decTime, 1000);
a.set(\decTime, 0.0001);

//Episis Gamato Apo kanoniko freq se poli mikro
a.set(\freq, 100);
a.set(\freq, 0.1); 

//Episis Gamato KAI TA DIO MAZI
a.set(\freq, 1000); a.set(\decTime, 1000); 
a.set(\freq, 0.1);  a.set(\decTime, 0.0005); 

//Episis Gamato KAI TA TRIA MAZI
a.set(\freq, 1000); a.set(\decTime, 200); a.set(\pfreq, 0.2); //change the decTime
a.set(\freq, 0.1);  a.set(\decTime, 0.0005); a.set(\pfreq, 2);
//:

(
~ena = SendTags.new;
~ena.tags = [2,4,3,1];//[1, 2, 3, 4, 5, 6, 7, 8]; //Me 	\pfreq, 0.2
~ena.dests = [Dests.mineAddr];
~ena.step = [0.6, 0.6, 0.5, 0.6];//4 normal
~ena.title = '/tags';
~ena.loop;
)

~ena.stop;
~ena.resume;

//:	freqs = ~e_2, ~a_2
~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);

//:
~a1.action = {'ena'.postln; 
	
			//a.set(\pfreq, 2);	
			a.set(\freq, 40);
			a.set(\num, 10.5);
			a.set(\amp, 0.3);
			a.set(\fback, 0);	
				
		
		~ne = {
			
			SinOsc.ar(
			
			[EnvGen.kr(Env.new([1, 2, 1, 0.1]*40, [1, 1, 1], 1, 2, 0), 				doneAction:2), 
			EnvGen.kr(Env.new([1, 2, 1, 0.1]*41, [0.5, 1, 0.5], 1, 2,0), 				doneAction:2)], 

			0, 0.2)}.play;


		
		
		};

~a2.action = {'dio'.postln;    
	
			
			//a.set(\pfreq, 3.5);
		
			//a.set(\fback, 1);		
			a.set(\freq, 10);			
			//a.set(\fback, 0);			
					

			fork{
				1.do{ 
					a.set(\amp, 0.2);
					a.set(\freq2, 20);
					0.05.wait;				
					a.set(\freq2, 2);
					0.05.wait;
					a.set(\freq2, 200);
					0.1.wait;
					a.set(\freq2, 0.1);
					0.5.wait;
					a.set(\freq2, 1000);
					0.1.wait;
					a.set(\freq2, 16);
				
				
				
				}
			};

		};

~a3.action = {'tria'.postln; 
	
			//a.set(\pfreq, 1);
			a.set(\freq, 800);
			a.set(\fback, 1.5);				
			a.set(\amp, 0.1);				
		};

~a4.action = {'tessera'.postln;    
			a.set(\fback, 0);				
			//a.set(\pfreq, 0.9);		
			a.set(\freq, 1);			
			//a.set(\freq2, 16);			
				/*fork{
					1.do{ 
						a.set(\amp, 0.15);
						a.set(\freq2, 10000);
						1.wait;				
						a.set(\freq2, 20000);
						0.4.wait;			
						a.set(\freq2, 2);
					}
				};*/
				
				fork{
					1.do{ 
						a.set(\amp, 0.2);
						a.set(\freq2, 100);
						1.wait;				
						a.set(\freq2, 200);
						0.4.wait;			
						a.set(\freq2, 10);
						0.1.wait;
						a.set(\freq2, 16);
					}
				};
			
		~ne.free;				
		
		};



//:

//:

////////////////////////////////////////////////////////////////////Little_Changed//Prostheto merika micra ixakia sto midi opos eipe kai o Dakis
////////////////////////////////////////////////////////////////////___Vazo to ixaki pou paizei stin proti ixografisi, to poli spilo(isos buffer), opos episis kai 
////////////////////////////////////////////////////////////////////to gretzo apo to chaos ugen(nice sounds), kai to bend ixaki(nice sounds, san to parakato)
//:
//Harmonic_Sets, 2/3 (5th), 3/4 (4th)

~a1.action = {'ena'.postln; 
	
			//a.set(\pfreq, 2);	
			a.set(\freq, 40);
			a.set(\num, 10.5);
			a.set(\amp, 0.3);
			a.set(\fback, 0);	
			a.set(\decTime, 2);	
		
		~ne = {
			
			SinOsc.ar(
			
			[EnvGen.kr(Env.new([1, 2, 1, 0.1]*40, [1, 1, 1], 1, 2, 0), 				doneAction:2), 
			EnvGen.kr(Env.new([1, 2, 1, 0.1]*41, [0.5, 1, 0.5], 1, 2,0), 				doneAction:2)], 

			0, 0.2)}.play;


		
		
		};

~a2.action = {'dio'.postln;    
	
			
			//a.set(\pfreq, 3.5);
		
			a.set(\pfreq, 0.2);		
			a.set(\freq, 10);			
			//a.set(\fback, 0);			
			a.set(\decTime, 2);		

			fork{
				1.do{ 
					a.set(\amp, 0.2);
					a.set(\freq2, 20);
					0.05.wait;				
					a.set(\freq2, 2);
					0.05.wait;
					a.set(\freq2, 200);
					0.1.wait;
					a.set(\freq2, 0.1);
					0.5.wait;
					a.set(\freq2, 1000);
					0.1.wait;
					a.set(\freq2, 16);
				
				
				
				}
			};

		};

~a3.action = {'tria'.postln; 
	
			//a.set(\pfreq, 1);
			a.set(\freq, 40);
			a.set(\fback, 2);				
			a.set(\decTime, 1);
		
		};

~a4.action = {'tessera'.postln;    
			a.set(\fback, 0);				
			//a.set(\pfreq, 0.9);		
			a.set(\freq, 1);			
			//a.set(\freq2, 16);			
				/*fork{
					1.do{ 
						a.set(\amp, 0.15);
						a.set(\freq2, 10000);
						1.wait;				
						a.set(\freq2, 20000);
						0.4.wait;			
						a.set(\freq2, 2);
					}
				};*/
				
				fork{
					1.do{ 
						a.set(\amp, 0.2);
						a.set(\freq2, 100);
						1.wait;				
						a.set(\freq2, 2000);
						0.4.wait;			
						a.set(\freq2, 10);
						0.1.wait;
						a.set(\freq2, 16);
					}
				};
			
		~ne.free;				
		
		};



//:

//Sounds

~sin1 = {var harm = 1; Mix.fill(20, {|i| i = i * harm/2; SinOscFB.ar(10 + i, 0.8, 1)}) + Mix.fill(20, {|i| i = i * harm/2; SinOsc.ar(40 + i, 1, 1)})* EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2)!2}.play;
~sin1.free;		

~pus1 = {var harm = 5; Mix.fill(50, {|i| i = i * harm; LFPulse.ar(1000 + i, 0, 1)}) * EnvGen.ar(Env.perc( 0.01, 1, 0.04, -4), doneAction:2)!2}.play;
~pus1.free;		

~pus2 = {var harm = 1; Mix.fill(40, {|i| i = i * harm; LFPulse.ar(40 + i, 0, 1)}) * EnvGen.ar(Env.perc( 0.01, 2, 0.04, -1), doneAction:2)!2}.play;
~pus2.free;		

~pus3 = {var harm = 1; Mix.fill(20, {|i| i = i * harm; Pulse.ar(10 + i, 0.5, 1)}) * EnvGen.ar(Env.perc( 5, 0.01, 0.04, -4), doneAction:2)!2}.play;
~pus3.free;		
																						                //28.midicps
~sin2 = {var harm = 1; Mix.fill(10, {|i| i = i * harm; SinOscFB.ar(~e_1 + i, 0.2, 1)}) * EnvGen.ar(Env( [0, 1, 0.5, 0]/5, [0.1, 0.1, 1], -1), doneAction:2)!2}.play;
~sin2.free;		


~sin3 = {var harm = 1; Mix.fill(20, {|i| i = i * harm/2; LFSaw.ar(LFSaw.kr(10).range(0, 10) + i, 0, 1)}) + Mix.fill(20, {|i| i = i * harm/1; SinOsc.ar(40 + i, 1, 1)})* EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2)!2}.play;
~sin3.free;		

//Sounds_SynthDef_Pattern
//:
SynthDef(\Bass, { arg out = 0, amp = 0.01, amp2 = 0.002, freq = 40, harm = 1, freq2 = 55,  temp = 1;
	var source, source2, env;
	temp = Impulse.ar(tempo);
	source = Mix.fill(50, {|i| i = i * harm; SinOsc.ar(freq + i, 0 + i/10, amp)});
	source2 = Mix.fill(10, {|i| i = i *harm; Saw.ar(freq*30 + i/2, amp2, 0)});
	Out.ar(out, source ! 2 );
	Out.ar(out, source2 ! 2);
}).send(s);
//:
d = Synth(\Bass);
d.set(\amp, 0.01);
d.set(\harm, 1);
d.set(\amp2, 0.001);

//:

SynthDef(\Bass, { | out = 0, amp = 0.01, amp2 = 0.002, freq = 40, harm = 1, freq2 = 10|
	var source, source2, env;
	source = Mix.fill(20, {|i| i = i * harm/2; SinOscFB.ar(freq2 + i, 0.8, amp)}) + Mix.fill(30, {|i| i = i * harm/2; SinOsc.ar(freq + i, 1, amp)})* 
	EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2);

	Out.ar(out, source ! 2 );
}).add;

//:

Pdef(\x,
		Pbind(\instrument, \Bass,
				\tempo, 2,
				\dur, Pseq([1, 0.5, 1.5, 1], inf),
				\harm,  Pseq([1, 5, 0.7, 3], inf),
				\freq,  Pseq([40, 50, 70, 30], inf),
				\freq2,  Pseq([10, 20, 30, 10], inf),
				\amp, 0.5
));

//:

Pdef(\x).play;
Pdef(\x).stop;


//:

Pdef(\x,
		Pbind(\instrument, \Bass,
				\tempo, 2,
				\dur, Pseq([4/4], inf),
				\harm,  Prand([1, 5, 0.7, 10], inf),
				\freq,  Pseq([40, 50, 70, 30], inf),
				\freq2,  Pseq([10, 20, 30, 10], inf),
				\amp, 0.5
));

Pdef(\y,
		Pbind(\instrument, \Bass,
				\tempo, 2,
				\dur, Pseq([3/4], inf),
				\harm,  Pseq([1, 5, 0.7, 3], inf),
				\freq,  Pseq([40, 50, 70, 30], inf),
				\freq2,  Pseq([10, 20, 30, 10], inf),
				\amp, 0.5
));

//:

Pdef(\x).play;Pdef(\y).play;


//:2nd

SynthDef(\Bass, { | out = 0, amp = 1, freq = 40, harm = 1, freq2 = 10|
	var source, source2, env;
	source = Mix.fill(20, {|i| i = i * harm/2; SinOscFB.ar(freq2 + i, 0.8, amp)}) + Mix.fill(20, {|i| i = i * harm/2; SinOsc.ar(freq + i, 1, amp)}) * 
	EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2);

	Out.ar(out, source ! 2 );
}).add;

//:

Synth(\Bass);

//:

Pdef(\x,
		Pbind(\instrument, \Bass,
				\dur, Pseq([1, 0.5, 1.1, 0.8, 0.2], inf),
				\amp, 0.5,
				\harm,  Pseq([1, 5, 0.7, 3, 3], inf),
				\freq,  Pseq([40, 54, 80, 60, 60], inf),
				\freq2,  Pseq([10, 20, 30, 10, 10], inf)
));

//:

Pdef(\x,
		Pbind(\instrument, \Bass,
				\dur, Pseq([0.5], inf),
				\amp, 0.8,
				\harm,  Pseq([1], inf),
				\freq,  Pseq([40], inf),
				\freq2,  Pseq([0], inf)
));

//:

Pdef(\x).play;











