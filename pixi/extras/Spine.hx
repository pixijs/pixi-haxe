package pixi.extras;

@:native("PIXI.Spine")
extern class Spine extends pixi.display.DisplayObjectContainer {

	/**
	 * A class that enables the you to import and run your spine animations in pixi.
	 * Spine animation data needs to be loaded using the PIXI.AssetLoader or PIXI.SpineLoader before it can be used by this class
	 * See example 12 (http://www.goodboydigital.com/pixijs/examples/12/) to see a working example and check out the source
	 *
	 * @class Spine
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param url {String} The url of the spine anim file to be used
	*/
	function new(url:String):Void;

	function createSprite(slot:Dynamic, descriptor:String):pixi.display.Sprite;

	var spineData:Dynamic;
	var skeleton:Dynamic;
	var stateData:Dynamic;
	var state:Dynamic;
}