package pixi.plugins.particles.cloudkid;

@:native("cloudkid.AnimatedParticle")
extern class AnimatedParticle {

	/**
	*	An individual particle image with an animation. While this class may be functional, it
	*	has not gotten thorough testing or examples yet, and is not considered to be release ready.
	*	@class AnimatedParticle
	*	@constructor
	*	@param {Emitter} emitter The emitter that controls this AnimatedParticle.
	*/
	function new(e:pixi.plugins.particles.cloudkid.Emitter):Void;

	/**
	*	Initializes the particle for use, based on the properties that have to
	*	have been set already on the particle.
	*	@method init
	*/
	function init():Void;

	/**
	*	Sets the textures for the particle.
	*	@method applyArt
	*	@param {Array<pixi.textures.Texture>} art An array of pixi.textures.Texture objects for this animated particle.
	*/
	function applyArt(art:Array<pixi.textures.Texture>):Void;

	/**
	*	Updates the particle.
	*	@method update
	*	@param {Float} delta Time elapsed since the previous frame, in __seconds__.
	*/
	function update( delta:Float ):Void;

	/**
	*	Destroys the particle, removing references and preventing future use.
	*	@method destroy
	*/
	function destroy():Void;
}