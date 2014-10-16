package pixi.epsy;

@:native("PIXI.Emitter")
extern class Emitter {

    function new();

    var id:Float;
    var container:Dynamic;
    var settings:Dynamic; //EmitterEntity;

    var _baseSystem:Dynamic;
    var _totalParticles:Int;


    var emissionRate:Int;
    var allOrNone:Bool;


    var aFactor:Dynamic;
    var xFactor:Dynamic;

    var active:Bool;
    var duration:Float;
    var cycles:Dynamic;

    var border:Dynamic;

    var recyclable:Array<Dynamic>;

    var zIndex:Int;
    var xEquation:String;
    var yEquation:String;
    var posTransform:Dynamic;
    var particles:Dynamic;
    var totalParticles:Int;

    function load(config:Dynamic):Void;
    function save():Dynamic;

    function restart():Void;
    function reset():Void;
    function kill():Void;
    function update(delta:Float):Void;
}