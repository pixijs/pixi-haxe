package pixi.display;

@:native("PIXI.DisplayObject")
extern class DisplayObject {

	/**
	 * The base class for all objects that are rendered on the screen. 
	 * This is an abstract class and should not be used on its own rather it should be extended.
	 *
	 * @class DisplayObject
	 * @constructor
	*/
	public function new(x:Float, y:Float, radius:Float):Void;

	/**
	 * Indicates if the sprite will have touch and mouse interactivity. It is false by default
	 *
	 * @property interactive
	 * @type Boolean
	 * @default false
	*/
	public var interactive:Bool;

	/**
	 * [read-only] Indicates if the sprite is globaly visible.
	 *
	 * @property worldVisible
	 * @type Boolean
	*/
	public var worldVisible:Bool;

	/**
	 * Sets a mask for the displayObject. A mask is an object that limits the visibility of an object to the shape of the mask applied to it.
	 * In PIXI a regular mask must be a PIXI.Graphics object. This allows for much faster masking in canvas as it utilises shape clipping.
	 * To remove a mask, set this property to null.
	 *
	 * @property mask
	 * @type Graphics
	*/
	public var mask:Dynamic;

	/**
	 * Sets the filters for the displayObject.
	 * * IMPORTANT: This is a webGL only feature and will be ignored by the canvas renderer.
	 * To remove filters simply set this property to 'null'
	 * @property filters
	 * @type Array An array of filters
	*/
	public var filters:Dynamic;

	/**
	 * Set weather or not a the display objects is cached as a bitmap.
	 * This basically takes a snap shot of the display object as it is at that moment. It can provide a performance benefit for complex static displayObjects
	 * To remove filters simply set this property to 'null'
	 * @property cacheAsBitmap
	 * @type Boolean
	*/
	public var cacheAsBitmap:Bool;

	public var x:Float;

	public var y:Float;

	/*
	 * Updates the object transform for rendering
	 *
	 * @method updateTransform
	 * @private
	*/
	public function getBounds(matrix:Dynamic):pixi.core.Rectangle;

	/**
	 * Sets the object's stage reference, the stage this object is connected to
	 *
	 * @method setStageReference
	 * @param stage {Stage} the stage that the object will have as its current stage reference
	*/
	public function setStageReference(stage:Dynamic):Void;

	public function generateTexture(renderer:Dynamic):Void;

	public function updateCache():Void;
}