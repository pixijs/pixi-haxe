package pixi.core.renderers.webgl.filters;
import pixi.core.renderers.webgl.managers.FilterManager;
import pixi.core.renderers.webgl.utils.RenderTarget;

@:native("PIXI.Filter")
extern class Filter {

	/**
	 * The default vertex shader source
	 *
	 * @static
	 * @constant
	 */
	static var defaultVertexSrc:Dynamic;

	/**
	 * The default fragment shader source
	 *
	 * @static
	 * @constant
	 */
	static var defaultFragmentSrc:Dynamic;

	/**
	 * @class
	 * @memberof PIXI
	 * @param [vertexSrc] {String} The source of the vertex shader.
	 * @param [fragmentSrc] {String} The source of the fragment shader.
	 * @param [uniforms] {Dynamic} Custom uniforms to use to augment the built-in ones.
	 */
	function new(?vertexSrc:String, ?fragmentSrc:String, ?uniforms:Dynamic);

	/**
     * The vertex shader.
     *
     * @member {String}
     */
	var vertexSrc:String;

	/**
     * The fragment shader.
     *
     * @member {String}
     */
	var fragmentSrc:String;

	/**
	 * An object containing the current values of custom uniforms.
	 * @example <caption>Updating the value of a custom uniform</caption>
	 * filter.uniforms.time = performance.now();
	 *
	 * @member {Dynamic}
	 */
	var uniforms:Dynamic;

	/**
	 * The padding of the filter. Some filters require extra space to breath such as a blur.
	 * Increasing this will add extra width and height to the bounds of the object that the
	 * filter is applied to.
	 *
	 * @member {Float}
	 */
	var padding:Float;

	/**
	 * The resolution of the filter. Setting this to be lower will lower the quality but
	 * increase the performance of the filter.
	 *
	 * @member {Float}
	 */
	var resolution:Float;

	/**
	 * If enabled is true the filter is applied, if false it will not.
	 *
	 * @member {Bool}
	 */
	var enabled:Bool;

	/*
	 * Applies the filter
	 * @param filterManager {Dynamic}
	 * @param input {RenderTarget}
	 * @param output {RenderTarget}
	 * @param clear {Bool} Whether or not we want to clear the outputTarget
	 * @param {object} [currentState] - It's current state of filter.
     *        There are some useful properties in the currentState :
     *        target, filters, sourceFrame, destinationFrame, renderTarget, resolution
	 */
	function apply(filterManager:FilterManager, input:RenderTarget, output:RenderTarget, ?clear:Bool, ?currentState:Dynamic):Void;
}