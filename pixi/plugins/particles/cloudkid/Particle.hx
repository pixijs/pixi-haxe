package pixi.plugins.particles.cloudkid;

@:native("cloudkid.Particle")
extern class Particle {

	/**
	*	Acceleration to apply to the particle.
	*	@property {pixi.geom.Point} acceleration
	*/
	var acceleration:pixi.geom.Point;

	/**
	*	The current age of the particle, in seconds.
	*	@property {Float} age
	*/
	var age:Float;

	/**
	*	A simple easing function to be applied to all properties that
	*	are being interpolated.
	*	@property {Void->Void} ease
	*/
	var ease:Void -> Void;

	/**
	*	The emitter that controls this particle.
	*	@property {Emitter} emitter
	*/
	var emitter:Emitter;

	/**
	*	The alpha of the particle at the end of its life.
	*	@property {Float} endAlpha
	*/
	var endAlpha:Float;
	var endColor:Array<Int>;

	/**
	*	The scale of the particle at the start of its life.
	*	@property {Float} endScale
	*/
	var endScale:Float;

	/**
	*	The speed of the particle at the end of its life.
	*	@property {Number} endSpeed
	*/
	var endSpeed:Float;

	/**
	*	Extra data that the emitter passes along for custom particles.
	*	@property {Dynamic} extraData
	*/
	var extraData:Dynamic;

	/**
	*	The maximum lifetime of this particle, in seconds.
	*	@property {Float} maxLife
	*/
	var maxLife:Float;

	/**
	*	The alpha of the particle at the start of its life.
	*	@property {Float} startAlpha
	*/
	var startAlpha:Float;

	/**
	*	The tint of the particle at the start of its life.
	*	@property {Array<Int>} startColor
	*/
	var startColor:Array<Int>;

	/**
	*	The scale of the particle at the start of its life.
	*	@property {Float} startScale
	*/
	var startScale:Float;

	/**
	*	The speed of the particle at the start of its life.
	*	@property {Float} startSpeed
	*/
	var startSpeed:Float;

	/**
	*	The velocity of the particle. Speed may change, but the angle also
	*	contained in velocity is constant.
	*	@property {pixi.geom.Point} velocity
	*/
	var velocity:pixi.geom.Point;

	/**
	*	@class Particle
	*	@constructor
	*	@param {Emitter} emitter The emitter that controls this particle.
	*/
	function new(emitter:pixi.plugins.particles.cloudkid.Emitter):Void;

	/**
	*	Sets the texture for the particle. This can be overridden to allow
	*	for an animated particle.
	*	@method applyArt
	*	@param {pixi.textures.Texture} art The texture to set.
	*/
	function applyArt(art:pixi.textures.Texture):Void;

	/**
	*	Destroys the particle, removing references and preventing future use.
	*	@method destroy
	*/
	function destroy():Void;

	/**
	*	Initializes the particle for use, based on the properties that have to
	*	have been set already on the particle.
	*	@method init
	*/
	function init():Void;

	/**
	*	Kills the particle, removing it from the display list
	*	and telling the emitter to recycle it.
	*	@method kill
	*/
	function kill():Void;

	/**
	*	Updates the particle.
	*	@method update
	*	@param {Float} delta Time elapsed since the previous frame, in __seconds__.
	*	@return {Float} The standard interpolation multiplier (0-1) used for all relevant particle
	*                    properties. A value of -1 means the particle died of old age instead.
	*/
	function update(delta:Float):Float;
}