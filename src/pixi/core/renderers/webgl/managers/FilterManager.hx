package pixi.core.renderers.webgl.managers;

import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.sprites.Sprite;

extern class FilterManager extends WebGLManager {

	/**
	 * @class
	 * @memberof PIXI
	 * @extends WebGlManager
	 * @param renderer {WebGLRenderer} The renderer this manager works for.
	 */
	function new(renderer:WebGLRenderer);

	/**
	 * @member {any[]}
	 */
	var filterStack:Array<Dynamic>;

	/**
	 * @member {any[]}
	 */
	var texturePool:Array<Dynamic>;

	/**
	 * @param renderer {WebGLRenderer}
	 * @param buffer {ArrayBuffer}
	 */
	function setFilterStack(filterStack:Dynamic):Void;
	
	/**
	 * Applies the filter and adds it to the current filter stack.
	 *
	 * @param filterBlock {object} the filter that will be pushed to the current filter stack
	 */
	function pushFilter(target:Dynamic, filters:Dynamic):Void;

	/**
	 * Removes the last filter from the filter stack and returns it.
	 *
	 */
	function popFilter():Void;

	/**
	 * Grabs an render target from the internal pool
	 *
	 * @param clear {Bool} Whether or not we need to clear the RenderTarget
	 * @return {RenderTarget}
	 */
	function getRenderTarget(?clear:Bool):Dynamic;

	/*
	 * Returns a RenderTarget to the internal pool
	 * @param renderTarget {RenderTarget} The RenderTarget we want to return to the pool
	 */
	function returnRenderTarget(renderTarget:Dynamic):Dynamic;

	/*
	 * Applies the filter
	 * @param shader {Shader} The shader to upload
	 * @param inputTarget {RenderTarget}
	 * @param outputTarget {RenderTarget}
	 * @param clear {Bool} Whether or not we want to clear the outputTarget
	 */
	function applyFilter(shader:Dynamic, inputTarget:Dynamic, outputTarget:Dynamic, ?clear:Bool):Void;

	/*
	 * Constrains the filter area to the texture size
	 * @param filterArea {Rectangle} The filter area we want to cap
	 */
	function capFilterArea(filterArea:Rectangle):Void;

	/*
	 * Resizes all the render targets in the pool
	 * @param width {Float} the new width
	 * @param height {Float} the new height
	 */
	function resize(width:Float, height:Float):Void;
	
	/*
	 * Multiply vTextureCoord to this matrix to achieve (0,0,1,1) for filterArea
	 * @param output {PIXI.Matrix} The mapped matrix.
	 */
	function calculateNormalizedScreenSpaceMatrix(output:Matrix):Void;
	
	/**
	 * Calculates the mapped matrix.
	 * TODO playing around here.. this is temporary - (will end up in the shader) this returns a matrix that will normalise map filter cords in the filter to screen space
	 * @param	output {PIXI.Matrix} The mapped matrix.
	 */
	function calculateScreenSpaceMatrix(output:Matrix):Void;	
	
	/**
	 * This will map the filter coord so that a texture can be used based on the transform of a sprite
	 * @param	output {PIXI.Matrix} The mapped matrix.
	 * @param	sprite {PIXI.Sprite} The sprite to map to.
	 */
	function calculateSpriteMatrix(output:Matrix, sprite:Sprite):Void;
}