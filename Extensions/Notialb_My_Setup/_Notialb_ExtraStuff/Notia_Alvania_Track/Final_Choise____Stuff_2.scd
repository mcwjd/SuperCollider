//:
////////////////////////////////////////////////////////////////////////////////To do: Better Drone, Modulations gia kontrol

SynthDef(\test_2, {
 	|freq = 80, amp = 0.5, freq2 = 0.0002, fback = 0, pfreq = 2, ampsin = 0.8, maxdel = 0.4, decTime = 2, num = 1|
	var source, out = 0;
	source = AllpassC.ar(							//~e_2, ~a_2
				SinOscFB.kr([freq,freq+num], LFNoise0.kr(2).range(0, 0.4), ampsin).tanh, //tanh, squared, cubed 
					maxdel,		//max del time
						//SinOsc.ar(freq2, 0, LFPulse.ar(pfreq, 0, 0.5)).range([2e-3,4e-3], [0.1, 0.2]), //More Complex Glitch
							//SinOsc.ar(freq2, 0, LFPulse.ar(pfreq, 0, 0.5).range([2e-3,4e-3], [0.1, 0.2])), //More Complex Glitch_2(.range: Inside)
						SinOsc.ar(freq2, 0, LFPulse.ar(pfreq, 0, 0.5)).range([2e-3,4e-3], 1), //Check SinOsc freq	
							decTime, amp); 
	Out.ar(out, source)
	
}).send(s);

//:

a = Synth(\test_2);
a.free;

a.set(\pfreq, 0.0);//GAMATO!!! Argo pfreq xekinao me argo sinexizo me xrigoro kai xanakano argo
a.set(\ampsin, 0.0001);
a.set(\maxdel, 100);

//Diakrotima Change
a.set(\num, 100.5);

//Otan trexei apo megalo se mikro KALOO
a.set(\decTime, 1000);
a.set(\decTime, 0.0001);

//Episis Gamato Apo kanoniko freq se poli mikro
a.set(\freq, 100);
a.set(\freq, 0.1); 

//Episis Gamato KAI TA DIO MAZI
a.set(\freq, 1000); a.set(\decTime, 100); 
a.set(\freq, 0.1);  a.set(\decTime, 0.0005); 

//Episis Gamato KAI TA TRIA MAZI
a.set(\freq, 100); a.set(\decTime, 1000); a.set(\pfreq, 0.2); //change the decTime
a.set(\freq, 0.1);  a.set(\decTime, 0.0005); a.set(\pfreq, 2);
//:

(
~ena = SendTags.new;
~ena.tags = [4];//[1, 2, 3, 4, 5, 6, 7, 8]; //Me 	\pfreq, 0.2
~ena.dests = [Dests.mineAddr];
~ena.step = [1,2];//4 normal
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
			a.set(\freq, 80);
							
			fork{
				1.do{ 
					a.set(\amp, 0.2);
					0.3.wait;				
					//Bass Sound
					}
				};

		/*
		~ne = {
			
			SinOsc.ar(
			
			[EnvGen.kr(Env.new([1, 2, 1, 0.1]*40, [1, 1, 1], 1, 2, 0), 				doneAction:2), 
			EnvGen.kr(Env.new([1, 2, 1, 0.1]*41, [0.5, 1, 0.5], 1, 2,0), 				doneAction:2)], 

			0, 0.2)}.play;

*/
		
		
		};

~a2.action = {'dio'.postln;    
	
			
			//a.set(\pfreq, 3.5);
		
					
			a.set(\freq, 100);			
			//a.set(\fback, 0);			
					
/*
			fork{
					1.do{ 
						a.set(\amp, 0.2);
						a.set(\freq2, 100);
						1.wait;				
						a.set(\freq2, 200);
						0.4.wait;			
						a.set(\freq2, 100);
						
					}
				};
*/

		};

~a3.action = {'tria'.postln; 
	
			//a.set(\pfreq, 1);
			a.set(\freq, 80);
							
		};

~a4.action = {'tessera'.postln;    
	
			//a.set(\pfreq, 0.9);		
			a.set(\freq, 10);			
			
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
						a.set(\freq2, 1000);
						1.wait;				
						a.set(\freq2, 2000);
						0.4.wait;			
						a.set(\freq2, 1000);
						0.1.wait;
						a.set(\freq2, 0.02);
					}
				};
			
		~ne.free;				
		
		};



//:
