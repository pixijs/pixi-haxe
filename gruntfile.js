module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        haxe: {
            project: {
                hxml: "build.hxml"
            }
        },

        /*shell: {
            makeDir: {
                command: 'mkdir pixi'
            },
            copy_src: {
                command: "cp -r src/pixi/** pixi/"
            }
        },*/

        zip: {
            "pixi.zip": ["pixi/**", "haxelib.json"]
        }

        /*exec: {
            command: "rm -rf pixi"
        }*/
    });

    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks("grunt-zip");
    //grunt.loadNpmTasks("grunt-shell");
    //grunt.loadNpmTasks("grunt-exec");
    grunt.registerTask("default", ["haxe", "zip"]);
};