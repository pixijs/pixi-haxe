package demos.spritesheet;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

    var _loader:AssetLoader;
    var _alienContainer:DisplayObjectContainer;
    var _renderer:WebGLRenderer;
    var _stage:Stage;

    var _count:Float;
    var _aliens:Array<Sprite>;
    var _alienFrames:Array<String>;

    public function new() {
        _stage = new Stage(0x00FF00);
        _renderer = Detector.autoDetectRenderer(800, 600);
        Browser.document.body.appendChild(_renderer.view);

        var assetsToLoader:Array<String> = ["assets/spritesheet/SpriteSheet.json"];

        _loader = new AssetLoader(assetsToLoader);
        _loader.onComplete = onAssetsLoaded;
        _loader.load();

        _count = 0;
        _aliens = [];
        _alienFrames = ["eggHead.png", "flowerTop.png", "helmlok.png", "skully.png"];

        _alienContainer = new DisplayObjectContainer();
        _alienContainer.x = 400;
        _alienContainer.y = 300;

        _stage.addChild(_alienContainer);
    }

    function animate() {
        Browser.window.requestAnimationFrame(cast animate);
        for (i in 0...100) {
            var alien = _aliens[i];
            alien.rotation += 0.1;
        }

        _count += 0.01;
        _alienContainer.scale.set(Math.sin(_count), Math.sin(_count));
        _alienContainer.rotation += 0.01;
        _renderer.render(_stage);
    }

    function onAssetsLoaded() {
        for (i in 0...100) {
            var frameName:String = _alienFrames[i % 4];
            var alien = Sprite.fromFrame(frameName);
            alien.x = Math.random() * 800 - 400;
            alien.y = Math.random() * 600 - 300;
            alien.anchor.set(0.5, 0.5);
            _aliens.push(alien);
            _alienContainer.addChild(alien);
        }
        Browser.window.requestAnimationFrame(cast animate);
    }

    static function main() {
        new Main();
    }
}