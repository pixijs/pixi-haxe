package pixi.plugins.particles.cloudkid;

@:native("cloudkid.PathParticle")
extern class PathParticle {

	/**
	*	The function representing the path the particle should take.
	*	@property {Float->Float} path
	*/
	var path:Float -> Float;

	/**
	*	The initial rotation in degrees of the particle, because the direction of the path
	*	is based on that.
	*	@property {Float} initialRotation
	*/
	var initialRotation:Float;

	/**
	*	The initial position of the particle, as all path movement is added to that.
	*	@property {pixi.geom.Point} initialPosition
	*/
	var initialPosition:pixi.geom.Point;

	/**
	*	Total single directional movement, due to speed.
	*	@property {Float} movement
	*/
	var movement:Float;

	/**
	*	An particle that follows a path defined by an algebraic expression, e.g. "sin(x)" or
	*	"5x + 3".
	*	To use this class, the particle config must have a "path" string in the
	*	"extraData" parameter. This string should have "x" in it to represent movement (from the
	*	speed settings of the particle). It may have numbers, parentheses, the four basic
	*	operations, and the following Math functions or properties (without the preceding "Math."):
	*	"pow", "sqrt", "abs", "floor", "round", "ceil", "E", "PI", "sin", "cos", "tan", "asin",
	*	"acos", "atan", "atan2", "log".
	*	The overall movement of the particle and the expression value become x and y positions for
	*	the particle, respectively. The final position is rotated by the spawn rotation/angle of
	*	the particle.
	*
	*	Some example paths:
	*
	*		"sin(x/10) * 20" // A sine wave path.
	*		"cos(x/100) * 30" // Particles curve counterclockwise (for medium speed/low lifetime particles)
	*		"pow(x/10, 2) / 2" // Particles curve clockwise (remember, +y is down).
	*
	*	@class PathParticle
	*	@constructor
	*	@param {Emitter} emitter The emitter that controls this PathParticle.
	*/
	function new(emitter:Emitter):Void;

	/**
	*	Initializes the particle for use, based on the properties that have to
	*	have been set already on the particle.
	*	@method init
	*/
	function init():Void;

	/**
	*	Destroys the particle, removing references and preventing future use.
	*	@method destroy
	*/
	function destroy():Void;
}