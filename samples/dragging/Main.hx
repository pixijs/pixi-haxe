package dragging;

import pixi.interaction.EventTarget;
import pixi.core.math.Point;
import pixi.core.text.Text;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import js.Browser;

class Main extends Application {

	var _texture:Texture;
	var _label:Text;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		super.start();

		_texture = Texture.fromImage("assets/basics/bunny.png");
		for (i in 0 ... 10) _createBunny(Math.floor(Math.random() * Browser.window.innerWidth), Math.floor(Math.random() * Browser.window.innerHeight));
	}

	function _createBunny(x:Float, y:Float) {
		// create our little bunny friend..
		var bunny:Bunny = new Bunny(_texture);

		// enable the bunny to be interactive... this will allow it to respond to mouse and touch events
		bunny.interactive = true;

		// this button mode will mean the hand cursor appears when you roll over the bunny with your mouse
		bunny.buttonMode = true;

		// center the bunny's anchor point
		bunny.anchor.set(0.5);

		// make it a bit bigger, so it's easier to grab
		bunny.scale.set(3);

		// setup events
		bunny.on("mousedown", _onDragStart);
		bunny.on("touchstart", _onDragStart);
		// events for drag end
		bunny.on("mouseup", _onDragEnd);
		bunny.on("mouseupoutside", _onDragEnd);
		bunny.on("touchend", _onDragEnd);
		bunny.on("touchendoutside", _onDragEnd);
		// events for drag move
		bunny.on("mousemove", _onDragMove);
		bunny.on("touchmove", _onDragMove);

		// move the sprite to its designated position
		bunny.position.set(x, y);

		// add it to the stage
		stage.addChild(bunny);
	}

	function _onDragStart(event:EventTarget) {
		var bunny:Bunny = cast(event.target, Bunny);
		// store a reference to the data
		// the reason for this is because of multitouch
		// we want to track the movement of this particular touch
		bunny.data = event.data;
		bunny.alpha = 0.5;
		bunny.dragging = true;
	}

	function _onDragEnd(event:EventTarget) {
		var bunny:Bunny = cast(event.target, Bunny);
		bunny.alpha = 1;
		bunny.dragging = false;

		// set the interaction data to null
		bunny.data = null;
	}

	function _onDragMove(event:EventTarget) {
		var bunny:Bunny = cast(event.target, Bunny);
		if (bunny.dragging) {
			var newPosition:Point = bunny.data.getLocalPosition(bunny.parent);
			bunny.position.set(newPosition.x, newPosition.y);
		}
	}

	static function main() {
		new Main();
	}
}