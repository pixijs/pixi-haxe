package pixi.core.particles;

import pixi.core.display.Container;

@:native("PIXI.ParticleContainer")
extern class ParticleContainer extends Container {

	/**
	 * The ParticleContainer class is a really fast version of the Container built solely for speed,
	 * so use when you need a lot of sprites or particles. The tradeoff of the ParticleContainer is that advanced
	 * functionality will not work. ParticleContainer implements only the basic object transform (position, scale, rotation).
	 * Any other functionality like tinting, masking, etc will not work on sprites in this batch.
	 *
	 * It's extremely easy to use :
	 *
	 * ```js
	 * var container = new ParticleContainer();
	 *
	 * for (var i = 0; i < 100; ++i)
	 * {
	 *     var sprite = new PIXI.Sprite.fromImage("myImage.png");
	 *     container.addChild(sprite);
	 * }
	 * ```
	 *
	 * And here you have a hundred sprites that will be renderer at the speed of light.
	 *
	 * @class
	 * @extends PIXI.Container
	 * @memberof PIXI
	 *
	 * @param [size=15000] {number} The number of images in the SpriteBatch before it flushes.
	 * @param [properties] {object} The properties of children that should be uploaded to the gpu and applied.
	 * @param [properties.scale=false] {boolean} When true, scale be uploaded and applied.
	 * @param [properties.position=true] {boolean} When true, position be uploaded and applied.
	 * @param [properties.rotation=false] {boolean} When true, rotation be uploaded and applied.
	 * @param [properties.uvs=false] {boolean} When true, uvs be uploaded and applied.
	 * @param [properties.alpha=false] {boolean} When true, alpha be uploaded and applied.
	 */
	function new(?size:Int, ?properties:Array<Bool>);

	/**
	 * Sets the private properties array to dynamic / static based on the passed properties object
	 *
	 * @param properties {object} The properties to be uploaded
	 */
	function setProperties(properties:Array<Bool>):Void;
}