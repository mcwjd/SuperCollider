
//:///////////////////////////
~ena = SendTags.new;
~ena.tags = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
~ena.dests = [Dests.myAddr];
~ena.step = [1/16];
~ena.title = '/tags'


//://////////////////////
~count1 = CountRespTags.new;
~count1.sendTags = ~ena;
~count1.numCounter = 4;
~count1.prepare;
~count1.load;

//:////////////////

~ena.loop;

//://count_1 pattern//////

~count1.resps[\countResp1_1].action = {
	"1_1".postln;
};

~count1.resps[\countResp1_2].action = {
	"1_2".postln;
};

~count1.resps[\countResp1_3].action = {
	"1_3".postln;
};

~count1.resps[\countResp1_4].action = {
	"1_4".postln;
};

~count1.resps[\countResp1_5].action = {
	"1_5".postln;
};

~count1.resps[\countResp1_6].action = {
	"1_6".postln;
};

~count1.resps[\countResp1_7].action = {
	"1_7".postln;
};

~count1.resps[\countResp1_8].action = {
	"1_8".postln;
};

~count1.resps[\countResp1_9].action = {
	"1_9".postln;
};

~count1.resps[\countResp1_10].action = {
	"1_10".postln;
};

~count1.resps[\countResp1_11].action = {
	"1_11".postln;
};

~count1.resps[\countResp1_12].action = {
	"1_12".postln;
};

~count1.resps[\countResp1_13].action = {
	"1_13".postln;
};

~count1.resps[\countResp1_14].action = {
	"1_14".postln;
};

~count1.resps[\countResp1_15].action = {
	"1_15".postln;
};

~count1.resps[\countResp1_16].action = {
	"1_16".postln;
};


////count_2 pattern//////


~count1.resps[\countResp2_1].action = {
	"2_1".postln;
};

~count1.resps[\countResp2_2].action = {
	"2_2".postln;
};

~count1.resps[\countResp2_3].action = {
	"2_3".postln;
};

~count1.resps[\countResp2_4].action = {
	"2_4".postln;
};

~count1.resps[\countResp2_5].action = {
	"2_5".postln;
};

~count1.resps[\countResp2_6].action = {
	"2_6".postln;
};

~count1.resps[\countResp2_7].action = {
	"2_7".postln;
};

~count1.resps[\countResp2_8].action = {
	"2_8".postln;
};

~count1.resps[\countResp2_9].action = {
	"2_9".postln;
	
};

~count1.resps[\countResp2_10].action = {
	"2_10".postln;
};

~count1.resps[\countResp2_11].action = {
	"2_11".postln;
};

~count1.resps[\countResp2_12].action = {
	"2_12".postln;

};

~count1.resps[\countResp2_13].action = {
	"2_13".postln;
};

~count1.resps[\countResp2_14].action = {
	"2_14".postln;
};

~count1.resps[\countResp2_15].action = {
	"2_15".postln;
};

~count1.resps[\countResp2_16].action = {
	"2_16".postln;
};



////count_3 pattern//////


~count1.resps[\countResp3_1].action = {
	"3_1".postln;
};

~count1.resps[\countResp3_2].action = {
	"3_2".postln;
};

~count1.resps[\countResp3_3].action = {
	"3_3".postln;
};

~count1.resps[\countResp3_4].action = {
	"3_4".postln;
};

~count1.resps[\countResp3_5].action = {
	"3_5".postln;
};

~count1.resps[\countResp3_6].action = {
	"3_6".postln;
};

~count1.resps[\countResp3_7].action = {
	"3_7".postln;
};

~count1.resps[\countResp3_8].action = {
	"3_8".postln;
};

~count1.resps[\countResp3_9].action = {
	"3_9".postln;
};

~count1.resps[\countResp3_10].action = {
	"3_10".postln;
};

~count1.resps[\countResp3_11].action = {
	"3_11".postln;
};

~count1.resps[\countResp3_12].action = {
	"3_12".postln;
};

~count1.resps[\countResp3_13].action = {
	"3_13".postln;
};

~count1.resps[\countResp3_14].action = {
	"3_14".postln;
};

~count1.resps[\countResp3_15].action = {
	"3_15".postln;
};

~count1.resps[\countResp3_16].action = {
	"3_16".postln;
};



////count_4 pattern//////


~count1.resps[\countResp4_1].action = {
	"4_1".postln;
};

~count1.resps[\countResp4_2].action = {
	"4_2".postln;
};

~count1.resps[\countResp4_3].action = {
	"4_3".postln;
};

~count1.resps[\countResp4_4].action = {
	"4_4".postln;
};

~count1.resps[\countResp4_5].action = {
	"4_5".postln;
};

~count1.resps[\countResp4_6].action = {
	"4_6".postln;
};

~count1.resps[\countResp4_7].action = {
	"4_7".postln;
};

~count1.resps[\countResp4_8].action = {
	"4_8".postln;

};

~count1.resps[\countResp4_9].action = {
	"4_9".postln;
};

~count1.resps[\countResp4_10].action = {
	"4_10".postln;

};

~count1.resps[\countResp4_11].action = {
	"4_11".postln;
};

~count1.resps[\countResp4_12].action = {
	"4_12".postln;

};

~count1.resps[\countResp4_13].action = {
	"4_13".postln;
};

~count1.resps[\countResp4_14].action = {
	"4_14".postln;

};

~count1.resps[\countResp4_15].action = {
	"4_15".postln;

};

~count1.resps[\countResp4_16].action = {
	"4_16".postln;

};

//:
