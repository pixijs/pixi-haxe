package pixi.core.graphics;

import pixi.core.Pixi.BlendModes;
import pixi.core.Pixi.ScaleModes;
import pixi.core.display.Container;
import pixi.core.math.Point;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Circle;
import pixi.core.math.shapes.Ellipse;
import pixi.core.math.shapes.Polygon;
import pixi.core.math.shapes.Rectangle;
import pixi.core.textures.Texture;

@:native("PIXI.LineStyle")
extern class LineStyle extends FillStyle {
	/**
	 * Fill style object for Graphics.
	 */
	function new();

	/**
	 * The alignment of any lines drawn (0.5 = middle, 1 = outter, 0 = inner).
	 */
	var alignment:Float;

	/**
	 * If true the lines will be draw using LINES instead of TRIANGLE_STRIP
	 */
	var native:Bool;

	/**
	 * The width (thickness) of any lines drawn.
	 */
	var width:Float;
}
