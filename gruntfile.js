/**
 * Created by Adi Mora on 10/10/2014.
 */

module.exports = function(grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        zip: {
            "pixi.zip": ["./pixi/**", "haxelib.json"],
        }
    });
    
    grunt.loadNpmTasks("grunt-zip");
    grunt.registerTask("default", ["zip"]);
};