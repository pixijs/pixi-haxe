package samples.basics;

import pixi.text.Text;
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
		super.start();

		var resolution:Int = (Browser.window.devicePixelRatio >= 2) ? 2 : 1;

		var imgPath:String = (resolution == 2) ? "assets/basics/img@2x.jpg" : "assets/basics/img.jpg";
		_img = new Sprite(Texture.fromImage(imgPath));
		_img.anchor.set(0.5, 0.5);
		_img.name = "img";
		_img.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_stage.addChild(_img);

		var style:TextStyle = {};
		style.fill = "#FFFFFF";
		style.font = "16px Tahoma";

		_label = new Text(imgPath, style);
		_label.position.set(_img.x - 480, _img.y - 300);
		_stage.addChild(_label);
	}

	static function main() {
		new Main();
	}
}