package phaser.pixi.filters;

@:native("PIXI.NormalMapFilter")
extern class NormalMapFilter {
	
	/**
	 * The texture used for the displacemtent map * must be power of 2 texture at the moment
	 */
	var map:Dynamic;
	
	/**
	 * The multiplier used to scale the displacement result from the map calculation.
	 */
	var scale:Dynamic;
	
	/**
	 * The offset used to move the displacement map.
	 */
	var offset:Dynamic;
	
}
