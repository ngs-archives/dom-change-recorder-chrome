bower = require 'gulp-bower'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
gulp = require "gulp"
gutil = require 'gulp-util'
jade = require 'gulp-jade'
karma = require 'gulp-karma'

gulp.task 'jade', ->
  gulp.src './src/**/*.jade'
  .pipe jade()
  .pipe gulp.dest './app'

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
  .pipe coffee(bere: yes).on 'error', gutil.log
  .pipe gulp.dest './app'

gulp.task 'concat-content', ->
  gulp
  .src ['./app/scripts/_vendor.js', './app/scripts/_content.js']
  .pipe concat 'content.js'
  .pipe gulp.dest './app/scripts'

gulp.task 'bower',->
  bower().pipe gulp.dest './bower_components'

gulp.task 'vendor', ->
  gulp
  .src [
    './bower_components/jquery/dist/jquery.min.js'
    './bower_components/jquery-allAttributes/dist/allAttributes.min.js'
    './bower_components/jquery-elementDiff/dist/elementDiff.min.js'
    './bower_components/jquery-selectorator/dist/selectorator.min.js'
  ]
  .pipe concat '_vendor.js'
  .pipe gulp.dest './app/scripts'

gulp.task 'test', ->
  gulp
  .src [
    './app/scripts/content.js'
    './test/**/*'
  ]
  .pipe karma
    configFile: './karma.conf.coffee'
    action: 'run'
  .on 'error', (err) ->
    throw err

gulp.task 'setup',  ['bower']
gulp.task 'concat', ['concat-content']
gulp.task 'build',  ['vendor', 'jade', 'coffee', 'concat']
gulp.task 'default', ['build', 'test']
