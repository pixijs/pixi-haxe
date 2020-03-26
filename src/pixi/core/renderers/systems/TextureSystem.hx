package pixi.core.renderers.systems;

import haxe.extern.EitherType;
import pixi.core.Pixi.GCModes;
import pixi.core.display.DisplayObject;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.textures.BaseTexture;
import pixi.core.textures.Texture;

@:native("PIXI.systems.TextureSystem")
extern class TextureSystem extends System {
	/**
	 * Bound textures
	 */
	var boundTextures(default, null):Array<BaseTexture>;

	/**
	 * Current location
	 */
	var currentLocation(default, null):Float;

	/**
	 * List of managed textures
	 */
	var managedTextures(default, null):Array<BaseTexture>;

	/**
	 * BaseTexture value that shows that we don't know what is bound
	 */
	var unknownTexture(default, null):BaseTexture;

	/**
	 * System plugin to the renderer to manage textures.
	 * @param	renderer The renderer this system works for
	 */
	function new(renderer:Renderer);

	/**
	 * Bind a texture to a specific location
	 * If you want to unbind something, please use unbind(texture) instead of bind(null, textureLocation)
	 * @param	texture Texture to bind
	 * @param	location Location to bind at
	 */
	function bind(texture:EitherType<Texture, BaseTexture>, ?location:Float):Void;

	/**
	 * Sets up the renderer context and necessary buffers.
	 */
	function contextChange():Void;

	/**
	 * Resets texture location and bound textures. Actual bind(null, i) calls will be performed at next unbind() call
	 */
	function reset():Void;

	/**
	 * Unbind a texture
	 * @param	texture Texture to bind
	 */
	function unbind(texture:EitherType<Texture, BaseTexture>):Void;
}
