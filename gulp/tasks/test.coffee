# --------------------------------------
# テスト系タスク
# --------------------------------------
gulp = require('gulp')
mocha = require('gulp-mocha')

config = require('../config')


gulp.task 'mocha', (callback) ->
  gulp.src([
    'test/**/*.js'
    'test/**/*.coffee'
    '!test/functest/*.js'
    '!test/functest/*.coffee'
    ], { read: false })
  .pipe(mocha({ reporter: 'list'}))
# .on('error', gutil.log)


gulp.task 'mocha:functest', (callback) ->
  gulp.src([
    'test/functest/*.js'
    'test/functest/*.coffee'
    ], { read: false })
  .pipe(mocha({ reporter: 'list'}))
# .on('error', gutil.log)
