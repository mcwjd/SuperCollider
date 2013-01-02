BhobLoShelf {
	*ar {|in, freq, amp|
		var wc, a0, allpass;
		wc=pi * freq * SampleDur.ir;
		a0=(1 - wc)/(1 + wc);
		allpass=FOS.ar(in, a0.neg, 1, a0, -1);
		^(0.5 * (in + allpass + (amp * (in-allpass))))
	}
}

BhobHiShelf {
	*ar {|in, freq, amp|
		var wc, a0, allpass;
		wc=pi * freq * SampleDur.ir;
		a0=(1 - wc)/(1 + wc);
		allpass=FOS.ar(in, a0.neg, 1, a0, 1);
		^(0.5 * (in + allpass + (amp * (in-allpass))))
	}
}

BhobTone {
	*ar {|in, tone|
		^Mix([BHiShelf.ar(in, 10000, tone), BhobLoShelf.ar(in, 100, tone.reciprocal)])
	}
}




//{BhobTone.ar(WhiteNoise.ar(0.1), 100)}.play;