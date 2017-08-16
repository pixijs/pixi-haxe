package pixi.plugins.spine;

import pixi.plugins.spine.core.SkeletonData;
import pixi.plugins.spine.core.AnimationStateData;
import pixi.core.display.Container;

@:native("PIXI.spine.Spine")
extern class Spine extends Container {

	/**
	 * A class that enables the you to import and run your spine animations in pixi.
	 * The Spine animation data needs to be loaded using either the Loader or a SpineLoader before it can be used by this class
	 * See example 12 (http://www.goodboydigital.com/pixijs/examples/12/) to see a working example and check out the source
	 *
	 * ```js
	 * var spineAnimation = new PIXI.Spine(spineData);
	 * ```
	 *
	 * @class
	 * @extends Container
	 * @memberof PIXI.spine
	 * @param spineData {object} The spine data loaded from a spine atlas.
	 */
	function new(spineData:Dynamic);

	/**
     * Should the Spine object update its transforms
     *
     * @member {boolean}
     */
	var autoUpdate:Bool;

	/**
     * The spineData object
     *
     * @member {object}
     */
	var spineData:SkeletonData;

	/**
     * A spine Skeleton object
     *
     * @member {object}
     */
	var skeleton:Dynamic;

	/**
     * A spine AnimationStateData object created from the spine data passed in the constructor
     *
     * @member {object}
     */
	var stateData:AnimationStateData;

	/**
     * A spine AnimationState object created from the spine AnimationStateData object
     *
     * @member {object}
     */
	var state:Dynamic;

	/**
     * An array of containers
     *
     * @member {Container[]}
     */
	var slotContainers:Array<Container>;

	/**
	 * Update the spine skeleton and its animations by delta time (dt)
	 *
	 * @param dt {number} Delta time. Time by which the animation should be updated
	 */
	function update(dt:Float):Void;
}