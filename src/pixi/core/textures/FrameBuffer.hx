package pixi.core.textures;

@:native("PIXI.FrameBuffer")
extern class FrameBuffer {
	/**
	 * Reference to the colorTexture.
	 */
	var colorTexture(default, null):Array<Texture>;

	/**
	 * Frame buffer used by the BaseRenderTexture
	 * @param	width Width of the frame buffer
	 * @param	height height of the frame buffer
	 */
	public function new(width:Float, height:Float);

	/**
	 * Add texture to the colorTexture array
	 * @param	index Index of the array to add the texture to
	 * @param	texture Texture to add to the array
	 */
	function addColorTexture(?index:Int, ?texture:Texture):Void;

	/**
	 * Add a depth texture to the frame buffer
	 * @param	texture Texture to add
	 */
	function addDepthTexture(?texture:Texture):Void;

	/**
	 * disposes WebGL resources that are connected to this geometry
	 */
	function dispose():Void;

	/**
	 * Enable depth on the frame buffer
	 */
	function enableDepth():Void;

	/**
	 * Enable stencil on the frame buffer
	 */
	function enableStencil():Void;

	/**
	 * Resize the frame buffer
	 * @param	width Width of the frame buffer to resize to
	 * @param	height Height of the frame buffer to resize to
	 */
	function resize(width:Float, height:Float):Void;
}
