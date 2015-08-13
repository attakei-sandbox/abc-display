# --------------------------------------
# Electronパッケージング系タスク
# --------------------------------------
runSequence = require('run-sequence')
gulp = require('gulp')
electron = require('gulp-electron')

config = require('../config')


gulp.task 'electron', (callback) ->
  runSequence(
    'prod',
    'electron:json',
    'electron:app',
    callback
  )

gulp.task 'electron:json', (callback) ->
  gulp.src([
      config.dest.compile + '/' + 'package.json',
      config.dest.compile + '/' + config.electron.packageJson.main
    ])
    .pipe(gulp.dest(config.dest.package))

gulp.task 'electron:app', (callback) ->
  gulp.src('')
    .pipe(electron(config.electron))
    .pipe(gulp.dest(''))
