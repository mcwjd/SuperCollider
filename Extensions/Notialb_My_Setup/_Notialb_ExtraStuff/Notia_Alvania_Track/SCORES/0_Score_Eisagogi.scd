//:Krataei: 47
//21, 27, 34
~import = SendTags.new;
~import.dests = [Dests.mineAddr, ~aris = NetAddr("192.168.1.67", 57120), ~alex = NetAddr("169.254.145.99", 57120)];
~import.title = '/tags';
~import.tags = [1, 2, 3, 4];
~import.step = [1];
~import.times = inf;

//:Responders
//:===================================================================
Pdef(\import).quant = 0;
~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);

~counter1 = 0;
~counter2 = 0;
~counter3 = 0;
~counter4 = 0;
~counter5 = 0;

//:
~a1.action = {'1'.postln; ~counter1 = ~counter1 + 1;  
		
			
	("Metro: ").post; ~counter1.postln;
	
	if (~counter1 == 1) { ~aris.sendMsg("eisagogi"); Pdef(\import).play; };	
	if (~counter1 == 21) {~aris.sendMsg("eisagogiFeedBack");};
			 
			};

~a2.action = {'2'.postln;};

~a3.action = {'3'.postln;};

~a4.action = {'4'.postln;};

//:

~import.loop;
~import.stop;