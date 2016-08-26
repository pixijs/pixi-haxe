package spritesheet;

import pixi.core.text.Text;
import js.html.DivElement;
import pixi.loaders.Loader;
import pixi.extras.MovieClip;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _loader:Loader;
	var _label:Text;
	var _fighterTextures:Array<Texture>;
	var _counter:DivElement;
	var _count:Int;
	var _isAdding:Bool;

	public function new() {
		super();
		_init();
	}

	function _init() {
		onUpdate = _onUpdate;
		super.start(Application.AUTO);

		_loader = new Loader();
		_loader.baseUrl = "assets/spritesheet/";
		_loader.add("fighter", "fighter.json");
		_loader.load(_onLoaded);
	}

	function _onLoaded() {
		_count = 0;
		_isAdding = false;
		_fighterTextures = [];
		for (i in 0 ... 29) {
			var frame:String = "" + i;
			if (i < 10) frame = "0" + frame;
			_fighterTextures.push(Texture.fromFrame("rollSequence00" + frame + ".png"));
		}

		renderer.view.onmouseup = _onTouchEnd;
		Browser.document.addEventListener("touchend", _onTouchEnd, true);

		renderer.view.onmousedown = _onTouchStart;
		Browser.document.addEventListener("touchstart", _onTouchStart, true);

		_addCounter();
		_addFighter(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
	}

	function _onTouchStart(event) {
		_isAdding = true;
	}

	function _onTouchEnd(event) {
		_isAdding = false;
	}

	function _onUpdate(elapsedTime:Float) {
		if (_isAdding) _addFighter(Std.random(Browser.window.innerWidth), Std.random(Browser.window.innerHeight));
	}

	function _addFighter(x:Float, y:Float) {
		var fighter:MovieClip = new MovieClip(_fighterTextures);
		fighter.anchor.set(0.5);
		fighter.position.set(x, y);
		fighter.play();

		stage.addChild(fighter);
		_count++;
		_counter.innerHTML = _count + " SPRITES";
	}

	function _addCounter() {
		_counter = Browser.document.createDivElement();
		_counter.style.position = "absolute";
		_counter.style.top = "1px";
		_counter.style.left = "1px";
		_counter.style.width = "90px";
		_counter.style.background = "#CCCCC";
		_counter.style.backgroundColor = "#105CB6";
		_counter.style.fontFamily = "Helvetica,Arial";
		_counter.style.padding = "3px";
		_counter.style.color = "#0FF";
		_counter.style.fontSize = "10px";
		_counter.style.fontWeight = "bold";
		_counter.style.textAlign = "center";
		_counter.className = "counter";
		Browser.document.body.appendChild(_counter);
	}

	static function main() {
		new Main();
	}
}