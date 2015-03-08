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
	 * @namespace PIXI
	 */
	function new(size:Int, properties:Array<Bool>);

}