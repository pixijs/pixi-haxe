package pixi.core.graphics;

import pixi.core.display.Bounds;
import pixi.core.math.Matrix;
import pixi.core.math.Point;
import pixi.core.renderers.webgl.Buffer;
import pixi.core.textures.Texture;

@:native("PIXI.GraphicsGeometry")
extern class GraphicsGeometry extends BatchGeometry {
	/**
	 * The Graphics class contains methods used to draw primitive shapes such as lines, circles and rectangles to the display, and to color and fill them.
	 * GraphicsGeometry is designed to not be continually updating the geometry since it's expensive to re-tesselate using earcut. Consider using PIXI.Mesh for this use-case, it's much faster.
	 */
	function new();

	/**
	 * The maximum number of points to consider an object "batchable", able to be batched by the renderer's batch system.
	 */
	static var BATCHABLE_SIZE:Int;

	/**
	 * Cached bounds.
	 */
	private var _bounds:Bounds;

	/**
	 * Batches need to regenerated if the geometry is updated.
	 */
	private var batchDirty:Int;

	/**
	 * Intermediate abstract format sent to batch system. Can be converted to drawCalls or to batchable objects.
	 */
	private var batches:Array<Dynamic>;

	/**
	 * Get the current bounds of the graphic geometry.
	 */
	var bounds(default, null):Bounds;

	/**
	 * The bounds dirty flag.
	 */
	private var boundsDirty:Int;

	/**
	 * Padding to add to the bounds.
	 */
	var boundsPadding:Float;

	/**
	 * Used to check if the cache is dirty.
	 */
	private var cacheDirty:Int;

	/**
	 * Used to detect if we cleared the graphicsData.
	 */
	private var cleanDirty:Int;

	/**
	 * Minimal distance between points that are considered different. Affects line tesselation.
	 */
	var closePointEps:Float;

	/**
	 * The collection of colors
	 */
	private var colors:Array<Int>;

	/**
	 * Used to detect if the graphics object has changed.
	 */
	private var dirty:Int;

	/**
	 * List of current draw calls drived from the batches.
	 */
	private var drawCells:Array<Dynamic>;

	/**
	 * The collection of drawn shapes.
	 */
	private var graphicsData:Array<GraphicsData>;

	/**
	 * The indices of the vertices
	 */
	private var indices:Array<Int>;

	/**
	 * An array of points to draw, 2 numbers per point
	 */
	private var points:Array<Float>;

	/**
	 * Index of the last batched shape in the stack of calls.
	 */
	private var shapeIndex:Int;

	/**
	 * Reference to the texture IDs.
	 */
	private var textureIds:Array<Int>;

	/**
	 * The UVs collection
	 */
	private var uvs:Array<Float>;

	/**
	 * Add colors.
	 * @param	colors List of colors to add to
	 * @param	color Color to add
	 * @param	alpha Alpha to use
	 * @param	size Number of colors to add
	 */
	private function addColors(colors:Array<Int>, color:Int, alpha:Float, size:Int):Void;

	/**
	 * Add texture id that the shader/fragment wants to use.
	 */
	private function addTextureIds(textureIds:Array<Int>, id:Int, size:Int):Void;

	/**
	 * Generates the UVs for a shape.
	 * @param	verts Vertices
	 * @param	uvs UVs
	 * @param	texture Reference to Texture
	 * @param	start Index buffer start index
	 * @param	size The size/length for index buffer.
	 * @param	matrix Optional transform for all points.
	 */
	private function addUvs(verts:Array<Int>, uvs:Array<Int>, texture:Texture, start:Int, size:Int, ?matrix:Matrix):Void;

	/**
	 * Modify uvs array according to position of texture region Does not work with rotated or trimmed textures
	 * @param	uvs UVs
	 * @param	texture Reference to Texture
	 * @param	start Index buffer start index
	 * @param	size The size/length for index buffer.
	 */
	function adjustUvs(uvs:Array<Int>, texture:Array<Int>, start:Int, size:Int):Void;

	/**
	 * Converts intermediate batches data to drawCalls.
	 */
	private function buildDrawCalls():Void;

	/**
	 * Update the local bounds of the object. Expensive to use performance-wise.
	 */
	private function calculateBounds():Void;

	/**
	 * Clears the graphics that were drawn to this Graphics object, and resets fill and line style settings.
	 * @return This GraphicsGeometry object. Good for chaining method calls
	 */
	function clear():GraphicsGeometry;

	/**
	 * Check to see if a point is contained within this geometry.
	 * @param	point Point to check if it's contained.
	 * @return true if the point is contained within geometry.
	 */
	function containsPoint(point:Point):Bool;

	/**
	 * Draws the given shape to this Graphics object. Can be any of Circle, Rectangle, Ellipse, Line or Polygon.
	 * @param	shape The shape object to draw: PIXI.Circle | PIXI.Ellipse | PIXI.Polygon | PIXI.Rectangle | PIXI.RoundedRectangle
	 * @param	matrix Transform applied to the points of the shape.
	 * @return Returns geometry for chaining.
	 */
	function drawHole(shape:Dynamic, matrix:Matrix):GraphicsGeometry;

	/**
	 * Draws the given shape to this Graphics object. Can be any of Circle, Rectangle, Ellipse, Line or Polygon.
	 * @param	shape The shape object to draw: PIXI.Circle | PIXI.Ellipse | PIXI.Polygon | PIXI.Rectangle | PIXI.RoundedRectangle
	 * @param	fillStyle Defines style of the fill.
	 * @param	lineStyle Defines style of the line.
	 * @param	matrix 	Transform applied to the points of the shape.
	 * @return Returns geometry for chaining.
	 */
	function drawShape(shape:Dynamic, fillStyle:FillStyle, lineStyle:LineStyle, matrix:Matrix):GraphicsGeometry;

	/**
	 * Call if you changed graphicsData manually. Empties all batch buffers.
	 */
	function invalidate():Void;

	/**
	 * Checks to see if this graphics geometry can be batched. Currently it needs to be small enough and not contain any native lines.
	 */
	private function isBatchable():Bool;

	/**
	 * Process the holes data.
	 * @param	holes Holes to render
	 */
	private function processHoles(holes:Array<GraphicsData>):Void;

	/**
	 * Transform points using matrix.
	 * @param	points Points to transform
	 * @param	matrix Transform matrix
	 */
	private function transformPoints(points:Array<Float>, matrix:Matrix):Void;

	/**
	 * Generates intermediate batch data. Either gets converted to drawCalls or used to convert to batch objects directly by the Graphics object.
	 */
	function updateBatches():Void;
}
