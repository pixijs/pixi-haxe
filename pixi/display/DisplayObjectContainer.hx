package pixi.display;

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
	 * @type Float
	*/
	var width:Float;

	/**
	 * The height of the displayObjectContainer, setting this will actually modify the scale to achieve the value set
	 *
	 * @property height
	 * @type Float
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
	function addChild(child:DisplayObject):Void;

	/**
	 * Adds a child to the container at a specified index. If the index is out of bounds an error will be thrown
	 *
	 * @method addChildAt
	 * @param child {DisplayObject} The child to add
	 * @param index {Int} The index to place the child in
	*/
	function addChildAt(child:DisplayObject, index:Int):Void;

	/**
	 * Swaps the position of 2 Display Objects within this container.
	 *
	 * @method swapChildren
	 * @param child1 {DisplayObject}
	 * @param child2 {DisplayObject}
	 */
	function swapChildren(child1:DisplayObject, child2:DisplayObject):Void;

	/**
	 * Returns the child at the specified index
	 *
	 * @method getChildAt
	 * @param index {Int} The index to get the child from
	 * @return {DisplayObject}
	*/
	function getChildAt(index:Int):DisplayObject;

	/**
	 * Removes a child from the container.
	 *
	 * @method removeChild
	 * @param child {DisplayObject} The DisplayObject to remove
	*/
	function removeChild(child:DisplayObject):Void;

	/**
	 * Removes a child from the specified index position in the child list of the container.
	 *
	 * @method removeChildAt
	 * @param index {Int} The index to get the child from
	*/
	function removeChildAt(index:Int):Void;

	/**
	 * Removes all child instances from the child list of the container.
	 *
	 * @method removeChildren
	 * @param beginIndex {Int} The beginning position. Predefined value is 0.
	 * @param [endIndex] {Int} The ending position. Predefined value is children's array length.
	*/
	function removeChildren(?beginIndex:Int, ?endIndex:Int):Void;

	/**
	 * Changes the position of an existing child in the display object container
	 *
	 * @method setChildIndex
	 * @param child {DisplayObject} The child DisplayObject instance for which you want to change the index number
	 * @param index {Int} The resulting index number for the child display object
	 */
	function setChildIndex(child:DisplayObject, index:Int):Void;

	/**
	 * Returns the index position of a child DisplayObject instance
	 *
	 * @method getChildIndex
	 * @param child {DisplayObject} The DisplayObject instance to identify
	 * @return {Int} The index position of the child display object to identify
	 */
	function getChildIndex(child:DisplayObject):Int;

	/**
	 * Removes the current stage reference from the container and all of its children.
	 *
	 * @method removeStageReference
	 */
	function removeStageReference():Void;
}