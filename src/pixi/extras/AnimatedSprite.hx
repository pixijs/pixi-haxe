package pixi.extras;

import pixi.core.textures.Texture;
import flash.display.Sprite;

@:native("PIXI.extras.AnimatedSprite")
extern class AnimatedSprite extends Sprite
{
    /**
     * An AnimatedSprite is a simple way to display an animation depicted by a list of textures.
     *
     * ```js
     * let alienImages = ["image_sequence_01.png","image_sequence_02.png","image_sequence_03.png","image_sequence_04.png"];
     * let textureArray = [];
     *
     * for (let i=0; i < 4; i++)
     * {
     *      let texture = PIXI.Texture.fromImage(alienImages[i]);
     *      textureArray.push(texture);
     * };
     *
     * let mc = new PIXI.AnimatedSprite(textureArray);
     * ```
     *
     * @class
     * @extends Sprite
     * @memberof PIXI.extras
     * @param {Array<Texture>|Array<FrameObject>} textures - an array of {Texture} or frame
     *  objects that make up the animation
     * @param {Bool} [autoUpdate=true] - Whether use PIXI.ticker.shared to auto update animation time.
     */
    function new(textures:Array<Texture>, autoUpdate:Bool = true);

    /**
     * The speed that the AnimatedSprite will play at. Higher is faster, lower is slower
     *
     * @member {Float}
     * @default 1
     */
    var animationSpeed:Float;

    /**
     * Whether or not the animate sprite repeats after playing.
     *
     * @member {Bool}
     * @default true
     */
    var loop:Bool;

    /**
     * Function to call when a AnimatedSprite finishes playing
     *
     * @method
	 * @memberof MovieClip#
     */
    var onComplete:Void -> Void;

    /**
     * Function to call when a AnimatedSprite changes which texture is being rendered
     *
	 * @method
	 * @memberof MovieClip#
	 */
    var onFrameChange:Void -> Void;

    /**
     * Indicates if the AnimatedSprite is currently playing
     *
     * @member {Bool}
     * @readonly
     */
    var playing:Bool;

    /**
	 * The AnimatedSprite's current frame index (this may not have to be a whole number)
	 *
	 * @member {Int}
	 * @default 0
	 * @readonly
	 */
    var currentFrame:Int;

    /**
	 * totalFrames is the total number of frames in the AnimatedSprite. This is the same as number of textures
	 * assigned to the AnimatedSprite.
	 *
	 * @member
	 * @memberof AnimatedSprite#
	 * @default 0
	 * @readonly
	 */
    var totalFrames:Int;

    /**
	 * The array of textures used for this AnimatedSprite
	 *
	 * @member
	 * @memberof AnimatedSprite#
	 * @readonly
	 */
    var textures:Array<Texture>;

    /**
     * Stops the AnimatedSprite
     *
     */
    function stop():Void;

    /**
     * Plays the AnimatedSprite
     *
     */
    function play():Void;

    /**
     * Stops the AnimatedSprite and goes to a specific frame
     *
     * @param {Int} frameNumber - frame index to stop at
     */
    function gotoAndStop(frameNumber:Int):Void;

    /**
     * Goes to a specific frame and begins playing the AnimatedSprite
     *
     * @param {Int} frameNumber - frame index to start at
     */
    function gotoAndPlay(frameNumber:Int):Void;

    /**
     * Stops the AnimatedSprite and destroys it
     *
     */
    function destroy():Void;

    /**
     * A short hand way of creating a movieclip from an array of frame ids
     *
     * @static
     * @param {Array<String>} frames - The array of frames ids the movieclip will use as its texture frames
     * @return {AnimatedSprite} The new animated sprite with the specified frames.
     */
    static function fromFrames(frames:Array<String>):AnimatedSprite;

    /**
     * A short hand way of creating a movieclip from an array of image ids
     *
     * @static
     * @param {Array<String>} images - the array of image urls the movieclip will use as its texture frames
     * @return {AnimatedSprite} The new animate sprite with the specified images as frames.
     */
    static function fromImages(images:Array<String>):AnimatedSprite;
}