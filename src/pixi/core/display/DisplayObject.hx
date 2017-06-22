package pixi.core.display;

import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.math.Point;
import pixi.interaction.InteractiveTarget;
import haxe.extern.EitherType;

@:native("PIXI.DisplayObject")
extern class DisplayObject extends InteractiveTarget {

	/**
	 * The base class for all objects that are rendered on the screen.
	 * This is an abstract class and should not be used on its own rather it should be extended.
	 *
	 * @class
	 * @namespace PIXI
	 */
	function new();

	/**
	 * Retrieves the bounds of the displayObject as a rectangle object
	 *
	 * @param skipUpdate {Matrix} setting to true will stop the transforms of the scene graph from being updated.
	 * This means the calculation returned MAY be out of date BUT will give you a nice performance boost
	 * @param rect {Rectangle} Optional rectangle to store the result of the bounds calculation
	 * @return {Rectangle} the rectangular bounding area
	 */
	function getBounds(?skipUpdate:Bool, ?rect:Rectangle):Rectangle;

	/**
	 * Retrieves the local bounds of the displayObject as a rectangle object
	 *
	 * @return {Rectangle} the rectangular bounding area
	 */
	function getLocalBounds():Rectangle;

	/**
	 * Calculates the global position of the display object
	 *
	 * @param position {Point} The world origin to calculate from
	 * @param point {Point} A Point in which to store the value, optional (otherwise a new Point is created)
	 * @param skipUpdate {Bool} Should we skip the update transform
	 * @return {Point} A point object representing the position of this object
	 */
	function toGlobal(position:Point, ?point:Point, ?skipUpdate:Bool):Point;

	/**
	 * Calculates the local position of the display object relative to another point
	 *
	 * @param position {Point} The world origin to calculate from
	 * @param [from] {DisplayObject} The DisplayObject to calculate the global position from
	 * @param [point] {Point} A Point object in which to store the value, optional (otherwise will create a new Point)
	 * @return {Point} A point object representing the position of this object
	 */
	function toLocal(position:Point, ?frm:DisplayObject, ?point:Point):Point;

	/*
	 * Updates the object transform for rendering
	 *
	 * TODO - Optimization pass!
	 */
	function updateTransform():Void;
	function displayObjectUpdateTransform():Void;

	/**
	 * Set the parent Container of this DisplayObject
	 *
	 * @param container {Container} The Container to add this DisplayObject to
	 * @return {Container} The Container that this DisplayObject was added to
	 */
	function setParent(container:Container):Container;

	/**
	 * Convenience function to set the postion, scale, skew and pivot at once.
	 *
	 * @param [x=0] {Float} The X position
	 * @param [y=0] {Float} The Y position
	 * @param [scaleX=1] {Float} The X scale value
	 * @param [scaleY=1] {Float} The Y scale value
	 * @param [skewX=0] {Float} The X skew value
	 * @param [skewY=0] {Float} The Y skew value
	 * @param [pivotX=0] {Float} The X pivot value
	 * @param [pivotY=0] {Float} The Y pivot value
	 * @return {DisplayObject}
	 */
	function setTransform(?x:Float, ?y:Float, ?scaleX:Float, ?scaleY:Float, ?rotation:Float, ?skewX:Float, ?skewY:Float, ?pivotX:Float, ?pivotY:Float):DisplayObject;

	/**
	 * Base destroy method for generic display objects
     * Removes all internal references and listeners as well as removes children from the display list.
     *
     * @param {object|boolean} [options] - Options parameter. A boolean will act as if all options
     *  have been set to that value
     * @param {boolean} [options.children=false] - if set to true, all the children will have their destroy
     *  method called as well. 'options' will be passed on to those calls.
     * @param {boolean} [options.texture=false] - Only used for child Sprites if options.children is set to true
     *  Should it destroy the texture of the child sprite
     * @param {boolean} [options.baseTexture=false] - Only used for child Sprites if options.children is set to true
     *  Should it destroy the base texture of the child sprite
     */
	function destroy(?options:EitherType<Bool, DestroyOptions>):Void;

	/**
	 * The instance name of the object.
	 *
	 * @member {String}
	 */
	var name:String;

	/**
	 * Set this to true if you want this display object to be cached as a bitmap.
	 * This basically takes a snap shot of the display object as it is at that moment. It can provide a performance benefit for complex static displayObjects.
	 * To remove simply set this property to 'null'
	 *
	 * @member {Bool}
	 * @memberof DisplayObject#
	 */
	var cacheAsBitmap:Bool;

	/**
	 * The opacity of the object.
	 *
	 * @member {Float}
	 */
	var alpha:Float;

	/**
	 * The visibility of the object. If false the object will not be drawn, and
	 * the updateTransform function will not be called.
	 *
	 * @member {Bool}
	 */
	var visible:Bool;

	/**
	 * Can this object be rendered, if false the object will not be drawn but the updateTransform
	 * methods will still be called.
	 *
	 * @member {Bool}
	 */
	var renderable:Bool;

	/**
	 * The display object container that contains this display object.
	 *
	 * @member {Container}
	 * @readOnly
	 */
	var parent:Container;

	/**
	 * The multiplied alpha of the displayObject
	 *
	 * @member {Float}
	 * @readOnly
	 */
	var worldAlpha:Float;

	/**
	 * The area the filter is applied to. This is used as more of an optimisation
	 * rather than figuring out the dimensions of the displayObject each frame you can set this rectangle
	 *
	 * Also works as an interaction mask
	 *
	 * @member {Rectangle}
	 */
	var filterArea:Rectangle;

	/**
	 * The position of the displayObject on the x axis relative to the local coordinates of the parent.
	 *
	 * @member {Float}
	 * @memberof DisplayObject#
	 */
	var x:Float;

	/**
	 * The position of the displayObject on the y axis relative to the local coordinates of the parent.
	 *
	 * @member {Float}
	 * @memberof DisplayObject#
	 */
	var y:Float;

	/**
	 * Current transform of the object based on world (parent) factors
	 *
	 * @member {Matrix}
	 * @readOnly
	 */
	var worldTransform:Matrix;

	/**
     * Current transform of the object based on local factors: position, scale, other stuff
     *
     * @member {PIXI.Matrix}
     * @readOnly
     */
	var localTransform:Matrix;

	/**
	 * The coordinate of the object relative to the local coordinates of the parent.
	 *
	 * @member {Point}
	 */
	var position:Point;

	/**
	 * The scale factor of the object.
	 *
	 * @member {Point}
	 */
	var scale:Point;

	/**
	 * The pivot point of the displayObject that it rotates around
	 *
	 * @member {Point}
	 */
	var pivot:Point;

	/**
     * The skew factor for the object in radians.
     *
     * @member {Point}
     */
	var skew:Point;

	/**
	 * The rotation of the object in radians.
	 *
	 * @member {Float}
	 */
	var rotation:Float;

	/**
	 * Indicates if the displayObject is globally visible.
	 *
	 * @member {Bool}
	 * @memberof DisplayObject#
	 * @readonly
	 */
	var worldVisible:Bool;

	/**
     * Sets a mask for the displayObject. A mask is an object that limits the visibility of an object to the shape of the mask applied to it.
     * In PIXI a regular mask must be a PIXI.Graphics or a PIXI.Sprite object. This allows for much faster masking in canvas as it utilises shape clipping.
     * To remove a mask, set this property to null.
     *
     * @todo For the moment, PIXI.CanvasRenderer doesn't support PIXI.Sprite as mask.
     *
     * @member {Graphics|Sprite}
     * @memberof DisplayObject#
     */
	var mask:Dynamic;

	/**
	 * Sets the filters for the displayObject.
	 * * IMPORTANT: This is a webGL only feature and will be ignored by the canvas renderer.
	 * To remove filters simply set this property to 'null'
	 *
	 * @member {Array<AbstractFilter>}
	 * @memberof DisplayObject#
	 */
	var filters:Array<Filter>;

	/**
     *  Flag for if the object is accessible. If true AccessibilityManager will overlay a
     *   shadow div with attributes set
     *
     * @member {Bool}
     */
	var accessible:Bool;

	/**
     * Sets the title attribute of the shadow div
     * If accessibleTitle AND accessibleHint has not been this will default to 'displayObject [tabIndex]'
     *
     * @member {String}
     */
	var accessibleTitle:String;

	/**
     * Sets the aria-label attribute of the shadow div
     *
     * @member {String}
     */
	var accessibleHint:String;

	/**
     * @todo Needs docs.
     */
	var tabIndex:Int;
}

typedef DestroyOptions = {
	/**
	* {boolean} [options.children=false] - if set to true, all the children will have their destroy
	*  method called as well. 'options' will be passed on to those calls.
	*/
	@:optional var children:Bool;

	/**
    * {boolean} [options.texture=false] - Only used for child Sprites if options.children is set to true
    * Should it destroy the texture of the child sprite
	*/
	@:optional var texture:Bool;

	/**
    * {boolean} [options.baseTexture=false] - Only used for child Sprites if options.children is set to true
    * Should it destroy the base texture of the child sprite
	*/
	@:optional var baseTexture:Bool;
}