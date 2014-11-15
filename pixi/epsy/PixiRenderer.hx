package pixi.epsy;

@:native("PIXI.PixiRenderer")
extern class PixiRenderer {

    function new();

    function render(emitter:Emitter):Void;
    function hideAllParticles(emitter:Emitter):Void;

    function sort():Void;
    function reset():Void;
}