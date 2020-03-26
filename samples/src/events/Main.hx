package events;

import pixi.core.text.DefaultStyle;
import pixi.interaction.InteractionEvent;
import pixi.core.text.Text;
import pixi.core.Application;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

class Main extends Application {

	var _img:Sprite;
	var _label:Text;

	public function new() {
		super({backgroundColor: 0xFFFFFF});
		_init();
	}

	function _init() {
		super.start();
		_img = new Sprite(Texture.from("assets/basics/bunny.png"));
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

		var style:DefaultStyle = {};
		style.fill = "#000000";
		style.fontSize = 12;
		style.fontFamily = "Courier";

		_label = new Text("EVENTS", style);
		_label.position.set(0, 0);
		stage.addChild(_label);

		ticker.add(function(delta){
			_onUpdate(delta);
		});
	}
	
	function _onUpdate(t:Float):Void{
		_img.rotation += 0.1;
	}

	function _onEvent(target:InteractionEvent) {
		_label.text = target.type;
	}

	static function main() {
		new Main();
	}
}