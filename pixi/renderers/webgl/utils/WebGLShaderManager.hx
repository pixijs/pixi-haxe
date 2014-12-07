package pixi.renderers.webgl.utils;

@:native("PIXI.WebGLShaderManager")
extern class WebGLShaderManager {

	/**
	 * @class WebGLShaderManager
	 */
	function new();

	/**
	 * @property maxAttibs
	 * @type Number
	 */
	var maxAttibs:Int;

	/**
	 * @property attribState
	 * @type Array
	 */
	var attribState:Array<Bool>;

	/**
	 * @property tempAttribState
	 * @type Array
	 */
	var tempAttribState:Array<Bool>;

	/**
	 * @property stack
	 * @type Array
	 */
	var stack:Array<Dynamic>;

	/**
	* @method setContext
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function setContext(gl:Dynamic):Void;

	/**
	* Takes the attributes given in parameters.
	*
	* @method setAttribs
	* @param attribs {Array} attribs
	*/
	function setAttribs(attribs:Array<Dynamic>):Void;

	/**
	* Sets the current shader.
	*
	* @method setShader
	* @param shader {Any}
	*/
	function setShader(shader:Dynamic):Void;

	/**
	* Destroys this object.
	*
	* @method destroy
	*/
	function destroy():Void;
}