
XixiHID  {
	var < action;

	*new { 
		^super.new.initHID;
		}
	
	initHID { var counter;
		counter = 0;
		":::::: initialising ixi HID ::::::".postln;
		"".postln;		
		HIDDeviceService.buildDeviceList;
		":::::: Found devices :::::: ".postln;
		~locID = [];
		HIDDeviceService.devices.do({arg dev;
			(" ======  Device " + counter + " =====").postln;
			[dev.manufacturer, dev.product].postln;
			"".postln;		
			counter = counter + 1;
			~locID = ~locID.add(dev.locID);
		});
		//["locID list : ", ~locID].postln;
	}
	
	getDevices {
		var counter;
		counter = 0;
		~locID = [];
		":::::: Found devices :::::: ".postln;
		HIDDeviceService.devices.do({arg dev;
			(" ======  Device " + counter + " =====").postln;
			[dev.manufacturer, dev.product].postln;
			"".postln;
			~locID = ~locID.add(dev.locID);
			counter = counter + 1;
		});
		//["locID list : ", ~locID].postln;
		"".postln;
	}
	
	getDeviceElements {arg device;
		var name;
		name = HIDDeviceService.devices.at(device).product;
		(" ======  Device " + device + " =====").postln;
		(" ======  Device name :"+ name + " =====").postln;
		"- [type, usage, cookie, min, max] -".postln;
		HIDDeviceService.devices.at(device).elements.do({arg ele;
			[ele.type, ele.usage, ele.cookie, ele.min, ele.max].postln;
		});
		"".postln;
	}
	
	startDevice { arg device;
		var name;
		if(device > (~locID.size-1), {
			"====== You don't have that many devices connected =====".postln;
		}, {
			name = HIDDeviceService.devices.at(device).product;
			("====== HID device :"+device+"("++ name ++") started ====== ").postln;
			"".postln;
			HIDDeviceService.devices.at(device).queueDevice;
		})
	}
	
	action_ {arg ac;
		action = ac;
		HIDDeviceService.action_(action);
		HIDDeviceService.runEventLoop;
	}
		
	stopDevice { arg device;
		var name;
		if(device > (~locID.size-1), {
			"====== You don't have that many devices connected =====".postln;
		}, {
		name = HIDDeviceService.devices.at(device).product;
		HIDDeviceService.devices.at(device).dequeueDevice;
		HIDDeviceService.devices.at(device).dequeueElement;
		("====== HID device :"+device+"("++ name ++") stopped ====== ").postln;
		"".postln;
		})
	}

	killAll {
		HIDDeviceService.stopEventLoop;
		HIDDeviceService.releaseDeviceList;
		("====== All HID devices killed ====== ").postln;
		"".postln;
	}
}


