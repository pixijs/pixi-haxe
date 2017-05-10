package pixi.mesh;

import js.html.Uint16Array;
import js.html.Float32Array;
import pixi.core.math.Point;
import pixi.core.textures.Texture;

@:native("PIXI.mesh.Rope")
extern class Rope extends Mesh {

	/**
	 * The rope allows you to draw a texture across several points and them manipulate these points
	 *
	 *```js
	 * for (i in 0 ... 20) {
	 *     points.push(new Point(i * 50, 0));
	 * };
	 * var rope = new Rope(PIXI.Texture.fromImage("snake.png"), points);
	 *  ```
	 *
	 * @class
	 * @extends Mesh
	 * @memberof PIXI.mesh
	 * @param {Texture} texture - The texture to use on the rope.
	 * @param {Array<Point>} points - An array of {Point} objects to construct var rope.
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
	 * refreshes vertices on every updateTransform
	 * @member {boolean}
	 * @default true
	 */
	var autoUpdate:Bool;
}