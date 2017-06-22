package dragonbones;

import pixi.interaction.InteractionEvent;
import pixi.plugins.dragonbones.pixi.PixiArmatureDisplay;
import pixi.plugins.dragonbones.pixi.PixiFactory;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;

class Main extends Application {

	var _loader:Loader;

	var _displayIndex:Int;
	var _replaceDisplays:Array<String>;
	var _factory:PixiFactory;
	var _armatureDisplay1:PixiArmatureDisplay;
	var _armatureDisplay2:PixiArmatureDisplay;

	public function new() {
		super();
		_init();
	}

	function _init() {
		position = Application.POSITION_FIXED;
		backgroundColor = 0x003366;
		super.start();

		_displayIndex = 0;
		_replaceDisplays = [
			"display0002", "display0003", "display0004", "display0005",
			"display0006", "display0007", "display0008", "display0009",
			"display0010", "meshA", "meshB", "mesh"
		];
		_factory = PixiFactory.factory;

		var baseURL = "assets/dragonbones/";
		_loader = new Loader();
		_loader.baseUrl = baseURL;

		_loader.add("dragonBonesData", "DragonBoy/DragonBoy.json");
		_loader.add("textureDataA", "DragonBoy/DragonBoy_texture_1.json");
		_loader.add("textureA", "DragonBoy/DragonBoy_texture_1.png");

		_loader.add("dragonBonesData1", "ReplaceSlotDisplay/ReplaceSlotDisplay.json");
		_loader.add("textureDataA1", "ReplaceSlotDisplay/texture.json");
		_loader.add("textureA1", "ReplaceSlotDisplay/texture.png");
		_loader.add("textureRP", "ReplaceSlotDisplay/textureReplace.png");

		_loader.load(_onLoaded);
	}

	function _onLoaded() {
		_factory.parseDragonBonesData(_loader.resources["dragonBonesData"].data);
		_factory.parseTextureAtlasData(_loader.resources["textureDataA"].data, _loader.resources["textureA"].texture);

		_armatureDisplay1 = _factory.buildArmatureDisplay("DragonBoy");
		_armatureDisplay1.animation.play("walk");

		_armatureDisplay1.x = renderer.width * 0.5;
		_armatureDisplay1.y = renderer.height * 0.5 + 100;


		_factory.parseDragonBonesData(_loader.resources["dragonBonesData1"].data);
		_factory.parseTextureAtlasData(_loader.resources["textureDataA1"].data, _loader.resources["textureA1"].texture);

		_armatureDisplay2 = _factory.buildArmatureDisplay("MyArmature");
		_armatureDisplay2.animation.timeScale = 0.1;
		_armatureDisplay2.animation.play();

		_armatureDisplay2.x = renderer.width * 0.5;
		_armatureDisplay2.y = renderer.height * 0.5;

		stage.interactive = true;
		stage.on("touchstart", _touchHandler, this);
		stage.on("mousedown", _touchHandler, this);

		stage.addChild(_armatureDisplay2);
		stage.addChild(_armatureDisplay1);
	}

	function _touchHandler(event:InteractionEvent) {
		_replaceDisplay();
	}

	function _replaceDisplay() {
		_displayIndex = (_displayIndex + 1) % _replaceDisplays.length;

		var replaceDisplayName = _replaceDisplays[_displayIndex];

		if (replaceDisplayName.indexOf("mesh") >= 0) {
			switch (replaceDisplayName) {
				case "meshA":
					// Normal to mesh.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyMesh",
						"meshA",
						"weapon_1004_1",
						_armatureDisplay2.armature.getSlot("weapon")
					);

					// Replace mesh texture.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyDisplay",
						"ball",
						"display0002",
						_armatureDisplay2.armature.getSlot("mesh")
					);

				case "meshB":
					// Normal to mesh.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyMesh",
						"meshB",
						"weapon_1004_1",
						_armatureDisplay2.armature.getSlot("weapon")
					);

					// Replace mesh texture.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyDisplay",
						"ball",
						"display0003",
						_armatureDisplay2.armature.getSlot("mesh")
					);

				case "mesh":
					// Back to normal.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyMesh",
						"mesh",
						"weapon_1004_1",
						_armatureDisplay2.armature.getSlot("weapon")
					);

					// Replace mesh texture.
					_factory.replaceSlotDisplay(
						"ReplaceSlotDisplay",
						"MyDisplay",
						"ball",
						"display0005",
						_armatureDisplay2.armature.getSlot("mesh")
					);
			}
		}
		else { // Replace normal display.
			_factory.replaceSlotDisplay(
				"ReplaceSlotDisplay",
				"MyDisplay",
				"ball",
				replaceDisplayName,
				_armatureDisplay2.armature.getSlot("ball")
			);
		}
	}

	static function main() {
		new Main();
	}
}