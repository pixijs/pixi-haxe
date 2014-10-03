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
	public function new(url:String):Void;

	public function createSprite(slot:Dynamic, descriptor:Dynamic):pixi.display.Sprite;

	public var spineData:Dynamic;
	public var skeleton:Dynamic;
	public var stateData:Dynamic;
	public var state:Dynamic;
}