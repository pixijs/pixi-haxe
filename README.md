haxe-pixi
=========

![haxe pixi logo](https://raw.githubusercontent.com/adireddy/haxe-pixi/master/logo.png)

Extern classes of Pixi - v2 for Haxe - 2D webGL renderer with canvas fallback.

If you are looking for Pixi - v1.6.1 externs, you can get it from https://github.com/adireddy/haxe-pixi/releases/tag/v1.6.1-e0.1.3

### Installation ###

```haxe
haxelib install pixijs
```
<i>Please note that all the extern classes were not tested, so report any issues found by creating new issues in GitHub.</i>

### Demos ###

* [Basics](http://www.arm.rocks/haxe-pixi-demos/basics.html)
* [Graphics](http://www.arm.rocks/haxe-pixi-demos/graphics.html)
* [Movieclip](http://www.arm.rocks/haxe-pixi-demos/movieclip.html)
* [Spritesheet](http://www.arm.rocks/haxe-pixi-demos/spritesheet.html)
* [Snake](http://www.arm.rocks/haxe-pixi-demos/snake.html)
* [Spine](http://www.arm.rocks/haxe-pixi-demos/spine.html)
* [Render Texture](http://www.arm.rocks/haxe-pixi-demos/rendertexture.html)

Source code of the abovr examples ported to haxe can be found at https://github.com/adireddy/haxe-pixi-demos

### Usage ###

```haxe

package ;

import pixi.Pixi;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	private var _bunny:Sprite;
    private var _renderer:Dynamic;
    private var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);
        
        var texture = Texture.fromImage("bunny.png");
        _bunny = new Sprite(texture);
        _bunny.anchor.x = _bunny.anchor.y = 0.5;
        _bunny.position.x = 400;
        _bunny.position.y = 300;
        _bunny.scale.x = _bunny.scale.y = 2;
        
        _stage.addChild(_bunny);
        
        Browser.window.requestAnimationFrame(cast animate);
	}

	private function animate():Void {
        Browser.window.requestAnimationFrame(cast animate);
        _bunny.rotation += 0.1;  
        _renderer.render(_stage);
    }

	private static function main() {
		new Main();
	}
}
```

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.
