package pixi.core;

import js.html.CanvasElement;

typedef RenderOptions = {
	
	// Whether css dimensions of canvas view should be resized to screen dimensions automatically
	// default: false
	@:optional var autoResize:Bool;
	
	// the width of the renderers view
	// default: 800 	
	@:optional var width:Int;	
	
	// the height of the renderers view
	// default: 800
	@:optional var height:Int;	
	
	// the canvas to use as a view
	// if not provided creates a new one
	@:optional var view:CanvasElement;
	
	//If the render view is transparent
	// default: false
	@:optional var transparent:Bool;
	
	//sets antialias (only applicable in chrome at the moment)
	//default: false
	@:optional var antialias:Bool;
	
	
	//enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	//default: false
	@:optional var preserveDrawingBuffer:Bool;
	
	
	//The background color of the rendered area (shown if not transparent).
	//default: 0x000000
	@:optional var backgroundColor:Int;
	
	
	//This sets if the renderer will clear the canvas or not before the new render pass.
	//default: true
	@:optional var clearBeforeRender:Bool;
	
	
	//The resolution / device pixel ratio of the renderer, retina would be 2
	//default: 1
	@:optional var resolution:Float;
	
	
	//prevents selection of WebGL renderer, even if such is present
	//default: false
	@:optional var forceCanvas:Bool;
	
	
	//If true PixiJS will Math.floor() x / y values when rendering, stopping pixel interpolation.
	//default: false
	@:optional var roundPixels:Bool;
	
	
	//forces FXAA antialiasing to be used over native. FXAA is faster, but may not always look as great webgl only
	//default: false;
	@:optional var forceFXAA:Bool;
	
	
	//true to ensure compatibility with older / less advanced devices. If you experience unexplained flickering try setting this to true. webgl only
	//default: false
	@:optional var legacy:Bool;
	
	
	//Parameter passed to webgl context, set to "high-performance" for devices with dual graphics card webgl only
	@:optional var powerPreference:String;
	
}