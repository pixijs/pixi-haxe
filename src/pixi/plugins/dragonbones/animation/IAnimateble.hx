package pixi.plugins.dragonbones.animation;

@:native("dragonBones.IAnimateble")
extern interface IAnimateble {

	function advanceTime(passedTime:Float):Void;
	var clock:WorldClock;
}