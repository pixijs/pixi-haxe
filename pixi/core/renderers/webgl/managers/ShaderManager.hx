package pixi.core.renderers.webgl.managers;

extern class ShaderManager extends WebGLManager {

	/**
	 * @class
	 * @memberof PIXI
	 * @extends WebGLManager
	 * @param renderer {WebGLRenderer} The renderer this manager works for.
	 */
	function new(renderer:WebGLRenderer);

	/**
	 * @member {number}
	 */
	var maxAttibs:Int;

	/**
	 * @member {any[]}
	 */
	var attribState:Array<Dynamic>;

	/**
	 * @member {any[]}
	 */
	var tempAttribState:Array<Dynamic>;

	/**
	 * @member {any[]}
	 */
	var stack:Array<Dynamic>;

	/**
	 * Takes the attributes given in parameters and uploads them.
	 *
	 * @param attribs {Array} attribs
	 */
	function setAttribs(attribs:Array<Dynamic>):Void;

	/**
	 * Sets the current shader.
	 *
	 * @param shader {Shader} the shader to upload
	 */
	function setShader(shader:Dynamic):Void;
}