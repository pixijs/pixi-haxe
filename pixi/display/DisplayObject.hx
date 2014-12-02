package pixi.display;

import pixi.core.Matrix;
import pixi.core.Rectangle;
import pixi.primitives.Graphics;
import pixi.core.Point;
import pixi.textures.Texture;
import pixi.renderers.canvas.CanvasRenderer;
import pixi.renderers.webgl.WebGLRenderer;

@:native("PIXI.DisplayObject")
extern class DisplayObject {

	/**
	 * The base class for all objects that are rendered on the screen.
	 * This is an abstract class and should not be used on its own rather it should be extended.
	 *
	 * @class DisplayObject
	 * @constructor
	*/
	function new():Void;

	/**
     * Useful function that returns a texture of the displayObject object that can then be used to create sprites
     * This can be quite useful if your displayObject is static / complicated and needs to be reused multiple times.
     *
     * @method generateTexture
     * @param resolution {Float} The resolution of the texture being generated
     * @param scaleMode {Int} Should be one of the PIXI.scaleMode consts
     * @param renderer {CanvasRenderer|WebGLRenderer} The renderer used to generate the texture.
     * @return {Texture} a texture of the graphics object
     */
	@:overload(function(resolution:Float, scaleMode:Int, ?renderer:CanvasRenderer):Texture{})
	function generateTexture(resolution:Float, scaleMode:Int, ?renderer:WebGLRenderer):Texture;

	/**
     * Retrieves the bounds of the displayObject as a rectangle object
     *
     * @method getBounds
     * @param matrix {Matrix}
     * @return {Rectangle} the rectangular bounding area
     */
	function getBounds(matrix:Matrix):Rectangle;

	/**
	 * Retrieves the local bounds of the displayObject as a rectangle object
	 *
	 * @method getLocalBounds
	 * @return {Rectangle} the rectangular bounding area
	 */
	function getLocalBounds():Rectangle;

	/**
	 * Sets the object's stage reference, the stage this object is connected to
	 *
	 * @method setStageReference
	 * @param stage {Stage} the stage that the object will have as its current stage reference
	*/
	function setStageReference(stage:Stage):Void;

	/**
	 * Calculates the global position of the display object
	 *
	 * @method toGlobal
	 * @param position {Point} The world origin to calculate from
	 * @return {Point} A point object representing the position of this object
	 */
	function toGlobal(position:Point):Point;

	/**
	 * Calculates the local position of the display object relative to another point
	 *
	 * @method toLocal
	 * @param position {Point} The world origin to calculate from
	 * @param [from] {DisplayObject} The DisplayObject to calculate the global position from
	 * @return {Point} A point object representing the position of this object
	 */
	function toLocal(position:Point, ?frm:DisplayObject):Point;

	/**
	 * Generates and updates the cached sprite for this object.
	 *
	 * @method updateCache
	 */
	function updateCache():Void;

	/**
     * The opacity of the object.
     *
     * @property alpha
     * @type Float
     */
	var alpha:Float;

	/**
     * This is used to indicate if the displayObject should display a mouse hand cursor on rollover
     *
     * @property buttonMode
     * @type Bool
     */
	var buttonMode:Bool;

	/**
	 * Set weather or not a the display objects is cached as a bitmap.
	 * This basically takes a snap shot of the display object as it is at that moment. It can provide a performance benefit for complex static displayObjects
	 * To remove filters simply set this property to 'null'
	 * @property cacheAsBitmap
	 * @type Bool
	*/
	var cacheAsBitmap:Bool;

	/**
     * This is the cursor that will be used when the mouse is over this object. To enable this the element must have interaction = true and buttonMode = true
     *
     * @property defaultCursor
     * @type String
    */
	var defaultCursor:String;

	/**
     * The area the filter is applied to like the hitArea this is used as more of an optimisation
     * rather than figuring out the dimensions of the displayObject each frame you can set this rectangle
     *
     * @property filterArea
     * @type Rectangle
     */
	var filterArea:Rectangle;

	/**
	 * Sets the filters for the displayObject.
	 * * IMPORTANT: This is a webGL only feature and will be ignored by the canvas renderer.
	 * To remove filters simply set this property to 'null'
	 * @property filters
	 * @type Array An array of filters
	*/
	var filters:Array<Dynamic>;

	/**
     * This is the defined area that will pick up mouse / touch events. It is null by default.
     * Setting it is a neat way of optimising the hitTest function that the interactionManager will use (as it will not need to hit test all the children)
     *
     * @property hitArea
     * @type Rectangle|Circle|Ellipse|Polygon
     */
	var hitArea:Dynamic;

	/**
	 * Indicates if the sprite will have touch and mouse interactivity. It is false by default
	 *
	 * @property interactive
	 * @type Bool
	 * @default false
	 */
	var interactive:Bool;

	/**
	 * Sets a mask for the displayObject. A mask is an object that limits the visibility of an object to the shape of the mask applied to it.
	 * In PIXI a regular mask must be a PIXI.Graphics object. This allows for much faster masking in canvas as it utilises shape clipping.
	 * To remove a mask, set this property to null.
	 *
	 * @property mask
	 * @type Graphics
	*/
	var mask:Graphics;

	/**
     * [read-only] The display object container that contains this display object.
     *
     * @property parent
     * @type DisplayObjectContainer
     * @readOnly
     */
	var parent:DisplayObjectContainer;

	/**
     * The pivot point of the displayObject that it rotates around
     *
     * @property pivot
     * @type Point
     */
	var pivot:Point;

	/**
     * The coordinate of the object relative to the local coordinates of the parent.
     *
     * @property position
     * @type Point
     */
	var position:Point;

	/**
     * Can this object be rendered
     *
     * @property renderable
     * @type Bool
     */
	var renderable:Bool;

	/**
     * The rotation of the object in radians.
     *
     * @property rotation
     * @type Float
     */
	var rotation:Float;

	/**
     * The scale factor of the object.
     *
     * @property scale
     * @type Point
     */
	var scale:Point;

	/**
     * [read-only] The stage the display object is connected to, or undefined if it is not connected to the stage.
     *
     * @property stage
     * @type Stage
     * @readOnly
     */
	var stage:Stage;

	/**
     * The visibility of the object.
     *
     * @property visible
     * @type Bool
     */
	var visible:Bool;

	/**
     * [read-only] The multiplied alpha of the displayObject
     *
     * @property worldAlpha
     * @type Float
     * @readOnly
     */
	var worldAlpha:Float;

	/**
	 * [read-only] Indicates if the sprite is globaly visible.
	 *
	 * @property worldVisible
	 * @type Bool
	*/
	var worldVisible:Bool;

	/**
	 * The position of the displayObject on the x axis relative to the local coordinates of the parent.
	 *
	 * @property x
	 * @type Float
	 */
	var x:Float;

	/**
	 * The position of the displayObject on the y axis relative to the local coordinates of the parent.
	 *
	 * @property y
	 * @type Float
	 */
	var y:Float;

	var click:InteractionData -> Void;
	var tap:InteractionData -> Void;
	var mousedown:InteractionData -> Void;
	var mouseout:InteractionData -> Void;
	var mouseover:InteractionData -> Void;
	var mouseup:InteractionData -> Void;
    var mousemove:InteractionData -> Void;
	var mouseupoutside:InteractionData -> Void;
    var touchstart:InteractionData -> Void;
    var touchmove:InteractionData -> Void;
    var touchend:InteractionData -> Void;
    var touchendoutside:InteractionData -> Void;
	var rightclick:InteractionData -> Void;
	var rightdown:InteractionData -> Void;
	var rightup:InteractionData -> Void;
}