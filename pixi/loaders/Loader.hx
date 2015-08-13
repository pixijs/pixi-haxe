package pixi.loaders;

@:native("PIXI.loaders.Loader")
extern class Loader extends ResourceLoader {

	/**
	 *
	 * The new loader, extends Resource Loader by Chad Engler : https://github.com/englercj/resource-loader
	 *
	 * ```js
	 * 	var loader = new PIXI.loader();
	 *
	 * loader.add('spineboy',"data/spineboy.json");
	 *
	 * loader.once('complete',onAssetsLoaded);
	 *
	 * loader.load();
	 * ```
	 *
	 * @class
	 * @extends ResourceLoader
	 * @memberof PIXI.loaders
	 */
	function new();
}