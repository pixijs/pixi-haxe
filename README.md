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
* [Graphics](http://notboring.github.io/demos/haxe-pixi/graphics.html)
* [Animated Sprite](http://notboring.github.io/demos/haxe-pixi/animatedsprite.html)
* [Spritesheet](http://notboring.github.io/demos/haxe-pixi/spritesheet.html)
* [Spine](http://notboring.github.io/demos/haxe-pixi/spine.html)
* [Rope](http://notboring.github.io/demos/haxe-pixi/rope.html)
* [Dragging](http://notboring.github.io/demos/haxe-pixi/dragging.html)
* [Tiling](http://notboring.github.io/demos/haxe-pixi/tiling.html)
* [Bitmap Font](http://notboring.github.io/demos/haxe-pixi/bitmapfont.html)
* [Alpha Mask](http://notboring.github.io/demos/haxe-pixie/alphamask.html)
* [Bunnymark](http://notboring.github.io/demos/haxe-pixi/bunnymark.html)
* [Retina](http://notboring.github.io/demos/haxe-pixi/retina.html)
* [Events](http://notboring.github.io/demos/haxe-pixi/events.html)
* [Loader](http://notboring.github.io/demos/haxe-pixi/loader.html)
* [Video](http://notboring.github.io/demos/haxe-pixi/video.html)
* [Nape](http://notboring.github.io/demos/haxe-pixi/nape.html)

**Filters (WebGL only)**

* [ColorMatrix](http://notboring.github.io/demos/haxe-pixi/colormatrix.html)
* [Blur](http://notboring.github.io/demos/haxe-pixi/blur.html)

**Filters (pixi-extra-filters)**
* [Glow](http://notboring.github.io/demos/haxe-pixi/glow.html)

Look at the `samples` folder for the source code of above examples.

### Usage

```haxe

import pixi.plugins.app.Application;
import pixi.core.graphics.Graphics;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main extends Application {

	var _bunny:Sprite;
	var _graphic:Graphics;

	public function new() {
		super();

		position = Application.POSITION_FIXED;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		backgroundColor = 0x006666;
		transparent = true;
		antialias = false;
		onUpdate = _animate;
		super.start();

		_bunny = new Sprite(Texture.from("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5);
		_bunny.position.set(400, 300);

		_graphic = new Graphics();
		_graphic.beginFill(0xFF0000, 0.4);
		_graphic.drawRect(200, 150, 400, 300);
		_graphic.endFill();

		stage.addChild(_graphic);
		stage.addChild(_bunny);
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
