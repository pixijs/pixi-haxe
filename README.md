### Switch to v2.x.x branch for stable v2 externs ###

[![Haxelib Version](https://img.shields.io/github/tag/pixijs/pixi-haxe.svg?style=flat&label=haxelib)](http://lib.haxe.org/p/pixijs) ![Build Status](https://travis-ci.org/pixijs/pixi-haxe.svg?branch=master) [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/) [![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/adireddy/haxe-pixi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![haxe pixi logo](https://raw.githubusercontent.com/pixijs/pixi-haxe/master/logo.png)

Externs of pixi.js (v3) for Haxe - 2D webGL renderer with canvas fallback.

### Installation ###

```haxe
haxelib install pixijs 3.0.0-rc
```
### API Documentation ###

[Documentation](http://adireddy.github.io/docs/haxe-pixi/v3/) - generated with chxdocs

### Issues ###

Found any bug? Please create a new [issue](https://github.com/pixijs/pixi-haxe/issues/new).

### Demos ###

* [Basics](http://adireddy.github.io/demos/haxe-pixi/v3/basics.html) - basic example
* [Bunnymark](http://adireddy.github.io/demos/haxe-pixi/v3/bunnymark.html) - perormance check
* [Spritesheet](http://adireddy.github.io/demos/haxe-pixi/v3/spritesheet.html) - perormance check
* [Retina](http://adireddy.github.io/demos/haxe-pixi/v3/retina.html) - retina asset handling
* [Events](http://adireddy.github.io/demos/haxe-pixi/v3/events.html) - events example
* [Loader](http://adireddy.github.io/demos/haxe-pixi/v3/loader.html) - using loader to load images
* [Video](http://adireddy.github.io/demos/haxe-pixi/v3/video.html) - video test

Look at the `samples` folder for the source code of above examples.

### Usage ###

```haxe

package samples.basics;

import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main {

	var _bunny:Sprite;
	var _renderer:SystemRenderer;
	var _stage:Container;

	public function new() {
		// Rendering options usage sample
		var options:RenderingOptions = {};
		options.backgroundColor = 0x003366;
		options.resolution = 1;

		_stage = new Container();
		_renderer = Detector.autoDetectRenderer(800, 600, options);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.position.set(400, 300);

		_stage.addChild(_bunny);

		Browser.document.body.appendChild(_renderer.view);
		Browser.window.requestAnimationFrame(cast _animate);
	}

	function _animate() {
		Browser.window.requestAnimationFrame(cast _animate);
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

[Code of Conduct](https://github.com/CoralineAda/contributor_covenant) is adapted from [Contributor Covenant](http://contributor-covenant.org/version/1/0/0/)
