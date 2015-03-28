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
             docs: "haxelib run chxdoc -o ../adireddy.github.io/docs/haxe-pixi/v3 -f docs.xml " +
                   " --showTodoTags=false " +
                   " --deny=demos.*,samples.*,js.*,haxe.*,nape.*,zpp_nape.*,/ " +
                   "--title='Externs of pixi.js for Haxe' " +
                   "--subtitle='<a href='http://adireddy.github.io/haxe-pixi' target='_blank'>haxe-pixi</a>'",
             copy_samples: "cp -R samples/_output/** ../adireddy.github.io/demos/haxe-pixi/v3/"
         },

         zip: {
             "pixi.zip": ["pixi/**", "haxelib.json"]
         }
     });

    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks('grunt-browserify');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks("grunt-zip");
    grunt.loadNpmTasks("grunt-exec");
    grunt.registerTask("default", ["haxe", "browserify", "uglify", "exec"]);
};