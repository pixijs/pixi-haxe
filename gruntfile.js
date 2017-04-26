module.exports = function (grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),

		haxe: {
			project: {
				hxml: "build.hxml -xml docs.xml --macro include('pixi')"
			}
		},

		exec: {
			copy_libs: "cp -R ./libs/*.min.js ./samples/output/libs/",
			copy_samples: "cp -R samples/output/** ../adireddy.github.io/demos/pixi-haxe/"
		},

		zip: {
			"pixi.zip": ["src/**", "haxelib.json", "logo.png", "extraParams.hxml", "README.md", "LICENSE"]
		}
	});

	grunt.loadNpmTasks("grunt-haxe");
	grunt.loadNpmTasks("grunt-browserify");
	grunt.loadNpmTasks("grunt-zip");
	grunt.loadNpmTasks("grunt-exec");
	grunt.registerTask("default", ["haxe", "exec"]);
};