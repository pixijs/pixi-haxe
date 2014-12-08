(function () { "use strict";
var demos = {};
demos.tilingsprite = {};
demos.tilingsprite.Main = function() {
	this._stage = new PIXI.Stage(9946478);
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	var texture = PIXI.Texture.fromImage("assets/tilingsprite/p2.jpeg");
	this._tilingSprite = new PIXI.TilingSprite(texture,window.innerWidth,window.innerHeight);
	this._stage.addChild(this._tilingSprite);
	this._count = 0;
	window.requestAnimationFrame($bind(this,this.animate));
};
demos.tilingsprite.Main.main = function() {
	new demos.tilingsprite.Main();
};
demos.tilingsprite.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._count += 0.005;
		this._tilingSprite.tileScale.x = 2 + Math.sin(this._count);
		this._tilingSprite.tileScale.y = 2 + Math.cos(this._count);
		this._tilingSprite.tilePosition.x += 1;
		this._tilingSprite.tilePosition.y += 1;
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
demos.tilingsprite.Main.main();
})();
