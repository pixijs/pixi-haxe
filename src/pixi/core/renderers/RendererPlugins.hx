package pixi.core.renderers;
import pixi.accessibility.AccessibilityManager;
import pixi.core.renderers.webgl.extract.WebGLExtract;
import pixi.interaction.InteractionManager;

/**
 * Collection of installed plugins. 
 * These are included by default in PIXI, but can be excluded by creating a custom build. 
 * Consult the README for more information about creating custom builds and excluding plugins.
 */	
extern class RendererPlugins implements Dynamic
{
	/**
	 * Support tabbing interactive elements.
	 */	
	public var accessibility:AccessibilityManager;
	
	/**
	 * Extract image data from renderer.
	 */
	public var extract:WebGLExtract;
	
	/**
	 * Handles mouse, touch and pointer events.
	 */
	public var interaction:InteractionManager;
	
	/**
	 * Pre-render display objects.
	 */
	public var prepare:BasePrepare;
}