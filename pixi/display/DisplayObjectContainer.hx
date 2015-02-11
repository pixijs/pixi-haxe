package pixi.display;

class DisplayObjectContainer extends CoreDisplayObjectContainer {

	public function new() {
		super();
	}

	/**
	 * Returns the child with the specified name
	 *
	 * @method getChildByName
	 * @param name {String} The name of the child
	 * @return {DisplayObject}
	*/
	public function getChildByName(name:String):DisplayObject {
		for (i in 0 ... children.length) {
			if (children[i].name == name) {
				return children[i];
			}
		}
		return null;
	}

	/**
	 * Helper function to apply scale based on the pixel ratio passed
	 *
	 * @method applyScale
	 * @param pixelRatio {Float} pixel ratio
	*/
	public function applyScale(pixelRatio:Float) {
		if (pixelRatio > 0) scale.set(1 / pixelRatio, 1 / pixelRatio);
	}
}