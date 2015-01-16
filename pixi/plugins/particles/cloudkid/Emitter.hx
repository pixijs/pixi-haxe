package cloudkid;

@:native("cloudkid.Emitter")
extern class Emitter {
		 
	/**
	*	If either ownerPos or spawnPos has changed since the previous update.
	*	@property {Bool} _posChanged
	*/
	 var _posChanged : Bool;

	/**
	*	Acceleration to apply to particles. Using this disables
	*	any interpolation of particle speed. If the particles do
	*	not have a rotation speed, then they will be rotated to
	*	match the direction of travel.
	*	@property {pixi.geom.Point} acceleration
	*	@default null
	*/
	 var acceleration : pixi.geom.Point;


	/**
	*	If particles should be added at the back of the display list instead of the front.
	*	@property {Bool} addAtBack
	*/
	 var	addAtBack : Bool;

	/**
	*	Angle at which to start spawning particles in a burst.
	*	@property {Float} angleStart
	*	@default 0
	*/
	 var	angleStart : Float;

	/**
	*	An easing function for nonlinear interpolation of values. Accepts a single
	*	parameter of time as a value from 0-1, inclusive. Expected outputs are values
	*	from 0-1, inclusive.
	*	@property {Void->Void} customEase
	*/
	 var	customEase : Void -> Void;
	 var	emit : Bool;


	/**
	*	The amount of time in seconds to emit for before setting emit to false.
	*	A value of -1 is an unlimited amount of time.
	*	@property {Float} emitterLifetime
	*	@default -1
	*/
	 var	emitterLife : Float;

	/**
	*	The ending alpha of all particles.
	*	@property {Float} endAlpha
	*	@default 1
	*/
	 var	endAlpha : Float;
	/**
	*	The ending color of all particles, as red, green, and blue uints from 0-255.
	*	@property {Array<Int>} endColor
	*/
	 var	endColor : Array<Int>;

	/**
	*	The ending scale of all particles.
	*	@property {Float} endScale
	*	@default 1
	*/
	 var	endScale : Float;


	/**
	*	The ending speed of all particles.
	*	@property {Float} endSpeed
	*	@default 0
	*/
	 var	endSpeed : Float;


	/**
	 *	Extra data for use in custom particles. The emitter doesn't look inside, but
	 *	passes it on to the particle to use in init().
	 *	@property {Dynamic} extraData
	 */
	 var	extraData : Dynamic;


	/**
	*	Time between particle spawns in seconds.
	*	@property {Float} frequency
	*/
	 var	frequency : Float;

	/**
	*	The maximum lifetime for a particle, in seconds.
	*	@property {Float} maxLifetime
	*/
	 var	maxLifetime : Float;

	/**
	*	Maximum number of particles to keep alive at a time. If this limit
	*	is reached, no more particles will spawn until some have died.
	*	@property {Int} maxParticles
	*	@default 1000
	*/
	 var	maxParticles : Int;


	/**
	*	The maximum start rotation for a particle, in degrees. This value
	*	is ignored if the spawn type is "burst" or "arc".
	*	@property {Float} maxStartRotation
	*/
	 var	maxRotationSpeed : Float;


	/**
	*	The maximum rotation speed for a particle, in degrees per second.
	*	This only visually spins the particle, it does not change direction of movement.
	*	@property {Float} maxRotationSpeed
	*/
	 var	maxStartRotation : Float;

	/**
	*	A minimum multiplier for the scale of a particle at both start and
	*	end. A value between minimumScaleMultiplier and 1 is randomly generated
	*	and multiplied with startScale and endScale to provide the actual
	*	startScale and endScale for each particle.
	*	@property {Float} minimumScaleMultiplier
	*	@default 1
	*/
	 var	minimumScaleMultiplier : Float;

	/**
	*	The minimum lifetime for a particle, in seconds.
	*	@property {Float} minLifetime
	*/
	var	minLifetime : Float;

	/**
	*	The minimum rotation speed for a particle, in degrees per second.
	*	This only visually spins the particle, it does not change direction of movement.
	*	@property {Float} minRotationSpeed
	*/
	 var	minRotationSpeed : Float;

	 
	/**
	*	The world position of the emitter's owner, to add spawnPos to when
	*	spawning particles. To change this, use updateSpawnOrigin().
	*	@property {pixi.geom.Point} ownerPos
	*	@default {x:0, y:0}
	*	@readOnly
	*/
	 var	ownerPos : pixi.geom.Point;

	/**
	*	The display object to add particles to.
	*	@property {pixi.display.DisplayObjectContainer} parent
	*/
	 var	parent : pixi.display.DisplayObjectContainer;

	/**
	*	The blend mode for all particles, as named by PIXI.blendModes.
	*	@property {Int} particleBlendMode
	*/
	 var	particleBlendMode : Int;

	/**
	*	An array of PIXI Texture objects.
	*	@property {Array<pixi.textures.Texture>} particleImages
	*/	 
	 var	particleImage : Array<pixi.textures.Texture>;

	/**
	*	Spacing between particles in a burst. 0 gives a random angle for each particle.
	*	@property {Float} particleSpacing
	*	@default 0
	*/
	 var	particleSpacing : Float;

	/**
	*	Float of particles to spawn each wave in a burst.
	*	@property {int} particlesPerWave
	*	@default 1
	*/
	 var	particlePerWave : Int;

	/**
	*	Rotation of the emitter or emitter's owner in degrees. This is added to
	*	the calculated spawn angle.
	*	To change this, use rotate().
	*	@property {Float} rotation
	*	@default 0
	*	@readOnly
	*/
	 var	rotation : Float;

	/**
	*	A circle relative to spawnPos to spawn particles inside if the spawn type is "circle".
	*	@property {pixi.geom.Circle} spawnCircle
	*/
	 var	spawnCircle : pixi.geom.Circle;

	/**
	*	Position at which to spawn particles, relative to the emitter's owner's origin.
	*	For example, the flames of a rocket travelling right might have a spawnPos
	*	of {x:-50, y:0}.
	*	to spawn at the rear of the rocket.
	*	To change this, use updateSpawnPos().
	*	@property {pixi.geom.Point} spawnPos
	*	@readOnly
	*/
	 var	spawnPos : pixi.geom.Point;

	/**
	*	A rectangle relative to spawnPos to spawn particles inside if the spawn type is "rect".
	*	@property {pixi.geom.Rectangle} spawnRect
	*/
	 var	spawnRect : pixi.geom.Rectangle;

	/**
	*	How the particles will be spawned. Valid types are "point", "rectangle",
	*	"circle", "burst".
	*	@property {String} spawnType
	*	@readOnly
	*/
	 var	spawnType : String;

	/**
	*	The starting alpha of all particles.
	*	@property {Float} startAlpha
	*	@default 1
	*/
	 var	startAlpha : Float;
	 var	startColor : Array<Int>;


	/**
	*	The starting scale of all particles.
	*	@property {Float} startScale
	*	@default 1
	*/
	 var	startScale : Float;

	/**
	*	The starting speed of all particles.
	*	@property {Float} startSpeed
	*	@default 0
	*/
	 var	startSpeed : Float;

	/**
	*	A particle emitter.
	*	@class Emitter
	*	@constructor
	*	@param {pixi.display.DisplayObjectContainer} particleParent The display object to add the
	*														particles to.
	*	@param {Array<pixi.textures.Texture>} [particleImages] A texture or array of textures to use
	*												for the particles.
	*	@param {Dynamic} [config] A configuration object containing settings for the emitter.
	*/
	 function new( parent : pixi.display.DisplayObjectContainer, ?particleImages : Array<pixi.textures.Texture>, ?config : Dynamic ):Void;

	/**
	*	Kills all active particles immediately.
	*	@method cleanup
	*/	
	 function cleanup() : Void;

	/**
	*	Destroys the emitter and all of its particles.
	*	@method destroy
	*/	
	 function destroy() : Void;

	/**
	*	Sets up the emitter based on the config settings.
	*	@method init
	*	@param {Array<pixi.textures.Texture>} particleImages A texture or array of textures to use for the particles.
	*	@param {Dynamic} config A configuration object containing settings for the emitter.
	*/	
	 function init( particleImages : Array<pixi.textures.Texture>, config : Dynamic ) : Void;

	/**
	*	Recycles an individual particle.
	*	@method recycle
	*	@param {Particle} particle The particle to recycle.
	*/
	 function recycle( particle : cloudkid.Particle ) : Void;

	/**
	*	Prevents emitter position interpolation in the next update.
	*	This should be used if you made a major position change of your emitter's owner
	*	that was not normal movement.
	*	@method resetPositionTracking
	*/
	 function resetPositionTracking() : Void;


	/**
	*	Sets the rotation of the emitter to a new value.
	*	@method rotate
	*	@param {Float} newRot The new rotation, in degrees.
	*/
	 function rotate( newRot : Float ) : Void;

	/**
	*	Updates all particles spawned by this emitter and emits new ones.
	*	@method update
	*	@param {Float} delta Time elapsed since the previous frame, in __seconds__.
	*/	 
	 function update( delta : Float ) : Void;

	/**
	*	Changes the position of the emitter's owner. You should call this if you are adding
	*	particles to the world display object that your emitter's owner is moving around in.
	*	@method updateOwnerPos
	*	@param {Float} x The new x value of the emitter's owner.
	*	@param {Float} y The new y value of the emitter's owner.
	*/	 
	 function updateOwnerPos( x: Float, y : Float ) : Void;

	/**
	*	Changes the spawn position of the emitter.
	*	@method updateSpawnPos
	*	@param {Float} x The new x value of the spawn position for the emitter.
	*	@param {Float} y The new y value of the spawn position for the emitter.
	*/
	 function updateSpawnPos( x: Float, y : Float ) : Void;
	
}
