package pixi.loaders;

import pixi.interaction.EventEmitter;

extern class ResourceLoader extends EventEmitter {

	/**
	 * Manages the state and loading of multiple resources to load.
	 *
	 * @class
	 * @param [baseUrl=''] {string} The base url for all resources loaded by this loader.
	 * @param [concurrency=10] {number} The number of resources to load concurrently.
	 */
	function new(?baseUrl:String, ?concurrency:Int);

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
     * All the resources for this loader keyed by name.
     *
     * @member {object<string, Resource>}
     */
	var resources:haxe.DynamicAccess<Resource>;

	/**
	 * Adds a resource (or multiple resources) to the loader queue.
	 *
	 * This function can take a wide variety of different parameters. The only thing that is always
	 * required the url to load. All the following will work:
	 *
	 * ```js
	 * loader
	 *     // normal param syntax
	 *     .add('key', 'http://...', 	function () {})
	 *     .add('http://...', 	function () {})
	 *     .add('http://...')
	 *
	 *     // object syntax
	 *     .add({
	 *         name: 'key2',
	 *         url: 'http://...'
	 *     }, 	function () {})
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
	 * @param [callback] {function} function to call when this specific resource completes loading.
	 * @return {Loader}
	 */
	@:overload(function(obj:ResourceObject):ResourceLoader {})
	@:overload(function(urls:Array<ResourceObject>):ResourceLoader {})
	@:overload(function(urls:Array<String>):ResourceLoader {})
	@:overload(function(url:String, ?options:LoaderOptions, ?callback:Resource -> Void):ResourceLoader {})
	function add(name:String, url:String, ?options:LoaderOptions, ?callback:Resource -> Void):ResourceLoader;

	/**
	 * Sets up a middleware function that will run *after* the
	 * resource is loaded.
	 *
	 * @alias use
	 * @param middleware {function} The middleware function to register.
	 * @return {Loader}
	 */
	function after(fn:Resource -> (Void->Void) -> Void):ResourceLoader;

	/**
	 * Sets up a middleware function that will run *before* the
	 * resource is loaded.
	 *
	 * @alias pre
	 * @param middleware {function} The middleware function to register.
	 * @return {Loader}
	 */
	function before(fn:Resource -> (Void->Void) -> Void):ResourceLoader;

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
	@:overload(function(?cb:ResourceLoader -> Dynamic -> Void):ResourceLoader {})
	@:overload(function(?cb:ResourceLoader -> Void):ResourceLoader {})
	@:overload(function(?cb:Void -> Void):ResourceLoader {})
	function load(?cb:Dynamic):ResourceLoader;

	/**
	 * Middleware function to use
	 *
	 * @param {function} function to call
	 */
	function use(fn:Resource -> (Void->Void) -> Void):Void;

	/**
	 * Middleware function
	 *
	 * @param {function} function to call
	 */
	function pre(fn:Resource -> (Void->Void) -> Void):ResourceLoader;
}

typedef ResourceObject = {
	var url:String;
	@:optional var name:String;
	@:optional var callback:Resource -> Void;
	@:optional var crossOrigin:Dynamic;
	@:optional var loadType:Int;
	@:optional var xhrType:String;
}
