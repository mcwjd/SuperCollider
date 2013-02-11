
Notialbtest {



	*start{
	
	MasterEQ(2);
	
//:SendTags (Den Xreiazetai dio SendTags)
//:===================================================================
~ena = SendTags.new;
~ena.dests = [Dests.mineAddr];
~ena.title = '/tags';
~ena.tags = [1, 2, 3, 4];
~ena.step = [1/3, 1/2, 1/3, 1/3];
~ena.times = inf;

/*
~dio = SendTags.new;
~dio.dests = [Dests.mineAddr];
~dio.title = '/tags2';
~dio.tags = [1, 2, 3, 4, 5];
~dio.step = [1];
~dio.times = inf;
*/

//:Responders
//:===================================================================

~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);


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
*/

//:Actions of Responders
//:===================================================================

////////////a

~a1.action = {'ena'.postln; Pdef(\a).play; };

~a2.action = {'dio'.postln; ~counter2 = ~counter2 + 1;
		
		~counter2.postln;

		if (~counter2 == 10) { ("ALLAGI").postln; 
			
				MasterEQ.stop;
				
				~ena.stop; 
 				~dio.loop;
 
				Pdef(\a).stop;
				Pdef(\b).play;
				
				~counter1 = 0;
				~counter2 = 0;
				~counter3 = 0;
				~counter4 = 0;
				~counter5 = 0;
			
			};
		
				};

~a3.action = {'tria'.postln;};

~a4.action = {'tessera'.postln;};

////////////b

~b1.action = {'ena2'.postln; 

				};

~b2.action = {'dio2'.postln; ~counter2 = ~counter2 + 1;
			
			~counter2.postln;
			
			if (~counter2 == 5) { ("TELOS").postln; 
				
				Pdef(\b).stop;
				~dio.stop;
				
				};
			
				};

~b3.action = {'tria2'.postln;};

~b4.action = {'tessera2'.postln;};

~b5.action = {'pente2'.postln;  };

//:The SYNTHS
//:===================================================================

Pdef(\a1, Ppar([

	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3], inf), \pan, Ê0.5, \freq, Pseq([600, 604, 607, 604])),
Ê Ê 	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/2, inf), \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/4, inf), \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/8, inf), \pan, -0.5, \midinote, Pseq([28]))


], 1));

Pdef(\a2, Ppar([

	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3], inf), \pan, Ê0.5, \freq, Pseq([600, 604, 607, 604]*2)),
Ê Ê 	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/2, inf), \pan, -0.5, \midinote, Pseq([48, 43]*2)),
	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/4, inf), \pan, -0.5, \midinote, Pseq([48, 43]*2)),
	Pbind(\dur, Pseq([1/3, 1/2, 1/3, 1/3]/8, inf), \pan, -0.5, \midinote, Pseq([28]*2))


], 1));


Pdef(\b1, Ppar([

	Pbind(\dur, Pseq([1], inf), \pan, Ê0.5, \freq, Pseq([600, 604, 607, 604])),
Ê Ê 	Pbind(\dur, Pseq([1]/2, inf), \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, Pseq([1]/4, inf), \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, Pseq([1]/8, inf), \pan, -0.5, \midinote, Pseq([28]))


], 1));

Pdef(\b2, Ppar([

	Pbind(\dur, Pseq([1], inf), \pan, Ê0.5, \freq, Pseq([600, 604, 607, 604]*2)),
Ê Ê 	Pbind(\dur, Pseq([1]/2, inf), \pan, -0.5, \midinote, Pseq([48, 43]*2)),
	Pbind(\dur, Pseq([1]/4, inf), \pan, -0.5, \midinote, Pseq([48, 43]*2)),
	Pbind(\dur, Pseq([1]/8, inf), \pan, -0.5, \midinote, Pseq([28]*2))


], 1));


Pdef(\a, Pseq([Pdef(\a1), Pdef(\a2)], inf));
Pdef(\b, Pseq([Pdef(\b1), Pdef(\b2)], inf));

Pdef(\a).quant = 0;
Pdef(\b).quant = 0;

//:START !!!
//:===================================================================
}

	*play{~ena.loop;}

}

/*
~ena.loop;

Pdef(\a).play;
Pdef(\b).play;
//
Notialb.start;
Notialb.play;


MasterEQ(2);
*/




