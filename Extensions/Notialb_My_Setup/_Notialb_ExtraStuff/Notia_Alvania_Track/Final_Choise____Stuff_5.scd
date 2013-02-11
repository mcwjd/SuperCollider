//:
////////////////////////////////////////////////////////////////////////////////1st

SynthDef(\test_2, {
 	|freq = 43, amp = 0.5, freq2 = 0.0002, fback = 0, pfreq = 0.2, ampsin = 0.4, maxdel = 0.4, decTime = 2, num = 0.4, harm = 1|

	var source, out = 0;

	source = AllpassC.ar(							
	
				Mix.fill(2, { |i| i = i * harm; SinOscFB.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range(1, 2.1)*/, fback, ampsin).tanh}), 
	
					maxdel,		
					
							Pan2.ar(LFPulse.ar(LFPulse.kr(pfreq).range(6, freq2), 
									LFNoise0.kr(10).range(0, pi), /*LFNoise1.kr(10).range(0.0001, 0.001)*/0.0001, 0.1), 
											PinkNoise.kr(10).range(-1, 1), 0.05), 
						
					decTime, amp);
	
	Out.ar(out, source)
	
}).send(s);


//:////////////////////////////////////////////////////////////////////////////////Anexartita_Pulse kai Drone

SynthDef(\test_2, {
 	|freq = 43, ampD = 0.5, ampG = 1, freq2 = 0.0002, fback = 0, pfreq = 0.2, ampsin = 0.4, maxdel = 0.4, decTime = 0.2, delt = 0.2, num = 0.4, harm = 1,	range1 = 6, range2 = 0.2 |

	var source, out = 0;

	source = 
	
	//Drone
	AllpassC.ar(												Mix.fill(2, { |i| i = i * harm; SinOscFB.ar([freq/*,freq+num*/]*i/**LFNoise1.ar(1).range(1, 2.1)*/, fback, ampsin).tanh}),
					maxdel, delt, decTime, ampD)					
	+	


	//Glitch
	Pan2.ar(LFPulse.ar(LFPulse.kr(pfreq).range(range1, range2), 
				LFNoise0.kr(10).range(0, pi), /*LFNoise1.kr(10).range(0.0001, 0.001)*/0.0001, 0.4), 
						PinkNoise.kr(10).range(-1, 1), ampG);
						
	
	
	Out.ar(out, source)
	
}).send(s);

//:
a = Synth(\test_2);
a.free;
 
a.set(\pfreq, 0.2);//GAMATO!!! Stadiaka Glitch
a.set(\harm, 1);
a.set(\freq, 45);
//Diakrotima Change
a.set(\num, 0.2);
//Episis Gamato Apo kanoniko freq se poli mikro
a.set(\freq, ~f_1); 
a.set(\freq2, 16);
a.set(\freq2, 1); 

a.set(\decTime, 0.1);
a.set(\maxdel, 1);
a.set(\delt, 0.2);
a.set(\ampG, 0);

//:Ena SnedTags me steps /2, /4, /8

(
~ena = SendTags.new;
~ena.tags = [1,2,3,4];//[1, 2, 3, 4, 5, 6, 7, 8]; //Me 	\pfreq, 0.2
~ena.dests = [Dests.mineAddr];
~ena.step = [1, 1/2, 3/2, 1];//4 normal
~ena.title = '/tags';
~ena.loop;
~dio.loop;
~tri.loop;
)

~ena.stop;~dio.stop;
~ena.resume;

//:	freqs = ~e_2, ~a_2
~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);



//:
~a1.action = {'ena_1'.postln; 

		//~pus2 = {var harm = 1; Mix.fill(10, {|i| i = i * harm/2; LFPulse.ar(10 + i, 0, 1)}) * EnvGen.ar(Env.perc( 0.01, 2, 0.04, -1), doneAction:2)!2}.play;
		a.set(\ampD, 0.5); 
		a.set(\fback, 0);						
		a.set(\freq, 43);
		
		};

~a2.action = {'dio'.postln;    
		
		a.set(\fback, 0);									a.set(\freq, 43);	
		
		};

~a3.action = {'tria'.postln; 

		a.set(\ampD, 0.5); 
		a.set(\fback, 0);	
		a.set(\freq, 43);		
							
		
		};

~a4.action = {'tessera'.postln;    
		
		a.set(\fback, 50); a.set(\ampD, 0.1); 
		a.set(\freq, 43);
						
		};
		
//:		
~pus3 = {var harm = 1; Mix.fill(50, {|i| i = i * harm; Pulse.ar(10 + i, 0.5, 1)}) * EnvGen.ar(Env.perc( 5, 0.01, 0.04, -4), doneAction:2)!2}.play;a.free;~ena.stop;		
~pus3.free;a = Synth(\test_2);~ena.resume;		


//:

