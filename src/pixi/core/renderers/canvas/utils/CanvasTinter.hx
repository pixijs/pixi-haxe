package pixi.core.renderers.canvas.utils;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.html.CanvasElement;

@:native("PIXI.CanvasTinter")
extern class CanvasTinter {

	/**
	 * Basically this method just needs a sprite and a color and tints the sprite with the given color.
	 *
	 * @param sprite {Sprite} the sprite to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @return {HTMLCanvasElement} The tinted canvas
	 */
	static function getTintedTexture(sprite:Sprite, color:Int):CanvasElement;

	/**
	 * Tint a texture using the 'multiply' operation.
	 *
	 * @param texture {Texture} the texture to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintWithMultiply(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture using the 'overlay' operation.
	 *
	 * @param texture {Texture} the texture to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintWithOverlay(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture pixel per pixel.
	 *
	 * @param texture {Texture} the texture to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintWithPerPixel(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Rounds the specified color according to the CanvasTinter.cacheStepsPerColorChannel.
	 *
	 * @param color {Int} the color to round, should be a hex color
	 */
	static function roundColor(color:Int):Int;

	/**
	 * Number of steps which will be used as a cap when rounding colors.
	 *
	 * @member
	 */
	var cacheStepsPerColorChannel:Int;

	/**
	 * Tint cache boolean flag.
	 *
	 * @member
	 */
	var convertTintToImage:Bool;

	/**
	 * Whether or not the Canvas BlendModes are supported, consequently the ability to tint using the multiply method.
	 *
	 * @member
	 */
	var canUseMultiply:Bool;

	/**
	 * The tinting method that will be used.
	 *
	 */
	var tintMethod:Dynamic;
}