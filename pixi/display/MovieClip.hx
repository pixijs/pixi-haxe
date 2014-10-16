package pixi.display;

@:native("PIXI.MovieClip")
extern class MovieClip extends Sprite {

	/**
	 * A MovieClip is a simple way to display an animation depicted by a list of textures.
	 *
	 * @class MovieClip
	 * @extends Sprite
	 * @constructor
	 * @param textures {Array<Texture>} an array of {Texture} objects that make up the animation
	*/
	function new(textures:Array<Dynamic>):Void;

	/**
	 * [read-only] totalFrames is the total number of frames in the MovieClip. This is the same as number of textures
	 * assigned to the MovieClip.
	 *
	 * @property totalFrames
	 * @type Number
	 * @default 0
	 * @readOnly
	*/
	var totalFrames:Int;

	/**
	 * Stops the MovieClip
	 *
	 * @method stop
	*/
	function stop():Void;

	/**
	 * Plays the MovieClip
	 *
	 * @method play
	*/
	function play():Void;

	/**
	 * Stops the MovieClip and goes to a specific frame
	 *
	 * @method gotoAndStop
	 * @param frameNumber {Number} frame index to stop at
	*/
	function gotoAndStop(frameNumber:Float):Void;

	/**
	 * Goes to a specific frame and begins playing the MovieClip
	 *
	 * @method gotoAndPlay
	 * @param frameNumber {Number} frame index to start at
	*/
	function gotoAndPlay(frameNumber:Float):Void;

	static function fromFrames(frames:Array<Int>):Dynamic;

	static function fromImages(images:Array<Int>):Dynamic;

}