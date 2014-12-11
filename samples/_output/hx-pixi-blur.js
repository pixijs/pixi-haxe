(function () { "use strict";
var pixi = {};
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.blur = {};
samples.blur.Main = function() {
	this._stage = new PIXI.Stage(16777215);
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	this._renderer.view.style.position = "absolute";
	this._renderer.view.style.width = window.innerWidth + "px";
	this._renderer.view.style.height = window.innerHeight + "px";
	this._renderer.view.style.display = "block";
	this._bg = PIXI.Sprite.fromImage("assets/filters/depth_blur_BG.jpg");
	this._stage.addChild(this._bg);
	this._littleDudes = PIXI.Sprite.fromImage("assets/filters/depth_blur_dudes.jpg");
	this._littleDudes.y = 100;
	this._stage.addChild(this._littleDudes);
	this._littleRobot = PIXI.Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
	this._littleRobot.x = 120;
	this._stage.addChild(this._littleRobot);
	this._blurFilter1 = new PIXI.BlurFilter();
	this._blurFilter2 = new PIXI.BlurFilter();
	this._littleDudes.filters = [this._blurFilter1];
	this._littleRobot.filters = [this._blurFilter2];
	this._count = 0;
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.blur.Main.main = function() {
	new samples.blur.Main();
};
samples.blur.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._count += 0.01;
		var blurAmount1 = Math.cos(this._count);
		var blurAmount2 = Math.sin(this._count);
		this._blurFilter1.blur = 20 * blurAmount1;
		this._blurFilter2.blur = 20 * blurAmount2;
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
samples.blur.Main.main();
})();
