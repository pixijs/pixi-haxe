package pixi.spine;

import pixi.display.DisplayObjectContainer;

@:native("PIXI.Spine")
extern class Spine extends DisplayObjectContainer {

	/**
	 * A class that enables the you to import and run your spine animations in pixi.
	 * Spine animation data needs to be loaded using the PIXI.AssetLoader or PIXI.SpineLoader before it can be used by this class
	 * See example 12 (http://www.goodboydigital.com/pixijs/examples/12/) to see a working example and check out the source
	 *
	 * @class Spine
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param url {String} The url of the spine anim file to be used
	*/
	function new(url:String);

		/**
	 * If this flag is set to true, the spine animation will be autoupdated every time
	 * the object id drawn. The down side of this approach is that the delta time is
	 * automatically calculated and you could miss out on cool effects like slow motion,
	 * pause, skip ahead and the sorts. Most of these effects can be achieved even with
	 * autoupdate enabled but are harder to achieve.
	 *
	 * @property autoUpdate
	 * @type { Bool }
	 * @default true
	 */
	var autoUpdate:Bool;

	/**
	 * Update the spine skeleton and its animations by delta time (dt)
	 *
	 * @method update
	 * @param dt {Float} Delta time. Time by which the animation should be updated
	 */
	function update(dt:Float):Void;

	var spineData:SkeletonData;
	var skeleton:Skeleton;
	var stateData:AnimationStateData;
	var state:AnimationState;
}

typedef Descriptor = {
	var name:String;
	var scale:Float;
	var rotation:Float;
}