package bunnymark;

import pixi.particles.ParticleContainer;
import pixi.core.math.shapes.Rectangle;
import js.html.DivElement;
import js.Browser;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var wabbitTexture:Texture;

	var bunnys:Array<Bunny> = [];
	var bunnyTextures:Array<Texture> = [];
	var gravity:Float = 0.5;

	var maxX:Float;
	var minX:Float = 0;
	var maxY:Float;
	var minY:Float = 0;

	var startBunnyCount:Int = 2;
	var isAdding:Bool = false;
	var count:Int = 0;
	var container:ParticleContainer;

	var amount:Int = 100;
	var bunnyType:Int;
	var currentTexture:Texture;
	var counter:DivElement;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xE0E6F8;
		onUpdate = _onUpdate;
		onResize = _onResize;
		fps = 50;
		super.start();
		_setup();
	}

	function _setup() {
		renderer.view.style.transform = "translatez(0)";
		maxX = Browser.window.innerWidth;
		maxY = Browser.window.innerHeight;

		counter = Browser.document.createDivElement();
		counter.style.position = "absolute";
		counter.style.top = "0px";
		counter.style.width = "76px";
		counter.style.background = "#CCCCC";
		counter.style.backgroundColor = "#105CB6";
		counter.style.fontFamily = "Helvetica,Arial";
		counter.style.padding = "2px";
		counter.style.color = "#0FF";
		counter.style.fontSize = "9px";
		counter.style.fontWeight = "bold";
		counter.style.textAlign = "center";
		counter.className = "counter";
		Browser.document.body.appendChild(counter);

		count = startBunnyCount;
		counter.innerHTML = count + " BUNNIES";

		container = new ParticleContainer(200000, [false, true, false, false, false]);
		stage.addChild(container);

		wabbitTexture = Texture.fromImage("assets/bunnymark/bunnys.png");

		var bunny1 = new Texture(wabbitTexture.baseTexture, new Rectangle(2, 47, 26, 37));
		var bunny2 = new Texture(wabbitTexture.baseTexture, new Rectangle(2, 86, 26, 37));
		var bunny3 = new Texture(wabbitTexture.baseTexture, new Rectangle(2, 125, 26, 37));
		var bunny4 = new Texture(wabbitTexture.baseTexture, new Rectangle(2, 164, 26, 37));
		var bunny5 = new Texture(wabbitTexture.baseTexture, new Rectangle(2, 2, 26, 37));

		bunnyTextures = [bunny1, bunny2, bunny3, bunny4, bunny5];
		bunnyType = 1;
		currentTexture = bunnyTextures[bunnyType];

		for (i in 0 ... startBunnyCount) {
			var bunny = new Bunny(currentTexture);
			bunny.speedX = Math.random() * 5;
			bunny.speedY = (Math.random() * 5) - 3;

			bunny.anchor.x = 0.5;
			bunny.anchor.y = 1;

			bunnys.push(bunny);
			container.addChild(bunny);
		}

		renderer.view.onmousedown = onTouchStart;
		renderer.view.onmouseup = onTouchEnd;

		Browser.document.addEventListener("touchstart", onTouchStart, true);
		Browser.document.addEventListener("touchend", onTouchEnd, true);
	}

	function onTouchStart(event) {
		isAdding = true;
	}

	function onTouchEnd(event) {
		bunnyType++;
		bunnyType %= 5;
		currentTexture = bunnyTextures[bunnyType];
		isAdding = false;
	}

	function _onUpdate(elapsedTime:Float) {
		if (isAdding) {
			if (count < 200000) {
				for (i in 0 ... amount) {
					var bunny = new Bunny(currentTexture);
					bunny.speedX = Math.random() * 5;
					bunny.speedY = (Math.random() * 5) - 3;
					bunny.anchor.y = 1;
					bunnys.push(bunny);
					bunny.scale.set(0.5 + Math.random() * 0.5, 0.5 + Math.random() * 0.5);
					bunny.rotation = (Math.random() - 0.5);
					var random = Std.random(container.children.length - 2);
					container.addChild(bunny);

					count++;
				}
			}
			counter.innerHTML = count + " BUNNIES";
		}

		for (i in 0 ... bunnys.length) {
			var bunny = bunnys[i];

			bunny.position.x += bunny.speedX;
			bunny.position.y += bunny.speedY;
			bunny.speedY += gravity;

			if (bunny.position.x > maxX) {
				bunny.speedX *= -1;
				bunny.position.x = maxX;
			}
			else if (bunny.position.x < minX) {
				bunny.speedX *= -1;
				bunny.position.x = minX;
			}

			if (bunny.position.y > maxY) {
				bunny.speedY *= -0.85;
				bunny.position.y = maxY;
				if (Math.random() > 0.5) bunny.speedY -= Math.random() * 6;
			}
			else if (bunny.position.y < minY) {
				bunny.speedY = 0;
				bunny.position.y = minY;
			}
		}
	}

	function _onResize() {
		maxX = Browser.window.innerWidth;
		maxY = Browser.window.innerHeight;

		counter.style.top = "1px";
		counter.style.left = "1px";
	}

	static function main() {
		new Main();
	}
}