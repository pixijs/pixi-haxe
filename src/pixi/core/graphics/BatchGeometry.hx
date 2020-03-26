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
import pixi.core.renderers.webgl.Buffer;
import pixi.core.textures.Texture;

@:native("PIXI.BatchGeometry")
extern class BatchGeometry extends Container {
	function new(?_static:Bool = false);

	/**
	 * Buffer used for position, color, texture IDs
	 */
	private var _buffer:Buffer;

	/**
	 * Index buffer data
	 */
	private var _indexBuffer:Buffer;
}
