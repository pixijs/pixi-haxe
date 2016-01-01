package pixi.mesh;

import pixi.core.math.Point;
import pixi.core.textures.Texture;

@:native("PIXI.mesh.Rope")
extern class Rope extends Mesh {

	/**
	 * The rope allows you to draw a texture across several points and them manipulate these points
	 *
	 *```js
	 * for (var i = 0; i < 20; i++) {
	 *     points.push(new PIXI.Point(i * 50, 0));
	 * };
	 * var rope = new PIXI.Rope(PIXI.Texture.fromImage("snake.png"), points);
	 *  ```
	 *
	 * @class
	 * @extends Mesh
	 * @memberof PIXI.mesh
	 * @param {Texture} texture - The texture to use on the rope.
	 * @param {Array} points - An array of {Point} objects to construct var rope.
	 *
	 */
	function new(texture:Texture, ?points:Array<Point>);

	/*
	 * @member {Array<Point>} An array of points that determine the rope
	 */
	var points:Array<Point>;

	/*
	 * @member {Array<Float>} An array containing the color components
	 */
	var colors:Array<Float>;

	/**
	 * Refreshes
	 *
	 */
	function refresh():Void;
}