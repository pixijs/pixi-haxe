package deviceinfo;

import pixi.core.display.Container;
import pixi.core.text.Text;
import pixi.core.Application;
import js.Browser;

class Main extends Application {

	var _info:Container;

	var _rendererType:Array<String>;

	public function new() {
		super({backgroundColor: 0x003366});
		_init();
	}

	function _init() {
		super.start();

		_info = new Container();
		stage.addChild(_info);

		var txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Resolution: \t\t" + Browser.window.innerWidth + " x " + Browser.window.innerHeight;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Pixel Ratio: \t\t" + Browser.window.devicePixelRatio;
		txt.y = 40;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Renderer: \t\t\t\t\t" + switch (renderer.type)
		{
			case UNKNOWN: "Unknown";
			case WEBGL: "WebGL";
			case CANVAS: "Canvas";
		};
		txt.y = 80;
		_info.addChild(txt);

		_info.position.x = (Browser.window.innerWidth - _info.width) / 2;
		_info.position.y = (Browser.window.innerHeight - _info.height) / 2;
	}

	static function main() {
		new Main();
	}
}