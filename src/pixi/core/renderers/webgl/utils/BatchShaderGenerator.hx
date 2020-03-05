package pixi.core.renderers.webgl.utils;

extern class BatchShaderGenerator {
	/**
	 * Helper that generates batching multi-texture shader. Use it with your new BatchRenderer
	 */
	function new(vertexSrc:String, fragTemplate:String);

	/**
	 * Reference to the fragement shader template. Must contain "%count%" and "%forloop%".
	 */
	var fragTemplate:String;

	/**
	 * Reference to the vertex shader source.
	 */
	var vertexSrc:String;
}
