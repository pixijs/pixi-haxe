package pixi.display;

import pixi.core.Rectangle;
import pixi.core.Matrix;
import pixi.display.DisplayObject;

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
	function new():Void;

	/**
	 * The width of the displayObjectContainer, setting this will actually modify the scale to achieve the value set
	 *
	 * @property width
	 * @type Number
	*/
	var width:Float;

	/**
	 * The height of the displayObjectContainer, setting this will actually modify the scale to achieve the value set
	 *
	 * @property height
	 * @type Number
	*/
	var height:Float;

    /**
     * [read-only] The array of children of this container.
     *
     * @property children
     * @type Array<DisplayObject>
     * @readOnly
     */
    var children:Array<DisplayObject>;

	/**
	 * Adds a child to the container.
	 *
	 * @method addChild
	 * @param child {DisplayObject} The DisplayObject to add to the container
	*/
    @:overload(function (child:Dynamic):Void {})
	function addChild(child:DisplayObject):Void;

	/**
	 * Adds a child to the container at a specified index. If the index is out of bounds an error will be thrown
	 *
	 * @method addChildAt
	 * @param child {DisplayObject} The child to add
	 * @param index {Number} The index to place the child in
	*/
    @:overload(function (child:Dynamic, index:Int):Void {})
	function addChildAt(child:DisplayObject, index:Int):Void;

	/**
	 * [NYI] Swaps the depth of 2 displayObjects
	 *
	 * @method swapChildren
	 * @param child1 {DisplayObject}
	 * @param child2 {DisplayObject}
	 * @private
	*/
    @:overload(function (child1:Dynamic, child2:DisplayObject):Void {})
    @:overload(function (child1:Dynamic, child2:Dynamic):Void {})
    @:overload(function (child1:DisplayObject, child2:Dynamic):Void {})
	function swapChildren(child1:DisplayObject, child2:DisplayObject):Void;

	/**
	 * Returns the child at the specified index
	 *
	 * @method getChildAt
	 * @param index {Number} The index to get the child from
	*/
    @:overload(function(index:Int):Dynamic {})
	function getChildAt(index:Int):DisplayObject;

	/**
	 * Removes a child from the container.
	 *
	 * @method removeChild
	 * @param child {DisplayObject} The DisplayObject to remove
	*/
    @:overload(function (child:Dynamic):Void {})
	function removeChild(child:DisplayObject):Void;

	/**
	 * Removes a child from the specified index position in the child list of the container.
	 *
	 * @method removeChildAt
	 * @param index {Number} The index to get the child from
	*/
	function removeChildAt(index:Int):Void;

	/**
	 * Removes all child instances from the child list of the container.
	 *
	 * @method removeChildren
	 * @param beginIndex {Number} The beginning position. Predefined value is 0.
	 * @param endIndex {Number} The ending position. Predefined value is children's array length.
	*/
	function removeChildren(beginIndex:Int, endIndex:Int):Void;

	/**
	 * Changes the position of an existing child in the display object container
	 *
	 * @method setChildIndex
	 * @param child {DisplayObject} The child DisplayObject instance for which you want to change the index number
	 * @param index {Number} The resulting index number for the child display object
	 */
	function setChildIndex(child:DisplayObject, index:Int):Void;

	/**
	 * Returns the index position of a child DisplayObject instance
	 *
	 * @method getChildIndex
	 * @param child {DisplayObject} The DisplayObject instance to identify
	 * @return {Number} The index position of the child display object to identify
	 */
	function getChildIndex(child:DisplayObject):Int;

	/*
	 * Updates the container's childrens transform for rendering
	 *
	 * @method updateTransform
	 * @private
	*/
	function updateTransform():Void;

	/**
	 * Retrieves the bounds of the displayObjectContainer as a rectangle object
	 *
	 * @method getBounds
	 * @return {Rectangle} the rectangular bounding area
	*/
	override function getBounds(matrix:Matrix):Rectangle;

	function getLocalBounds():Void;

	/**
	 * Sets the container's stage reference, the stage this object is connected to
	 *
	 * @method setStageReference
	 * @param stage {Stage} the stage that the container will have as its current stage reference
	*/
	override function setStageReference(stage:Stage):Void;

	/**
	 * removes the current stage reference of the container
	 *
	 * @method removeStageReference
	*/
	function removeStageReference():Void;
}