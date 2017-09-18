package pixi.plugins.spine.core;

import pixi.plugins.spine.core.Event;

typedef AnimationStateListener2 =
{

	@:optional function start(entry: TrackEntry):Void;
    @:optional function interrupt(entry: TrackEntry):Void;
    @:optional function end(entry: TrackEntry):Void;
    @:optional function dispose(entry: TrackEntry):Void;
    @:optional function complete(entry: TrackEntry):Void;
    @:optional function event(entry: TrackEntry, event: Event):Void;
	
}