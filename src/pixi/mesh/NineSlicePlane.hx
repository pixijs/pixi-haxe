package pixi.mesh;

import js.html.CanvasRenderingContext2D;
import pixi.core.textures.Texture;
@:native("PIXI.mesh.NineSlicePlane")
extern class NineSlicePlane extends Plane {

	/**
	 * The NineSlicePlane allows you to stretch a texture using 9-slice scaling. The corners will remain unscaled (useful
	 * for buttons with rounded corners for example) and the other areas will be scaled horizontally and or vertically
	 *
	 *```js
	 * let Plane9 = new NineSlicePlane(Texture.fromImage('BoxWithRoundedCorners.png'), 15, 15, 15, 15);
	 *  ```
	 * <pre>
	 *      A                          B
	 *    +---+----------------------+---+
	 *  C | 1 |          2           | 3 |
	 *    +---+----------------------+---+
	 *    |   |                      |   |
	 *    | 4 |          5           | 6 |
	 *    |   |                      |   |
	 *    +---+----------------------+---+
	 *  D | 7 |          8           | 9 |
	 *    +---+----------------------+---+
	 *  When changing this objects width and/or height:
	 *     areas 1 3 7 and 9 will remain unscaled.
	 *     areas 2 and 8 will be stretched horizontally
	 *     areas 4 and 6 will be stretched vertically
	 *     area 5 will be stretched both horizontally and vertically
	 * </pre>
	 *
	 * @class
	 * @extends PIXI.mesh.Plane
	 * @memberof PIXI.mesh
	 *
	 * @param {Texture} texture - The texture to use on the NineSlicePlane.
     * @param {Float} [leftWidth=10] size of the left vertical bar (A)
     * @param {Float} [topHeight=10] size of the top horizontal bar (C)
     * @param {Float} [rightWidth=10] size of the right vertical bar (B)
     * @param {Float} [bottomHeight=10] size of the bottom horizontal bar (D)
	 */
	function new(texture:Texture, ?leftWidth:Float, ?topHeight:Float, ?rightWidth:Float, ?bottomHeight:Float);

	var leftWidth:Float;
	var rightWidth:Float;
	var topHeight:Float;
	var bottomHeight:Float;

	function updateHorizontalVertices():Void;

	function updateVerticalVertices():Void;

	/**
     * Renders one segment of the plane.
     * to mimic the exact drawing behavior of stretching the image like WebGL does, we need to make sure
     * that the source area is at least 1 pixel in size, otherwise nothing gets drawn when a slice size of 0 is used.
     *
     * @private
     * @param {CanvasRenderingContext2D} context - The context to draw with.
     * @param {CanvasImageSource} textureSource - The source to draw.
     * @param {Float} w - width of the texture
     * @param {Float} h - height of the texture
     * @param {Float} x1 - x index 1
     * @param {Float} y1 - y index 1
     * @param {Float} x2 - x index 2
     * @param {Float} y2 - y index 2
     */
	function drawSegment(context:CanvasRenderingContext2D, textureSource:Dynamic, w:Float, h:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void;
}