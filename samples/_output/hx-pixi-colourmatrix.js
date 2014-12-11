(function () { "use strict";
var pixi = {};
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.colourmatrix = {};
samples.colourmatrix.Main = function() {
	this._stage = new PIXI.Stage(13158);
	this._stage.interactive = true;
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	this._bg = PIXI.Sprite.fromImage("assets/filters/BGrotate.jpg");
	this._bg.anchor.set(0.5,0.5);
	this._bg.x = window.innerWidth / 2;
	this._bg.y = window.innerHeight / 2;
	this._colorMatrix = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
	this._filter = new PIXI.ColorMatrixFilter();
	this._container = new PIXI.DisplayObjectContainer();
	this._container.x = window.innerWidth / 2;
	this._container.y = window.innerHeight / 2;
	this._bgFront = PIXI.Sprite.fromImage("assets/filters/SceneRotate.jpg");
	this._bgFront.anchor.set(0.5,0.5);
	this._container.addChild(this._bgFront);
	this._light2 = PIXI.Sprite.fromImage("assets/filters/LightRotate2.png");
	this._light2.anchor.set(0.5,0.5);
	this._container.addChild(this._light2);
	this._light1 = PIXI.Sprite.fromImage("assets/filters/LightRotate1.png");
	this._light1.anchor.set(0.5,0.5);
	this._container.addChild(this._light1);
	this._panda = PIXI.Sprite.fromImage("assets/filters/panda.png");
	this._panda.anchor.set(0.5,0.5);
	this._container.addChild(this._panda);
	this._stage.addChild(this._container);
	this._count = 0;
	this._switchy = false;
	this._stage.filters = [this._filter];
	this._stage.click = this._stage.tap = $bind(this,this._onClick);
	var style = { font : "bold 12pt Arial", fill : "#FFFFFF"};
	var help = new PIXI.Text("Click to turn filters on / off.",style);
	this._stage.addChild(help);
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.colourmatrix.Main.main = function() {
	new samples.colourmatrix.Main();
};
samples.colourmatrix.Main.prototype = {
	_onClick: function(data) {
		this._switchy = !this._switchy;
		if(!this._switchy) this._stage.filters = [this._filter]; else this._stage.filters = null;
	}
	,animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._count += 0.01;
		this._bg.rotation += 0.01;
		this._bgFront.rotation -= 0.01;
		this._light1.rotation += 0.02;
		this._light2.rotation += 0.01;
		this._panda.scale.x = 1 + Math.sin(this._count) * 0.04;
		this._panda.scale.y = 1 + Math.cos(this._count) * 0.04;
		this._count += 0.1;
		this._colorMatrix[1] = Math.sin(this._count) * 3;
		this._colorMatrix[2] = Math.cos(this._count);
		this._colorMatrix[3] = Math.cos(this._count) * 1.5;
		this._colorMatrix[4] = Math.sin(this._count / 3) * 2;
		this._colorMatrix[5] = Math.sin(this._count / 2);
		this._colorMatrix[6] = Math.sin(this._count / 4);
		this._filter.matrix = this._colorMatrix;
		this._renderer.render(this._stage);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
samples.colourmatrix.Main.main();
})();
