package pixi.core.renderers.canvas.utils;

import js.html.CanvasElement;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

@:native("PIXI.canvasUtils")
extern class CanvasUtils {
	/**
	 * Number of steps which will be used as a cap when rounding colors.
	 */
	static var cacheStepsPerColorChannel:Int;

	/**
	 * Whether or not the Canvas BlendModes are supported, consequently the ability to tint using the multiply method.
	 */
	static var canUseMultiply:Bool;

	/**
	 * Tint cache boolean flag.
	 */
	static var convertTintToImage:Bool;

	static function getTintedCanvas(sprite:Sprite, color:Int):CanvasElement;

	/**
	 * Rounds the specified color according to the canvasUtils.cacheStepsPerColorChannel.
	 * @param	color the color to round, should be a hex color
	 * @return The rounded color.
	 */
	static function roundColor(color:Int):Int;

	/**
	 * The tinting method that will be used.
	 */
	static function tintMethod():Void;

	/**
	 * Tint a texture using the 'multiply' operation.
	 * @param	texture the texture to tint
	 * @param	color the color to use to tint the sprite with
	 * @param	canvas the current canvas
	 */
	static function tintWithMultiply(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture using the 'overlay' operation.
	 * @param	texture the texture to tint
	 * @param	color the color to use to tint the sprite with
	 * @param	canvas the current canvas
	 */
	static function tintWithOverlay(texture:Texture, color:Int, canvas:CanvasElement):Void;

	/**
	 * Tint a texture pixel per pixel.
	 * @param	texture the texture to tint
	 * @param	color the color to use to tint the sprite with
	 * @param	canvas the current canvas
	 */
	static function tintWithPerPixel(texture:Texture, color:Int, canvas:CanvasElement):Void;
}
