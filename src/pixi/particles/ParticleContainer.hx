package pixi.particles;

import pixi.core.display.Container;


/**
 * The properties of children that should be uploaded to the gpu and applied.
 */
typedef ParticleContainerProperties = {
	
	/**
	 * When true, scale be uploaded and applied
	 * @default false
	 * @member {Bool}	 
	 */
	?scale:Bool,
	
	/**
	 * When true, position be uploaded and applied
	 * @default true
	 * @member {Bool}
	 */
	?position:Bool,
	
	/**
	 * When true, rotation be uploaded and applied
	 * @default false
	 * @member {Bool}
	 */
	?rotation:Bool,
	
	/**
	 * When true, uvs be uploaded and applied
	 * @default false
	 * @member {Bool}
	 */
	?uvs:Bool,
	
	/**
	 * When true, alpha be uploaded and applied
	 * @default false
	 * @member {Bool}
	 */
	?alpha:Bool
}

@:native("PIXI.particles.ParticleContainer")
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
	 * for (i in 0 ... 100) {
	 *     var sprite = new Sprite.fromImage("myImage.png");
	 *     container.addChild(sprite);
	 * }
	 * ```
	 *
	 * And here you have a hundred sprites that will be renderer at the speed of light.
	 *
	 * @class
	 * @extends Container
	 * @memberof PIXI
	 *
	 * @param [maxSize=15000] {Int} The number of images in the SpriteBatch before it flushes.
	 * @param [properties] {ParticleContainerProperties} The properties of children that should be uploaded to the gpu and applied.
	 * @param [batchSize=15000] {Int} Number of particles per batch.
	 */
	function new(?maxSize:Int, ?properties:ParticleContainerProperties, ?batchSize:Int);

	/**
	 * Sets the private properties array to dynamic / static based on the passed properties object
	 *
	 * @param properties {object} The properties to be uploaded
	 */
	function setProperties(properties:ParticleContainerProperties):Void;
}