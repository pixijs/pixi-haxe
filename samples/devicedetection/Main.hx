package devicedetection;

import pixi.core.display.Container;
import pixi.core.text.Text;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _info:Container;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0x003366;
		super.start();

		_info = new Container();
		stage.addChild(_info);

		var txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Android:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + _isAndroid();
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Android Phone:\t\t\t\t\t" + _isAndroidPhone();
		txt.y = 40;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "iOS:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + _isiOS();
		txt.y = 80;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "iOS Phone:\t\t\t\t\t\t\t\t\t\t\t\t\t" + _isiOSPhone();
		txt.y = 120;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Windows:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + _isWindows();
		txt.y = 160;
		_info.addChild(txt);

		txt = new Text("", {fill: "#FFFFFF"});
		txt.text = "Windows Phone:\t\t\t" + _isWindowsPhone();
		txt.y = 200;
		_info.addChild(txt);

		_info.position.x = (Browser.window.innerWidth - _info.width) / 2;
		_info.position.y = (Browser.window.innerHeight - _info.height) / 2;
	}

	function _isAndroid():Bool {
		return ~/Android/i.match(Browser.navigator.userAgent);
	}

	function _isAndroidPhone():Bool {
		return ~/Android/i.match(Browser.navigator.userAgent) && ~/Mobile/i.match(Browser.navigator.userAgent);
	}

	function _isiOS():Bool {
		return ~/(iPad|iPhone|iPod)/i.match(Browser.navigator.userAgent);
	}

	function _isiOSPhone():Bool {
		return ~/(iPhone|iPod)/i.match(Browser.navigator.userAgent);
	}

	function _isWindows():Bool {
		return ~/(Windows|iemobile)/i.match(Browser.navigator.userAgent);
	}

	function _isWindowsPhone():Bool {
		return ~/Windows Phone/i.match(Browser.navigator.userAgent) || ~/iemobile/i.match(Browser.navigator.userAgent);
	}

	function _getiOSVersion():Array<Int> {
		var v:EReg = ~/[0-9_]+?[0-9_]+?[0-9_]+/i;
		var matched:Array<Int> = [];
		if (v.match(Browser.navigator.userAgent)) {
			var match:Array<String> = v.matched(0).split("_");
			matched = [for (i in match) Std.parseInt(i)];
		}
		return matched;
	}

	static function main() {
		new Main();
	}
}