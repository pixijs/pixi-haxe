package core;

import js.html.Audio;

class AudioAsset {

	public var mute:Bool;
	public var loop(default, set):Bool;

	var _src:Audio;

	public function new(src:Audio) {
		_src = src;
		mute = false;
		loop = false;
	}

	public function play() {
		if (!mute) _src.play();
	}

	public function stop() {
		_src.pause();
	}

	function set_loop(val:Bool):Bool {
		_src.loop = val;
		return loop = val;
	}
}