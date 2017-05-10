package pixi.mesh;

import pixi.core.textures.Texture;

@:native("PIXI.mesh.Plane")
extern class Plane extends Mesh {

	/**
	 * The Plane allows you to draw a texture across several points and them manipulate these points
	 *
	 *```js
	 * for (i in 0 ... 20) {
	 *     points.push(new Point(i * 50, 0));
	 * };
	 * var Plane = new Plane(Texture.fromImage("snake.png"), points);
	 *  ```
	 *
	 * @class
	 * @extends PIXI.mesh.Mesh
	 * @memberof PIXI.mesh
	 * @param {Texture} texture - The texture to use on the Plane.
	 * @param {Int} verticesX - The number of vertices in the x-axis
	 * @param {Int} verticesY - The number of vertices in the y-axis
	 *
	 */
	function new(texture:Texture, verticesX:Int, verticesY:Int);

	var verticesX:Int;
	var verticesY:Int;
}