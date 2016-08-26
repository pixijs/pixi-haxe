package webglinfo;

import js.html.CanvasElement;
import js.Browser;

class Main {

	var contextName:String;

	public function new() {
		contextName = "";
		var checkSupport = detectWebGL({ stencil: true });
		log("WebGL Support", checkSupport + " " + contextName);
		if (checkSupport) displayWebGLProperties();

		log("---------------------------------------------------");
		checkSupport = detectWebGL({ stencil: true, failIfMajorPerformanceCaveat: true });
		log("WebGL Support (performance caveat set to true)", checkSupport + " " + contextName);
	}

	function detectWebGL(?props:Dynamic):Bool {
		var ctx = Reflect.field(Browser.window, "WebGLRenderingContext");
		if (ctx != null) {
			var canvas:CanvasElement = Browser.document.createCanvasElement();
			var supportedContextNames:Array<String> = ["webgl", "experimental-webgl"];
			var gl:Dynamic;

			for (context in supportedContextNames) {
				try {
					gl = props != null ? canvas.getContext(context, props) : canvas.getContext(context);
					if (gl != null && gl.getParameter != null) {
						contextName = context;
						return gl.getContextAttributes().stencil;
					}
				} catch (e:Dynamic) {}
			}

			return false;
		}

		return false;
	}

	function displayWebGLProperties() {
		if (contextName != "") {
			var gl = Browser.document.createCanvasElement().getContext(contextName);
			log("WebGL Version", gl.getParameter(gl.VERSION));
			log("Shading Language Version", gl.getParameter(gl.SHADING_LANGUAGE_VERSION));
			log("WebGL Vendor", gl.getParameter(gl.VENDOR));
			log("WebGL Renderer", gl.getParameter(gl.RENDERER));

			var dbgRenderInfo = gl.getExtension("WEBGL_debug_renderer_info");
			if (dbgRenderInfo != null) {
				log("Renderer", gl.getParameter(dbgRenderInfo.UNMASKED_RENDERER_WEBGL));
				log("Vendor", gl.getParameter(dbgRenderInfo.UNMASKED_VENDOR_WEBGL));
			}

			log("Antialias Support", gl.getContextAttributes().antialias);
			log("Drawing Buffer", gl.drawingBufferWidth + "x" + gl.drawingBufferHeight);
			log("Max Render Buffer Size", gl.getParameter(gl.MAX_RENDERBUFFER_SIZE));
			log("Max Texture Size (recommended 2048)", gl.getParameter(gl.MAX_TEXTURE_SIZE));
			log("Max Texture Image Units", gl.getParameter(gl.MAX_TEXTURE_IMAGE_UNITS));
			log("Max Vertex Texture Image Units (recommended 4)", gl.getParameter(gl.MAX_VERTEX_TEXTURE_IMAGE_UNITS));
			log("Max Combined Texture Image Units", gl.getParameter(gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS));
			log("Max Fragmented Uniform Vectors", gl.getParameter(gl.MAX_FRAGMENT_UNIFORM_VECTORS));
			log("Max Vertex Attributes (recommended 16)", gl.getParameter(gl.MAX_VERTEX_ATTRIBS));
			log("Max Varying Vectors (recommended 8)", gl.getParameter(gl.MAX_VARYING_VECTORS));
			log("RGBA Bits", "[" + gl.getParameter(gl.RED_BITS) + ", " + gl.getParameter(gl.GREEN_BITS) + ", " + gl.getParameter(gl.BLUE_BITS) + ", " + gl.getParameter(gl.ALPHA_BITS) + "]");
			log("Depth & Stencil Bits", "[" + gl.getParameter(gl.DEPTH_BITS) + ", " + gl.getParameter(gl.STENCIL_BITS) + "]");
			if (gl.getExtension("WEBGL_draw_buffers") != null) log("Max Color Buffers", gl.getParameter(gl.getExtension("WEBGL_draw_buffers").MAX_DRAW_BUFFERS_WEBGL));

			if (gl.getExtension("EXT_texture_filter_anisotropic") != null) {
				log("Max Anisotropy", gl.getParameter(gl.getExtension("EXT_texture_filter_anisotropic").MAX_TEXTURE_MAX_ANISOTROPY_EXT));
			}
			else if (gl.getExtension("WEBKIT_EXT_texture_filter_anisotropic") != null) {
				log("Max Anisotropy", gl.getParameter(gl.getExtension("WEBKIT_EXT_texture_filter_anisotropic").MAX_TEXTURE_MAX_ANISOTROPY_EXT));
			}
			else if (gl.getExtension("MOZ_EXT_texture_filter_anisotropic") != null) {
				log("Max Anisotropy", gl.getParameter(gl.getExtension("MOZ_EXT_texture_filter_anisotropic").MAX_TEXTURE_MAX_ANISOTROPY_EXT));
			}

			log("---------------------------------------------------");
			log("Supported Extensions", "<br />" + gl.getSupportedExtensions().join("<br />"));
		}
	}

	function log(msg:String, ?val:String = "") {
		Browser.window.document.writeln(msg + ": <b>" + val + "</b><br/>");
	}

	static function main() {
		new Main();
	}
}