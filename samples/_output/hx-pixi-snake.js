(function () { "use strict";
var pixi = {};
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.snake = {};
samples.snake.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	this._count = 0;
	var length = 45.9;
	this._points = [];
	var _g = 0;
	while(_g < 20) {
		var i = _g++;
		var segSize = length;
		this._points.push(new PIXI.Point(i * length,0));
	}
	var strip = new PIXI.Rope(PIXI.Texture.fromImage("assets/snake/snake.png"),this._points);
	strip.x = -459.;
	var snakeContainer = new PIXI.DisplayObjectContainer();
	snakeContainer.position.x = window.innerWidth / 2;
	snakeContainer.position.y = window.innerHeight / 2;
	snakeContainer.scale.x = window.innerWidth / 1100;
	this._stage.addChild(snakeContainer);
	snakeContainer.addChild(strip);
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.snake.Main.main = function() {
	new samples.snake.Main();
};
samples.snake.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._count += 0.1;
		var length = 45.9;
		var _g1 = 0;
		var _g = this._points.length;
		while(_g1 < _g) {
			var i = _g1++;
			this._points[i].y = Math.sin(i * 0.5 + this._count) * 30;
			this._points[i].x = i * length + Math.cos(i * 0.3 + this._count) * 20;
		}
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
samples.snake.Main.main();
})();
