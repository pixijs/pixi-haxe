package pixi.mesh;

import pixi.core.math.Point;
import pixi.core.textures.Texture;

@:native("PIXI.mesh.Plane")
extern class Plane extends Mesh {

	/**
	 * The Plane allows you to draw a texture across several points and them manipulate these points
	 *
	 *```haxe
	 * for (var i in 0 ... 20) {
	 *     points.push(new Point(i * 50, 0));
	 * };
	 * var Plane = new Plane(Texture.fromImage("snake.png"), points);
	 *  ```
	 *
	 * @class
	 * @extends PIXI.mesh.Mesh
	 * @memberof PIXI.mesh
	 * @param {Texture} texture - The texture to use on the Plane.
	 * @param {Int} segmentsX - The number ox x segments
	 * @param {Int} segmentsY - The number of y segments
	 *
	 */
	function new(texture:Texture, segmentsX:Int, segmentsY:Int);

	var segmentsX:Int;
	var segmentsY:Int;

	/**
	 * Refreshes
	 *
	 */
	function refresh():Void;
}