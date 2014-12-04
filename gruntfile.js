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
            docs: "haxelib run chxdoc -o ../adireddy.github.io/docs/haxe-pixi -f docs.xml " +
                " --deny=demos.*,js.*,haxe.*,nape.*,zpp_nape.*,/ " +
                "--title='Externs of pixi.js for Haxe' " +
                "--subtitle='<a href='http://adireddy.github.io/haxe-pixi' target='_blank'>haxe-pixi</a>'",
            copy: "cp -R demos/_output/** ../adireddy.github.io/demos/haxe-pixi/"
        }
    });

    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks("grunt-zip");
    grunt.loadNpmTasks("grunt-exec");
    grunt.registerTask("default", ["haxe", "zip", "exec"]);
};