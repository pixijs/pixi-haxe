package pixi.interaction;
import pixi.core.math.shapes.Circle;
import pixi.core.math.shapes.Ellipse;
import pixi.core.math.shapes.Polygon;
import pixi.core.math.shapes.Rectangle;
import pixi.core.math.shapes.RoundedRectangle;
import pixi.interaction.EventEmitter;
import haxe.extern.EitherType;

@:native("PIXI.interaction.interactiveTarget")
extern class InteractiveTarget extends EventEmitter
{
	/**
	 * Indicates if the displayObject is interactive or not.
	 *
	 * @member {Bool}
	 * @default false
	 * @memberof InteractiveTarget#
	 */
	var interactive:Bool;

	/**
	 * Indicates if the children of displayObject are interactive or not.
	 *
	 * @member {Bool}
	 * @default true
	 * @memberof InteractiveTarget#
	 */
	var interactiveChildren: Bool;

	/**
	 * Interaction shape. Children will be hit first, then this shape will be checked.
	 *	 
	 * @member {EitherType<Rectangle, EitherType<Circle, EitherType<Ellipse, EitherType<Polygon, RoundedRectangle>>>>}
	 * @memberof InteractiveTarget#
	 * @default null
	 */
	var hitArea: EitherType< Rectangle, 
				 EitherType< Circle, 
				 EitherType< Ellipse,
				 EitherType< Polygon,
							 RoundedRectangle 
				 >>>>;

	/**
	 * Indicates if the displayObject uses button mode or normal mode.
	 *
	 * @member {Bool}
	 * @default false
	 * @memberof InteractiveTarget#
	 */
	var buttonMode:Bool;

	/**
	 * Default cursor.
	 *
	 * @member {String}
	 * @default pointer
	 * @memberof InteractiveTarget#
	 */
	var defaultCursor:String;

	// some internal checks..
	/**
	 * Internal check to detect if the mouse cursor is hovered over the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _over: Bool;

	/**
	 * Internal check to detect if the left mouse button is pressed on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _isLeftDown: Bool;

	/**
	 * Internal check to detect if the right mouse button is pressed on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _isRightDown: Bool;

	/**
	 * Internal check to detect if the pointer cursor is hovered over the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _pointerOver: Bool;

	/**
	 * Internal check to detect if the pointer is down on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _pointerDown: Bool;

	/**
	 * Internal check to detect if a user has touched the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _touchDown: Bool;
}