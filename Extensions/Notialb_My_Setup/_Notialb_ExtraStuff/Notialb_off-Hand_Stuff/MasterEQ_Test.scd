//:
~ena = SendTags.new;
~ena.dests = [Dests.mineAddr];
~ena.title = '/tags1';
~ena.tags = [1, 2, 3, 4];
~ena.step = [1/2];
~ena.times = inf;
~ena.loop;
//:

~a1 = RespTags.do('/tags1', 1, nil);
~a2 = RespTags.do('/tags1', 2, nil);
~a3 = RespTags.do('/tags1', 3, nil);
~a4 = RespTags.do('/tags1', 4, nil);

//:

~a1.action = {'1'.postln; 	MasterEQ(2);};

~a2.action = {'2'.postln;   };

~a3.action = {'3'.postln;   };

~a4.action = {'4'.postln;   };

//:


MasterEQ(2);