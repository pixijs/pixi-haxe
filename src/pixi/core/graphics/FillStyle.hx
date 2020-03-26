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

@:native("PIXI.FillStyle")
extern class FillStyle {
	/**
	 * Fill style object for Graphics.
	 */
	function new();

	/**
	 * The alpha value used when filling the Graphics object.
	 */
	var alpha:Float;

	/**
	 * If the current fill is visible.
	 */
	var visible:Bool;

	/**
	 * The hex color value used when coloring the Graphics object.
	 */
	var color:Int;

	/**
	 * The transform applied to the texture.
	 */
	var matrix:String;

	/**
	 * The texture to be used for the fill.
	 */
	var texture:String;

	/**
	 * Clones the object
	 * @return the clone
	 */
	function clone():FillStyle;

	/**
	 * Destroy and don't use after this
	 */
	function destroy():Void;

	/**
	 * Reset
	 */
	function reset():Void;
}
