module.exports = (grunt)->
  grunt.initConfig
    coffee:
      compile:
        files:
          'build/index.js': 'src/index.coffee'
        options:
          bare: true
    cson:
      manifest:
        files:
          'build/manifest.json': 'src/manifest.cson'
    copy:
      lib:
        files:
          'build/md.js': 'markdown-browser-0.6.0-beta1/markdown.min.js'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'build', ['coffee', 'cson', 'copy']
