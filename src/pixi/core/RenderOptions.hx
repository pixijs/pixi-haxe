package pixi.core;

import js.html.CanvasElement;

typedef RenderOptions = {
	// the width of the renderers view
	// default: 800
	@:optional var width:Int;

	// the height of the renderers view
	// default: 800
	@:optional var height:Int;
	// the canvas to use as a view
	// if not provided creates a new one
	@:optional var view:CanvasElement;
	// If the render view is transparent
	// default: false
	@:optional var transparent:Bool;

	/**
	 * Resizes renderer view in CSS pixels to allow for resolutions other than 1.
	 */
	@:optional var autoDensity:Bool;

	// sets antialias (only applicable in chrome at the moment)
	// default: false
	@:optional var antialias:Bool;
	// enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	// default: false
	@:optional var preserveDrawingBuffer:Bool;
	// The background color of the rendered area (shown if not transparent).
	// default: 0x000000
	@:optional var backgroundColor:Int;
	// This sets if the renderer will clear the canvas or not before the new render pass.
	// default: true
	@:optional var clearBeforeRender:Bool;
	// The resolution / device pixel ratio of the renderer, retina would be 2
	// default: 1
	@:optional var resolution:Float;
	// forces FXAA antialiasing to be used over native. FXAA is faster, but may not always look as great webgl only
	// default: false;
	@:optional var forceFXAA:Bool;
	// Parameter passed to webgl context, set to "high-performance" for devices with dual graphics card webgl only
	@:optional var powerPreference:String;

	/**
	 * If WebGL context already exists, all parameters must be taken from it.
	 */
	@:optional var context:Dynamic;
}
