package samples.events;

import pixi.plugins.eventemitter.EventTarget;
import pixi.core.text.Text;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _img:Sprite;
	var _label:Text;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		super.start();

		_img = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_img.anchor.set(0.5, 0.5);
		_img.position.set(400, 300);
		_img.interactive = true;
		_img.on("click", _onEvent);
		_img.on("mouseover", _onEvent);
		_img.on("mousedown", _onEvent);
		_img.on("touch", _onEvent);
		_stage.addChild(_img);

		var style:TextStyle = {};
		style.fill = "#000000";
		style.font = "12px Courier";

		_label = new Text("EVENTS", style);
		_label.position.set(0, 0);
		_stage.addChild(_label);
	}

	function _onEvent(target:EventTarget) {
		_label.text = target.type;
	}

	static function main() {
		new Main();
	}
}