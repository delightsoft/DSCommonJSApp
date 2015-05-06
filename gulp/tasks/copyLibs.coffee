gulp = require("gulp")
config = require("../config").copyLibs

gulp.task "copyLibs", [], (->
  gulp.src("#{config.libs}/**").pipe(gulp.dest(config.dest + '/libs'));
  return)