Vagelis_Menu{
 	
	classvar centralMenu, st1, st2, jack;


*initClass {
� � 
	StartUp.add {
	� � �
		centralMenu = SCMenuGroup(nil, "Vagelis_Menu", 12);
		
		//Open SC folder
		st1 = SCMenuItem(centralMenu, "SuperCollider folder open");
		st1.action = { Platform.userAppSupportDir.openOS };
		st1.setShortCut("a", true); // Cmd-alt-s
� � 
		//Jack booting
		st2 = SCMenuItem(centralMenu, "Jack booting");

		st2.action = { 
			
			if (jack.isNil)  {
			
					jack = Jack.load; ("Jack booting on").postln;
					
					}{
					
					("Jack booting off").postln; jack = nil;}
						
				};

		st2.setShortCut("j", true); // Cmd-alt-j
� � 
		
		
		}
	
	}

}

/*
y = Jack.load;
y = Jack.load.isNil;
y.isNil
y = nil
d = nil
f.isNil
f.isPlaying

f = {SinOsc.ar}.play;
f.value
f.free;

j = Jack.load
*/
/*

~jack = 1;
(
	if (~jack.isNil;) {
			
			 {SinOsc.ar}.play;
			 ("Jack booting on").postln;
				//~jack = 1;
				
				}{
			
			 ("Jack booting off").postln;
				//~jack = nil;	
				
				};
)

*/







