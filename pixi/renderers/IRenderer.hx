package pixi.renderers;
import pixi.display.Stage;
import pixi.DomDefinitions;

interface IRenderer {

	var transparent:Bool;
	var resolution:Float;

	var width:Float;
	var height:Float;
	var type:Int;
	var view:CanvasElement;

	function render(stage:Stage):Void;
	function resize(width:Float, height:Float):Void;
}