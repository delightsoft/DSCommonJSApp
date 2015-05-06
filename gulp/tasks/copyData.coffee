gulp = require("gulp")
config = require("../config").copyData

gulp.task "copyData", [], (->
  gulp.src("#{config.data}/**").pipe(gulp.dest(config.dest + '/data'));
  return)