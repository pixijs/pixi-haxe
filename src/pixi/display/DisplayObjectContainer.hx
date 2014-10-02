package pixi.display;

@:native("PIXI.DisplayObjectContainer")
extern class DisplayObjectContainer extends DisplayObject {

	/**
	 * A DisplayObjectContainer represents a collection of display objects.
	 * It is the base class of all display objects that act as a container for other objects.
	 *
	 * @class DisplayObjectContainer
	 * @extends DisplayObject
	 * @constructor
	*/
	public function new():Void;

	/**
	 * The width of the displayObjectContainer, setting this will actually modify the scale to achieve the value set
	 *
	 * @property width
	 * @type Number
	*/
	public var width:Float;

	/**
	 * The height of the displayObjectContainer, setting this will actually modify the scale to achieve the value set
	 *
	 * @property height
	 * @type Number
	*/
	public var height:Float;

	/**
	 * Adds a child to the container.
	 *
	 * @method addChild
	 * @param child {DisplayObject} The DisplayObject to add to the container
	*/
	public function addChild(child:Dynamic):Void;

	/**
	 * Adds a child to the container at a specified index. If the index is out of bounds an error will be thrown
	 *
	 * @method addChildAt
	 * @param child {DisplayObject} The child to add
	 * @param index {Number} The index to place the child in
	*/
	public function addChildAt(child:Dynamic, index:Int):Void;

	/**
	 * [NYI] Swaps the depth of 2 displayObjects
	 *
	 * @method swapChildren
	 * @param child1 {DisplayObject}
	 * @param child2 {DisplayObject}
	 * @private
	*/
	public function swapChildren(child1:Dynamic, child2:Dynamic):Void;

	/**
	 * Returns the child at the specified index
	 *
	 * @method getChildAt
	 * @param index {Number} The index to get the child from
	*/
	public function getChildAt(index:Int):Dynamic;

	/**
	 * Removes a child from the container.
	 *
	 * @method removeChild
	 * @param child {DisplayObject} The DisplayObject to remove
	*/
	public function removeChild(child:Dynamic):Void;

	/**
	 * Removes a child from the specified index position in the child list of the container.
	 *
	 * @method removeChildAt
	 * @param index {Number} The index to get the child from
	*/
	public function removeChildAt(index:Int):Dynamic;

	/**
	 * Removes all child instances from the child list of the container.
	 *
	 * @method removeChildren
	 * @param beginIndex {Number} The beginning position. Predefined value is 0.
	 * @param endIndex {Number} The ending position. Predefined value is children's array length.
	*/
	public function removeChildren(beginIndex:Int, endIndex:Int):Void;

	/*
	 * Updates the container's childrens transform for rendering
	 *
	 * @method updateTransform
	 * @private
	*/
	public function updateTransform():Void;

	/**
	 * Retrieves the bounds of the displayObjectContainer as a rectangle object
	 *
	 * @method getBounds
	 * @return {Rectangle} the rectangular bounding area
	*/
	public override function getBounds(matrix:Dynamic):Dynamic;

	public function getLocalBounds():Void;

	/**
	 * Sets the container's stage reference, the stage this object is connected to
	 *
	 * @method setStageReference
	 * @param stage {Stage} the stage that the container will have as its current stage reference
	*/
	public override function setStageReference(stage:Dynamic):Void;

	/**
	 * removes the current stage reference of the container
	 *
	 * @method removeStageReference
	*/
	public function removeStageReference():Void;
}