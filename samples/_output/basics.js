(function (console) { "use strict";
var samples_basics_Main = function() {
	var options = { };
	options.backgroundColor = 26214;
	options.resolution = 1;
	options.transparent = true;
	options.antialias = true;
	this._container = new PIXI.Container();
	this._renderer = PIXI.autoDetectRenderer(800,600,options);
	this._bunny = new PIXI.Sprite(PIXI.Texture.fromImage("assets/basics/bunny.png"));
	this._bunny.anchor.set(0.5);
	this._bunny.position.set(400,300);
	this._container.addChild(this._bunny);
	this._graphic = new PIXI.Graphics();
	this._graphic.beginFill(16711680,0.4);
	this._graphic.drawRect(200,150,400,300);
	this._graphic.endFill();
	this._graphic.interactive = true;
	this._graphic.on("click",function(evt) {
		console.log(evt);
	});
	this._container.addChild(this._graphic);
	window.document.body.appendChild(this._renderer.view);
	window.requestAnimationFrame($bind(this,this._animate));
};
samples_basics_Main.main = function() {
	new samples_basics_Main();
};
samples_basics_Main.prototype = {
	_animate: function() {
		window.requestAnimationFrame($bind(this,this._animate));
		this._bunny.rotation += 0.1;
		this._renderer.render(this._container);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples_basics_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=basics.js.map