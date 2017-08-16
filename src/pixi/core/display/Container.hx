package pixi.core.display;

import haxe.extern.Rest;

@:native("PIXI.Container")
extern class Container extends DisplayObject {

	/**
	 * A Container represents a collection of display objects.
	 * It is the base class of all display objects that act as a container for other objects.
	 *
	 * @class
	 * @extends DisplayObject
	 * @namespace PIXI
	 */
	function new();

	/**
	 * The array of children of this container.
	 *
	 * @member {DisplayObject[]}
	 * @readonly
	 */
	var children:Array<DisplayObject>;

	/**
	 * The width of the Container, setting this will actually modify the scale to achieve the value set
	 *
	 * @member {Float}
	 * @memberof Container#
	 */
	var width:Float;

	/**
	 * The height of the Container, setting this will actually modify the scale to achieve the value set
	 *
	 * @member {Float}
	 * @memberof Container#
	 */
	var height:Float;

	/**
	 * Adds a child to the container.
	 *
	 * You can also add multple items like so: myContainer.addChild(thinkOne, thingTwo, thingThree)
	 *
	 * @param child {DisplayObject} The DisplayObject to add to the container
	 * @return {DisplayObject} The child that was added.
	 */
	@:overload(function (child:Rest<DisplayObject>):DisplayObject {})
	function addChild<T:DisplayObject>(child:T):T;

	/**
	 * Adds a child to the container at a specified index.
	 * If the index is out of bounds an error will be thrown.
	 *
	 * @param child {DisplayObject} The child to add
	 * @param index {Int} The index to place the child in
	 * @return {DisplayObject} The child that was added.
	 */
	function addChildAt<T:DisplayObject>(child:T, index:Int):T;

	/**
	 * Swaps the position of 2 Display Objects within this container.
	 *
	 * @param child1 {DisplayObject}
	 * @param child2 {DisplayObject}
	 */
	function swapChildren(child1:DisplayObject, child2:DisplayObject):Void;

	/**
	 * Returns the index position of a child DisplayObject instance
	 *
	 * @param child {DisplayObject} The DisplayObject instance to identify
	 * @return {Int} The index position of the child display object to identify
	 */
	function getChildIndex(child:DisplayObject):Int;

	/**
	 * Changes the position of an existing child in the display object container
	 *
	 * @param child {DisplayObject} The child DisplayObject instance for which you want to change the index number
	 * @param index {Int} The resulting index number for the child display object
	 */
	function setChildIndex(child:DisplayObject, index:Int):Void;

	/**
	 * Returns the child at the specified index
	 *
	 * @param index {Int} The index to get the child from
	 * @return {DisplayObject} The child at the given index, if any.
	 */
	function getChildAt(index:Int):DisplayObject;

	/**
	 * Removes a child from the container.
	 *
	 * @param child {DisplayObject} The DisplayObject to remove
	 * @return {DisplayObject} The child that was removed.
	 */
	function removeChild(child:DisplayObject):DisplayObject;

	/**
	 * Removes a child from the specified index position.
	 *
	 * @param index {Int} The index to get the child from
	 * @return {DisplayObject} The child that was removed.
	 */
	function removeChildAt(index:Int):DisplayObject;

	/**
	 * Removes all children from this container that are within the begin and end indexes.
	 *
	 * @param beginIndex {Int} The beginning position. Default value is 0.
	 * @param endIndex {Int} The ending position. Default value is size of the container.
	 */
	function removeChildren(?beginIndex:Int, ?endIndex:Int):Void;

	/**
	* Returns the display object in the container
	*
	* @param name {string} instance name
	* @return {DisplayObject}
	*/
	function getChildByName(name:String):DisplayObject;
}