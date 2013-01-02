CCR{ 
	classvar cmidi, noteon;
	
	
	*play{
		 
		cmidi = CCResponder({ |src,chan,num,value|
	� � � � [src,chan,num,value].postln;
	� � � � },
	� � � � nil, // any source
	� � � � nil, // any channel
	� � � � nil, // any CC number
	� � � � nil // any value
	� � 	   );
		
		
		noteon = NoteOnResponder({ |src,chan,note,vel|
	� � � � [src,chan,note,vel].postln;
	� � � � },
	� � � � nil, // any source
	� � � � nil, // any channel
	� � � � nil, // any note
	� � � � nil // any vel
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