package phaser.pixi.renderers.webgl.shaders;

@:native("PIXI.ComplexPrimitiveShader")
extern class ComplexPrimitiveShader {
	
	/**
	* @class ComplexPrimitiveShader
	* @constructor
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function new (gl:Dynamic);
	
	/**
     * @property gl
     * @type WebGLContext
     */
	var gl:Dynamic;
	
	/**
    * @property {any} program - The WebGL program.
    */
	var program:Dynamic;
	
	/**
     * @property fragmentSrc
     * @type Array
     */
	var fragmentSrc:Dynamic;
	
	/**
     * @property vertexSrc
     * @type Array
     */
	var vertexSrc:Dynamic;

	/**
	 * Initialises the shader
	 * @method init
	 *
	 */
	function init():Void;

	/**
	 * Destroys the shader
	 * @method destroy
	 *
	 */
	function destroy():Void;
}