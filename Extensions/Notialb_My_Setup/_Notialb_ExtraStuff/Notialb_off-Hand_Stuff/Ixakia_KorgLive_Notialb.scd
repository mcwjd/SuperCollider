

//Dokimazo kai paromia ixakia me auta pou exoun ta synths tou kathe merous alla diaforetika


~sin1 = {var harm = 1; Mix.fill(20, {|i| i = i * harm/2; SinOscFB.ar(10 + i, 0.8, 1)}) + Mix.fill(20, {|i| i = i * harm/2; Saw.ar(40 + i, 1, 1)})* EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2)!2}.play;
~sin1.free;		

~pus1 = {var harm = 5; Mix.fill(50, {|i| i = i * harm; LFPulse.ar(1000 + i, 0, 1)}) * EnvGen.ar(Env.perc( 0.01, 1, 0.04, -4), doneAction:2)!2}.play;
~pus1.free;		

~pus2 = {var harm = 1; Mix.fill(40, {|i| i = i * harm; LFPulse.ar(40 + i, 0, 1)}) * EnvGen.ar(Env.perc( 0.01, 2, 0.04, -1), doneAction:2)!2}.play;
~pus2.free;		

~pus3 = {var harm = 1; Mix.fill(20, {|i| i = i * harm; Pulse.ar(10 + i, 0.5, 1)}) * EnvGen.ar(Env.perc( 5, 0.01, 0.04, -4), doneAction:2)!2}.play;
~pus3.free;		
																						                //28.midicps
~sin2 = {var harm = 1; Mix.fill(10, {|i| i = i * harm; LFSaw.ar(~e_1, 0.2, 1)}) * EnvGen.ar(Env( [0, 1, 0.5, 0]/5, [0.1, 0.1, 1], -1), doneAction:2)!2}.play;
~sin2.free;		


~sin3 = {var harm = 1; Mix.fill(2, {|i| i = i * harm/2; LFSaw.ar(LFSaw.kr(10).range(0, 10) + i, 0, 1)}) + Mix.fill(20, {|i| i = i * harm/1; LFPulse.ar(40 + i, 1, 1)})* EnvGen.ar(Env.perc( 0.01, 2, 0.04, -4), doneAction:2)!2}.play;
~sin3.free;		


~sin1 = {var harm = 1; Mix.fill(10, {|i| i = i * harm; LFSaw.ar(100 * i, 0.8, 1)}) * EnvGen.ar(Env.perc( 0.001, 0.02, 0.1, 4), doneAction:2)!2}.play;
~sin1.free;		

~sin1 = {var harm = 0.1; Mix.fill(12, {|i, w = 1| i = i * [1, 20]; w = w * [1, 0.1]; SinOsc.ar(100 * i , 0.01, w)}) * EnvGen.ar(Env.perc( 0.001, 0.02, 0.5, 4), 
	doneAction:2)!2}.play;
~sin1.free;		

~sin1 = {var harm = 0.1; Mix.fill(12, {|i, w = 1| i = i * [0.1, 200]; w = w * [1, 0.009]; LFNoise0.ar(100 * i , 0.01, w)}) * EnvGen.ar(Env.perc( 0.001, 0.02, 0.5, 4), 
doneAction:2)!2}.play;




