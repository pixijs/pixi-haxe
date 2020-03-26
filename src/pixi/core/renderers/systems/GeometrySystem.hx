package pixi.core.renderers.systems;

import js.html.webgl.ContextEvent;
import js.html.webgl.RenderingContext;
import pixi.core.Pixi.BlendModes;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Buffer;
import pixi.core.renderers.webgl.Program;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.State;
import pixi.core.renderers.webgl.UniformGroup;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.renderers.webgl.utils.ObjectRenderer;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;
import pixi.core.textures.FrameBuffer;
import pixi.mesh.Geometry;

@:native("PIXI.systems.GeometrySystem")
extern class GeometrySystem extends System {
	/**
	 * A cache of currently bound buffer, contains only two members with keys ARRAY_BUFFER and ELEMENT_ARRAY_BUFFER
	 */
	var boundBuffers(default, null):Array<Buffer>;

	/**
	 * true if support gl.UNSIGNED_INT in gl.drawElements or gl.drawElementsInstanced
	 */
	var canUseUInt32ElementIndex(default, null):Bool;

	/**
	 * true if has ANGLE_instanced_arrays extension
	 */
	var hasInstance(default, null):Bool;

	/**
	 * true if we has *_vertex_array_object extension
	 */
	var hasVao(default, null):Bool;

	/**
	 * Cache for all buffers by id, used in case renderer gets destroyed or for profiling
	 */
	var managedBuffers(default, null):Dynamic;

	/**
	 * System plugin to the renderer to manage framebuffers.
	 * @param	renderer The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * Activate vertex array object
	 * @param	geometry Geometry instance
	 * @param	program Shader program instance
	 */
	private function activateVao(geometry:Geometry, program:Program):Void;

	/**
	 * Binds geometry so that is can be drawn. Creating a Vao if required
	 * @param	geometry Geometry instance
	 * @param	program Shader program instance
	 */
	function bind(geometry:Geometry, ?program:Program):Void;

	/**
	 * Check compability between a geometry and a program
	 * @param	geometry Geometry instance
	 * @param	program Shader program instance
	 */
	private function checkCompatibility(geometry:Geometry, program:Program):Void;

	/**
	 * Sets up the renderer context and necessary buffers.
	 */
	function contextChange():Void;

	/**
	 * dispose all WebGL resources of all managed geometries and buffers
	 * @param	contextLost If context was lost, we suppress gl.delete calls
	 */
	function disposeAll(?contextLost:Bool):Void;

	/**
	 * Disposes buffer
	 * @param	buffer buffer with data
	 * @param	contextLost If context was lost, we suppress deleteVertexArray
	 */
	function disposeBuffer(buffer:Buffer, ?contextLost:Bool):Void;

	/**
	 * Disposes geometry
	 * @param	geometry Geometry with buffers. Only VAO will be disposed
	 * @param	contextLost If context was lost, we suppress deleteVertexArray
	 */
	function disposeGeometry(geometry:Geometry, ?contextLost:Bool):Void;

	/**
	 * Draw the geometry
	 * @param	type the type primitive to render
	 * @param	size the number of elements to be rendered
	 * @param	start starting index
	 * @param	instanceCount the number of instances of the set of elements to execute
	 */
	function draw(type:Float, ?size:Int, ?start:Int, ?instanceCount:Int):Void;

	/**
	 * Takes a geometry and program and generates a unique signature for them.
	 * @param	geometry to get signature from
	 * @param	program to test geometry against
	 * @return Unique signature of the geometry and program
	 */
	private function getSignature(geometry:Geometry, program:Program):String;

	/**
	 * Creates or gets Vao with the same structure as the geometry and stores it on the geometry. If vao is created, it is bound automatically.
	 * @param	geometry Instance of geometry to to generate Vao for
	 * @param	program Instance of program
	 */
	private function initGeometryVao(geometry:Geometry, program:Program):Void;

	/**
	 * Reset and unbind any active VAO and geometry
	 */
	function reset():Void;

	/**
	 * Unbind/reset everything
	 */
	private function unbind():Void;

	/**
	 * Update buffers
	 */
	private function updateBuffers():Void;
}
