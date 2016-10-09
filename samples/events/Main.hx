package events;

import pixi.core.text.TextStyleObject;
import pixi.interaction.EventTarget;
import pixi.core.text.Text;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

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
		_img.position.set(400, 300);
		_img.interactive = true;
		_img.scale.set(4);
		_img.anchor.set(0.5);
		_img.on("mouseover", _onEvent);
		_img.on("mouseout", _onEvent);
		_img.on("touchstart", _onEvent);
		_img.tap = _onEvent;
		_img.click = _onEvent;

		stage.addChild(_img);

		var style:TextStyleObject = {};
		style.fill = "#000000";
		style.fontSize = 12;
		style.fontFamily = "Courier";

		_label = new Text("EVENTS", style);
		_label.position.set(0, 0);
		stage.addChild(_label);

		onUpdate = function(t) {
			_img.rotation += 0.1;
		}
	}

	function _onEvent(target:EventTarget) {
		_label.text = target.type;
	}

	static function main() {
		new Main();
	}
}