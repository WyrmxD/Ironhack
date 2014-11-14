module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			build: {
				src: 'public/js/*.js',
				dest: 'build/mylib.min.js'
			}
		},
		cssmin: {
			minify: {
			expand: true,
			cwd: 'public/css/',
			src: ['*.css', '!*.min.css'],
			dest: 'public/css/',
			ext: '.min.css'
			}
		}
	});

	// Load the plugin that provides the "uglify" task.
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');

	// Default task(s).
	grunt.registerTask('default', ['uglify', 'cssmin']);

};
