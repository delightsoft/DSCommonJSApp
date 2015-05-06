# Notes:
#   - gulp/tasks/browserify.js handles js recompiling with watchify
#   - gulp/tasks/browserSync.js watches and reloads compiled files
#
gulp = require("gulp")
config = require("../config")

gulp.task "watch", ["setWatch", "browserSync"], (->
  gulp.watch config.jade.src, ["jade"]
  gulp.watch config.html.src, ["html"]
  gulp.watch config.test.src, ["jade"]
  gulp.watch config.sass.src, ["sass"]
  gulp.watch config.images.src, ["images"]
  gulp.watch config.copyData.data + '/**', ["copyData"]
  return)
