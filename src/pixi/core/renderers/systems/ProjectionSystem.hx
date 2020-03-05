package pixi.core.renderers.systems;

import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;

@:native("PIXI.systems.ProjectionSystem")
extern class ProjectionSystem extends System {
	/**
	 * Default destination frame
	 */
	var defaultFrame(default, null):Rectangle;

	/**
	 * Destination frame
	 */
	var destinationFrame(default, null):Rectangle;

	/**
	 * Project matrix
	 */
	var projectionMatrix(default, null):Matrix;

	/**
	 * Source frame
	 */
	var sourceFrame(default, null):Rectangle;

	/**
	 * A transform that will be appended to the projection matrix if null, nothing will be applied
	 */
	var transform:Matrix;

	/**
	 * System plugin to the renderer to manage the projection matrix.
	 * @param	renderer The renderer this manager works for
	 */
	function new(renderer:Renderer);

	/**
	 * Updates the projection matrix based on a projection frame (which is a rectangle)
	 * @param	destinationFrame The destination frame.
	 * @param	sourceFrame The source frame.
	 * @param	resolution Resolution
	 * @param	root If is root
	 */
	function calculateProjection(destinationFrame:Rectangle, sourceFrame:Rectangle, resolution:Float, root:Bool):Void;

	/**
	 * Generic destroy methods to be overridden by the subclass
	 * @param	matrix Sets the transform of the active render target to the given matrix
	 */
	function setTransform(matrix:Matrix):Void;

	/**
	 * Updates the projection matrix based on a projection frame (which is a rectangle)
	 * @param	destinationFrame The destination frame.
	 * @param	sourceFrame The source frame.
	 * @param	resolution Resolution
	 * @param	root If is root
	 */
	function update(destinationFrame:Rectangle, sourceFrame:Rectangle, resolution:Float, root:Bool):Void;
}
