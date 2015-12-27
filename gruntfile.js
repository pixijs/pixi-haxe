module.exports = function (grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),

		haxe: {
			project: {
				hxml: "build.hxml -xml docs.xml --macro include('pixi')"
			}
		},

		browserify: {
			pixi: {
				src: [],
				dest: "libs/pixi.dev.js",
				options: {
					require: ["pixi.js"],
					browserifyOptions: {
						standalone: "PIXI"
					}
				}
			},
			stats: {
				src: [],
				dest: "libs/perf.min.js",
				options: {
					require: ["perf.js"],
					browserifyOptions: {
						standalone: "Perf"
					}
				}
			}
		},

		uglify: {
			options: {
				compress: {
					drop_console: true
				}
			},
			target: {
				files: {
					"libs/pixi.min.js": ["libs/pixi.dev.js"]
				}
			}
		},

		exec: {
			copy_libs: "cp -R ./libs/*.min.js ./samples/_output/libs/",
			docs: "haxelib run chxdoc -o ../adireddy.github.io/docs/pixi-haxe/ -f docs.xml " +
				  " --showTodoTags=false " +
				  " --deny=msignal.*,core.*,demos.*,samples.*,js.*,haxe.*,nape.*,zpp_nape.*,/ " +
				  "--title='pixi-haxe' " +
				  "--subtitle='Externs'",
			copy_samples: "cp -R samples/_output/** ../adireddy.github.io/demos/pixi-haxe/"
			/*cleanup: "rm ./libs/pixi.dev.js"*/
		},

		zip: {
			"pixi.zip": ["pixi/**", "haxelib.json", "extraParams.hxml", "README.md"]
		}
	});

	grunt.loadNpmTasks("grunt-haxe");
	grunt.loadNpmTasks("grunt-npm-install");
	grunt.loadNpmTasks("grunt-browserify");
	grunt.loadNpmTasks("grunt-contrib-uglify");
	grunt.loadNpmTasks("grunt-zip");
	grunt.loadNpmTasks("grunt-exec");
	grunt.registerTask("default", ["haxe", "npm-install:pixi.js@3.0.8:perf.js", "exec"]);
};