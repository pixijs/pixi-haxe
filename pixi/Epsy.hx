package pixi;

import pixi.epsy.PixiRenderer;
import pixi.epsy.Emitter;

@:native("PIXI.EPSY")
extern class Epsy {

    function new();

    var lastTimestamp:Date;
    var emitters:Array<Dynamic>;

    var particleRenderer:PixiRenderer;

    function createEmitter(config:Dynamic, x:Float, y:Float):Emitter;
    function loadSystem(config:Dynamic, x:Float, y:Float):Void;

    function updateTransform():Void;
}