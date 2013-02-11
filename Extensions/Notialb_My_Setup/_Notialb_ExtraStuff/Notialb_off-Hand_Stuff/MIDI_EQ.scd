//: ~re = MasterEQ.newEQ(2); ~we = MasterEQ.newEQ(2);
CCResponder({ |src,chan,num,value|
Ê Ê Ê Ê [src,chan,num,value].postln;

		
if (num == 24 ) {		
		
	
	if (value == 127) { AppClock.sched(0,{
		Ê Ê 
							 ~we.start;
							 nil;
						
						});
		};
		
	if (value == 0) { ~we.stop;};

};
	
if (num == 25 ) {		
		
	
	if (value == 127) { AppClock.sched(0,{
		Ê Ê 
							 ~re.start;
							 nil;
						
						});
		};
		
	if (value == 0) { ~re.stop;};

};

	    },
	  Ênil,
Ê Ê Ê Ê 0, 
Ê Ê Ê Ê [24, 25],
Ê Ê Ê Ê nil
);
//:
CCR.play;
CCR.stop;
CCR.kill;

q = MasterEQ(2);

MasterEQ.eq[ \frdb ] = [ [ 100, 10.rand2, 1 ], [ 250, 10.rand2, 1 ], [ 1000, 10.rand2, 1 ], 
				[ 3500, 10.rand2, 1 ], [ 6000, 10.rand2, 1 ] ];
MasterEQ.eq[ \send_current ].value;
MasterEQ.eq[ \uvw ].refresh;
MasterEQ.eq[ \tvw_refresh ].value;
MasterEQ.eq[ \pumenu_check ].value;
f = MasterEQ.newEQ(2)
f.start
w = MasterEQ.newEQ(2)

(
AppClock.sched(0.0001,{
Ê Ê 
	w = MasterEQ.newEQ(2);
 nil;
});
)


w = MasterEQ.newEQ(2)
MasterEQ.newEQ.eq[ \toControl ];
		
