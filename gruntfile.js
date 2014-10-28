/**
 * Created by Adi Mora on 10/10/2014.
 */

module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        shell: {
            makeDir: {
                command: 'mkdir pixi'
            },
            copy_src: {
                command: "cp -r src/pixi/** pixi/"
            }
        },

        zip: {
            "pixi.zip": ["pixi/**", "haxelib.json"]
        },

        exec: {
            command: "rm -rf pixi"
        }
    });

    grunt.loadNpmTasks("grunt-zip");
    grunt.loadNpmTasks("grunt-shell");
    grunt.loadNpmTasks("grunt-exec");
    grunt.registerTask("default", ["shell", "zip", "exec"]);
};