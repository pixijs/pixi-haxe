haxe-pixi
=========

![haxe pixi logo](https://raw.githubusercontent.com/adireddy/haxe-pixi/master/logo.png)

Extern classes of Pixi - v1.6.1 for Haxe - 2D webGL renderer with canvas fallback.

### Installation ###

```haxe
haxelib install pixijs
```
<i>Please note that all the extern classes were not tested, so report any issues found by creating new issues in GitHub.</i>

### Demos ###

Examples ported to haxe can be found at https://github.com/adireddy/haxe-pixi-demos

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

This content is released under the (http://opensource.org/licenses/MIT) MIT License.
