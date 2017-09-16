package pixi.plugins.spine.core;
import pixi.plugins.spine.core.AnimationStateData;
import pixi.plugins.spine.core.Event;

@:native("PIXI.spine.core.AnimationState")
extern class AnimationState 
{

	public static var emptyAnimation: Animation;
	public static var SUBSEQUENT: Float;
	public static var FIRST: Float;
	public static var DIP: Float;
	public static var DIP_MIX: Float;
	public var data: AnimationStateData;
	public var tracks: Array<TrackEntry>;
	public var events: Array<Event>;
	public var listeners: Array<AnimationStateListener2>;
	public var queue: EventQueue;
	public var propertyIDs: IntSet;
	public var mixingTo: Array<TrackEntry>;
	public var animationsChanged: Bool;
	public var timeScale: Float;
	public var trackEntryPool: Pool<TrackEntry>;
	public function new(data: AnimationStateData);
	public function update(delta: Float):Void;
	public function updateMixingFrom(to: TrackEntry, delta: Float): Bool;
	public function apply(skeleton: Skeleton): Bool;
	public function applyMixingFrom(to: TrackEntry, skeleton: Skeleton, currentPose: MixPose): Float;
	public function applyRotateTimeline(timeline: Timeline, skeleton: Skeleton, time: Float, alpha: Float, pose: MixPose, timelinesRotation: Array<Float>, i: Float, firstFrame: Bool):Void;
	public function queueEvents(entry: TrackEntry, animationTime: Float):Void;
	public function clearTracks():Void;
	public function clearTrack(trackIndex: Int):Void;
	public function setCurrent(index: Float, current: TrackEntry, interrupt: Bool):Void;
	public function setAnimation(trackIndex: Int, animationName: String, loop: Bool): TrackEntry;
	public function setAnimationWith(trackIndex: Int, animation: Animation, loop: Bool): TrackEntry;
	public function addAnimation(trackIndex: Int, animationName: String, loop: Bool, delay: Float): TrackEntry;
	public function addAnimationWith(trackIndex: Int, animation: Animation, loop: Bool, delay: Float): TrackEntry;
	public function setEmptyAnimation(trackIndex: Int, mixDuration: Float): TrackEntry;
	public function addEmptyAnimation(trackIndex: Int, mixDuration: Float, delay: Float): TrackEntry;
	public function setEmptyAnimations(mixDuration: Float):Void;
	public function expandToIndex(index: Float): TrackEntry;
	public function trackEntry(trackIndex: Int, animation: Animation, loop: Bool, last: TrackEntry): TrackEntry;
	public function disposeNext(entry: TrackEntry):Void;
	public function _animationsChanged():Void;
	public function getCurrent(trackIndex: Int): TrackEntry;
	public function addListener(listener: AnimationStateListener2):Void;
	public function removeListener(listener: AnimationStateListener2):Void;
	public function clearListeners():Void;
	public function clearListenerNotifications():Void;
	public dynamic function onComplete(trackIndex: Int, loopCount: Float):Void;
	public dynamic function onEvent(trackIndex: Int, event: Event):Void;
	public dynamic function onStart(trackIndex: Int):Void;
	public dynamic function onEnd(trackIndex: Int):Void;	
	public function setAnimationByName(trackIndex: Int, animationName: String, loop: Bool):Void;	
	public function addAnimationByName(trackIndex: Int, animationName: String, loop: Bool, delay: Float):Void;
	public function hasAnimation(animationName: String): Bool;
	public function hasAnimationByName(animationName: String): Bool;
	
}