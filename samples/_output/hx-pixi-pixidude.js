(function () { "use strict";
var pixi = {};
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.pixidude = {};
samples.pixidude.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	this._renderer.view.style.display = "block";
	this._renderer.view.style.width = "100%";
	this._renderer.view.style.height = "100%";
	window.document.body.appendChild(this._renderer.view);
	var assetsToLoader = ["assets/spine/data/PixieSpineData.json","assets/spine/data/Pixie.json","assets/spine/data/iP4_BGtile.jpg","assets/spine/data/iP4_ground.png"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
	this._postition = 0;
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.pixidude.Main.main = function() {
	new samples.pixidude.Main();
};
samples.pixidude.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		this._background1 = PIXI.Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
		this._background2 = PIXI.Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
		this._stage.addChild(this._background1);
		this._stage.addChild(this._background2);
		this._foreground1 = PIXI.Sprite.fromImage("assets/spine/data/iP4_ground.png");
		this._foreground2 = PIXI.Sprite.fromImage("assets/spine/data/iP4_ground.png");
		this._stage.addChild(this._foreground1);
		this._stage.addChild(this._foreground2);
		this._foreground1.position.y = this._foreground2.position.y = 640 - this._foreground2.height;
		this._pixie = new PIXI.Spine("assets/spine/data/PixieSpineData.json");
		var scale = 0.3;
		this._pixie.position.x = 341.333333333333314;
		this._pixie.position.y = 500;
		this._pixie.scale.x = this._pixie.scale.y = scale;
		this._pixie.stateData.setMixByName("running","jump",0.2);
		this._pixie.stateData.setMixByName("jump","running",0.4);
		this._pixie.state.setAnimationByName("running",true);
		this._stage.addChild(this._pixie);
		this._stage.click = $bind(this,this._stageOnClick);
	}
	,_stageOnClick: function(data) {
		this._pixie.state.setAnimationByName("jump",false);
		this._pixie.state.addAnimationByName("running",true);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples.pixidude.Main.main();
})();
