package pixi.plugins.input;

import pixi.plugins.input.core.InputObject;

@:native("PIXI.Select")
extern class Select extends InputObject {

	function new(?data:Dynamic);

	var value:Dynamic;
}