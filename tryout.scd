Server.default.meter;  //me cmd y
Server.default.volume.gui;
s.boot;    Server.internal.boot;      Server.default.boot;       NetAddr.langPort;
ctl option cmd b            --> //user classes
cmd option shift d          --> //help tou class
cmd option ctl shift t      --> //maura
cmd option shift b          --> //boot
cmd shift b                 --> //parentheseis elegxos
option cmd d
cmd w                       --> //kleinei parathiro
cmd y pano sto ugen 		--> // efarmoges tou ugen 
cmd shift a velakia         --> //epilegei keimeno 
shift velakia               --> //epilegei keimeno
cmd klik(gia ligio kratimeno) --> //kounaei to keimeno
cmd shift k me //: pano kato  --> //paizei ton kodika 
cmd j					--> //open class
cmd ] ή [					--> //stixisi aristera dexia
anti gia var ~		--> //gia na mporo na xrisimopoio tin metavliti kai exo apo to function
c !10                --> //poses fores tha trexei otan to kanoume !2 to kanoume stereo kai sta dio 
kanalia
cmd shift y		--> //pou teriazei to message (px add, play, ktl)
shift alt cmd B		--> //boot/quit
o nomos tis ebneusis --> //ama den kaneis kati tora den tha to kaneis pote
~ var pou to vlepei kai exo oxi mono to function
cmd shift *       --> //anoigei /* */
cmd j, k			--> //kinoume anamesa sta //:
/*....*/         --> // gia sxolia se pano apo mia grami  
cmd shift alt .  --> //allazei interface
//news
cmd alt control B --> //class library
cmd g --> //kinisi stis periptoseis tou find
cmd y --> sta methods
cmd [] --> //stixisi olon mazi
cmd shift [] --> //vazei se {} olo to epilegmeno
_ //einai san to = 
alt kai velakia --> //kinitai se lexeis
SinOsc(_) -->  //einai adio kai to gemizo meta
PulseDivider, Latch kai ta eidi simaton sine tetragoniko triagle ktl
&& --> //logiko kai san texniti noimosini
$ -->//character
Duty Drand Dseq --> //koitao
cmd shift V -->//meter open, pdef all otan einai se pdefs
poll, TIRand //koitao
scramble --> //anakateuei tin seira tou pinaka
trace --> koitao
plot(0.1) //allazei tin klimaka
Lag //gia kathisterisi
++ --> //enonei dio arays
poll--> //tionei san sendReply
InFeedback --> //koitao
add://prosthetitis    - anevazei olo to sima pio pano
mul://polaplasiastis  - entasi
var:// gia na ta orizeis mesa sto synthdef
arg:// kai gia exo apo auto

code snipper button emfanizei auta pou einai mesa se //:
to chain ktl einai kainouria classes
SC features   --> vagelis-library-application support-supercollider-extensions

markov chain
//Command line parse failed simainei oti lipei kapia parenthesi

//ori
  class = protipo
  instance = stigmiotipo
  function = sinartisi, leitourgia
  variable = metavliti
  arguments = orismata, parametroi
  array = sistixies
  integers = akeraioi 
  floats = dekadikoi

ReplaceOut.ar //anti gia Out gia na antikatasteiseis to proigoumeno periexomeno tou bus 

"an intruduction in music technology" to vilio tou julio DESCRIVAL

//send to bus

/**/b = Bus.control(s,1); // we create a control bus (not an audio bus) - Check the Bus helpfile

{Out.kr(b, MouseX.kr(20,22000))}.play // and we run some UGen on the bus



//apo ta examples tou collider
	microhelix kai autohausen mazi
	pieces - dreamhouse - apisteuto
	keyboardwindow
	RM octaver - ring modulator foni
	quines  - plaka
	
	
// IXI
Quarks.gui
XiiQuarks.new;	

//Boot server with jacks router
ServerOptions.devices
s.options.device = ServerOptions.devices[5];
s.options.device = "JackRouter";
s.reboot;


// post incoming osc
(
f = { |msg, time, replyAddr, recvPort|
    if(msg[0] != '/status.reply') {
        "At time %s received message % from % on port%\n".postf( time, msg, replyAddr, recvPort )
    }
};
thisProcess.addOSCRecvFunc;
);  
//
thisProcess.recvOSCfunc = { | ... args | };  //dont post 
// stop posting.
thisProcess.removeOSCRecvFunc(f);

//responders
a = OSCresponder(nil, '/1/fader3', { |t, r, msg| x.set(\amp1, 0.2*msg[1]) }).add;
a = OSCresponder.new(nil, '/1/toggle1', { arg time, resp, msg; 
	if (msg[1] == 1)	{x = Synth(\chaos1);};
	if (msg[1] == 0)	{x.free};
} ).add;

//open
"open -a 'System Preferences'".unixCmd;
//to do:
g = ControlSpec(0.01, 2000, \exp, 0.1, 220, "Hz");
BiMap(inMin, inMax, inWarp, inStep, outMin, outMax, outWarp, outStep);
Ftiaxno Equalizer kai to elegxo me ipod

//erotisis
-Pos na allazo kati live sto Pattern //PatternProxy
-Pos na valo to dur ExpRand live  //Synth help file sto telos
//-Envelope, pos na anoigei kai na kleinei kati //doneaction apla kai mporei na mpei kai opoudipote
- Sta buffer kalitera na vazo ego index
- koitao sched kai TempoClock gia katigoriopoiisi pattern
-folk me polla do mesa

---Zannos
- pos na vazo rand mesa se PatternProxy
- bbcut
- classes
- jithub
- ta paths

---Dakis
- epikoinonia SC Live TimeScore
- sequencer

Kathe Ugen mporei na steilei kai xrafiki parastasi ama ginei kr
Se enan CCResponder molis parei mia timi trexei oti exei mesa

IDEA:

mia chaotiki genitria paizei stelnontas dedomena me to sendreply kai ta dedomena ayta xorizontai kai diamoirazontai se diafores alles diadikasies - genitries.


//Xronikes_Dokimes

1 + (1/2) + (1/4) + 1 + 1.5

(1/3) + (1/2) + (1/3) + (1/3) + ((1/6) * 6) + (1/6)


//:TO LEARN ???
//:===================================================================

` 
^ 
fold2
yield



abs = apolites times, mono thetika
even = zigos
odd = monos
&& = logiko and
|| = logiko or
** = pow, dinami 
mod(x) or %  = akeraio ipoloipo diairesis
div(x) = akeraio piliko diaoresis 
!  = dup(x), num of Channels 
asInt = san akeraios
asFloat = san dekadikos
<> = gia na ta xerei kai apo exo apo tin classi map
x.reciprocal = me poso tha pollaplasiaso to x gia na mpo dosei 1
+/+ = sinexizei to path meta apo tin prokathorismeni poreia sto Platform px 
	Platform.resourceDir +/+ "sound/ktl"
`[] = otan exei auto ` --> otan pernaei sto epomeno dur stamataei to proigoumeno


//TO SEE:
//============

Operators
SimpleNumber
BinaryOpFunction
 

//:Notialb
//:===================================================================

Notialb.load;
Notialb.playAll;
Notialb.playAfterEisagogi;
Notialb.playMeros1;
Notialb.playMeros2; 

