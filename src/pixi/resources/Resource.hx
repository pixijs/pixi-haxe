package pixi.resources;

import js.lib.Promise;
import pixi.core.renderers.webgl.GLTexture;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.textures.BaseTexture;

@:native("PIXI.resources.Resource")
extern class Resource {
	/**
	 * Base resource class for textures that manages validation and uploading, depending on its type.
	 * Uploading of a base texture to the GPU is required.
	 * @param	width Width of the resource
	 * @param	height Height of the resource
	 */
	function new(?width:Float, ?height:Float);

	/**
	 * Internal height of the resource
	 */
	private var _height:Float;

	/**
	 * Internal width of the resource
	 */
	private var _width:Float;

	/**
	 * If resource has been destroyed
	 */
	var destroyed(default, null):Bool;

	/**
	 * The height of the resource.
	 */
	var height(default, null):Float;

	/**
	 * true if resource is created by BaseTexture useful for doing cleanup with BaseTexture destroy and not cleaning up resources that were created externally.
	 */
	var internal(default, null):Bool;

	/**
	 * Has been validated
	 */
	var valid(default, null):Bool;

	/**
	 * The width of the resource.
	 */
	var width(default, null):Float;

	/**
	 * Bind to a parent BaseTexture
	 * @param	baseTexture Parent texture
	 */
	function bind(baseTexture:BaseTexture):Void;

	/**
	 * Call when destroying resource, unbind any BaseTexture object before calling this method, as reference counts are maintained internally.
	 */
	function destroy():Void;

	/**
	 * Clean up anything, this happens when destroying is ready.
	 */
	private function dispose():Void;

	/**
	 * This can be overridden to start preloading a resource or do any other prepare step.
	 * @return Handle the validate event
	 */
	private function load():Promise<Void>;

	/**
	 * Trigger a resize event
	 */
	function resize():Void;

	/**
	 * Set the style, optional to override
	 * @param	renderer yeah, renderer!
	 * @param	baseTexture the texture
	 * @param	glTexture texture instance for this webgl context
	 * @return true is success
	 */
	function style(renderer:Renderer, baseTexture:BaseTexture, glTexture:GLTexture):Bool;

	/**
	 * Unbind to a parent BaseTexture
	 * @param	baseTexture
	 */
	function unbind(baseTexture:BaseTexture):Void;

	/**
	 * Has been updated trigger event
	 */
	function update():Void;

	/**
	 * Uploads the texture or returns false if it cant for some reason. Override this.
	 * @param	renderer yeah, renderer!
	 * @param	baseTexture the texture
	 * @param	glTexture texture instance for this webgl context
	 * @return true is success
	 */
	function upload(renderer:Renderer, baseTexture:BaseTexture, glTexture:GLTexture):Bool;
}
