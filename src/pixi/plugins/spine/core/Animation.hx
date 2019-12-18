package pixi.plugins.spine.core;

extern class Animation {
	public var name: String;
	public var timelines: Array<Timeline>;
	public var timelineIds: Array<Bool>;
	public var duration: Float;
	
	public function new(name: String, timelines: Array<Timeline>, duration: Float);
	public function hasTimeline(id: Float): Bool;
	public function apply(skeleton: Skeleton, lastTime: Float, time: Float, loop: Bool, events: Array<Event>, alpha: Float, blend: MixBlend, direction: MixDirection): Void;
	
    public static function binarySearch(values: Array<Float>, target: Float, ?step: Float): Float;
    public static function linearSearch(values: Array<Float>, target: Float, step: Float): Float;
}