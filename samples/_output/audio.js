(function (console) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.__name__ = true;
EReg.prototype = {
	match: function(s) {
		if(this.r.global) this.r.lastIndex = 0;
		this.r.m = this.r.exec(s);
		this.r.s = s;
		return this.r.m != null;
	}
};
Math.__name__ = true;
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( e ) {
		if (e instanceof js__$Boot_HaxeError) e = e.val;
		return null;
	}
};
Reflect.fields = function(o) {
	var a = [];
	if(o != null) {
		var hasOwnProperty = Object.prototype.hasOwnProperty;
		for( var f in o ) {
		if(f != "__id__" && f != "hx__closures__" && hasOwnProperty.call(o,f)) a.push(f);
		}
	}
	return a;
};
Reflect.isFunction = function(f) {
	return typeof(f) == "function" && !(f.__name__ || f.__ename__);
};
Reflect.compareMethods = function(f1,f2) {
	if(f1 == f2) return true;
	if(!Reflect.isFunction(f1) || !Reflect.isFunction(f2)) return false;
	return f1.scope == f2.scope && f1.method == f2.method && f1.method != null;
};
var core_AssetLoader = function() {
	PIXI.loaders.Loader.call(this);
	this.count = 0;
	this.pixelRatio = 1;
	this._audioAssets = new haxe_ds_StringMap();
	core_MultipackParser.loader = this;
	this["use"](core_MultipackParser.parse);
};
core_AssetLoader.__name__ = true;
core_AssetLoader.__super__ = PIXI.loaders.Loader;
core_AssetLoader.prototype = $extend(PIXI.loaders.Loader.prototype,{
	start: function(onComplete,onProgress) {
		this.load(onComplete);
		if(this.progress != null) this.on("progress",onProgress);
	}
	,addAsset: function(id,path,usePixelRatio,onAssetLoaded) {
		if(usePixelRatio == null) usePixelRatio = true;
		if(!(Reflect.field(this.resources,id) != null)) {
			var url = path;
			if(url != "") {
				this.add(id,url,{ loadType : this._getLoadtype(path)},onAssetLoaded);
				this.count++;
			}
		}
	}
	,getAudio: function(id) {
		if(this._audioAssets.get(id) == null) {
			var value = new core_AudioAsset(Reflect.field(this.resources,id).data);
			this._audioAssets.set(id,value);
		}
		return this._audioAssets.get(id);
	}
	,_getLoadtype: function(asset) {
		if(new EReg("(.png|.gif|.svg|.jpg|.jpeg|.bmp)","i").match(asset)) return 2; else if(new EReg("(.mp3|.wav|.ogg|.aac|.m4a|.oga|.webma)","i").match(asset)) return 3; else if(new EReg("(.mp4|.webm|.m3u8)","i").match(asset)) return 4;
		return 1;
	}
});
var core_AudioAsset = function(src) {
	this._src = src;
	this.mute = false;
	this.set_loop(false);
};
core_AudioAsset.__name__ = true;
core_AudioAsset.prototype = {
	play: function() {
		if(!this.mute) this._src.play();
	}
	,stop: function() {
		this._src.pause();
	}
	,set_loop: function(val) {
		this._src.loop = val;
		return this.loop = val;
	}
};
var core_MultipackParser = function() { };
core_MultipackParser.__name__ = true;
core_MultipackParser.parse = function(resource,next) {
	var data = resource.data;
	if(data != null && data.multipack) {
		var textures = data.textures;
		var imgCount = textures.length;
		var imgLoadedCount = 0;
		var resolution = PIXI.utils.getResolutionOfUrl(resource.url);
		var baseURL = resource.url.split(core_MultipackParser.loader.baseUrl)[1];
		baseURL = baseURL.substring(0,baseURL.lastIndexOf("/") + 1);
		var _g = 0;
		while(_g < textures.length) {
			var texture = [textures[_g]];
			++_g;
			var url = baseURL + texture[0].meta.image;
			core_MultipackParser.loader.add(texture[0].meta.image,url,{ loadType : 2, crossOrigin : resource.crossOrigin},(function(texture) {
				return function(image) {
					var frames = texture[0].frames;
					var _g1 = 0;
					var _g2 = Reflect.fields(frames);
					while(_g1 < _g2.length) {
						var n = _g2[_g1];
						++_g1;
						var frameData = Reflect.field(frames,n);
						var rect = frameData.frame;
						if(rect != null) {
							var size = new PIXI.Rectangle(rect.x,rect.y,rect.w,rect.h);
							var trim = null;
							if(frameData.trimmed) {
								var actualSize = frameData.sourceSize;
								var realSize = frameData.spriteSourceSize;
								trim = new PIXI.Rectangle(realSize.x / resolution,realSize.y / resolution,actualSize.w / resolution,actualSize.h / resolution);
							}
							size.x /= resolution;
							size.y /= resolution;
							size.width /= resolution;
							size.height /= resolution;
							PIXI.Texture.addTextureToCache(new PIXI.Texture(image.texture.baseTexture,size,size.clone(),trim),n);
						}
					}
				};
			})(texture));
		}
		next();
	} else next();
};
var haxe_IMap = function() { };
haxe_IMap.__name__ = true;
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__name__ = true;
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	set: function(key,value) {
		if(__map_reserved[key] != null) this.setReserved(key,value); else this.h[key] = value;
	}
	,get: function(key) {
		if(__map_reserved[key] != null) return this.getReserved(key);
		return this.h[key];
	}
	,setReserved: function(key,value) {
		if(this.rh == null) this.rh = { };
		this.rh["$" + key] = value;
	}
	,getReserved: function(key) {
		if(this.rh == null) return null; else return this.rh["$" + key];
	}
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	this.message = String(val);
	if(Error.captureStackTrace) Error.captureStackTrace(this,js__$Boot_HaxeError);
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
});
var msignal_Signal = function(valueClasses) {
	if(valueClasses == null) valueClasses = [];
	this.valueClasses = valueClasses;
	this.slots = msignal_SlotList.NIL;
	this.priorityBased = false;
};
msignal_Signal.__name__ = true;
msignal_Signal.prototype = {
	add: function(listener) {
		return this.registerListener(listener);
	}
	,remove: function(listener) {
		var slot = this.slots.find(listener);
		if(slot == null) return null;
		this.slots = this.slots.filterNot(listener);
		return slot;
	}
	,registerListener: function(listener,once,priority) {
		if(priority == null) priority = 0;
		if(once == null) once = false;
		if(this.registrationPossible(listener,once)) {
			var newSlot = this.createSlot(listener,once,priority);
			if(!this.priorityBased && priority != 0) this.priorityBased = true;
			if(!this.priorityBased && priority == 0) this.slots = this.slots.prepend(newSlot); else this.slots = this.slots.insertWithPriority(newSlot);
			return newSlot;
		}
		return this.slots.find(listener);
	}
	,registrationPossible: function(listener,once) {
		if(!this.slots.nonEmpty) return true;
		var existingSlot = this.slots.find(listener);
		if(existingSlot == null) return true;
		if(existingSlot.once != once) throw new js__$Boot_HaxeError("You cannot addOnce() then add() the same listener without removing the relationship first.");
		return false;
	}
	,createSlot: function(listener,once,priority) {
		if(priority == null) priority = 0;
		if(once == null) once = false;
		return null;
	}
};
var msignal_Signal1 = function(type) {
	msignal_Signal.call(this,[type]);
};
msignal_Signal1.__name__ = true;
msignal_Signal1.__super__ = msignal_Signal;
msignal_Signal1.prototype = $extend(msignal_Signal.prototype,{
	dispatch: function(value) {
		var slotsToProcess = this.slots;
		while(slotsToProcess.nonEmpty) {
			slotsToProcess.head.execute(value);
			slotsToProcess = slotsToProcess.tail;
		}
	}
	,createSlot: function(listener,once,priority) {
		if(priority == null) priority = 0;
		if(once == null) once = false;
		return new msignal_Slot1(this,listener,once,priority);
	}
});
var msignal_Slot = function(signal,listener,once,priority) {
	if(priority == null) priority = 0;
	if(once == null) once = false;
	this.signal = signal;
	this.set_listener(listener);
	this.once = once;
	this.priority = priority;
	this.enabled = true;
};
msignal_Slot.__name__ = true;
msignal_Slot.prototype = {
	remove: function() {
		this.signal.remove(this.listener);
	}
	,set_listener: function(value) {
		if(value == null) throw new js__$Boot_HaxeError("listener cannot be null");
		return this.listener = value;
	}
};
var msignal_Slot1 = function(signal,listener,once,priority) {
	if(priority == null) priority = 0;
	if(once == null) once = false;
	msignal_Slot.call(this,signal,listener,once,priority);
};
msignal_Slot1.__name__ = true;
msignal_Slot1.__super__ = msignal_Slot;
msignal_Slot1.prototype = $extend(msignal_Slot.prototype,{
	execute: function(value1) {
		if(!this.enabled) return;
		if(this.once) this.remove();
		if(this.param != null) value1 = this.param;
		this.listener(value1);
	}
});
var msignal_SlotList = function(head,tail) {
	this.nonEmpty = false;
	if(head == null && tail == null) {
		if(msignal_SlotList.NIL != null) throw new js__$Boot_HaxeError("Parameters head and tail are null. Use the NIL element instead.");
		this.nonEmpty = false;
	} else if(head == null) throw new js__$Boot_HaxeError("Parameter head cannot be null."); else {
		this.head = head;
		if(tail == null) this.tail = msignal_SlotList.NIL; else this.tail = tail;
		this.nonEmpty = true;
	}
};
msignal_SlotList.__name__ = true;
msignal_SlotList.prototype = {
	prepend: function(slot) {
		return new msignal_SlotList(slot,this);
	}
	,insertWithPriority: function(slot) {
		if(!this.nonEmpty) return new msignal_SlotList(slot);
		var priority = slot.priority;
		if(priority >= this.head.priority) return this.prepend(slot);
		var wholeClone = new msignal_SlotList(this.head);
		var subClone = wholeClone;
		var current = this.tail;
		while(current.nonEmpty) {
			if(priority > current.head.priority) {
				subClone.tail = current.prepend(slot);
				return wholeClone;
			}
			subClone = subClone.tail = new msignal_SlotList(current.head);
			current = current.tail;
		}
		subClone.tail = new msignal_SlotList(slot);
		return wholeClone;
	}
	,filterNot: function(listener) {
		if(!this.nonEmpty || listener == null) return this;
		if(Reflect.compareMethods(this.head.listener,listener)) return this.tail;
		var wholeClone = new msignal_SlotList(this.head);
		var subClone = wholeClone;
		var current = this.tail;
		while(current.nonEmpty) {
			if(Reflect.compareMethods(current.head.listener,listener)) {
				subClone.tail = current.tail;
				return wholeClone;
			}
			subClone = subClone.tail = new msignal_SlotList(current.head);
			current = current.tail;
		}
		return this;
	}
	,find: function(listener) {
		if(!this.nonEmpty) return null;
		var p = this;
		while(p.nonEmpty) {
			if(Reflect.compareMethods(p.head.listener,listener)) return p.head;
			p = p.tail;
		}
		return null;
	}
};
var pixi_plugins_app_Application = function() {
	this._lastTime = new Date();
	this._setDefaultValues();
};
pixi_plugins_app_Application.__name__ = true;
pixi_plugins_app_Application.prototype = {
	set_fps: function(val) {
		this._frameCount = 0;
		return val >= 1 && val < 60?this.fps = val | 0:this.fps = 60;
	}
	,set_skipFrame: function(val) {
		if(val) {
			console.log("pixi.plugins.app.Application > Deprecated: skipFrame - use fps property and set it to 30 instead");
			this.set_fps(30);
		}
		return this.skipFrame = val;
	}
	,_setDefaultValues: function() {
		this.pixelRatio = 1;
		this.set_skipFrame(false);
		this.autoResize = true;
		this.transparent = false;
		this.antialias = false;
		this.forceFXAA = false;
		this.backgroundColor = 16777215;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.set_fps(60);
	}
	,start: function(rendererType,stats,parentDom) {
		if(stats == null) stats = true;
		if(rendererType == null) rendererType = "auto";
		var _this = window.document;
		this.canvas = _this.createElement("canvas");
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		this.canvas.style.position = "absolute";
		if(parentDom == null) window.document.body.appendChild(this.canvas); else parentDom.appendChild(this.canvas);
		this.stage = new PIXI.Container();
		var renderingOptions = { };
		renderingOptions.view = this.canvas;
		renderingOptions.backgroundColor = this.backgroundColor;
		renderingOptions.resolution = this.pixelRatio;
		renderingOptions.antialias = this.antialias;
		renderingOptions.forceFXAA = this.forceFXAA;
		renderingOptions.autoResize = this.autoResize;
		renderingOptions.transparent = this.transparent;
		if(rendererType == "auto") this.renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(rendererType == "canvas") this.renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this.renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
		window.document.body.appendChild(this.renderer.view);
		if(this.autoResize) window.onresize = $bind(this,this._onWindowResize);
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		this._lastTime = new Date();
		if(stats) this._addStats();
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.renderer.resize(this.width,this.height);
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		if(this._stats != null) {
			this._stats.domElement.style.top = "2px";
			this._stats.domElement.style.right = "2px";
		}
		if(this.onResize != null) this.onResize();
	}
	,_onRequestAnimationFrame: function() {
		this._frameCount++;
		if(this._frameCount == (60 / this.fps | 0)) {
			this._frameCount = 0;
			this._calculateElapsedTime();
			if(this.onUpdate != null) this.onUpdate(this._elapsedTime);
			this.renderer.render(this.stage);
		}
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		if(this._stats != null) this._stats.update();
	}
	,_calculateElapsedTime: function() {
		this._currentTime = new Date();
		this._elapsedTime = this._currentTime.getTime() - this._lastTime.getTime();
		this._lastTime = this._currentTime;
	}
	,_addStats: function() {
		if(window.Stats != null) {
			var _container = window.document.createElement("div");
			window.document.body.appendChild(_container);
			this._stats = new Stats();
			this._stats.domElement.style.position = "absolute";
			this._stats.domElement.style.top = "2px";
			this._stats.domElement.style.right = "2px";
			_container.appendChild(this._stats.domElement);
			this._stats.begin();
		}
	}
};
var samples_audio_Button = function(label,width,height,data,fontSize) {
	PIXI.Container.call(this);
	this.action = new msignal_Signal1(Dynamic);
	this._data = data;
	this._setupBackground(width,height);
	this._setupLabel(width,height,fontSize);
	this._label.text = label;
};
samples_audio_Button.__name__ = true;
samples_audio_Button.__super__ = PIXI.Container;
samples_audio_Button.prototype = $extend(PIXI.Container.prototype,{
	_setupBackground: function(width,height) {
		this._rect = new PIXI.Rectangle(0,0,width,height);
		this._background = new PIXI.Graphics();
		this._background.interactive = true;
		this._redraw(3040510);
		this.addChild(this._background);
		this._background.interactive = true;
		this._background.on("mouseover",$bind(this,this._onMouseOver));
		this._background.on("mouseout",$bind(this,this._onMouseOut));
		this._background.on("mousedown",$bind(this,this._onMouseDown));
		this._background.on("mouseup",$bind(this,this._onMouseUp));
		this._background.on("mouseupoutside",$bind(this,this._onMouseUpOutside));
		this._background.on("touchstart",$bind(this,this._onTouchStart));
		this._background.on("touchend",$bind(this,this._onTouchEnd));
		this._background.on("touchendoutside",$bind(this,this._onTouchEndOutside));
	}
	,_setupLabel: function(width,height,fontSize) {
		var size;
		if(fontSize != null) size = fontSize; else size = 12;
		var style = { };
		style.font = size + "px Arial";
		style.fill = "#FFFFFF";
		this._label = new PIXI.Text("",style);
		this._label.anchor.set(0.5);
		this._label.x = width / 2;
		this._label.y = height / 2;
		this.addChild(this._label);
	}
	,_redraw: function(colour) {
		var border = 1;
		this._background.clear();
		this._background.beginFill(13158);
		this._background.drawRect(this._rect.x,this._rect.y,this._rect.width,this._rect.height);
		this._background.endFill();
		this._background.beginFill(colour);
		this._background.drawRect(this._rect.x + border / 2,this._rect.y + border / 2,this._rect.width - border,this._rect.height - border);
		this._background.endFill();
	}
	,_onMouseDown: function(target) {
		if(this._enabled) this._redraw(14644225);
	}
	,_onMouseUp: function(target) {
		if(this._enabled) {
			this.action.dispatch(this._data);
			this._redraw(3040510);
		}
	}
	,_onMouseUpOutside: function(target) {
		if(this._enabled) this._redraw(3040510);
	}
	,_onMouseOver: function(target) {
		if(this._enabled) this._redraw(14644225);
	}
	,_onMouseOut: function(target) {
		if(this._enabled) this._redraw(3040510);
	}
	,_onTouchEndOutside: function(target) {
		if(this._enabled) this._redraw(3040510);
	}
	,_onTouchEnd: function(target) {
		if(this._enabled) {
			this._redraw(3040510);
			this.action.dispatch(this._data);
		}
	}
	,_onTouchStart: function(target) {
		if(this._enabled) this._redraw(14644225);
	}
});
var samples_audio_Main = function() {
	pixi_plugins_app_Application.call(this);
	this.pixelRatio = Math.floor(window.devicePixelRatio);
	this.backgroundColor = 6227124;
	pixi_plugins_app_Application.prototype.start.call(this);
	this._baseURL = "assets/audio/";
	this._loader = new core_AssetLoader();
	this._loader.baseUrl = this._baseURL;
	this._loader.addAsset("loop","loop.mp3",false,null);
	this._loader.addAsset("sound1","sound1.wav",false,null);
	this._loader.addAsset("sound2","sound2.wav",false,null);
	this._loader.start($bind(this,this._onLoaded),$bind(this,this._onLoadProgress));
	this._btnContainer = new PIXI.Container();
	this.stage.addChild(this._btnContainer);
};
samples_audio_Main.__name__ = true;
samples_audio_Main.main = function() {
	new samples_audio_Main();
};
samples_audio_Main.__super__ = pixi_plugins_app_Application;
samples_audio_Main.prototype = $extend(pixi_plugins_app_Application.prototype,{
	_onLoadProgress: function() {
		console.log("Loaded: " + Math.round(this._loader.progress));
	}
	,_onLoaded: function() {
		this._bgSound = this._loader.getAudio("loop");
		this._bgSound.set_loop(true);
		this._bgSound.play();
		this._sound1 = this._loader.getAudio("sound1");
		this._sound2 = this._loader.getAudio("sound2");
		this._addButton("SOUND 1",0,0,100,30,$bind(this,this._playSound1));
		this._addButton("SOUND 2",100,0,100,30,$bind(this,this._playSound2));
		this._addButton("STOP ALL",220,0,100,30,$bind(this,this._stopAll));
		this._btnContainer.position.set((window.innerWidth - 320) / 2,(window.innerHeight - 30) / 2);
	}
	,_playSound1: function() {
		this._sound1.play();
	}
	,_playSound2: function() {
		this._sound2.play();
	}
	,_stopAll: function() {
		this._bgSound.stop();
		this._sound1.stop();
		this._sound2.stop();
	}
	,_addButton: function(label,x,y,width,height,callback) {
		var button = new samples_audio_Button(label,width,height);
		button.position.set(x,y);
		button.action.add(callback);
		button._enabled = true;
		this._btnContainer.addChild(button);
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.__name__ = true;
Array.__name__ = true;
Date.__name__ = ["Date"];
var Dynamic = { __name__ : ["Dynamic"]};
var __map_reserved = {}
msignal_SlotList.NIL = new msignal_SlotList(null,null);
samples_audio_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=audio.js.map