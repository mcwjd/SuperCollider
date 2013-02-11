Vagelis_Menu{
 	
	classvar centralMenu, st1, st2;


*initClass {
Ê Ê 
	StartUp.add {
	Ê Ê Ê
		centralMenu = SCMenuGroup(nil, "Vagelis_Menu", 12);
		
		//Open SC folder
		st1 = SCMenuItem(centralMenu, "SuperCollider folder open");
		st1.action = { Platform.userAppSupportDir.openOS };
		st1.setShortCut("a", true); // Cmd-alt-s
Ê Ê 
		//Jack booting
		st2 = SCMenuItem(centralMenu, "Jack booting");
		st2.action = { Jack.load; "Jack booting on".postln;};
		st2.setShortCut("j", true); // Cmd-alt-j
Ê Ê 
		
		
		}
	
	}

}