//TO DO: make it stop, san the class.sc

Do {
	var sound, time = 10;
	var synth;

//class methods	

	*p { | sound, time = 10 |
		^super.newCopyArgs(sound, time).init;
	
	}
	
	*p1 { | sound|
		^super.newCopyArgs(sound).init1;
	
	}

//instance methods	

	init {
		if (sound.isNil) { sound = { WhiteNoise.ar(0.1)
								*EnvGen.kr(Env.perc(0.1, time, 1, 1), 
								doneAction: 2).dup(2)} 
								
								}; 
		
		^this.makeSynth;
	}
	
	
	init1 {
		if (sound.isNil) { sound = { 
			
					Out.ar([LFPulse.kr(0.7).range(0, 1)], WhiteNoise.ar(0.1));

					 }
								
						}; 
		^this.makeSynth;
	}
	
	makeSynth {
		
		Server.default.meter;
		
		^synth = { |time = 10| 
			
			sound.value;
		
		}.play(args: [\time, time])
	}
	
}

/*
Do.p1({SinOsc.ar}, 1);
Do.p(nil, time: 1);
Do.p(nil, 0.2);
Do.p;
Do.p1({SinOsc.ar});
Do.p2({SinOsc.ar});
*/

//d = { WhiteNoise.ar(0.1)*EnvGen.kr(Env.perc(0.1, 1, 1, 1), doneAction:2)}.play; 
//{ Out.ar([LFPulse.kr(0.7).range(0, 1)], WhiteNoise.ar(0.1)) }.play;


