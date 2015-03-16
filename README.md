# haxe-pixi ![Build Status](https://travis-ci.org/adireddy/haxe-pixi.svg?branch=master) [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

![haxe pixi logo](https://raw.githubusercontent.com/adireddy/haxe-pixi/master/logo.png)

Externs of pixi.js (v2.2.7) for Haxe - 2D webGL renderer with canvas fallback.

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/adireddy/haxe-pixi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### Installation ###

```haxe
haxelib install pixijs 2.3.0
```
### API Documentation ###

Click [here](http://adireddy.github.io/docs/haxe-pixi) for API documentation.
[YUIDoc API](http://adireddy.github.io/docs/haxe-pixi/yui/) similar to [pixi.js docs](http://www.goodboydigital.com/pixijs/docs/) also available.

### Issues ###

Found any bug? Please create a new [issue](https://github.com/adireddy/haxe-pixi/issues/new).

### Demos ###

Ported from pixi.js

* [Basics](http://adireddy.github.io/demos/haxe-pixi/basics.html)
* [Graphics](http://adireddy.github.io/demos/haxe-pixi/graphics.html)
* [Movieclip](http://adireddy.github.io/demos/haxe-pixi/movieclip.html)
* [Spritesheet](http://adireddy.github.io/demos/haxe-pixi/spritesheet.html)
* [Snake](http://adireddy.github.io/demos/haxe-pixi/snake.html)
* [Spine](http://adireddy.github.io/demos/haxe-pixi/spine.html)
* [Render Texture](http://adireddy.github.io/demos/haxe-pixi/rendertexture.html)
* [Pixi Dude](http://adireddy.github.io/demos/haxe-pixi/pixidude.html)
* [Bitmap Text](http://adireddy.github.io/demos/haxe-pixi/bitmaptext.html)
* [Tiling Sprite](http://adireddy.github.io/demos/haxe-pixi/tiling.html)
* [Blur (Depth of Field)](http://adireddy.github.io/demos/haxe-pixi/blur.html)
* [Colour Matrix](http://adireddy.github.io/demos/haxe-pixi/colourmatrix.html)

New Demos

* [Nape Physics](http://adireddy.github.io/demos/haxe-pixi/nape.html)
* [Bunnymark](http://adireddy.github.io/demos/haxe-pixi/bunnymark.html)
* [Particles](http://adireddy.github.io/demos/haxe-pixi/particles.html)

Look at the `samples` folder for the source code of above examples.

### Usage ###

```haxe

package ;

import pixi.renderers.IRenderer;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _bunny:Sprite;
    var _renderer:IRenderer;
    var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
		
		// Rendering options usage sample
		var options:RenderingOptions = {};
		options.antialias = true;
		options.resolution = 1;
		options.transparent = true;
		
        _renderer = Detector.autoDetectRenderer(800, 600, options);
        Browser.document.body.appendChild(_renderer.view);
        
        _bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
        _bunny.anchor.set(0.5, 0.5);
        _bunny.scale.set(2, 2);
        _bunny.position.set(400, 300);
        
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

### Licensing Information ###

<a rel="license" href="http://opensource.org/licenses/MIT">
<img alt="MIT license" height="40" src="http://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg" /></a>

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.

[pixi.js](https://github.com/GoodBoyDigital/pixi.js) is made by [goodboy](http://www.goodboydigital.com/) and licensed under the [MIT](http://opensource.org/licenses/MIT) License.

### Contributor Code of Conduct ###

Code of Conduct is adapted from [Contributor Covenant](http://contributor-covenant.org/version/1/0/0/)
