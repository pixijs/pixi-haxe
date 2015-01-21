package pixi;

/**
 * Because macros cannot access the JS package, put
 * a bunch of dummy typedefs so compilation will go through.
 */
#if js
	typedef CanvasElement = js.html.CanvasElement;
	typedef CanvasRenderingContext2D = js.html.CanvasRenderingContext2D;
	typedef Element = js.html.Element;
	typedef Image = js.html.Image;
	typedef DivElement = js.html.DivElement;
#else
	typedef CanvasElement = Dynamic;
	typedef CanvasRenderingContext2D = Dynamic;
	typedef Element = Dynamic;
	typedef Image = Dynamic;
	typedef DivElement = Dynamic;
#end

class DomDefinitions {}