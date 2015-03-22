package pixi.loaders;

import pixi.core.textures.Texture;

@:native("PIXI.loaders.Loader")
extern class Loader {

	/**
	 *
	 * The new loader, extends Resource Loader by Chad Engler : https://github.com/englercj/resource-loader
	 *
	 * ```js
	 * var loader = new PIXI.loader();
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

	/**
     * The base url for all resources loaded by this loader.
     *
     * @member {String}
     */
	var baseUrl:String;

	/**
     * The progress percent of the loader going through the queue.
     *
     * @member {Float}
     */
	var progress:Float;

	/**
     * Loading state of the loader, true if it is currently loading resources.
     *
     * @member {Bool}
     */
	var loading:Bool;

	/**
     * The resources waiting to be loaded.
     *
     * @member {Resource[]}
     */
	var queue:Array<Dynamic>;

	/**
     * All the resources for this loader keyed by name.
     *
     * @member {object<string, Resource>}
     */
	var resources:Dynamic;

	function on(type:String, callback:Void -> Void):Void;

	function once(type:String, callback:Void -> Void):Void;

	/**
	 * Adds a resource (or multiple resources) to the loader queue.
	 *
	 * This function can take a wide variety of different parameters. The only thing that is always
	 * required the url to load. All the following will work:
	 *
	 * ```js
	 * loader
	 *     // normal param syntax
	 *     .add('key', 'http://...', function () {})
	 *     .add('http://...', function () {})
	 *     .add('http://...')
	 *
	 *     // object syntax
	 *     .add({
	 *         name: 'key2',
	 *         url: 'http://...'
	 *     }, function () {})
	 *     .add({
	 *         url: 'http://...'
	 *     }, function () {})
	 *     .add({
	 *         name: 'key3',
	 *         url: 'http://...'
	 *         onComplete: function () {}
	 *     })
	 *     .add({
	 *         url: 'https://...',
	 *         onComplete: function () {},
	 *         crossOrigin: true
	 *     })
	 *
	 *     // you can also pass an array of objects or urls or both
	 *     .add([
	 *         { name: 'key4', url: 'http://...', onComplete: function () {} },
	 *         { url: 'http://...', onComplete: function () {} },
	 *         'http://...'
	 *     ]);
	 * ```
	 *
	 * @alias enqueue
	 * @param [name] {string} The name of the resource to load, if not passed the url is used.
	 * @param url {string} The url for this resource, relative to the baseUrl of this loader.
	 * @param [options] {object} The options for the load.
	 * @param [options.crossOrigin] {boolean} Is this request cross-origin? Default is to determine automatically.
	 * @param [options.loadType=Resource.LOAD_TYPE.XHR] {Resource.XHR_LOAD_TYPE} How should this resource be loaded?
	 * @param [options.xhrType=Resource.XHR_RESPONSE_TYPE.DEFAULT] {Resource.XHR_RESPONSE_TYPE} How should the data being
	 *      loaded be interpreted when using XHR?
	 * @param [callback] {function} Function to call when this specific resource completes loading.
	 * @return {Loader}
	 */
	function add(name:String, url:String, ?options:LoaderOptions, ?callback:Resource -> Void):Loader;

	/**
	 * Sets up a middleware function that will run *after* the
	 * resource is loaded.
	 *
	 * @alias use
	 * @param middleware {function} The middleware function to register.
	 * @return {Loader}
	 */
	function after(fn:Void -> Void):Loader;

	/**
	 * Sets up a middleware function that will run *before* the
	 * resource is loaded.
	 *
	 * @alias pre
	 * @param middleware {function} The middleware function to register.
	 * @return {Loader}
	 */
	function before(fn:Void -> Void):Loader;

	/**
	 * Resets the queue of the loader to prepare for a new load.
	 */
	function reset():Void;

	/**
	 * Starts loading the queued resources.
	 *
	 * @fires start
	 * @param [callback] {function} Optional callback that will be bound to the `complete` event.
	 * @return {Loader}
	 */
	function load(?cb:Void -> Void):Loader;

	/**
	 * Loads a single resource.
	 *
	 * @fires progress
	 */
	function loadResource(resource:String, ?cb:Void -> Void):Loader;

	function use(fn:Dynamic):Void;
}

typedef LoaderOptions = {
	@:optional var crossOrigin:Dynamic;
	@:optional var loadType:Int;
	@:optional var xhrType:String;
}

typedef Resource = {
	var name:String;
	var url:String;
	var xhr:Dynamic;
	var xhrType:String;
	var data:Dynamic;
	var texture:Texture;
	var crossOrigin:String;
	var loadType:Int;
}