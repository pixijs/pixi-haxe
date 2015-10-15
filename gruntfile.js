module.exports = function (grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),

		haxe: {
			project: {
				hxml: "build.hxml -xml docs.xml --macro include('pixi')"
			}
		},

		exec: {
			copy_libs: "cp -R ./libs/*.min.js ./samples/_output/libs/",
			docs: "haxelib run chxdoc -o ../adireddy.github.io/docs/pixi-haxe/ -f docs.xml " +
				  " --showTodoTags=false " +
				  " --deny=demos.*,samples.*,js.*,haxe.*,nape.*,zpp_nape.*,/ " +
				  "--title='Externs of pixi.js for Haxe' " +
				  "--subtitle='<a href='http://adireddy.github.io/docs/pixi-haxe' target='_blank'>pixi-haxe</a>'",
			copy_samples: "cp -R samples/_output/** ../adireddy.github.io/demos/pixi-haxe/"
		},

		zip: {
			"pixi.zip": ["pixi/**", "haxelib.json", "extraParams.hxml", "README.md"]
		}
	});

	grunt.loadNpmTasks("grunt-haxe");
	grunt.loadNpmTasks("grunt-zip");
	grunt.loadNpmTasks("grunt-exec");
	grunt.registerTask("default", ["haxe", "exec"]);
};