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
	@:keep public function getChildByName(name:String):DisplayObject {
		for (i in 0 ... children.length) {
			if (children[i].name == name) {
				return children[i];
			}
		}
		return null;
	}
}