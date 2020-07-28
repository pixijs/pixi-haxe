# Pixi.js 5 / Haxe 4 [![Build Status](https://travis-ci.org/markknol/pixi-haxe.svg?branch=pixi5)](https://travis-ci.org/markknol/pixi-haxe)

![image](https://user-images.githubusercontent.com/576184/70228763-38c03100-1755-11ea-9f2a-b1afc30be237.png)


-### Installation

```
haxelib install pixijs
```

### Issues

Found any bug? Please create a new [issue](https://github.com/pixijs/pixi-haxe/issues/new).

### Demos

* [Basics](http://notboring.github.io/demos/haxe-pixi/basics.html)

### Usage

```haxe

package basics;

import pixi.core.Application;
import pixi.core.graphics.Graphics;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main extends Application {

	var _bunny:Sprite;
	var _graphic:Graphics;

	public function new() {
		
		var options:ApplicationOptions = {
			width: Browser.window.innerWidth,
			height: Browser.window.innerHeight,
			backgroundColor: 0x006666,
			transparent: true,
			antialias: false,
		};
		
		super(options);
		ticker.add(function(delta){
			_animate(delta);
		});

		_bunny = new Sprite(Texture.from("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5);
		_bunny.position.set(400, 300);

		_graphic = new Graphics();
		_graphic.beginFill(0xFF0000, 0.4);
		_graphic.drawRect(200, 150, 400, 300);
		_graphic.endFill();

		stage.addChild(_graphic);
		stage.addChild(_bunny);
		Browser.document.body.appendChild(view);
	}

	function _animate(e:Float) {
		_bunny.rotation += 0.1;
	}

	static function main() {
		new Main();
	}
}
```

### Licensing Information

<a rel="license" href="http://opensource.org/licenses/MIT">
<img alt="MIT license" height="40" src="http://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg" /></a>

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.

[Pixi.js](https://github.com/GoodBoyDigital/pixi.js) is licensed under the [MIT](http://opensource.org/licenses/MIT) License.


### Contributor Code of Conduct

[Code of Conduct](https://github.com/CoralineAda/contributor_covenant) is adapted from [Contributor Covenant, version 1.4](http://contributor-covenant.org/version/1/4)
