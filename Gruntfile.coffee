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
          'build/md.js': 'marked/marked.min.js'
          'build/style.css': 'github-markdown-css/github-markdown.css'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-cson'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['coffee', 'cson', 'copy']
