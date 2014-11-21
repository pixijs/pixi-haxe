package pixi.renderers.webgl.utils;

import pixi.textures.Texture;
import pixi.filters.AbstractFilter;

@:native("PIXI.WebGLFilterManager")
extern class WebGLFilterManager {

	/**
	 * @class WebGLFilterManager
	 * @constructor
	 */
	function new();

	/**
	* Initialises the context and the properties.
	*
	* @method setContext
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function setContext(gl:Dynamic):Void;

	/**
	* @method begin
	* @param renderSession {RenderSession}
	* @param buffer {ArrayBuffer}
	*/
	function begin(renderSession:Dynamic, buffer:Dynamic):Void;

	/**
	* Applies the filter and adds it to the current filter stack.
	*
	* @method pushFilter
	* @param filterBlock {Object} the filter that will be pushed to the current filter stack
	*/
	function pushFilter(filterBlock:Dynamic):Void;

	/**
	* Removes the last filter from the filter stack and doesn't return it.
	*
	* @method popFilter
	*/
	function popFilter():Void;

	/**
	* Applies the filter to the specified area.
	*
	* @method applyFilterPass
	* @param filter {AbstractFilter} the filter that needs to be applied
	* @param filterArea {texture} TODO - might need an update
	* @param width {Number} the horizontal range of the filter
	* @param height {Number} the vertical range of the filter
	*/
	function applyFilterPass(filter:AbstractFilter, filterArea:Texture, width:Float, height:Float):Void;

	/**
	* Initialises the shader buffers.
	*
	* @method initShaderBuffers
	*/
	function initShaderBuffers():Void;

	/**
	* Destroys the filter and removes it from the filter stack.
	*
	* @method destroy
	*/
	function destroy():Void;
}