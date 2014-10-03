package pixi.display;

@:native("PIXI.Stage")
extern class Stage extends DisplayObjectContainer {

	/**
	 * A Stage represents the root of the display tree. Everything connected to the stage is rendered
	 *
	 * @class Stage
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param backgroundColor {Number} the background color of the stage, you have to pass this in is in hex format
	 *      like: 0xFFFFFF for white
	 * 
	 * Creating a stage is a mandatory process when you use Pixi, which is as simple as this : 
	 * var stage = new PIXI.Stage(0xFFFFFF);
	 * where the parameter given is the background colour of the stage, in hex
	 * you will use this stage instance to add your sprites to it and therefore to the renderer
	 * Here is how to add a sprite to the stage : 
	 * stage.addChild(sprite);
	*/
	function new(backgroundColor:Dynamic):Void;

	/**
	 * Sets another DOM element which can receive mouse/touch interactions instead of the default Canvas element.
	 * This is useful for when you have other DOM elements on top of the Canvas element.
	 *
	 * @method setInteractionDelegate
	 * @param domElement {DOMElement} This new domElement which will receive mouse/touch events
	*/
	function setInteractionDelegate(domElement:Dynamic):Void;

	/*
	 * Updates the object transform for rendering
	 *
	 * @method updateTransform
	 * @private
	*/
	override function updateTransform():Void;

	/**
	 * Sets the background color for the stage
	 *
	 * @method setBackgroundColor
	 * @param backgroundColor {Number} the color of the background, easiest way to pass this in is in hex format
	 *      like: 0xFFFFFF for white
	*/
	function setBackgroundColor(backgroundColor:Dynamic):Void;

	/**
	 * This will return the point containing global coords of the mouse.
	 *
	 * @method getMousePosition
	 * @return {Point} The point containing the coords of the global InteractionData position.
	*/
	function getMousePosition():pixi.core.Point;
}