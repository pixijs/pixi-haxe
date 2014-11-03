haxe-pixi
=========

![haxe pixi logo](https://raw.githubusercontent.com/adireddy/haxe-pixi/master/logo.png)

Externs of pixi.js (v2.0.0) for Haxe - 2D webGL renderer with canvas fallback.

If you are looking for pixi.js (v1.6.1) externs, you can get them from https://github.com/adireddy/haxe-pixi/releases/tag/v1.6.1-e0.1.3

### Installation ###

```haxe
haxelib install pixijs
```

Issues
======

Found any bug? Please create an issue on GitHub.

https://github.com/adireddy/haxe-pixi/issues

### Demos ###

* [Basics](http://www.arm.rocks/haxe-pixi-demos/basics.html)
* [Graphics](http://www.arm.rocks/haxe-pixi-demos/graphics.html)
* [Movieclip](http://www.arm.rocks/haxe-pixi-demos/movieclip.html)
* [Spritesheet](http://www.arm.rocks/haxe-pixi-demos/spritesheet.html)
* [Snake](http://www.arm.rocks/haxe-pixi-demos/snake.html)
* [Spine](http://www.arm.rocks/haxe-pixi-demos/spine.html)
* [Render Texture](http://www.arm.rocks/haxe-pixi-demos/rendertexture.html)
* [Pixi Dude](http://www.arm.rocks/haxe-pixi-demos/pixidude.html)
* [Bitmap Text](http://www.arm.rocks/haxe-pixi-demos/bitmaptext.html)

Source code of the above examples ported to haxe can be found at https://github.com/adireddy/haxe-pixi-demos

### Usage ###

```haxe

package ;

import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _bunny:Sprite;
    var _renderer:Dynamic;
    var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);
        
        _bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
        _bunny.anchor.set(0.5, 0.5);
        _bunny.scale.set(2, 2);
        _bunny.position.x = 400;
        _bunny.position.y = 300;
        
        _stage.addChild(_bunny);
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
        Browser.window.requestAnimationFrame(cast animate);
        _bunny.rotation += 0.1;  
        _renderer.render(_stage);
    }

	static function main() {
		new Main();
	}
}
```

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.
