//Mporei stadiaka na xalaei i foni

q = Buffer.read(s, "/Users/vagelis/Desktop/SOUND_BANK/1 O Motzart.aiff");
//q = Buffer.read(s, "/Users/vagelis/Desktop/SOUND_BANK/2 Me to Psosopo ston Toixo.aiff");
//:

SynthDef(\buf_meros_2, {|startp = 1, ipod = 1, pos = 0, at = 0.5, rel = 0.5, shape = -4|
	var source, env, sec, bufnum = q;
		sec = BufDur.ir(q);
		pos = sec * ipod * 44100;
		source = PlayBuf.ar(1, q, BufRateScale.kr(q), trigger: 0, startPos: pos, loop:0, doneAction:2); 
		env = EnvGen.ar(Env.perc(at, rel, 4, shape), doneAction:2);
		SendReply.kr(Impulse.kr(10), \pare, pos);
	Out.ar([0,1], source /** LFSaw.ar(10).range(0.2, 1)*//* * SinOsc.ar(10)*/ * 0.3)//xoris * env

}).add;

//:

Synth(\buf);	 

//:With ipod set range(0, 1)

Pdef(\xbuf, Pbind(
		\instrument, \buf,
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\ipod, Pseq([
					
					Pseq([0.1, 0.14, 0.16, 0.17, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.26], 1),
					Pseq([0.1, 0.14, 0.16, 0.17, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.26]+0.2, 1),
					Pseq([0.1, 0.14, 0.16, 0.17, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.26]+0.4, 1)
					
				]),

		\at, Pseq([1, 1/2, 3/2, 1]/2, inf),
		\rel, Pseq([1, 1/2, 3/2, 1]/2, inf),
		\shape, Pseq([-4], inf)
));

//:

Pdef(\mozart, Pbind(
		\instrument, \buf_meros_2,
		\dur, Pseq([1, 1/2, 3/2, 1]/2, inf),
		\ipod, Pseq([
					
					Pseq([0.01, 0.015, 0.017, 0.019/*, 0.019, 0.02, 0.022, 0.024, 0.026, 0.028, 0.029, 0.03*/], 1),
					Pseq([0.1, 0.13, 0.15, 0.17, 0.19, 0.2, 0.22, 0.24, 0.26, 0.28, 0.29, 0.3], 1),
					Pseq([0.1, 0.13, 0.15, 0.17, 0.19, 0.2, 0.22, 0.24, 0.26, 0.28, 0.29, 0.3]+0.2, 1),
					Pseq([0.1, 0.13, 0.15, 0.17, 0.19, 0.2, 0.22, 0.24, 0.26, 0.28, 0.29, 0.3]+0.4, 1),
					Pseq([0.1, 0.13, 0.15, 0.17, 0.19, 0.2, 0.22, 0.24, 0.26, 0.28, 0.29, 0.3]+0.6, 1),
					Pseq([0.1, 0.13, 0.15, 0.17, 0.19, 0.2/*, 0.22, 0.24, 0.26, 0.28, 0.29, 0.3*/]+0.8, 1)
					
				], inf),//def tipota anti inf

		\at, Pseq([1, 1/2, 3/2, 1]/4, inf),//Me /2 einai san delay
		\rel, Pseq([1, 1/2, 3/2, 1]/4, inf),//Me /2 einai san delay
		\shape, Pseq([-4], inf)
));

//:
Pdef(\mozart).quant = 0;
Pdef(\xbuf).play;
Pdef(\xbuf).stop;

//:

o.remove; 
o = OSCresponder(nil, 'pare', { |t, r, msg| 
	msg.postln;
}).add;

//:


//==============================Second_Way

l = Buffer.read(s, "/Users/vagelis/Desktop/SOUND_BANK/1 O Motzart.aiff");


//:

SynthDef(\bufVoice, {|startp = 1, rl = 0.01, dc = 1, ch = 0, vol=1, at = 0.01, gate = 1, sus = 0.2, sound, rate, cutoffL = 20000, cutoffH = 50, mixx = 0, rooom = 0.7, dampp = 0.2, pos = 0|
	var source, env, we, gen;
	
		source = PlayBuf.ar(1, l, BufRateScale.kr(l), trigger: 0, startPos: startp, loop:0, doneAction:2); 
	    env = EnvGen.kr(Env.adsr(2, 1, 1, rl), gate, doneAction: 2);
	
	Out.ar(ch, source * env);

}).add;

//:

Pdef(\x2, Pbind(
	\instrument, \bufVoice,
	\gate, Pseq([1, 0], inf),
	\dur, Pseq([1], inf),
	\startp, Pseq([1, 12, 0.5]*44100, inf),
	\ch, Pseq([0, 1], inf),
	\vol, Pseq([1], inf)
));

//:

Pdef(\xbuf).quant = 0;
Pdef(\x2).play;þ


