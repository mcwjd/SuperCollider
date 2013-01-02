CCR{ 
	classvar cmidi, noteon;
	
	
	*play{
		 
		cmidi = CCResponder({ |src,chan,num,value|
	Ê Ê Ê Ê [src,chan,num,value].postln;
	Ê Ê Ê Ê },
	Ê Ê Ê Ê nil, // any source
	Ê Ê Ê Ê nil, // any channel
	Ê Ê Ê Ê nil, // any CC number
	Ê Ê Ê Ê nil // any value
	Ê Ê 	   );
		
		
		noteon = NoteOnResponder({ |src,chan,note,vel|
	Ê Ê Ê Ê [src,chan,note,vel].postln;
	Ê Ê Ê Ê },
	Ê Ê Ê Ê nil, // any source
	Ê Ê Ê Ê nil, // any channel
	Ê Ê Ê Ê nil, // any note
	Ê Ê Ê Ê nil // any vel
		   );
	
	}
	

	*stop{
		
		cmidi.remove;
		noteon.remove;
		
		}


	
	*kill{
		
		CCResponder.removeAll;
		NoteOnResponder.removeAll;
		
		}



}

/*
CCR.play;
CCR.stop;
CCR.kill;
*/