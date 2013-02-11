//:
~ena = SendTags.new;
~ena.dests = [Dests.mineAddr];
~ena.title = '/tags';
~ena.tags = [1, 2, 3, 4, 5];
//~ena.step = [1, 1/2, 1/4, 1, 1.5]/2;
~ena.step = [1/3, 1/2, 1/3, 1/3, 1/6];
//~ena.step = [1];
~ena.times = inf;
//:
~ena.loop;
~ena.stop;
~ena.resume;

//: oi metavlites tou RespTags dilonontai se seira kai ta action apo exo

~a1 = RespTags.do('/tags', 1, nil);
~a2 = RespTags.do('/tags', 2, nil);
~a3 = RespTags.do('/tags', 3, nil);
~a4 = RespTags.do('/tags', 4, nil);
~a5 = RespTags.do('/tags', 5, nil);

//:

~a1.action = {'ena'.postln;};

~a2.action = {'dio'.postln;};

~a3.action = {'tria'.postln;};

~a4.action = {'tessera'.postln;};

~a5.action = {'pente'.postln;};

//:

t = TempoClock.new;
t.tempo = 1;
t.sched(2, {~ena.loop;});
t.sched(10, {~ena.stop;});