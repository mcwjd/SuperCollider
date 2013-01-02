


{ Document.listener.front }.defer(0.5);

//:developer specials - should not be on git because they create files that interfere with pull: 

(Platform.userAppSupportDir ++ "/dev_only/*.scd").pathMatch do: _.load;


//: bit rate change to 16bit

//s.recSampleFormat = "int16";


//Run Note - Name class

NotesData.load;


//Change Post window color and post strings color

//for recoloring all text before "compile done"
Document.listener.stringColor_(Color.white); 
//for subsequent post operations.
Document.postColor_(Color.white); 
//for recoloring background color
Document.listener.background = Color(0.14, 0.14, 0.14, 0.97);












