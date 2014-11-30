package pixi.display;

import pixi.textures.Texture;

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
	function new(textures:Array<Texture>):Void;

	/**
     * The speed that the MovieClip will play at. Higher is faster, lower is slower
     *
     * @property animationSpeed
     * @type Number
     * @default 1
     */
	var animationSpeed:Float;

	/**
     * Whether or not the movie clip repeats after playing.
     *
     * @property loop
     * @type Boolean
     * @default true
     */
	var loop:Bool;

	/**
     * Function to call when a MovieClip finishes playing
     *
     * @property onComplete
     * @type Function
     */
	var onComplete:Void -> Void;

	/**
     * [read-only] The MovieClips current frame index (this may not have to be a whole number)
     *
     * @property currentFrame
     * @type Number
     * @default 0
     * @readOnly
     */
	var currentFrame:Int;

	/**
     * [read-only] Indicates if the MovieClip is currently playing
     *
     * @property playing
     * @type Boolean
     * @readOnly
     */
	var playing:Bool;

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
     * The array of textures that make up the animation
     *
     * @property textures
     * @type Array
     */
	var textures:Array<Texture>;

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

	/**
	 * A short hand way of creating a movieclip from an array of frame ids
	 *
	 * @static
	 * @method fromFrames
	 * @param frames {Array} the array of frames ids the movieclip will use as its texture frames
	 */
	static function fromFrames(frames:Array<String>):MovieClip;

	/**
	 * A short hand way of creating a movieclip from an array of image ids
	 *
	 * @static
	 * @method fromImages
	 * @param frames {Array} the array of image ids the movieclip will use as its texture frames
	 */
	static function fromImages(images:Array<String>):MovieClip;
}