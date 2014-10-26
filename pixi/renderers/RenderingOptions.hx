package pixi.renderers;

import js.html.Element;

class RenderingOptions {
    public static var view:Element;
    public static var transparent:Bool = false;
    public static var resolution:Float = 1;

    //canvas
    public static var clearBeforeRender:Bool = true;

    //webgl
    public static var antialias:Bool = false;
    public static var preserveDrawingBuffer:Bool = false;
}