package samples.spritesheet;

import pixi.Application;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;

class Main extends Application {

    var _loader:AssetLoader;
    var _alienContainer:DisplayObjectContainer;

    var _count:Float;
    var _aliens:Array<Sprite>;
    var _alienFrames:Array<String>;

    public function new() {
        super();
        _init();

        var assetsToLoad:Array<String> = ["assets/spritesheet/SpriteSheet.json"];
        _loader = new AssetLoader(assetsToLoad);
        _loader.onComplete = onAssetsLoaded;
        _loader.load();
    }

    function _init() {
        stats = true;
        backgroundColor = 0x00FF66;
        resize = false;
        width = 800;
        height = 600;
        super.start();
    }

    function _onUpdate(elapsedTime:Float) {
        for (i in 0 ... 100) {
            var alien = _aliens[i];
            alien.rotation += 0.1;
        }

        _count += 0.01;
        _alienContainer.scale.set(Math.sin(_count), Math.sin(_count));
        _alienContainer.rotation += 0.01;
        _renderer.render(_stage);
    }

    function onAssetsLoaded() {
        _count = 0;
        _aliens = [];
        _alienFrames = ["eggHead.png", "flowerTop.png", "helmlok.png", "skully.png"];

        _alienContainer = new DisplayObjectContainer();
        _alienContainer.x = 400;
        _alienContainer.y = 300;

        _stage.addChild(_alienContainer);

        for (i in 0...100) {
            var frameName:String = _alienFrames[i % 4];
            var alien = Sprite.fromFrame(frameName);
            alien.x = Math.random() * 800 - 400;
            alien.y = Math.random() * 600 - 300;
            alien.anchor.set(0.5, 0.5);
            _aliens.push(alien);
            _alienContainer.addChild(alien);
        }
        onUpdate = _onUpdate;
    }

    static function main() {
        new Main();
    }
}