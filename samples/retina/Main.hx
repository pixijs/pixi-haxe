package retina;

import pixi.core.Pixi;
import pixi.core.text.TextStyleObject;
import pixi.core.text.Text;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
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
		pixelRatio = _getPixelRatio();
		super.start();

		var imgPath:String = "assets/retina/img" + _getResolutionStr() + ".jpg";
		_img = new Sprite(Texture.fromImage(imgPath));
		_img.anchor.set(0.5);
		_img.name = "img";
		_img.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		stage.addChild(_img);

		var style:TextStyleObject = {};
		style.fill = 0xF78181;
		style.fontSize = 12;
		style.fontFamily = "Courier";

		_label = new Text(imgPath, style);
		_label.position.set(0, 0);
		stage.addChild(_label);
	}

	function _getPixelRatio():Float {
		if (Browser.window.devicePixelRatio <= 1 || (Browser.window.devicePixelRatio > 1 && Browser.window.devicePixelRatio < 1.5)) return 1;
		else if (Browser.window.devicePixelRatio >= 1.5 && Browser.window.devicePixelRatio < 2) return 1.5;
		else if (Browser.window.devicePixelRatio >= 2 && Browser.window.devicePixelRatio < 3) return 2;
		else return 3;
	}

	function _getResolutionStr():String {
		return "@" + _getPixelRatio() + "x";
	}

	static function main() {
		new Main();
	}
}