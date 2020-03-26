package pixi.core.renderers.webgl;

import haxe.extern.EitherType;
import js.lib.Float32Array;

@:native("PIXI.Program")
extern class Program {
	/**
	 * Helper class to create a shader program.
	 * @param	vertextSrc The source of the vertex shader.
	 * @param	fragmentSrc The source of the fragment shader.
	 * @param	name Name for shader
	 */
	function new(?vertextSrc:String, ?fragmentSrc:String, ?name:String);

	static var defaultFragmentSrc:String;
	static var defaultVertexSrc:String;

	var fragmentSrc:String;
	var vertexSrc:String;

	/**
	 * A short hand function to create a program based of a vertex and fragment shader this method will also check to see if there is a cached program.
	 * @param	vertexSrc {String} The source of the vertex shader.
	 * @param	fragmentSrc {String} The source of the fragment shader.
	 * @param	uniforms {Dynamic} Custom uniforms to use to augment the built-in ones.
	 * @return {Program} an shiny new Pixi shader!
	 */
	function from(?vertexSrc:String, ?fragmentSrc:String, ?uniforms:Dynamic):Program;

	/**
	 * Extracts the data for a buy creating a small test program or reading the src directly.
	 * @param	vertexSrc {String} The source of the vertex shader.
	 * @param	fragmentSrc {String} The source of the fragment shader.
	 */
	private function extractData(vertexSrc:String, fragmentSrc:String):Void;
}
