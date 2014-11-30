module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        haxe: {
            project: {
                hxml: "demos.hxml -xml docs.xml --macro include('pixi')"
            }
        },

        zip: {
            "pixi.zip": ["pixi/**", "haxelib.json"]
        },

        exec: {
            docs: "haxelib run chxdoc -o docs -f docs.xml " +
                " --deny=demos.*,js.*,haxe.*,/ " +
                "--title='Externs of pixi.js for Haxe' " +
                "--subtitle='<a href='http://adireddy.github.io/haxe-pixi' target='_blank'>haxe-pixi</a>'"
        }
    });

    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks("grunt-zip");
    grunt.loadNpmTasks("grunt-exec");
    grunt.registerTask("default", ["haxe", "zip", "exec"]);
};