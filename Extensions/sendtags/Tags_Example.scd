
//First run the SendTags, then the Pdef, then the RespTags, then the actions 
//Because SendTags contains the ~tagSync informations

//WARNING: Pdef(\x).quant = 0;

//: Ta tags kai ta step allazoun live

//:
~ena = SendTags.new;
~ena.dests = [Dests.mineAddr, v = NetAddr("192.168.1.67", 57120), NetAddr("169.254.145.99", 57120)];
~ena.title = '/tags2';
~ena.tags = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
~ena.step = [1/3, 1/2, 1/3, 1/3, Pseq([1/6], 6), 1/6];
~ena.times = inf;
~ena.loop;
//:

~ena.stop;
~ena.resume;



//: oi metavlites tou RespTags dilonontai se seira kai ta action apo exo

~a1 = RespTags.do('/tags2', 1, nil);
~a2 = RespTags.do('/tags2', 2, nil);
~a3 = RespTags.do('/tags2', 3, nil);
~a4 = RespTags.do('/tags2', 4, nil);
~a5 = RespTags.do('/tags2', 5, nil);
~a6 = RespTags.do('/tags2', 6, nil);
~a7 = RespTags.do('/tags2', 7, nil);
~a8 = RespTags.do('/tags2', 8, nil);
~a9 = RespTags.do('/tags2', 9, nil);
~a10 = RespTags.do('/tags2', 10, nil);
~a11 = RespTags.do('/tags2', 11, nil);

//:Pdef(\sinFB_6).play;
Pdef(\x).quant = 0;
Pdef(\xbuf).quant = 0;
Pdef(\classic2_1_2_3_4).quant = 0;
Pdef(\no_InFast_1_2).quant = 0;
~counter1 = 1;


//:

~a1.action = {'1'.postln;  Pdef(\no_InFast_1_2).play;
						Pdef(\xbuf).play; 
				};

~a2.action = {'2'.postln;   };

~a3.action = {'3'.postln;   };

~a4.action = {'4'.postln;   };

~a5.action = {'5'.postln;   };

~a6.action = {'6'.postln;   };

~a7.action = {'7'.postln;   };

~a8.action = {'8'.postln;   };

~a9.action = {'9'.postln;   };

~a10.action = {'10'.postln; };

~a11.action = {'11'.postln; };

//:

~a1.removeResp;
~a2.removeResp;
~a3.removeResp;
~a4.removeResp;

//:

