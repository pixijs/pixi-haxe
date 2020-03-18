package pixi.core.renderers.webgl;

@:native("PIXI.Attribute")
extern class Attribute {
	/**
	 * Holds the information for a single attribute structure required to render geometry.
	 *
	 * This does not contain the actual data, but instead has a buffer id that maps to a PIXI.Buffer This can include anything from positions, uvs, normals, colors etc.
	 * @param	buffer {String} the id of the buffer that this attribute will look for
	 * @param	size {Int} the size of the attribute. If you have 2 floats per vertex (eg position x and y) this would be 2.
	 * @param	normalized {Bool} should the data be normalized.
	 * @param	type {Float} what type of number is the attribute. Check {PIXI.TYPES} to see the ones available
	 * @param	stride {Float} How far apart (in floats) the start of each value is. (used for interleaving data)
	 * @param	start {Int} How far into the array to start reading values (used for interleaving data)
	 */
	function new(buffer:String, ?size:Int, ?normalized:Bool, ?type:Float, stride:Float, start:Int);

	/**
	 * Helper function that creates an Attribute based on the information provided
	 * @param	buffer {String} the id of the buffer that this attribute will look for
	 * @param	size {Int} the size of the attribute. If you have 2 floats per vertex (eg position x and y) this would be 2.
	 * @param	stride {Float} How far apart (in floats) the start of each value is. (used for interleaving data)
	 * @param	start {Int} How far into the array to start reading values (used for interleaving data)
	 * @param	normalized {Int} How far into the array to start reading values (used for interleaving data)
	 * @return {Attribute} A new PIXI.Attribute based on the information provided
	 */
	function from(buffer:String, ?size:Int, normalized:Bool, ?start:Int, type:Float, ?stride:Float):Attribute;

	/**
	 * Destroys the Attribute.
	 */
	function destroy():Void;
}
