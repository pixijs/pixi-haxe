package pixi.extras;

import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

@:native("PIXI.extras.MovieClip")
extern class MovieClip extends Sprite {

	/**
	 * A MovieClip is a simple way to display an animation depicted by a list of textures.
	 *
	 * ```js
	 * 	var alienImages = ["image_sequence_01.png","image_sequence_02.png","image_sequence_03.png","image_sequence_04.png"];
	 * 	var textureArray = [];
	 *
	 * for (	var i=0; i < 4; i++)
	 * {
	 *      	var texture = PIXI.Texture.fromImage(alienImages[i]);
	 *      textureArray.push(texture);
	 * };
	 *
	 * 	var mc = new PIXI.MovieClip(textureArray);
	 * ```
	 *
	 * @class
	 * @extends Sprite
	 * @memberof PIXI.extras
	 * @param textures {Texture[]} an array of {Texture} objects that make up the animation
	 */
	function new(textures:Array<Texture>);

	/**
	 * The speed that the MovieClip will play at. Higher is faster, lower is slower
	 *
	 * @member {Float}
	 * @default 1
	 */
	var animationSpeed:Float;

	/**
	 * Whether or not the movie clip repeats after playing.
	 *
	 * @member {Bool}
	 * @default true
	 */
	var loop:Bool;

	/**
	 * 	function to call when a MovieClip finishes playing
	 *
	 * @method
	 * @memberof MovieClip#
	 */
	var onComplete:Void -> Void;

	/**
	 * The MovieClips current frame index (this may not have to be a whole number)
	 *
	 * @member {Int}
	 * @default 0
	 * @readonly
	 */
	var currentFrame:Int;

	/**
	 * Indicates if the MovieClip is currently playing
	 *
	 * @member {Bool}
	 * @readonly
	 */
	var playing:Bool;

	/**
	 * totalFrames is the total number of frames in the MovieClip. This is the same as number of textures
	 * assigned to the MovieClip.
	 *
	 * @member
	 * @memberof MovieClip#
	 * @default 0
	 * @readonly
	 */
	var totalFrames:Int;

	/**
	 * The array of textures used for this MovieClip
	 *
	 * @member
	 * @memberof MovieClip#
	 *
	 */
	var textures:Array<Texture>;

	/**
	 * Stops the MovieClip
	 *
	 */
	function stop():Void;

	/**
	 * Plays the MovieClip
	 *
	 */
	function play():Void;

	/**
	 * Stops the MovieClip and goes to a specific frame
	 *
	 * @param frameNumber {Int} frame index to stop at
	 */
	function gotoAndStop(frameNumber:Int):Void;

	/**
	 * Goes to a specific frame and begins playing the MovieClip
	 *
	 * @param frameNumber {Int} frame index to start at
	 */
	function gotoAndPlay(frameNumber:Int):Void;

	/**
	 * A short hand way of creating a movieclip from an array of frame ids
	 *
	 * @static
	 * @param frames {Array<String>} the array of frames ids the movieclip will use as its texture frames
	 */
	static function fromFrames(frames:Array<String>):MovieClip;

	/**
	 * A short hand way of creating a movieclip from an array of image ids
	 *
	 * @static
	 * @param images {Array<String>} the array of image urls the movieclip will use as its texture frames
	 */
	static function fromImages(images:Array<String>):MovieClip;
}