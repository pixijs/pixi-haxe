(function () { "use strict";
var pixi = {};
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.spine = {};
samples.spine.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	this._renderer.view.style.display = "block";
	window.document.body.appendChild(this._renderer.view);
	var assetsToLoader = ["assets/spine/data/spineboy.json","assets/spine/data/spineboySpineData.json"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.spine.Main.main = function() {
	new samples.spine.Main();
};
samples.spine.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		this._spineBoy = new PIXI.Spine("assets/spine/data/spineboySpineData.json");
		this._spineBoy.position.x = 400;
		this._spineBoy.position.y = 600;
		this._spineBoy.stateData.setMixByName("walk","jump",0.2);
		this._spineBoy.stateData.setMixByName("jump","walk",0.4);
		this._spineBoy.state.setAnimationByName("walk",true);
		this._stage.addChild(this._spineBoy);
		this._stage.click = $bind(this,this._stageOnClick);
	}
	,_stageOnClick: function(data) {
		this._spineBoy.state.setAnimationByName("jump",false);
		this._spineBoy.state.addAnimationByName("walk",true);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples.spine.Main.main();
})();
