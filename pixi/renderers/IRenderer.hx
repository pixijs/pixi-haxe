package pixi.renderers;

import js.html.CanvasElement;
import pixi.display.Stage;

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