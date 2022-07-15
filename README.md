# Pixi.js 5 / Haxe 4 [![Build Status](https://travis-ci.org/markknol/pixi-haxe.svg?branch=pixi5)](https://travis-ci.org/markknol/pixi-haxe)

![image](https://user-images.githubusercontent.com/576184/70228763-38c03100-1755-11ea-9f2a-b1afc30be237.png)


### Installation

```
haxelib install pixijs
```

### Build from source

```
git clone git@github.com:pixijs/pixi-haxe.git
cd pixi-haxe
lix download
haxe build.hxml
```

### Issues

Found any bug? Please create a new [issue](https://github.com/pixijs/pixi-haxe/issues/new).

### [Demos](https://github.com/notboring/notboring.github.io/tree/master/demos/haxe-pixi)

* [Alpha mask](https://notboring.github.io/demos/haxe-pixi/alphamask.html)
* [Animated sprite](https://notboring.github.io/demos/haxe-pixi/animatedsprite.html)
* [Basics](https://notboring.github.io/demos/haxe-pixi/basics.html)
* [Bitmap text](https://notboring.github.io/demos/haxe-pixi/bitmaptext.html)
* [Blur](https://notboring.github.io/demos/haxe-pixi/blur.html)
* [Bunnymark](https://notboring.github.io/demos/haxe-pixi/bunnymark.html)
* [Color matrix](https://notboring.github.io/demos/haxe-pixi/colormatrix.html)
* [Device detection](https://notboring.github.io/demos/haxe-pixi/devicedetection.html)
* [Device info](https://notboring.github.io/demos/haxe-pixi/deviceinfo.html)
* [Dragging](https://notboring.github.io/demos/haxe-pixi/dragging.html)
* [Events](https://notboring.github.io/demos/haxe-pixi/events.html)
* [Glow](https://notboring.github.io/demos/haxe-pixi/glow.html)
* [Graphics](https://notboring.github.io/demos/haxe-pixi/graphics.html)
* [Loader](https://notboring.github.io/demos/haxe-pixi/loader.html)
* [Mask](https://notboring.github.io/demos/haxe-pixi/mask.html)
* [Movie clip](https://notboring.github.io/demos/haxe-pixi/movieclip.html)
* [Nape](https://notboring.github.io/demos/haxe-pixi/nape.html)
* [Particles](https://notboring.github.io/demos/haxe-pixi/particles.html)
* [Pixi dude](https://notboring.github.io/demos/haxe-pixi/pixidude.html)
* [Render texture](https://notboring.github.io/demos/haxe-pixi/rendertexture.html)
* [Rope](https://notboring.github.io/demos/haxe-pixi/rope.html)
* [Spine](https://notboring.github.io/demos/haxe-pixi/spine.html)
* [Spritesheet](https://notboring.github.io/demos/haxe-pixi/spritesheet.html)
* [Text](https://notboring.github.io/demos/haxe-pixi/text.html)
* [Tiling](https://notboring.github.io/demos/haxe-pixi/tiling.html)


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
