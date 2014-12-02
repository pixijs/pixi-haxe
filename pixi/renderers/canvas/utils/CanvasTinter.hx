package pixi.renderers.canvas.utils;

import js.html.CanvasElement;
import pixi.textures.Texture;
import pixi.display.Sprite;

@:native("PIXI.CanvasTinter")
extern class CanvasTinter {

	/**
	 * Number of steps which will be used as a cap when rounding colors
	 */
	static var cacheStepsPerColorChannel:Float;

	/**
	 * Number of steps which will be used as a cap when rounding colors
	 */
	static var convertTintToImage:Bool;

	/**
	 * Whether or not the Canvas BlendModes are supported, consequently the ability to tint using the multiply method
	 */
	static var canUseMultiply:Bool;

	static var tintMethod:Dynamic;

	/**
	 * Basically this method just needs a sprite and a color and tints the sprite
	 * with the given color
	 *
	 * @method getTintedTexture
	 * @param sprite {Sprite} the sprite to tint
	 * @param color {Float} the color to use to tint the sprite with
	 */
	static function getTintedTexture(sprite:Sprite, color:Float):Dynamic;

	/**
	 * Tint a texture using the "multiply" operation
	 * @method tintWithMultiply
	 * @param texture {Texture} the texture to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintWithMultiply(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture using the "overlay" operation
	 * @method tintWithOverlay
	 * @param texture {Texture} the texture to tint
	 * @param color {Int} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintWithOverlay(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture pixel per pixel
	 * @method tintPerPixel
	 * @param texture {Texture} the texture to tint
	 * @param color {Number} the color to use to tint the sprite with
	 * @param canvas {HTMLCanvasElement} the current canvas
	 */
	static function tintPerPixel(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Rounds the specified color according to the PIXI.CanvasTinter.cacheStepsPerColorChannel
	 * @method roundColor
	 * @param color {Float} the color to round, should be a hex color
	 */
	static function roundColor(color:Float):Void;
}