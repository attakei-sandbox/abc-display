# --------------------------------------
# 変更検知系タスク
# --------------------------------------
gulp = require('gulp')

config = require('../config')


gulp.task 'watch', (callback) ->
  gulp.watch './src/**/*', ['build']


gulp.task 'watch:compile', () ->
  gulp.watch 'src/**/*.coffee', ['compile:coffee']
  gulp.watch 'src/**/*.jade', ['compile:jade']


gulp.task 'watch:mocha', ['watch:compile'], () ->
  gulp.watch ['lib/**/*', 'test/**/*'], ['mocha']
